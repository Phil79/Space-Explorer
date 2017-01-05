  --Modified by Alex Dec. 31st
  
--Planet Class
Planet = {} -- table representing class planet
Planet.__index = Planet --failed table lookups should fall back to class table to get methods 
	
function Planet.new(atmos, out_mat, in_mat, toxicity, age, colours, habitation, level, PBase, M1, M2, M3, M4, M5, M6)
	local self = setmetatable({}, Planet)
  self.atmos = atmos
  self.out_mat = out_mat
  self.in_mat = in_mat
  self.toxicity = toxicity
  self.age = age
  self.colours = colours
  self.habitation = habitation
  self.level = level
  self.PBase = PBase
  self.M1 = M1
  self.M2 = M2
  self.M3 = M3
  self.M4 = M4
  self.M5 = M5
  self.M6 = M6
  return self
end

function Planet.set_atmos(self, val)
	self.atmos = val
end

function Planet.get_atmos(self)
	return self.atmos
end

function Planet.set_out_mat(self, out_mat)
	self.out_mat = out_mat
end

function Planet.get_out_mat(self)
	return self.out_mat
end

function Planet.set_in_mat(self, in_mat)
	self.in_mat = in_mat
end

function Planet.get_in_mat(self)
	return self.in_mat
end

function Planet.set_toxicity(self, toxicity)
	self.toxicity = toxicity
end

function Planet.get_toxicity(self)
	return self.toxicity
end

function Planet.set_age(self, age)
	self.age = age
end

function Planet.get_age(self)
	return self.age
end

function Planet.set_colours(self, colours)
	self.atmos = colours
end

function Planet.get_colours(self)
	return self.colours
end

function Planet.set_habitation(self, habitation)
	self.habitation = habitation
end

function Planet.get_habitation(self)
	return self.habitation
end

function Planet.set_level(self, level)
	self.level = level
end

function Planet.get_level(self)
	return self.level
end

function Planet.set_PBase(self, PBase)
	self.PBase = PBase
end

function Planet.get_PBase(self, PBase)
	return self.PBase
end

function Planet.set_M1(self, M1)
	self.M1 = M1
end

function Planet.get_M1(self, M1)
	return self.M1
end

function Planet.set_M2(self, M2)
	self.M2 = M2
end

function Planet.get_M2(self, M2)
	return self.M2
end

function Planet.set_M3(self, M3)
	self.M3 = M3
end

function Planet.get_M3(self, M3)
	return self.M3
end

function Planet.set_M4(self, M4)
	self.M4 = M4
end

function Planet.get_M4(self, M4)
	return self.M4
end

function Planet.set_M5(self, M5)
	self.M5 = M5
end

function Planet.get_M5(self, M5)
	return self.M5
end

function Planet.set_M6(self, M6)
	self.M6 = M6
end

function Planet.get_M6(self, M6)
	return self.M6
end




--------------------------------------------------------------------------------------------------
--function for loading a planet: Augustino, December 23, 2016

--randomizing Objects

--atmosphere

function load_planet(New_Planet, level)

	local atmosphere = {heavy, multi_layer, thin_dusty, thin_tenuous, crystal_clouds}

	local atmos = atmosphere[math.random(5)]

	--call class method to set atmosphere
	Planet.set_atmos(New_Planet, atmos)

	local inside = {earth_like, gas, lava, hollow}

	local in_mat = inside[math.random(4)]

	--call class method to set inside material
	Planet.set_in_mat(New_Planet, in_mat)

	local outside = {rocky, liquid, gas, ice}

	local out_mat = outside[math.random(4)]

	--call class method to set outside material
	Planet.set_out_mat(New_Planet, out_mat)

	local toxic_level = {none, low, medium, high, death}

	local toxicity = toxic_level[math.random(5)]

	--call class method to set toxicity
	Planet.set_toxicity(New_Planet, toxicity)

	local ages = {birth, young, middle, old, dying}

	local age = ages[math.rand(5)]

	--call class method to set age
	Planet.set_age(New_Planet, age)

	local image = {planet_0001}

	local planet_image = image[math.random(3)] --updated as number of planets is increased

	--call class method to set image
	Planet.set_image(New_Planet, image)

	local habitation = {none, type0, type1, type2, type3}

	--call class method to set level
	PLanet.set_level(New_Planet, level)
	

	if math.random(2) == 1 then
		local habitat = habitation[0]

	else 

		--call class method to set habitation
		Planet.set_habitation(New_Planet, level) -- assuming that level indicates your type of civilization: type0, type1, type2, type3	

	end


	--call class method to set level

	Planet.set_level(New_Planet, level)




end




---------------------------------------------------------------------------------------------------------------------------


--Augustino Dec.23, 2016, Star Class

local Star = {} -- table representing class planet

Star.__index = Star --failed table lookups should fall back to class table to get methods 
	
function Star.new(type, toxicity, age, colours, level, image)
	local self = setmetatable({}, Star)
  self.type = type
  self.toxicity = toxicity
 
  self.toxicity = toxicity
  self.age = age
  self.colours = colours

  self.level = level
  self.image = image

  return self

end

function Star.set_toxicity(self, toxicity)
	self.toxicity = toxicity
end

function Star.get_toxicity(self)
	return self.toxicity
