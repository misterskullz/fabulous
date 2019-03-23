fabulous = {}

local mod = fabulous
mod.inventory_names = {
    fabulous_hat  = 'fabulous_hat',
    fabulous_face = 'fabulous_face',
    fabulous_body = 'fabulous_body',
    fabulous_arms = 'fabulous_arms',
    fabulous_legs = 'fabulous_legs',
  }
mod.items = {}
mod.players = {}

  
mod.build_formspec_label = function(location_x, location_y, label)
    return 'label[' .. tostring(location_x) .. ',' .. tostring(location_y) .. ';' .. label .. ']'
end

mod.build_formspec_list = function(inventory_type, inventory_list, location_x, location_y, width, height)
    return 'list[' .. inventory_type .. ';' ..
      inventory_list .. ';' ..
      tostring(location_x) .. ',' .. tostring(location_y) .. ';' ..
      tostring(width) .. ',' .. tostring(height) .. ';]'
end

local inv_src = 'current_player'
mod.formspec =  mod.build_formspec_label(1,1,'Hat') ..
                mod.build_formspec_list(inv_src, mod.inventory_names.fabulous_hat,  1, 2, 1, 1) .. 
                mod.build_formspec_label(2,1,'Face') ..
                mod.build_formspec_list(inv_src, mod.inventory_names.fabulous_face, 2, 2, 1, 1) .. 
                mod.build_formspec_label(3,1,'Body') ..
                mod.build_formspec_list(inv_src, mod.inventory_names.fabulous_body, 3, 2, 1, 1) .. 
                mod.build_formspec_label(4,1,'Arms') ..
                mod.build_formspec_list(inv_src, mod.inventory_names.fabulous_arms, 4, 2, 1, 1) .. 
                mod.build_formspec_label(5,1,'Legs') ..
                mod.build_formspec_list(inv_src, mod.inventory_names.fabulous_legs, 5, 2, 1, 1)


mod.msg = function(player, s)
    minetest.chat_send_player(player:get_player_name(), s)
end



mod.check_or_create_inv = function(player)
  local inv = player:get_inventory()
  
  for i, slot in pairs(mod.inventory_names) do
    if inv:get_size(slot) < 1 then
      mod.msg(player, 'Setting ' .. slot)
      inv:set_size(slot, 1)
    end
  end
end

mod.slot_type_check = function(stack, slot)
  local item_name = stack:get_name()
  local group_num = minetest.get_item_group(item_name, slot)
  
  minetest.debug('slot_type_check')
  minetest.debug(minetest.serialize(stack:to_string()))
  minetest.debug(minetest.serialize(item_name))
  minetest.debug(minetest.serialize(group_num))
  
  if group_num > 0 then
    return 1
  else
    return 0
  end
end

mod.node_name_to_entity_name = function(node)
  return node .. '_entity'
end

mod.attach_to_player = function(player, bone, entity_name, offset, rotation)
  local pos = player:getpos()
  local entity = minetest.add_entity(pos, entity_name)
  
  entity:set_attach(player, bone, offset, rotation)
  
  return entity
end

mod.wear_item = function(player, node_name)
  minetest.debug('wear_item')
  minetest.debug(minetest.serialize(node_name))
  local player_name = player:get_player_name()
  
  if not mod.players[player_name] then mod.players[player_name] = {} end
    
  local attached = mod.players[player_name]
  local pos = player:getpos()
  
  local item = mod.items[node_name]
  
  local entity_name = mod.node_name_to_entity_name(node_name)
  local bone = ''
  
  if item.slot == mod.inventory_names.fabulous_head then bone = 'Head' end
  if item.slot == mod.inventory_names.fabulous_face then bone = 'Head' end
  if item.slot == mod.inventory_names.fabulous_body then bone = 'Body' end
  if item.slot == mod.inventory_names.fabulous_arms then bone = 'Arm' end
  if item.slot == mod.inventory_names.fabulous_legs then bone = 'Leg' end
    
  if bone == 'Arm' or bone == 'Leg' then
    local lbone = bone .. '_Left'
    local rbone = bone .. '_Right'
    
    local loffset = {item.offset.x, -1 * item.offset.y, item.offset.z}
    local roffset = item.offset
    
    local lrotation = {item.rotation.x, -1 * item.rotation.y, item.rotation.z}
    local rrotation = item.rotation
    
    local lentity = mod.attach_to_player(player, lbone, entity_name, loffset, lrotation)
    attached[lbone] = lentity
    
    local rentity = mod.attach_to_player(player, rbone, entity_name, roffset, rrotation)
    attached[rbone] = rentity
  else
    local entity = mod.attach_to_player(player, bone, entity_name, item.offset, item.rotation)
    attached[bone] = entity
  end
