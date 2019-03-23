local mod = fabulous
local prefix = 'fabulous:'

local tn1 = {}
tn1.name = prefix .. 'test_node1'
tn1.slot = mod.inventory_names.fabulous_hat
tn1.node_def =  {
                  description = 'Test 1',
                  tiles = { 
                    'default_stone.png',
                  },
                  paramtype = 'light',
                  groups = {fabulous_hat = 1},
                }
tn1.scale = 0.9
tn1.offset = {x = 0, y = 0, z = 0}
tn1.rotation = {x = 0, y = 0, z = 0}
mod.register_fabulousness(tn1.name, tn1.slot, tn1.node_def, tn1.scale, tn1.offset, tn1.rotation)

local tn2 = {}
tn2.name = prefix .. 'test_node2'
tn2.slot = mod.inventory_names.fabulous_arms
tn2.node_def =  {
                  description = 'Test 2',
                  tiles = { 
                    'default_sand.png',
                  },
                  paramtype = 'light',
                  groups = {fabulous_arms = 1},
                }
tn2.scale = 0.5
tn2.offset = {x = 0, y = 0, z = 0}
tn2.rotation = {x = 0, y = 0, z = 0}
mod.register_fabulousness(tn2.name, tn2.slot, tn2.node_def, tn2.scale, tn2.offset, tn2.rotation)

local glasses00 = {}
glasses00.name = prefix .. 'glasses00'
glasses00.slot = mod.inventory_names.fabulous_face
glasses00.node_def =  {
                        groups = {fabulous_face = 1},
                        description = 'Glasses 00',
                        tiles = {
                          'default_wood.png',
                          'default_wood.png',
                          'default_wood.png',
                          'default_wood.png',
                          'default_wood.png',
                          'default_wood.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.5, 0.1875, -0.4375, -0.4375, 0.25, -0.0625}, -- NodeBox1
                            {-0.5, -0.125, -0.375, -0.4375, -0.0625, -0.0625}, -- NodeBox2
                            {-0.5, -0.125, 0.0625, -0.4375, -0.0625, 0.375}, -- NodeBox3
                            {-0.5, -0.0625, 0.375, -0.4375, 0.1875, 0.4375}, -- NodeBox4
                            {-0.5, -0.0625, -0.4375, -0.4375, 0.1875, -0.375}, -- NodeBox5
                            {-0.5, -0.0625, -0.0625, -0.4375, 0.1875, 0.0625}, -- NodeBox6
                            {-0.5, 0.1875, 0.0625, -0.4375, 0.25, 0.4375}, -- NodeBox7
                            {-0.4375, 0.0625, 0.4375, 0.0625, 0.125, 0.5}, -- NodeBox8
                            {-0.4375, 0.0625, -0.5, 0.0625, 0.125, -0.4375}, -- NodeBox9
                          }
                        }
                      }
glasses00.scale = 0.5
glasses00.offset = {x = 0, y = 1.5, z = 0}
glasses00.rotation = {x = 0, y = -90, z = 0}
mod.register_fabulousness(glasses00.name, glasses00.slot, glasses00.node_def, glasses00.scale, glasses00.offset, glasses00.rotation)


local glasses01 = {}
glasses01.name = prefix .. 'glasses01'
glasses01.slot = mod.inventory_names.fabulous_face
glasses01.node_def =  {
                        groups = {fabulous_face = 1},
                        description = 'Glasses 01',
                        tiles = {
                          'default_wood.png',
                          'default_wood.png',
                          'default_wood.png',
                          'default_wood.png',
                          'default_wood.png',
                          'default_wood.png'
                        },
                        drawtype = 'nodebox',
                        paramtype = 'light',
                        node_box = {
                          type = 'fixed',
                          fixed = {
                            {-0.5, 0.1875, -0.4375, -0.4375, 0.25, -0.0625}, -- NodeBox1
                            {-0.5, -0.125, -0.3125, -0.4375, -0.0625, -0.0625}, -- NodeBox2
                            {-0.5, -0.125, 0.0625, -0.4375, -0.0625, 0.3125}, -- NodeBox3
                            {-0.5, 0, 0.375, -0.4375, 0.1875, 0.4375}, -- NodeBox4
                            {-0.5, 0, -0.4375, -0.4375, 0.1875, -0.375}, -- NodeBox5
                            {-0.5, -0.0625, -0.0625, -0.4375, 0.1875, 0.0625}, -- NodeBox6
                            {-0.5, 0.1875, 0.0625, -0.4375, 0.25, 0.4375}, -- NodeBox7
                            {-0.4375, 0.0625, 0.4375, 0.0625, 0.1875, 0.5}, -- NodeBox8
                            {-0.4375, 0.0625, -0.5, 0.0625, 0.1875, -0.4375}, -- NodeBox9
                            {-0.4375, -0.0625, -0.375, -0.375, 0.1875, -0.0625}, -- NodeBox10
                            {-0.4375, -0.0625, 0.0625, -0.375, 0.1875, 0.375}, -- NodeBox11
                          }
                        }
                      }