end

function Star.set_age(self, age)
	self.age = age
end

function Star.get_age(self)
	return self.age
end

function Star.set_colours(self, colours)
	self.atmos = colours
end

function Star.get_colours(self)
	return self.colours
end

function Star.set_level(self, level)
	self.level = level
end

function Star.get_level(self)
	return self.level
end

function Star.set_image(self, image)
	self.image = image
end

function Star.get_image(self, image)
	return self.image
end

----------------------------------------------------------------------------------------------------------------------------
--Augustino, Dec.23, 2016, Load Star function



local function load_star(New_Star, level)


	local toxic_level = {none, low, medium, high, death}

	local toxicity = toxic_level[math.random(5)]

	--call class method to set toxicity
	Star.set_toxicity(New_Planet, toxicity)

	local ages = {birth, young, middle, old, dying}

	local age = ages[math.random(5)]

	--call class method to set age
	Star.set_age(New_Planet, age)

	local image = {star1.jpg, star2.jpg, star3.jpg, etc}
  
	local star_image = image[math.random(3)] --updated as number of stars is increased

	--call class method to set image
	Star.set_image(New_Star, image)

	local habitation = {none, type0, type1, type2, type3}


	-- use some way of ranking the different phases of the game in terms of overall progress
	local game_level = level


	--call class method to set level
	Star.set_level(New_Star, level)
	

	if math.random(2) == 1 then
		local habitat = habitation[0]

	else 

		--call class method to set habitation
		Star.set_habitation(New_Star, level) -- assuming that level indicates your type of civilization: type0, type1, type2, type3	

	end


	--call class method to set level

	Star.set_level(New_Star, level)
	

end



local planets = {}
local p_buttons = {}
local p_flags = {}
local solar_sys = {}
local sys_buttons = {}
local sys_flags = {}
local stars = {}
local star_buttons = {}
local star_flags = {}
local galaxy = {}
local gal_buttons = {}
local gal_flags = {}
local universe = {}
local uni_buttons = {}
local uni_flags = {}
local multiverse = {}
local multi_button = {}
local multi_flag = {}
local recent_planet
local recent_solar
local recent_gal
local recent_uni
local recent_multi
local planet_marker = tablelength(planets) + 1  
local sys_marker = tablelength(solar_sys) + 1
local star_marker = tablelength(stars) + 1
local gal_marker = tablelength(galaxy) + 1
local uni_marker = tablelength(universe) + 1



--FUNCTIONS FOR RETURNING OBJECT INFORMATION

function get_planets()
	return planets
end


function get_stars()
	return stars
end

function get_sys()
	return solar_sys
end

function get_galaxy()
	return galaxy
end

function get_universe()
	return universe
end

function get_multiverse()
	return multiverse
end


--FUNCTIONS FOR RETURNING BUTTON INFORMATION
function get_p_buttons()
	return p_buttons
end

function get_star_buttons()
	return star_buttons
end

function get_sys_buttons()
	return sys_buttons
end

function get_gal_buttons()
	return gal_buttons
end

function get_uni_buttons()
	return uni_buttons
end

function get_multi_button()
	return multi_button
end


--FUNCTIONS FOR GETTING FLAG INFORMATION

function get_p_flags()
	return p_flags
end

function get_sys_flags()
	return sys_flags
end

function get_star_flags()
	return star_flags
end

function get_gal_flags()
	return gal_flags
end

function get_uni_flags()
	return uni_flags
end

function get_multi_flags()
	return multi_flags
end


--FUNCTION FOR DETERMING THE NUMBER OF ENTRIES IN ANY TABLE

function tablelength(T)
	local count = 0
	for _ in pairs(T) do 
		count = count + 1 
	end
	return count
end



--FUNCTIONS FOR DETERMINING THE CURRENT OBJECT INSERTION POSITION OF TABLES

function planet_mark()
	return planet_marker
end

function sys_mark()
	return sys_marker
end

function star_mark()
	return star_marker
end

function galaxy_mark()
	return gal_marker
end

function universe_mark()
	return uni_marker
end


--Attempting Random Planet generation

local function createETP(PBase, M1, M2, M3, M4, M5, M6)

    local PBase = {"images/ETP/Pbase_1.png"}
  
  --load PBase corresponding to selected ss planet icon

  local Mass1 = {"images/ETP/Mass1_1.png", "images/ETP/Mass1_2.png"}

    local M1 = Mass1[math.random(2)]
  
  local Mass2 = {"images/ETP/Mass2_1.png", "images/ETP/Mass2_2.png"}

    local M2 = Mass2[math.random(2)]
  
  local Mass3 = {"images/ETP/Mass3_1.png", "images/ETP/Mass3_2.png"}

    local M3 = Mass3[math.random(2)]
  
  local Mass4 = {"images/ETP/Mass4_1.png", "images/ETP/Mass4_2.png"}

    local M4 = Mass4[math.random(2)]
  
  local Mass5 = {"images/ETP/Mass5_1.png", "images/ETP/Mass5_2.png"}

    local M5 = Mass5[math.random(2)]
  
  local Mass6 = {"images/ETP/Mass6_1.png", "images/ETP/Mass6_2.png"}

    local M6 = Mass6[math.random(2)]

    


end    





