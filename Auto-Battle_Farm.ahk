#Persistent
#NoEnv
#SingleInstance force

;Grab unique window ID
WinGetTitle, FEH , (Feh),,,

;*****************************************
Coordmode, Mouse, %FEH%
CoordMode, Pixel, %FEH%

;Check if window exists, or exit program
IfWinExist, %FEH% 
{
	WinActivate, %FEH%
	TimerB()
	
	while WinExist("FEH") 
	{
		Main()
	}
}
else 
{
	Msgbox, (LTrim Fire Emblem Heroes is not active!)
	ExitApp
}


Main() 
{
	ChooseDiff:
		DiffChosen := SelectButton("DifficultyLunatic.png")
		
	ChooseDiffb:
		DiffChosenb := SelectButton("DifficultyBonds.png")

	SelectSkip:
		SkipSelected := SelectButton("skip.png")
		
	SelectClose:
		CloseSelected := SelectButton("Close.png")
		
	SelectCloseB:
		CloseBSelected := SelectButton("CloseB.png")
		if (CloseBSelected == true) 
		{
			TimerB()
			Goto, SelectClose
		}
	
	SelectCloseC:
		CloseCSelected := SelectButton("CloseQuest.png")
		if (CloseCSelected == true) 
		{
			TimerB()
			Goto, SelectCloseC
		}
		
	SelectCloseD:
		CloseDSelected := SelectButton("CloseTTSeal.png")
		if (CloseDSelected == true) 
		{
			TimerB()
			Goto, SelectCloseD
		}

	Skip:
		Skipping := SelectButton("skip.png")
		
	SelectOkB:
		OkBSelected := SelectButton("OkB.png")
		
	StartAuto:
		AutoStarted := SelectButton("AutoBattleSmall.png")
		if (AutoStarted == true) 
		{
			TimerB()
			Goto, StartAuto
		}
		
	ConfirmAuto:
		AutoConfirmed := SelectButton("AutoBattleLarge.PNG")
		
	FightBonds:
		BondsFight := SelectButton("FightBonds.png")
	
	FightTempest:
		TTFight := SelectButton("FightTT.png")
		
	FightLEGION:
		LEGIONFight := SelectButton("FightLEGION.png")

	SelectFightB:
		FightBSelected := SelectButton("FightSelection.png")
		if (FightBSelected == true) 
		{
			TimerA()
			Goto, StartAuto
		}
		
	SelectFightC:
		FightCSelected := SelectButton("FightContinue.png")
		if (FightCSelected == true) 
		{
			TimerA()
			Goto, StartAuto
		}

	TheEnd:	
		Over := SelectButton("Gameover.png")
		if (Over == true) 
		{
			TimerA()
			Goto, TheEnd
		}
	
	Back:
		Backout := SelectButton("Back.png")	
		
		SelectFight:
		FightSelected := PreciseSelectButton("FightBar.png")
		if (FightSelected == true) 
		{
			TimerA()
			Goto, SelectFight
		}
			
	EndGame:
		GameEnd := PreciseSelectButton("GameWon.png")
		if (GameEnd == true) 
		{
			TimerA()
			Goto, SelectFight
		}
		
	EndGameB:
		GameEndB := PreciseSelectButton("GameLost.png")
		if (GameEndB ==	 true) 
		{
			Goto, SelectFight
			TimerA()
		}
		
	EndGameB2:
		GameEndB2 := PreciseSelectButton("Gameover.png")
		if (GameEndB2 == true) 
		{
			TimerA()
			Goto, SelectFight
		}
		
	SelectCloseTT:
		CloseTTSelected := PreciseSelectButton("CloseTTReward.png")
		if (SelectCloseTT == true) 
		{
			TimerA()
			Goto, SelectCloseTT
		}
		
	Surrender:
		GiveUp := PreciseSelectButton("Give.png")
		if (GiveUp == true) 
		{
			TimerA()
			Goto, SelectFight
		}
		
	Backout:
		Backout := PreciseSelectButton("Restore.png")
		if (Backout == true) 
		{
			TimerA()
		}
}

SelectButton(ImageName) 
{
	ColorDif := 75

	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%ColorDif% ButtonImages/%ImageName%
	if (FoundX != "" and FoundY != "") 
	{
		MouseMove, %FoundX%, %FoundY%, 3
		TimerB()
		Click
		ToolTip, Found ... `n%ImageName% at %FoundX% : %FoundY%!, 10, 40
		TimerB()
		return true
	} 
	else 
	{
		ToolTip, Searching ... `n%ImageName%, 10, 40
	}
}

PreciseSelectButton(ImageName) 
{
	ColorDif := 15

	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%ColorDif% ButtonImages/%ImageName%
	if (FoundX != "" and FoundY != "") 
	{
		MouseMove, %FoundX%, %FoundY%, 3
		TimerB()
		Click
		ToolTip, Found ... `n%ImageName% at %FoundX% : %FoundY%!, 10, 40
		TimerB()
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

TimerA() 
{
	Sleep, 3500
}

TimerB() 
{
	Sleep, 2000
}

; *** Stop Script ***
~Escape::
    Suspend, Toggle
    Pause,,1
	return
	
~Tab::
	ExitApp
	return