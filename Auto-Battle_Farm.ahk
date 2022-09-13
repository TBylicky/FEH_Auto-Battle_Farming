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
	;This is a temporary fix for error 308-8024 
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
	
	DifficultyAndArea:
		AreWeInsideTheTower := TowerSelection("TrainingTower.png")
		if (AreWeInsideTheTower == true)
		{
			FindQuest:
				QuestFound := SelectButton("Quest.png")
		}
		else
		{
			ChooseDiff:
				DiffChosen := SelectButton("DifficultyLunatic.png")
				
			ChooseDiffb:
				DiffChosenb := SelectButton("DifficultyBonds.png")
		}
		
	BigConfirmButton()
	
	MapStart()

	Skip:
		Skipping := SelectButton("skip.png")
		
	SelectOk:
		OkSelected := SelectButton("OkB.png")
			
	WinningGame:
		GameIsWon := MorePreciseSelectButton("GameWon.png")
		if (GameIsWon == true) 
		{
			BigConfirmButton()
		}
		
	LastUnitDies:
		LastUnitDead := PreciseSelectButton("GameLost.png")
		if (LastUnitDead == true) 
		{
			Sleep, 3000
		}
		
	TheEnd:	
		Over := SelectButton("Gameover.png")
		if (Over == true) 
		{
			Backout := PreciseSelectButton("ReturnError.png")
		}
		
	ResonantBattleBegin:
		ResonateBegin := PreciseSelectButton("ResonateBeginner.png")
		if (ResonateBegin == true) 
		{
			BigConfirmButton()
		}
		
	CancelRestore:
		Canceled := PreciseSelectButton("Restore.png")
		if (Canceled == true) 
		{
			Sleep, 2000
		}

	ReturnError:
		ReturnErrorSelected := PreciseSelectButton("ReturnError.png")
		if (ReturnErrorSelected == true) 
		{
			Sleep, 1500
			ReturnTitleSelected := SelectButton("ReturnTitle.png")
		}

}

; *** Functions ***
BigConfirmButton()
{
	ConfirmSelection := LessPreciseSelectButton("BIG_Confirm.png")
	if (ConfirmSelection == true)
	{
		Sleep, 2000
		AutoSmallButton := SelectButton("AutoBattleSmall.png")
		BigConfirmButton()
	}
}

MapStart()
{
	AutoSmallButton := SelectButton("AutoBattleSmall.png")
	if (AutoSmallButton == true)
	{
		Sleep, 2000
		AutoBigButton:= SelectButton("AutoBattleLarge.png")
	}
}

RanSleep() 
{
	Random, SleepTime, 1000, 3000
	Sleep, %SleepTime%
}

; *** Image Selectors ***
TowerSelection(ImageName) 
{
	ColorDif := 50

	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%ColorDif% ButtonImages/%ImageName%
	if (FoundX != "" and FoundY != "") 
	{
		Sleep, 1500
		ToolTip, Found ... `n%ImageName% at %FoundX% : %FoundY%!, 10, 40
		return true
	} 
	else 
	{
		ToolTip, Searching ... `n%ImageName%, 10, 40
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

LessPreciseSelectButton(ImageName) 
{
	ColorDif := 50

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
	ColorDif := 9

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

; *** Stop/Exit Script ***
~Escape::
    Suspend, Toggle
    Pause,,1
	return
	
~Tab::
	ExitApp
	return