end
  

mod.allow_player_inventory_action = function(player, action, inventory, inventory_info)
  mod.msg(player, 'in allow_player_inventory_action')
  
  local list = inventory_info.to_list or inventory_info.listname
  
  if mod.inventory_names[list] then
    mod.msg(player, 'action we care about')
    if action == 'move' then
      local stack = inventory:get_stack(inventory_info.from_list, inventory_info.from_index)
      minetest.debug(stack:to_string())
      
      mod.msg(player, 'move checked')
      return mod.slot_type_check(stack, list)
    end
    
    if action == 'put' then
      local stack = inventory_info.stack
      
      mod.msg(player, 'put checked')
      return mod.slot_type_check(stack, list)
    end
    
    if action == 'take' then
      mod.msg(player, 'take allowed')
      return 1
    end
  end
end

mod.on_player_inventory_action = function(player, action, inventory, inventory_info)
  mod.msg(player, 'in on_player_inventory_action')
  
  local list = inventory_info.to_list or inventory_info.listname
  
  if mod.inventory_names[list] then
    if action == 'move' then
      local stack = inventory:get_stack(inventory_info.to_list, inventory_info.to_index)
      local item_name = stack:get_name()
      minetest.debug('on_player_inventory_action')
      minetest.debug(stack:to_string())
      minetest.debug(minetest.serialize(item_name))
      
      if item_name then
        mod.wear_item(player, item_name)
        mod.msg(player, 'item name: ' .. item_name)
      end
      
      mod.msg(player, 'move done')
      return 1
    end
    
    if action == 'put' then
      local stack = inventory_info.stack
      
      mod.msg(player, 'put done')
      return 1
    end
    
    if action == 'take' then
      mod.msg(player, 'take done')
      return 1
    end
  end
end




mod.register_fabulousness = function(name, slot, node_def, scale, offset, rotation)
  minetest.register_node(name, node_def)
  
  local entity_def = {
		initial_properties = {
      physical = true,
      collide_with_objects = false,
      visual = 'wielditem',
      visual_size = {x = scale, y = scale},
      textures = {name},
    },
  }

  minetest.register_entity(mod.node_name_to_entity_name(name), entity_def)
  
  minetest.debug('registered ' .. name)
  mod.items[name] = {slot = slot, offset = offset, rotation = rotation}
  minetest.debug(minetest.serialize(mod.items))
end

mod.register_fabulousness('fabulous:test_node1', 
  'fabulous_hat',
  {
    description = "Test 1",
    tiles = { 
      "default_stone.png",
    },
    paramtype = "light",
    groups = {fabulous_hat = 1},
  },
  
  0.9,
  {x = 0, y = 0, z = 0},
  {x = 0, y = 0, z = 0}
  )

mod.register_fabulousness("fabulous:test_node2", 
  'fabulous_arms',
  {
    description = "Test 2",
    tiles = { 
      "default_sand.png",
    },
    paramtype = "light",
    groups = {fabulous_arms = 1},
  },
  
  0.5,
  {x = 0, y = 0, z = 0},
  {x = 0, y = 0, z = 0}
  )





-- init bits

sfinv.register_page("fabulous:sfinv_gui", {
  title = 'Fabulous!',
  get = function(self, player, context)
    local fs = 'size[5,2]' .. mod.formspec
    return sfinv.make_formspec(player, context, fs, true)
  end,
})

minetest.register_allow_player_inventory_action(mod.allow_player_inventory_action)
minetest.register_on_player_inventory_action(mod.on_player_inventory_action)
minetest.register_on_joinplayer(function(player)
  mod.check_or_create_inv(player)
end)
