@implementation VOSCommandCategory

+ (VOSCommandCategory)interaction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VOSCommandCategory *v8;
  void *v9;
  VOSCommandCategory *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand PrimaryActivate](VOSCommand, "PrimaryActivate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand SecondaryActivate](VOSCommand, "SecondaryActivate", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  +[VOSCommand MagicTap](VOSCommand, "MagicTap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  +[VOSCommand Escape](VOSCommand, "Escape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  +[VOSCommand PerformLongPress](VOSCommand, "PerformLongPress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.Interaction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v8, "initWithCommands:localizedCategoryName:", v7, v9);

  return v10;
}

+ (VOSCommandCategory)basicNavigation
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
  void *v12;
  void *v13;
  VOSCommandCategory *v14;
  void *v15;
  VOSCommandCategory *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[19];

  v27[17] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand MoveToPreviousElement](VOSCommand, "MoveToPreviousElement");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v26;
  +[VOSCommand MoveToNextElement](VOSCommand, "MoveToNextElement");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v25;
  +[VOSCommand MoveToFirstElement](VOSCommand, "MoveToFirstElement");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v24;
  +[VOSCommand MoveToElementAbove](VOSCommand, "MoveToElementAbove");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v23;
  +[VOSCommand MoveToElementBelow](VOSCommand, "MoveToElementBelow");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v22;
  +[VOSCommand MoveToLastElement](VOSCommand, "MoveToLastElement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v21;
  +[VOSCommand MoveToCenterElement](VOSCommand, "MoveToCenterElement");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v20;
  +[VOSCommand MoveToPreviousContainer](VOSCommand, "MoveToPreviousContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v19;
  +[VOSCommand MoveToNextContainer](VOSCommand, "MoveToNextContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v18;
  +[VOSCommand MoveToTopOfCurrentContainer](VOSCommand, "MoveToTopOfCurrentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v2;
  +[VOSCommand MoveToBottomOfCurrentContainer](VOSCommand, "MoveToBottomOfCurrentContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v3;
  +[VOSCommand MoveToTopOfCurrentDocument](VOSCommand, "MoveToTopOfCurrentDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v4;
  +[VOSCommand MoveToBottomOfCurrentDocument](VOSCommand, "MoveToBottomOfCurrentDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[12] = v5;
  +[VOSCommand MoveToLinkedUI](VOSCommand, "MoveToLinkedUI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[13] = v6;
  +[VOSCommand MoveToStatusBar](VOSCommand, "MoveToStatusBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[14] = v7;
  +[VOSCommand MoveToPreviousElementCommunity](VOSCommand, "MoveToPreviousElementCommunity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[15] = v8;
  +[VOSCommand MoveToNextElementCommunity](VOSCommand, "MoveToNextElementCommunity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[16] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    +[VOSCommand MoveIn](VOSCommand, "MoveIn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[VOSCommand MoveOut](VOSCommand, "MoveOut");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObject:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.BasicNavigation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v14, "initWithCommands:localizedCategoryName:", v10, v15);

  return v16;
}

+ (VOSCommandCategory)textNavigation
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
  VOSCommandCategory *v12;
  void *v13;
  VOSCommandCategory *v14;
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
  _QWORD v35[30];

  v35[28] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand MoveToPreviousCharacter](VOSCommand, "MoveToPreviousCharacter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v34;
  +[VOSCommand MoveToNextCharacter](VOSCommand, "MoveToNextCharacter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v33;
  +[VOSCommand MoveToPreviousWord](VOSCommand, "MoveToPreviousWord");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v32;
  +[VOSCommand MoveToNextWord](VOSCommand, "MoveToNextWord");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v31;
  +[VOSCommand MoveToPreviousSentence](VOSCommand, "MoveToPreviousSentence");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v30;
  +[VOSCommand MoveToNextSentence](VOSCommand, "MoveToNextSentence");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v29;
  +[VOSCommand MoveToPreviousParagraph](VOSCommand, "MoveToPreviousParagraph");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v28;
  +[VOSCommand MoveToNextParagraph](VOSCommand, "MoveToNextParagraph");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v27;
  +[VOSCommand MoveToPreviousStyleChange](VOSCommand, "MoveToPreviousStyleChange");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v26;
  +[VOSCommand MoveToNextStyleChange](VOSCommand, "MoveToNextStyleChange");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v25;
  +[VOSCommand MoveToPreviousFontChange](VOSCommand, "MoveToPreviousFontChange");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v24;
  +[VOSCommand MoveToNextFontChange](VOSCommand, "MoveToNextFontChange");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[11] = v23;
  +[VOSCommand MoveToPreviousUnderlineText](VOSCommand, "MoveToPreviousUnderlineText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[12] = v22;
  +[VOSCommand MoveToNextUnderlineText](VOSCommand, "MoveToNextUnderlineText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[13] = v21;
  +[VOSCommand MoveToPreviousItalicText](VOSCommand, "MoveToPreviousItalicText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[14] = v20;
  +[VOSCommand MoveToNextItalicText](VOSCommand, "MoveToNextItalicText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[15] = v19;
  +[VOSCommand MoveToPreviousBoldText](VOSCommand, "MoveToPreviousBoldText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[16] = v18;
  +[VOSCommand MoveToNextBoldText](VOSCommand, "MoveToNextBoldText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[17] = v16;
  +[VOSCommand MoveToPreviousColorChange](VOSCommand, "MoveToPreviousColorChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v35[18] = v2;
  +[VOSCommand MoveToNextColorChange](VOSCommand, "MoveToNextColorChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[19] = v3;
  +[VOSCommand MoveToPreviousPlainText](VOSCommand, "MoveToPreviousPlainText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[20] = v4;
  +[VOSCommand MoveToNextPlainText](VOSCommand, "MoveToNextPlainText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[21] = v5;
  +[VOSCommand MoveToPreviousMisspelledWord](VOSCommand, "MoveToPreviousMisspelledWord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[22] = v6;
  +[VOSCommand MoveToNextMisspelledWord](VOSCommand, "MoveToNextMisspelledWord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[23] = v7;
  +[VOSCommand MoveToPreviousBlockquote](VOSCommand, "MoveToPreviousBlockquote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[24] = v8;
  +[VOSCommand MoveToNextBlockquote](VOSCommand, "MoveToNextBlockquote");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[25] = v9;
  +[VOSCommand MoveToPreviousSameBlockquote](VOSCommand, "MoveToPreviousSameBlockquote");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[26] = v10;
  +[VOSCommand MoveToNextSameBlockquote](VOSCommand, "MoveToNextSameBlockquote");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[27] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.TextNavigation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v12, "initWithCommands:localizedCategoryName:", v17, v13);

  return v14;
}

+ (VOSCommandCategory)editing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VOSCommandCategory *v8;
  void *v9;
  VOSCommandCategory *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand Cut](VOSCommand, "Cut");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand Copy](VOSCommand, "Copy", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  +[VOSCommand Paste](VOSCommand, "Paste");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  +[VOSCommand Undo](VOSCommand, "Undo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  +[VOSCommand Redo](VOSCommand, "Redo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.Editing"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v8, "initWithCommands:localizedCategoryName:", v7, v9);

  return v10;
}

+ (VOSCommandCategory)advancedNavigation
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
  VOSCommandCategory *v12;
  void *v13;
  VOSCommandCategory *v14;
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
  _QWORD v35[30];

  v35[28] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand MoveToPreviousFrame](VOSCommand, "MoveToPreviousFrame");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v34;
  +[VOSCommand MoveToNextFrame](VOSCommand, "MoveToNextFrame");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v33;
  +[VOSCommand MoveToPreviousTable](VOSCommand, "MoveToPreviousTable");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v32;
  +[VOSCommand MoveToNextTable](VOSCommand, "MoveToNextTable");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v31;
  +[VOSCommand MoveToPreviousColumn](VOSCommand, "MoveToPreviousColumn");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v30;
  +[VOSCommand MoveToNextColumn](VOSCommand, "MoveToNextColumn");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v29;
  +[VOSCommand MoveToPreviousList](VOSCommand, "MoveToPreviousList");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v28;
  +[VOSCommand MoveToNextList](VOSCommand, "MoveToNextList");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v27;
  +[VOSCommand MoveToPreviousSameElement](VOSCommand, "MoveToPreviousSameElement");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v26;
  +[VOSCommand MoveToNextSameElement](VOSCommand, "MoveToNextSameElement");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v25;
  +[VOSCommand MoveToPreviousDifferentElement](VOSCommand, "MoveToPreviousDifferentElement");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v24;
  +[VOSCommand MoveToNextDifferentElement](VOSCommand, "MoveToNextDifferentElement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[11] = v23;
  +[VOSCommand MoveToPreviousHeading](VOSCommand, "MoveToPreviousHeading");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[12] = v22;
  +[VOSCommand MoveToNextHeading](VOSCommand, "MoveToNextHeading");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[13] = v21;
  +[VOSCommand MoveToPreviousSameHeading](VOSCommand, "MoveToPreviousSameHeading");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[14] = v20;
  +[VOSCommand MoveToNextSameHeading](VOSCommand, "MoveToNextSameHeading");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[15] = v19;
  +[VOSCommand MoveToPreviousLink](VOSCommand, "MoveToPreviousLink");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[16] = v18;
  +[VOSCommand MoveToNextLink](VOSCommand, "MoveToNextLink");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[17] = v16;
  +[VOSCommand MoveToPreviousVisitedLink](VOSCommand, "MoveToPreviousVisitedLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v35[18] = v2;
  +[VOSCommand MoveToNextVisitedLink](VOSCommand, "MoveToNextVisitedLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[19] = v3;
  +[VOSCommand MoveToPreviousControl](VOSCommand, "MoveToPreviousControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[20] = v4;
  +[VOSCommand MoveToNextControl](VOSCommand, "MoveToNextControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[21] = v5;
  +[VOSCommand MoveToPreviousGraphic](VOSCommand, "MoveToPreviousGraphic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[22] = v6;
  +[VOSCommand MoveToNextGraphic](VOSCommand, "MoveToNextGraphic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[23] = v7;
  +[VOSCommand MoveToSystemFocusedElement](VOSCommand, "MoveToSystemFocusedElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[24] = v8;
  +[VOSCommand FindElementWithTextSearch](VOSCommand, "FindElementWithTextSearch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[25] = v9;
  +[VOSCommand PreviousSearchResult](VOSCommand, "PreviousSearchResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[26] = v10;
  +[VOSCommand NextSearchResult](VOSCommand, "NextSearchResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[27] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.AdvancedNavigation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v12, "initWithCommands:localizedCategoryName:", v17, v13);

  return v14;
}

+ (VOSCommandCategory)braille
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
  VOSCommandCategory *v12;
  void *v13;
  VOSCommandCategory *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[13];

  v19[12] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand BraillePanLeft](VOSCommand, "BraillePanLeft");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  +[VOSCommand BraillePanRight](VOSCommand, "BraillePanRight");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  +[VOSCommand BrailleNextInputTable](VOSCommand, "BrailleNextInputTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  +[VOSCommand BrailleNextOutputTable](VOSCommand, "BrailleNextOutputTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v2;
  +[VOSCommand BrailleAnnouncementMode](VOSCommand, "BrailleAnnouncementMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v3;
  +[VOSCommand BrailleTranslate](VOSCommand, "BrailleTranslate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v4;
  +[VOSCommand BrailleToggleWordWrap](VOSCommand, "BrailleToggleWordWrap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v5;
  +[VOSCommand BrailleTranslateToClipboard](VOSCommand, "BrailleTranslateToClipboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v6;
  +[VOSCommand BrailleEnableAutoAdvance](VOSCommand, "BrailleEnableAutoAdvance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v7;
  +[VOSCommand BrailleIncreaseAutoAdvance](VOSCommand, "BrailleIncreaseAutoAdvance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v8;
  +[VOSCommand BrailleDecreaseAutoAdvance](VOSCommand, "BrailleDecreaseAutoAdvance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v9;
  +[VOSCommand BrailleReconnectBrailleDisplays](VOSCommand, "BrailleReconnectBrailleDisplays");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.Braille"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v12, "initWithCommands:localizedCategoryName:", v11, v13);

  return v14;
}

+ (VOSCommandCategory)speechAndAudio
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VOSCommandCategory *v8;
  void *v9;
  VOSCommandCategory *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand ToggleMute](VOSCommand, "ToggleMute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleSpeech](VOSCommand, "ToggleSpeech", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  +[VOSCommand ChangeAudioDuckingMode](VOSCommand, "ChangeAudioDuckingMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  +[VOSCommand VolumeUp](VOSCommand, "VolumeUp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  +[VOSCommand VolumeDown](VOSCommand, "VolumeDown");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.SpeechAndAudio"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v8, "initWithCommands:localizedCategoryName:", v7, v9);

  return v10;
}

+ (VOSCommandCategory)output
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
  uint64_t v12;
  VOSCommandCategory *v13;
  void *v14;
  VOSCommandCategory *v15;
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
  _QWORD v30[23];

  v30[21] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand SummarizeElement](VOSCommand, "SummarizeElement");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v29;
  +[VOSCommand AnalyzeElement](VOSCommand, "AnalyzeElement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v28;
  +[VOSCommand ReadAll](VOSCommand, "ReadAll");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v27;
  +[VOSCommand ReadFromTop](VOSCommand, "ReadFromTop");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v26;
  +[VOSCommand ReadLine](VOSCommand, "ReadLine");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v25;
  +[VOSCommand ReadWord](VOSCommand, "ReadWord");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v24;
  +[VOSCommand ReadURL](VOSCommand, "ReadURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v23;
  +[VOSCommand ReadSelectedText](VOSCommand, "ReadSelectedText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v22;
  +[VOSCommand ReadTextStyle](VOSCommand, "ReadTextStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v21;
  +[VOSCommand ReadHint](VOSCommand, "ReadHint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v20;
  +[VOSCommand ReadCharacter](VOSCommand, "ReadCharacter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v19;
  +[VOSCommand ReadCharacterPhonetically](VOSCommand, "ReadCharacterPhonetically");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[11] = v18;
  +[VOSCommand ReadRowHeader](VOSCommand, "ReadRowHeader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[12] = v17;
  +[VOSCommand ReadRowContents](VOSCommand, "ReadRowContents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[13] = v2;
  +[VOSCommand ReadTableRowColumn](VOSCommand, "ReadTableRowColumn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30[14] = v3;
  +[VOSCommand ReadTableRowColumnCell](VOSCommand, "ReadTableRowColumnCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[15] = v4;
  +[VOSCommand ReadColumnHeader](VOSCommand, "ReadColumnHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[16] = v5;
  +[VOSCommand ReadColumnContents](VOSCommand, "ReadColumnContents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[17] = v6;
  +[VOSCommand ReadLineCount](VOSCommand, "ReadLineCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[18] = v7;
  +[VOSCommand SummarizeSystemFocusedElement](VOSCommand, "SummarizeSystemFocusedElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[19] = v8;
  +[VOSCommand ReadSystemFocusedElementDetails](VOSCommand, "ReadSystemFocusedElementDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[20] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (AXDeviceHasForcePress3dTouch())
  {
    +[VOSCommand PreviewElementWith3DTouch](VOSCommand, "PreviewElementWith3DTouch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObject:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  v13 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.Output"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v13, "initWithCommands:localizedCategoryName:", v10, v14);

  return v15;
}

+ (VOSCommandCategory)rotor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VOSCommandCategory *v7;
  void *v8;
  VOSCommandCategory *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand PreviousRotor](VOSCommand, "PreviousRotor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[VOSCommand NextRotor](VOSCommand, "NextRotor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[VOSCommand PreviousRotorItem](VOSCommand, "PreviousRotorItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[VOSCommand NextRotorItem](VOSCommand, "NextRotorItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.Rotor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v7, "initWithCommands:localizedCategoryName:", v6, v8);

  return v9;
}

+ (VOSCommandCategory)scrolling
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VOSCommandCategory *v9;
  void *v10;
  VOSCommandCategory *v11;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand ScrollLeft](VOSCommand, "ScrollLeft");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  +[VOSCommand ScrollRight](VOSCommand, "ScrollRight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  +[VOSCommand ScrollUp](VOSCommand, "ScrollUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  +[VOSCommand ScrollDown](VOSCommand, "ScrollDown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  +[VOSCommand ScrollToTop](VOSCommand, "ScrollToTop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  +[VOSCommand ScrollToBottom](VOSCommand, "ScrollToBottom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.Scrolling"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v9, "initWithCommands:localizedCategoryName:", v8, v10);

  return v11;
}

+ (VOSCommandCategory)voiceOverFeatures
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
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  VOSCommandCategory *v20;
  void *v21;
  VOSCommandCategory *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[17];

  v31[15] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand ShowItemChooser](VOSCommand, "ShowItemChooser");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v29;
  +[VOSCommand OpenVoiceOverSettings](VOSCommand, "OpenVoiceOverSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v28;
  +[VOSCommand ToggleScreenCurtain](VOSCommand, "ToggleScreenCurtain");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v27;
  +[VOSCommand ToggleSoundCurtain](VOSCommand, "ToggleSoundCurtain");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v26;
  +[VOSCommand StartHelp](VOSCommand, "StartHelp");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v25;
  +[VOSCommand ToggleCaptionPanel](VOSCommand, "ToggleCaptionPanel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v24;
  +[VOSCommand LabelElement](VOSCommand, "LabelElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v2;
  +[VOSCommand MonitorElement](VOSCommand, "MonitorElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v3;
  +[VOSCommand ToggleSingleLetterQuickNav](VOSCommand, "ToggleSingleLetterQuickNav");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v4;
  +[VOSCommand ToggleQuickNav](VOSCommand, "ToggleQuickNav");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v5;
  +[VOSCommand ToggleLockModifierKeys](VOSCommand, "ToggleLockModifierKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v6;
  +[VOSCommand ToggleLiveRegions](VOSCommand, "ToggleLiveRegions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[11] = v7;
  +[VOSCommand ActivateBrailleScreenInput](VOSCommand, "ActivateBrailleScreenInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[12] = v8;
  +[VOSCommand ActivateBrailleScreenInputCommand](VOSCommand, "ActivateBrailleScreenInputCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[13] = v9;
  +[VOSCommand LaunchPeopleDetection](VOSCommand, "LaunchPeopleDetection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[14] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "physicalMemory") <= 0x773593FF)
  {
    v14 = v30;
    goto LABEL_5;
  }
  v12 = AXRuntimeCheck_HasANE();

  if (v12)
  {
    +[VOSCommand DescribeImage](VOSCommand, "DescribeImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "arrayByAddingObject:", v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v13;
LABEL_5:

    goto LABEL_7;
  }
  v14 = v30;
LABEL_7:
  if (_os_feature_enabled_impl())
  {
    +[VOSCommand ToggleSettingsHUD](VOSCommand, "ToggleSettingsHUD");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObject:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v17, "physicalMemory") <= 0x773593FF)
    goto LABEL_12;
  v18 = AXRuntimeCheck_HasANE();

  if (v18)
  {
    +[VOSCommand ToggleAutomaticAccessibility](VOSCommand, "ToggleAutomaticAccessibility");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObject:", v17);
    v19 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v19;
LABEL_12:

  }
  v20 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.VoiceOverFeatures"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v20, "initWithCommands:localizedCategoryName:", v14, v21);

  return v22;
}

+ (VOSCommandCategory)system
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
  uint64_t v12;
  VOSCommandCategory *v13;
  void *v14;
  VOSCommandCategory *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[15];

  v22[13] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand ShowNotificationCenter](VOSCommand, "ShowNotificationCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v21;
  +[VOSCommand ShowControlCenter](VOSCommand, "ShowControlCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v20;
  +[VOSCommand ActivateSpeakScreen](VOSCommand, "ActivateSpeakScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v19;
  +[VOSCommand ActivateHomeButton](VOSCommand, "ActivateHomeButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  +[VOSCommand ToggleDock](VOSCommand, "ToggleDock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v17;
  +[VOSCommand ToggleAppSwitcher](VOSCommand, "ToggleAppSwitcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v2;
  +[VOSCommand ActivateLockButton](VOSCommand, "ActivateLockButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v3;
  +[VOSCommand ShowSpotlight](VOSCommand, "ShowSpotlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v4;
  +[VOSCommand ActivateAccessibilityShortcut](VOSCommand, "ActivateAccessibilityShortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v5;
  +[VOSCommand ToggleReachability](VOSCommand, "ToggleReachability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v6;
  +[VOSCommand TakeScreenshot](VOSCommand, "TakeScreenshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v7;
  +[VOSCommand SwitchToPreviousApp](VOSCommand, "SwitchToPreviousApp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v8;
  +[VOSCommand SwitchToNextApp](VOSCommand, "SwitchToNextApp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (AXDeviceIsPad())
  {
    +[VOSCommand ToggleQuickNote](VOSCommand, "ToggleQuickNote");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObject:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  v13 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.System"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v13, "initWithCommands:localizedCategoryName:", v10, v14);

  return v15;
}

+ (VOSCommandCategory)other
{
  void *v2;
  void *v3;
  void *v4;
  VOSCommandCategory *v5;
  void *v6;
  VOSCommandCategory *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand ToggleTextSelection](VOSCommand, "ToggleTextSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  +[VOSCommand CopySpeechToClipboard](VOSCommand, "CopySpeechToClipboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.Other"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v5, "initWithCommands:localizedCategoryName:", v4, v6);

  return v7;
}

+ (VOSCommandCategory)internalOnly
{
  VOSCommandCategory *v2;
  const __CFString *v3;

  v2 = [VOSCommandCategory alloc];
  if (AXIsInternalInstall())
    v3 = CFSTR("Internal Only");
  else
    v3 = &stru_24CBADC48;
  return -[VOSCommandCategory initWithCommands:localizedCategoryName:](v2, "initWithCommands:localizedCategoryName:", MEMORY[0x24BDBD1A8], v3);
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[15];

  v19[13] = *MEMORY[0x24BDAC8D0];
  +[VOSCommandCategory interaction](VOSCommandCategory, "interaction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  +[VOSCommandCategory basicNavigation](VOSCommandCategory, "basicNavigation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  +[VOSCommandCategory textNavigation](VOSCommandCategory, "textNavigation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  +[VOSCommandCategory advancedNavigation](VOSCommandCategory, "advancedNavigation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v15;
  +[VOSCommandCategory editing](VOSCommandCategory, "editing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v14;
  +[VOSCommandCategory rotor](VOSCommandCategory, "rotor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v2;
  +[VOSCommandCategory scrolling](VOSCommandCategory, "scrolling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v3;
  +[VOSCommandCategory speechAndAudio](VOSCommandCategory, "speechAndAudio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v4;
  +[VOSCommandCategory output](VOSCommandCategory, "output");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v5;
  +[VOSCommandCategory braille](VOSCommandCategory, "braille");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v6;
  +[VOSCommandCategory voiceOverFeatures](VOSCommandCategory, "voiceOverFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v7;
  +[VOSCommandCategory system](VOSCommandCategory, "system");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v8;
  +[VOSCommandCategory other](VOSCommandCategory, "other");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (AXIsInternalInstall())
  {
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    +[VOSCommandCategory internalOnly](VOSCommandCategory, "internalOnly");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    v10 = v11;
  }
  return (NSArray *)v10;
}

+ (VOSCommandCategory)handwriting
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
  VOSCommandCategory *v12;
  void *v13;
  VOSCommandCategory *v14;
  void *v16;
  void *v17;
  _QWORD v18[12];

  v18[11] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand PreviousHandwritingCharacterMode](VOSCommand, "PreviousHandwritingCharacterMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  +[VOSCommand NextHandwritingCharacterMode](VOSCommand, "NextHandwritingCharacterMode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  +[VOSCommand AnnounceHandwritingCharacterMode](VOSCommand, "AnnounceHandwritingCharacterMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v2;
  +[VOSCommand GesturedTextInputInsertSpace](VOSCommand, "GesturedTextInputInsertSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v3;
  +[VOSCommand GesturedTextInputBackspace](VOSCommand, "GesturedTextInputBackspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v4;
  +[VOSCommand GesturedTextInputDeleteWord](VOSCommand, "GesturedTextInputDeleteWord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v5;
  +[VOSCommand GesturedTextInputPerformReturnEquivalent](VOSCommand, "GesturedTextInputPerformReturnEquivalent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v6;
  +[VOSCommand GesturedTextInputPreviousSuggestion](VOSCommand, "GesturedTextInputPreviousSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v7;
  +[VOSCommand GesturedTextInputNextSuggestion](VOSCommand, "GesturedTextInputNextSuggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v8;
  +[VOSCommand GesturedTextInputLaunchApp](VOSCommand, "GesturedTextInputLaunchApp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v9;
  +[VOSCommand GesturedTextInputNextKeyboardLanguage](VOSCommand, "GesturedTextInputNextKeyboardLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.Handwriting"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v12, "initWithCommands:localizedCategoryName:", v11, v13);

  return v14;
}

+ (VOSCommandCategory)brailleScreenInput
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
  VOSCommandCategory *v12;
  void *v13;
  VOSCommandCategory *v14;
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
  _QWORD v27[22];

  v27[20] = *MEMORY[0x24BDAC8D0];
  +[VOSCommand BSIExit](VOSCommand, "BSIExit");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v26;
  +[VOSCommand BSIPreviousBrailleMode](VOSCommand, "BSIPreviousBrailleMode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v25;
  +[VOSCommand BSINextBrailleMode](VOSCommand, "BSINextBrailleMode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v24;
  +[VOSCommand BSITranslateImmediately](VOSCommand, "BSITranslateImmediately");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v23;
  +[VOSCommand BSIOrientationLock](VOSCommand, "BSIOrientationLock");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v22;
  +[VOSCommand BSIQuickAction](VOSCommand, "BSIQuickAction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v21;
  +[VOSCommand GesturedTextInputInsertSpace](VOSCommand, "GesturedTextInputInsertSpace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v20;
  +[VOSCommand GesturedTextInputBackspace](VOSCommand, "GesturedTextInputBackspace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v19;
  +[VOSCommand GesturedTextInputDeleteWord](VOSCommand, "GesturedTextInputDeleteWord");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v18;
  +[VOSCommand GesturedTextInputPerformReturnEquivalent](VOSCommand, "GesturedTextInputPerformReturnEquivalent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v17;
  +[VOSCommand GesturedTextInputPreviousSuggestion](VOSCommand, "GesturedTextInputPreviousSuggestion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v16;
  +[VOSCommand GesturedTextInputNextSuggestion](VOSCommand, "GesturedTextInputNextSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v2;
  +[VOSCommand GesturedTextInputLaunchApp](VOSCommand, "GesturedTextInputLaunchApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[12] = v3;
  +[VOSCommand GesturedTextInputNextKeyboardLanguage](VOSCommand, "GesturedTextInputNextKeyboardLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[13] = v4;
  +[VOSCommand GesturedTextInputNextBrailleTable](VOSCommand, "GesturedTextInputNextBrailleTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[14] = v5;
  +[VOSCommand Cut](VOSCommand, "Cut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[15] = v6;
  +[VOSCommand Copy](VOSCommand, "Copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[16] = v7;
  +[VOSCommand Paste](VOSCommand, "Paste");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[17] = v8;
  +[VOSCommand Undo](VOSCommand, "Undo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[18] = v9;
  +[VOSCommand Redo](VOSCommand, "Redo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[19] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [VOSCommandCategory alloc];
  VOSLocString(CFSTR("VOSCommandCategory.BSI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](v12, "initWithCommands:localizedCategoryName:", v11, v13);

  return v14;
}

- (VOSCommandCategory)initWithCommands:(id)a3 localizedCategoryName:(id)a4
{
  id v6;
  id v7;
  VOSCommandCategory *v8;
  VOSCommandCategory *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VOSCommandCategory;
  v8 = -[VOSCommandCategory init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[VOSCommandCategory setLocalizedCategoryName:](v8, "setLocalizedCategoryName:", v7);
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VOSCommandCategory setCommands:](v9, "setCommands:", v10);

  }
  return v9;
}

uint64_t __61__VOSCommandCategory_initWithCommands_localizedCategoryName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompare:", v6);
  return v7;
}

- (VOSCommandCategory)init
{
  void *v3;
  VOSCommandCategory *v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VOSCommandCategory initWithCommands:localizedCategoryName:](self, "initWithCommands:localizedCategoryName:", v3, &stru_24CBADC48);

  return v4;
}

- (BOOL)containsCommand:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[VOSCommandCategory commands](self, "commands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)categories:(id)a3 containsCommand:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "containsCommand:", v6, (_QWORD)v12) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
  objc_storeStrong((id *)&self->_commands, a3);
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
  objc_storeStrong((id *)&self->_commands, 0);
}

@end
