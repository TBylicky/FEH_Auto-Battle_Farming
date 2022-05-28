#Persistent
#NoEnv
#SingleInstance force

;Grab unique window ID
WinGetTitle, FEH , (Feh),,,

;*****************************************
Coordmode, Mouse, %FEH%
CoordMode, Pixel, %FEH%

Sleep, 1500
Loop
{
	Main()
}

Main() 
{
	;Temporary fix for error 308-8024 
	TempGameStart:
		GameStartSelected := MorePreciseSelectButton("SmallMenu.png")
		if (GameStartSelected == true) 
		{
			;Loading time here is VERY long...
			Sleep, 25000
			BattleFromHallSelected := SelectButton("BattleFromHall.png")
			if (BattleFromHallSelected == true) 
			{
				Sleep, 8000
				FromMainSelected := SelectButton("ColiseumFromMain.png")
				if (FromMainSelected == true) 
				{
					Sleep, 3500
					BattlesSelected := SelectButton("ResonantBattles.png")
					if (BattlesSelected == true) 
					{
						Sleep, 3500
						TTStageSelectSelected := SelectButton("TTStageSelect.png")
					}
				}
			}
		}
		
	ChooseDiff:
		DiffChosen := SelectButton("DifficultyLunatic.png")
		
	ChooseDiffb:
		DiffChosenb := SelectButton("DifficultyBonds.png")
		
	SelectClose:
		CloseSelected := SelectButton("Close.png")
		
	SelectCloseB:
		CloseBSelected := SelectButton("CloseB.png")
		if (CloseBSelected == true) 
		{
			Sleep, 1500
			Goto, SelectClose
		}
	
	SelectCloseC:
		CloseCSelected := SelectButton("CloseQuest.png")
		if (CloseCSelected == true) 
		{
			Sleep, 1500
			Goto, SelectCloseC
		}
		
	SelectCloseD:
		CloseDSelected := SelectButton("CloseTTSeal.png")
		if (CloseDSelected == true) 
		{
			Sleep, 1500
			Goto, SelectCloseD
		}

	Skip:
		Skipping := SelectButton("skip.png")
		
	SelectOkB:
		OkBSelected := SelectButton("OkB.png")

	MapStart:
		AutoSmallButton := SelectButton("AutoBattleSmall.png")
		if AutoSmallButton == true) 
		{
			Sleep, 3500
			AutoBigButton:= SelectButton("AutoBattleLarge.PNG")
		}

	BigConfirmButton:
		FightSelected := SelectButton("FightSelection.png")
		if (FightSelected == true) 
		{
			Sleep, 3000
			Goto, MapStart
		}
		
	SelectContinueFight:
		ContinueFightSelected := MorePreciseSelectButton("FightContinue.png")
		if ContinueFightSelected == true) 
		{
			Sleep, 3500
			Goto, MapStart
		}

	TheEnd:	
		Over := SelectButton("Gameover.png")
		if (Over == true) 
		{
			Sleep, 3500
			Backout := SelectButton("Back.png")
		}
			
	EndGame:
		GameEnd := PreciseSelectButton("GameWon.png")
		if (GameEnd == true) 
		{
			Sleep, 3500
			Goto, BigConfirmButton
		}
		
	LastUnitDies:
		LastUnitDead := PreciseSelectButton("GameLost.png")
		if (LastUnitDead == true) 
		{
			Sleep, 4000
			Goto, BigConfirmButton
		}
		
	EndGameB2:
		GameEndB2 := MorePreciseSelectButton("Gameover.png")
		if (GameEndB2 == true) 
		{
			Sleep, 3500
			Goto, BigConfirmButton
		}
		
	SelectCloseTT:
		CloseTTSelected := PreciseSelectButton("CloseTTReward.png")
		if (SelectCloseTT == true) 
		{
			Sleep, 3500
			Goto, SelectCloseTT
		}
		
	ResonantBattleBegin:
		ResonateBegin := PreciseSelectButton("ResonateBeginner.png")
		if (ResonateBegin == true) 
		{
			Sleep, 2500
			Goto, BigConfirmButton
		}
		
	Backout:
		Backout := PreciseSelectButton("Restore.png")
		if (Backout == true) 
		{
			Sleep, 3500
		}
		
	ReturnError:
		ReturnErrorSelected := PreciseSelectButton("ReturnError.png")
		if (ReturnErrorSelected == true) 
		{
			Sleep, 1500
			ReturnTitleSelected := SelectButton("ReturnTitle.png")
		}
}

SelectButton(ImageName) 
{
	ColorDif := 70

	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%ColorDif% ButtonImages/%ImageName%
	if (FoundX != "" and FoundY != "") 
	{
		MouseMove, %FoundX%, %FoundY%, 3
		Sleep, 1500
		Click
		ToolTip, Found ... `n%ImageName% at %FoundX% : %FoundY%!, 10, 40
		Sleep, 1500
		return true
	} 
	else 
	{
		ToolTip, Searching ... `n%ImageName%, 10, 40
	}
}

PreciseSelectButton(ImageName) 
{
	ColorDif := 21

	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%ColorDif% ButtonImages/%ImageName%
	if (FoundX != "" and FoundY != "") 
	{
		MouseMove, %FoundX%, %FoundY%, 3
		Sleep, 1500
		Click
		ToolTip, Found ... `n%ImageName% at %FoundX% : %FoundY%!, 10, 40
		Sleep, 1500
		return true
	} 
	else 
	{
		ToolTip, Searching ... `n%ImageName%, 10, 40
	}
}

MorePreciseSelectButton(ImageName) 
{
	ColorDif := 15

	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%ColorDif% ButtonImages/%ImageName%
	if (FoundX != "" and FoundY != "") 
	{
		MouseMove, 700, 500, 3,
		Sleep, 1500
		Click
		ToolTip, Found ... `n%ImageName% at %FoundX% : %FoundY%!, 10, 40
		Sleep, 3500
		return true
	} 
	else 
	{
		ToolTip, Searching ... `n%ImageName%, 10, 40
	}
}

; *** Random Sleep Time ***
RanSleep() 
{
	Random, SleepTime, 1000, 3000
	Sleep, %SleepTime%
}

; *** Stop Script ***
~Escape::
    Suspend, Toggle
    Pause,,1
	return
	
~Tab::
	ExitApp
	return