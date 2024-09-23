@implementation VOSOutputEventCategory

+ (VOSOutputEventCategory)interaction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VOSOutputEventCategory *v12;
  void *v13;
  VOSOutputEventCategory *v14;
  void *v16;
  void *v17;
  _QWORD v18[12];

  v18[11] = *MEMORY[0x24BDAC8D0];
  +[VOSOutputEvent DidFocusOnElement](VOSOutputEvent, "DidFocusOnElement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  +[VOSOutputEvent DidFocusOnScreenRecognitionElement](VOSOutputEvent, "DidFocusOnScreenRecognitionElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  +[VOSOutputEvent DidActivateElement](VOSOutputEvent, "DidActivateElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v2;
  +[VOSOutputEvent DidWrapBackwards](VOSOutputEvent, "DidWrapBackwards");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v3;
  +[VOSOutputEvent DidWrapForwards](VOSOutputEvent, "DidWrapForwards");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v4;
  +[VOSOutputEvent DidScrollByPage](VOSOutputEvent, "DidScrollByPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v5;
  +[VOSOutputEvent BoundaryEncountered](VOSOutputEvent, "BoundaryEncountered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v6;
  +[VOSOutputEvent NoItemExists](VOSOutputEvent, "NoItemExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v7;
  +[VOSOutputEvent IsInteractable](VOSOutputEvent, "IsInteractable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v8;
  +[VOSOutputEvent InteractIn](VOSOutputEvent, "InteractIn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v9;
  +[VOSOutputEvent InteractOut](VOSOutputEvent, "InteractOut");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [VOSOutputEventCategory alloc];
  VOSLocString(CFSTR("VOSOutputEventCategory.Interaction"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VOSOutputEventCategory initWithOutputEvents:localizedCategoryName:](v12, "initWithOutputEvents:localizedCategoryName:", v11, v13);

  return v14;
}

+ (id)voiceOverFeedback
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VOSOutputEventCategory *v12;
  void *v13;
  VOSOutputEventCategory *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[32];

  v37[30] = *MEMORY[0x24BDAC8D0];
  +[VOSOutputEvent ScreenDidChange](VOSOutputEvent, "ScreenDidChange");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v36;
  +[VOSOutputEvent DidSyncWithSystemFocus](VOSOutputEvent, "DidSyncWithSystemFocus");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v35;
  +[VOSOutputEvent DidEnterTargetArea](VOSOutputEvent, "DidEnterTargetArea");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v34;
  +[VOSOutputEvent DidLeaveTargetArea](VOSOutputEvent, "DidLeaveTargetArea");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v33;
  +[VOSOutputEvent DidEnterTouchContainer](VOSOutputEvent, "DidEnterTouchContainer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v32;
  +[VOSOutputEvent DidSelectPreviousRotor](VOSOutputEvent, "DidSelectPreviousRotor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v31;
  +[VOSOutputEvent DidSelectNextRotor](VOSOutputEvent, "DidSelectNextRotor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v30;
  +[VOSOutputEvent PreviousRotorProgress](VOSOutputEvent, "PreviousRotorProgress");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v29;
  +[VOSOutputEvent NextRotorProgress](VOSOutputEvent, "NextRotorProgress");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v28;
  +[VOSOutputEvent DidBeginPassthrough](VOSOutputEvent, "DidBeginPassthrough");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = v27;
  +[VOSOutputEvent NoResultsFound](VOSOutputEvent, "NoResultsFound");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[10] = v26;
  +[VOSOutputEvent DidRecognizeMLContent](VOSOutputEvent, "DidRecognizeMLContent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[11] = v25;
  +[VOSOutputEvent DidEnableQuickNav](VOSOutputEvent, "DidEnableQuickNav");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[12] = v24;
  +[VOSOutputEvent DidDisableQuickNav](VOSOutputEvent, "DidDisableQuickNav");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[13] = v23;
  +[VOSOutputEvent SensitiveContent](VOSOutputEvent, "SensitiveContent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[14] = v22;
  +[VOSOutputEvent Startup](VOSOutputEvent, "Startup");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37[15] = v21;
  +[VOSOutputEvent BSIDidEnableTyping](VOSOutputEvent, "BSIDidEnableTyping");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[16] = v20;
  +[VOSOutputEvent BSIDidEnableCommand](VOSOutputEvent, "BSIDidEnableCommand");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[17] = v19;
  +[VOSOutputEvent BSIDidDisable](VOSOutputEvent, "BSIDidDisable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[18] = v17;
  +[VOSOutputEvent BSIDidCalibrate](VOSOutputEvent, "BSIDidCalibrate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[19] = v16;
  +[VOSOutputEvent BSIDidCarriageReturn](VOSOutputEvent, "BSIDidCarriageReturn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37[20] = v2;
  +[VOSOutputEvent BSIDidType](VOSOutputEvent, "BSIDidType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37[21] = v3;
  +[VOSOutputEvent BSIDidDelete](VOSOutputEvent, "BSIDidDelete");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[22] = v4;
  +[VOSOutputEvent BSIDidEnterSpace](VOSOutputEvent, "BSIDidEnterSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[23] = v5;
  +[VOSOutputEvent BSIDidEnterChord](VOSOutputEvent, "BSIDidEnterChord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[24] = v6;
  +[VOSOutputEvent TutorialSuccess](VOSOutputEvent, "TutorialSuccess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[25] = v7;
  +[VOSOutputEvent TutorialMagicTapStart](VOSOutputEvent, "TutorialMagicTapStart");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[26] = v8;
  +[VOSOutputEvent TutorialMagicTapStop](VOSOutputEvent, "TutorialMagicTapStop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[27] = v9;
  +[VOSOutputEvent BrailleDisplayReconnectionTriggered](VOSOutputEvent, "BrailleDisplayReconnectionTriggered");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[28] = v10;
  +[VOSOutputEvent UnknownCommand](VOSOutputEvent, "UnknownCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[29] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [VOSOutputEventCategory alloc];
  VOSLocString(CFSTR("VOSOutputEventCategory.VoiceOverFeedback"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VOSOutputEventCategory initWithOutputEvents:localizedCategoryName:](v12, "initWithOutputEvents:localizedCategoryName:", v18, v13);

  return v14;
}

+ (id)appFeedback
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VOSOutputEventCategory *v9;
  void *v10;
  VOSOutputEventCategory *v11;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x24BDAC8D0];
  +[VOSOutputEvent ItemIsLoading](VOSOutputEvent, "ItemIsLoading");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  +[VOSOutputEvent ItemDidLoad](VOSOutputEvent, "ItemDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  +[VOSOutputEvent PopoverDidAppear](VOSOutputEvent, "PopoverDidAppear");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  +[VOSOutputEvent AlertDidAppear](VOSOutputEvent, "AlertDidAppear");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  +[VOSOutputEvent NotificationDidAppear](VOSOutputEvent, "NotificationDidAppear");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  +[VOSOutputEvent DidReorderItem](VOSOutputEvent, "DidReorderItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [VOSOutputEventCategory alloc];
  VOSLocString(CFSTR("VOSOutputEventCategory.AppFeedback"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VOSOutputEventCategory initWithOutputEvents:localizedCategoryName:](v9, "initWithOutputEvents:localizedCategoryName:", v8, v10);

  return v11;
}

+ (id)braille
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VOSOutputEventCategory *v8;
  void *v9;
  VOSOutputEventCategory *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  +[VOSOutputEvent BrailleDisplayConnected](VOSOutputEvent, "BrailleDisplayConnected");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BrailleDisplayDisconnected](VOSOutputEvent, "BrailleDisplayDisconnected", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  +[VOSOutputEvent ItemMemorizationSucceeded](VOSOutputEvent, "ItemMemorizationSucceeded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  +[VOSOutputEvent ItemMemorizationFailed](VOSOutputEvent, "ItemMemorizationFailed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  +[VOSOutputEvent ItemMemorizationInProgress](VOSOutputEvent, "ItemMemorizationInProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [VOSOutputEventCategory alloc];
  VOSLocString(CFSTR("VOSOutputEventCategory.Braille"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VOSOutputEventCategory initWithOutputEvents:localizedCategoryName:](v8, "initWithOutputEvents:localizedCategoryName:", v7, v9);

  return v10;
}

+ (id)textEditing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VOSOutputEventCategory *v10;
  void *v11;
  VOSOutputEventCategory *v12;
  _QWORD v14[8];

  v14[7] = *MEMORY[0x24BDAC8D0];
  +[VOSOutputEvent CollaborationOccurred](VOSOutputEvent, "CollaborationOccurred");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent InsertionPointDidMove](VOSOutputEvent, "InsertionPointDidMove", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  +[VOSOutputEvent AutofillDidAppear](VOSOutputEvent, "AutofillDidAppear");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v4;
  +[VOSOutputEvent AutofillDidDismiss](VOSOutputEvent, "AutofillDidDismiss");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v5;
  +[VOSOutputEvent DidChangeTextSelectionDirection](VOSOutputEvent, "DidChangeTextSelectionDirection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v6;
  +[VOSOutputEvent DidSelectAutofill](VOSOutputEvent, "DidSelectAutofill");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v7;
  +[VOSOutputEvent DidEnterSecureText](VOSOutputEvent, "DidEnterSecureText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [VOSOutputEventCategory alloc];
  VOSLocString(CFSTR("VOSOutputEventCategory.TextEditing"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VOSOutputEventCategory initWithOutputEvents:localizedCategoryName:](v10, "initWithOutputEvents:localizedCategoryName:", v9, v11);

  return v12;
}

+ (id)system
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VOSOutputEventCategory *v12;
  void *v13;
  VOSOutputEventCategory *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[14];

  v20[13] = *MEMORY[0x24BDAC8D0];
  +[VOSOutputEvent TouchIDAuthenticated](VOSOutputEvent, "TouchIDAuthenticated");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v19;
  +[VOSOutputEvent TouchIDFailed](VOSOutputEvent, "TouchIDFailed");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v18;
  +[VOSOutputEvent ReachabilityDidBegin](VOSOutputEvent, "ReachabilityDidBegin");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v17;
  +[VOSOutputEvent ReachabilityDidEnd](VOSOutputEvent, "ReachabilityDidEnd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v16;
  +[VOSOutputEvent DockDidAppear](VOSOutputEvent, "DockDidAppear");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v2;
  +[VOSOutputEvent DockDidDisappear](VOSOutputEvent, "DockDidDisappear");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v3;
  +[VOSOutputEvent FolderWillOpen](VOSOutputEvent, "FolderWillOpen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v4;
  +[VOSOutputEvent FolderDidOpen](VOSOutputEvent, "FolderDidOpen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v5;
  +[VOSOutputEvent FolderDidClose](VOSOutputEvent, "FolderDidClose");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v6;
  +[VOSOutputEvent KeyboardAppeared](VOSOutputEvent, "KeyboardAppeared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[9] = v7;
  +[VOSOutputEvent KeyboardDisappeared](VOSOutputEvent, "KeyboardDisappeared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[10] = v8;
  +[VOSOutputEvent DidChangeVolume](VOSOutputEvent, "DidChangeVolume");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[11] = v9;
  +[VOSOutputEvent ScreenDidTurnOff](VOSOutputEvent, "ScreenDidTurnOff");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[12] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [VOSOutputEventCategory alloc];
  VOSLocString(CFSTR("VOSOutputEventCategory.System"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VOSOutputEventCategory initWithOutputEvents:localizedCategoryName:](v12, "initWithOutputEvents:localizedCategoryName:", v11, v13);

  return v14;
}

+ (NSArray)allCategories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  +[VOSOutputEventCategory interaction](VOSOutputEventCategory, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  +[VOSOutputEventCategory voiceOverFeedback](VOSOutputEventCategory, "voiceOverFeedback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  +[VOSOutputEventCategory appFeedback](VOSOutputEventCategory, "appFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  +[VOSOutputEventCategory braille](VOSOutputEventCategory, "braille");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  +[VOSOutputEventCategory textEditing](VOSOutputEventCategory, "textEditing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  +[VOSOutputEventCategory system](VOSOutputEventCategory, "system");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (VOSOutputEventCategory)initWithOutputEvents:(id)a3 localizedCategoryName:(id)a4
{
  id v6;
  id v7;
  VOSOutputEventCategory *v8;
  VOSOutputEventCategory *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VOSOutputEventCategory;
  v8 = -[VOSOutputEventCategory init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[VOSOutputEventCategory setLocalizedCategoryName:](v8, "setLocalizedCategoryName:", v7);
    -[VOSOutputEventCategory setOutputEvents:](v9, "setOutputEvents:", v6);
  }

  return v9;
}

- (VOSOutputEventCategory)init
{
  return -[VOSOutputEventCategory initWithOutputEvents:localizedCategoryName:](self, "initWithOutputEvents:localizedCategoryName:", MEMORY[0x24BDBD1A8], &stru_24CBADC48);
}

- (BOOL)containsOutputEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[VOSOutputEventCategory outputEvents](self, "outputEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSArray)outputEvents
{
  return self->_outputEvents;
}

- (void)setOutputEvents:(id)a3
{
  objc_storeStrong((id *)&self->_outputEvents, a3);
}

- (NSString)localizedCategoryName
{
  return self->_localizedCategoryName;
}

- (void)setLocalizedCategoryName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedCategoryName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCategoryName, 0);
  objc_storeStrong((id *)&self->_outputEvents, 0);
}

@end