glasses01.scale = 0.5
glasses01.offset = {x = 0, y = 1.5, z = 0}
glasses01.rotation = {x = 0, y = -90, z = 0}
mod.register_fabulousness(glasses01.name, glasses01.slot, glasses01.node_def, glasses01.scale, glasses01.offset, glasses01.rotation)
--[[
mod.register_fabulousness(prefix .. 'glasses01', {
	description = 'Glasses 01',
	tiles = {
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png'
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, 0.1875, -0.4375, -0.4375, 0.25, -0.0625}, -- NodeBox1
			{-0.5, -0.125, -0.3125, -0.4375, -0.0625, -0.0625}, -- NodeBox2
			{-0.5, -0.125, 0.0625, -0.4375, -0.0625, 0.3125}, -- NodeBox3
			{-0.5, 0, 0.375, -0.4375, 0.1875, 0.4375}, -- NodeBox4
			{-0.5, 0, -0.4375, -0.4375, 0.1875, -0.375}, -- NodeBox5
			{-0.5, -0.0625, -0.0625, -0.4375, 0.1875, 0.0625}, -- NodeBox6
			{-0.5, 0.1875, 0.0625, -0.4375, 0.25, 0.4375}, -- NodeBox7
			{-0.4375, 0.0625, 0.4375, 0.0625, 0.1875, 0.5}, -- NodeBox8
			{-0.4375, 0.0625, -0.5, 0.0625, 0.1875, -0.4375}, -- NodeBox9
			{-0.4375, -0.0625, -0.375, -0.375, 0.1875, -0.0625}, -- NodeBox10
			{-0.4375, -0.0625, 0.0625, -0.375, 0.1875, 0.375}, -- NodeBox11
		}
	}
})

mod.register_fabulousness(prefix .. 'glasses02', {
	description = 'Glasses 02',
	tiles = {
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png'
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, 0.1875, -0.1875, -0.4375, 0.25, -0.0625}, -- NodeBox1
			{-0.5, -0.125, -0.25, -0.4375, -0.0625, -0.1875}, -- NodeBox2
			{-0.5, -0.125, 0.1875, -0.4375, -0.0625, 0.25}, -- NodeBox3
			{-0.5, 0, 0.375, -0.4375, 0.1875, 0.4375}, -- NodeBox4
			{-0.5, 0, -0.4375, -0.4375, 0.1875, -0.375}, -- NodeBox5
			{-0.5, 0, -0.0625, -0.4375, 0.1875, 0.0625}, -- NodeBox6
			{-0.5, 0.1875, 0.0625, -0.4375, 0.25, 0.1875}, -- NodeBox7
			{-0.4375, 0.0625, 0.4375, 0.0625, 0.1875, 0.5}, -- NodeBox8
			{-0.4375, 0.0625, -0.5, 0.0625, 0.1875, -0.4375}, -- NodeBox9
			{-0.5, 0, -0.375, -0.4375, 0.1875, -0.0625}, -- NodeBox10
			{-0.5, 0, 0.0625, -0.4375, 0.1875, 0.375}, -- NodeBox11
			{-0.5, 0.1875, 0.25, -0.4375, 0.25, 0.375}, -- NodeBox12
			{-0.5, 0.1875, -0.375, -0.4375, 0.25, -0.25}, -- NodeBox13
			{-0.5, -0.0625, 0.125, -0.4375, 0, 0.3125}, -- NodeBox14
			{-0.5, -0.0625, -0.3125, -0.4375, 0, -0.125}, -- NodeBox15
		}
	}
})

mod.register_fabulousness(prefix .. 'hat00', {
	description = 'Hat 00',
	tiles = {
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png'
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.3125, -0.3125, -0.5, 0.3125, 0, 0.5}, -- NodeBox1
			{-0.5, -0.3125, -0.3125, -0.3125, 0, 0.3125}, -- NodeBox2
			{0.3125, -0.3125, -0.3125, 0.5, 0, 0.3125}, -- NodeBox3
			{-0.3125, 0, -0.3125, 0.3125, 0.25, 0.3125}, -- NodeBox4
			{-0.375, -0.5, -0.375, 0.375, -0.25, 0.375}, -- NodeBox5
		}
	}
})]]--