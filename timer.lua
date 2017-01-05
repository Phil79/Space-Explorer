--Augustino, Dec.23,2016, countdown timer



	local t = {1, 0, 1, 0}
	
	display.setDefault("background", 0.2, 0.2, 0.4 )

	--define necessary local variables
	local secondsLeft = -1 
	local minutesLeft = -1
	local hoursLeft = -1
	local daysLeft  = -1
	local clockText

	local seconds = t[1]*86400 + t[2]*3600 + t[3]*60 + t[4]

	--setup initial display depending on length of timer

	if t[1] == 0 then --if the timer is less than 1 day 
		if t[2] == 0 then --if the timer is less than 1 hour 

			if t[3] == 0 then -- if the timer is less than 1 minute - in seconds
				secondsLeft = t[4]
				clockText = display.newText(string.format("0:%d", secondsLeft), display.contentCenterX, 80, native.systemFontBold, 80)
				clockText:setFillColor( 0.7, 0.7, 1 )

			else --timer is in minutes, and seconds, less than hour
				minutesLeft = t[3]
				secondsLeft = t[4]
				clockText = display.newText(string.format("%d:%d", minutesLeft, secondsLeft), display.contentCenterX, 80, native.systemFontBold, 80)
				clockText:setFillColor( 0.7, 0.7, 1 )
			end

		else --if timer greater than hour, less than day in hour/minutes/seconds
			hoursLeft = t[2]
			minutesLeft = t[3]
			secondsLeft = t[4]
			clockText = display.newText(string.format("%d:%d:%d", hoursLeft, minutesLeft, secondsLeft), display.contentCenterX, 80, native.systemFontBold, 80)
			clockText:setFillColor( 0.7, 0.7, 1 )
		end
	
	else --timer is greater than 1 day, in days/hours/minutes/seconds
		daysLeft = t[1]
		hoursLeft = t[2]
		minutesLeft = t[3]
		secondsLeft = t[4]
		clockText = display.newText(string.format("%d:%d:%d:%d", daysLeft, hoursLeft, minutesLeft, secondsLeft), display.contentCenterX, 80, native.systemFontBold, 80)
		clockText:setFillColor( 0.7, 0.7, 1 )
	end
				


	local function updateTime()
		local flag_h = 0
		local flag_m = 0
		local timeDisplay

		if secondsLeft == 0 then
			secondsLeft = 60

			if minutesLeft == 0 then
				minutesLeft = 59

				if hoursLeft == 0 then
					hoursLeft = 23
					daysLeft = daysLeft - 1
				else
					hoursLeft = hoursLeft - 1
				end
			else 
				minutesLeft = minutesLeft - 1
			end
		end


		secondsLeft = secondsLeft - 1


		

		
	
		-- make it a string using string format.  
		if daysLeft == 0 then
			if hoursLeft == 0 then
				timeDisplay = string.format( "%02d:%02d", minutesLeft, secondsLeft )
				
			else 
				timeDisplay = string.format( "%02d:%02d:%02d", hoursLeft, minutesLeft, secondsLeft )
			end

		else 
			timeDisplay = string.format( "%02d:%02d:%02d:%02d", daysLeft, hoursLeft, minutesLeft, secondsLeft )
		end

		clockText.text = timeDisplay
		
	end

	-- run the timer
	local countDownTimer = timer.performWithDelay( 1000, updateTime, seconds )



-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
