@implementation CACTextEditingProvider

- (CACTextEditingProvider)initWithSpokenCommand:(id)a3 axElement:(id)a4
{
  id v7;
  id v8;
  CACTextEditingProvider *v9;
  CACTextEditingProvider *v10;
  uint64_t v11;
  SRCSTextEditing *textEditingEngine;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CACTextEditingProvider;
  v9 = -[CACTextEditingProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_spokenCommand, a3);
    objc_storeStrong((id *)&v10->_axElement, a4);
    v11 = objc_opt_new();
    textEditingEngine = v10->_textEditingEngine;
    v10->_textEditingEngine = (SRCSTextEditing *)v11;

    -[SRCSTextEditing setProvider:](v10->_textEditingEngine, "setProvider:", v10);
    -[SRCSTextEditing setDelayAfterSelectionBeforeExecutingAction:](v10->_textEditingEngine, "setDelayAfterSelectionBeforeExecutingAction:", 0.125);
  }

  return v10;
}

- (Class)textMarkerClass
{
  return (Class)objc_opt_class();
}

- (Class)textMarkerRangeClass
{
  return (Class)objc_opt_class();
}

- (void)formatSelectionBold
{
  -[AXElement cacApplyFormatBold](self->_axElement, "cacApplyFormatBold");
}

- (void)formatSelectionItalics
{
  -[AXElement cacApplyFormatItalics](self->_axElement, "cacApplyFormatItalics");
}

- (void)formatSelectionUnderline
{
  -[AXElement cacApplyFormatUnderline](self->_axElement, "cacApplyFormatUnderline");
}

- (void)applyFormat
{
  -[CACSpokenCommand applyFormat:](self->_spokenCommand, "applyFormat:", self->_axElement);
}

- (void)performTextCopy
{
  -[AXElement cacPerformTextCopy](self->_axElement, "cacPerformTextCopy");
}

- (void)performTextCut
{
  -[AXElement cacPerformTextCut](self->_axElement, "cacPerformTextCut");
}

- (void)performTextPaste
{
  -[AXElement cacPerformTextPaste](self->_axElement, "cacPerformTextPaste");
}

- (void)performTextUndo
{
  -[AXElement cacPerformTextUndo](self->_axElement, "cacPerformTextUndo");
}

- (void)performTextRedo
{
  -[AXElement cacPerformTextRedo](self->_axElement, "cacPerformTextRedo");
}

- (void)performTextSelectAll
{
  -[AXElement cacPerformTextSelectAll](self->_axElement, "cacPerformTextSelectAll");
}

- (CGRect)rectForRange:(_NSRange)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[AXElement rectForRange:](self->_axElement, "rectForRange:", a3.location, a3.length);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)isVisibleTextRange:(_NSRange)a3
{
  return -[AXElement isVisibleTextRange:](self->_axElement, "isVisibleTextRange:", a3.location, a3.length);
}

- (BOOL)isVisibleTextRect:(CGRect)a3
{
  return -[AXElement isVisibleTextRect:](self->_axElement, "isVisibleTextRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)selectionTextMarkerRange
{
  return -[AXElement cacTextSelectionCACTextMarkerRange](self->_axElement, "cacTextSelectionCACTextMarkerRange");
}

- (id)firstPositionTextMarker
{
  return -[AXElement cacFirstPosition](self->_axElement, "cacFirstPosition");
}

- (id)lastPositionTextMarker
{
  return -[AXElement cacLastPosition](self->_axElement, "cacLastPosition");
}

- (id)markerRangeForEnumerationType:(int64_t)a3 desiredBlock:(int)a4 count:(unint64_t)a5 options:(int)a6
{
  return (id)-[SRCSTextEditing markerRangeForEnumerationType:desiredBlock:count:options:](self->_textEditingEngine, "markerRangeForEnumerationType:desiredBlock:count:options:", a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

- (id)markerRangeForLineAtTextMarker:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[AXElement lineRangeForPosition:](self->_axElement, "lineRangeForPosition:", objc_msgSend(a3, "index"));
  return +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", v3, v4);
}

- (id)actOnStrings:(id)a3 ambiguityResolution:(id)a4 substringSearchGranularity:(int)a5 alwaysCallActionOnClosestMatch:(BOOL)a6 options:(id)a7 actionBlock:(id)a8
{
  return (id)-[SRCSTextEditing actOnStrings:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:actionBlock:](self->_textEditingEngine, "actOnStrings:ambiguityResolution:substringSearchGranularity:alwaysCallActionOnClosestMatch:options:actionBlock:", a3, a4, *(_QWORD *)&a5, a6, a7, a8);
}

- (id)actOnRange:(id)a3 options:(id)a4 actionBlock:(id)a5
{
  return (id)-[SRCSTextEditing actOnRange:options:actionBlock:](self->_textEditingEngine, "actOnRange:options:actionBlock:", a3, a4, a5);
}

- (void)setSelectionToTextMarkerRange:(id)a3
{
  -[AXElement cacSetTextSelectionToCACTextMarkerRange:](self->_axElement, "cacSetTextSelectionToCACTextMarkerRange:", a3);
}

- (id)stringForTextMarkerRange:(id)a3
{
  return -[AXElement cacStringForCACTextMarkerRange:](self->_axElement, "cacStringForCACTextMarkerRange:", a3);
}

- (void)deleteTextAtTextMarkerRange:(id)a3
{
  -[AXElement deleteTextAtTextMarkerRange:](self->_axElement, "deleteTextAtTextMarkerRange:", a3);
}

- (void)deleteText
{
  -[AXElement deleteText](self->_axElement, "deleteText");
}

- (id)textMarkerRangeFromPreviousTextInsertion
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[CACTextEditingProvider _rangeFromPreviousTextInsertionForAXElement:](self, "_rangeFromPreviousTextInsertionForAXElement:", self->_axElement);
  return +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", v2, v3);
}

- (id)nBestListFromPreviousTextInsertion
{
  return -[CACTextEditingProvider _nBestListFromPreviousTextInsertionForAXElement:](self, "_nBestListFromPreviousTextInsertionForAXElement:", self->_axElement);
}

- (int)searchGranularity
{
  void *v2;
  int v3;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 2 * (objc_msgSend(v2, "dictationRecognizerMode") == 3);

  return v3;
}

- (BOOL)isNextPreviousResolverSpokenCommandEmojiBased
{
  void *v2;
  char v3;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNextPreviousResolverSpokenCommandEmojiBased");

  return v3;
}

- (id)emojisMatchingTextInStrings:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        +[CACEmojiManager sharedManager](CACEmojiManager, "sharedManager", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "emojisForText:skinToneFilter:", v10, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "count"))
          objc_msgSend(v4, "addObjectsFromArray:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isTextDisambiguationSupported
{
  return 1;
}

- (int)statusOfEmojisFoundInString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  +[CACEmojiManager sharedManager](CACEmojiManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countOfEmojisInString:", v3);

  return v5 > 0;
}

- (BOOL)shouldInsertInterWordSpaces
{
  void *v2;
  int v3;
  void *v4;
  char v5;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dictationRecognizerMode");

  if ((v3 - 4) > 0xFFFFFFFD)
    return 0;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "doesCurrentLanguageSupportInterWordSpaces");

  return v5;
}

- (void)handleTextDisambiguationWithPhraseMatchResults:(id)a3 actionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CACDisambiguationHandler *v15;
  void *v16;
  CACDisambiguationHandler *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v13), "markerRange");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v11);
  }

  v15 = [CACDisambiguationHandler alloc];
  +[CACLabeledElementsCollection labeledElementsFromTextMarkerRanges:axElement:](CACLabeledElementsCollection, "labeledElementsFromTextMarkerRanges:axElement:", v8, self->_axElement);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CACDisambiguationHandler initWithLabeledElements:](v15, "initWithLabeledElements:", v16);

  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __85__CACTextEditingProvider_handleTextDisambiguationWithPhraseMatchResults_actionBlock___block_invoke;
  v30[3] = &unk_24F2AC2D8;
  v18 = v7;
  v30[4] = self;
  v31 = v18;
  -[CACDisambiguationHandler setChosenLabeledElementHandler:](v17, "setChosenLabeledElementHandler:", v30);
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDisambiguationHandler:", v17);

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startShowingTransientOverlayForType:", CFSTR("NumberedElements"));

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "userHintsFeatures") & 2) == 0)
    goto LABEL_14;
  +[CACUserHintsManager sharedManager](CACUserHintsManager, "sharedManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "shouldDisplayUserHintAfterRegisteringIdentifier:", CFSTR("DisambiguationPrompt"));

  if (v23)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "isEnabledForCommandIdentifier:", CFSTR("System.OverlayChooseLabelWithoutPrefix")) & 1) != 0)
    {
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.DisambiguationPrompt"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = (void *)MEMORY[0x24BDD17C8];
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.DisambiguationPromptWithCommandAsArgument"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "primaryStringForCommandIdentifier:", CFSTR("System.OverlayChooseLabel"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithValidatedFormat:validFormatSpecifiers:error:", v26, CFSTR("%@"), 0, v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "displayMessageString:type:announcementCompletion:", v21, 0, &__block_literal_global_25);

LABEL_14:
  }

}

void __85__CACTextEditingProvider_handleTextDisambiguationWithPhraseMatchResults_actionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "textMarkerRange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "stringForTextMarkerRange:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v5, v4);

}

void __85__CACTextEditingProvider_handleTextDisambiguationWithPhraseMatchResults_actionBlock___block_invoke_2()
{
  id v0;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "speakVoiceOverDescriptionForActiveOverlayIfNeeded");

}

- (void)handleSearchResultsWithRecognizedCommandParameters:(id)a3 variantOverrides:(id)a4
{
  id v4;

  if (a3)
  {
    +[CACSpokenCommand attributedStringFromRecognizedCommandParameters:variantOverrides:](CACSpokenCommand, "attributedStringFromRecognizedCommandParameters:variantOverrides:", a3, a4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[CACSpokenCommand displayRecognizedMessageUsingAttributedString:](CACSpokenCommand, "displayRecognizedMessageUsingAttributedString:", v4);

  }
}

- (void)handleErrorIdentifier:(id)a3 withObjects:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ErrorMessage.TextNotFound")))
  {
    objc_msgSend(v11, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ErrorMessage.TextNotFound"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayMessageString:type:", v9, 1);

    }
  }

}

- (void)handleCorrectionRequestWithStrings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CACTextEditingProvider selectionTextMarkerRange](self, "selectionTextMarkerRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACTextEditingProvider stringForTextMarkerRange:](self, "stringForTextMarkerRange:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    -[CACTextEditingProvider textEditingEngine](self, "textEditingEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectCurrentWord");

  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showCorrectionsForElement:nBestStrings:", self->_axElement, v4);

}

- (void)insertString:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertDictatedString:", v3);

}

- (void)insertAttributedString:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertDictatedAttributedString:", v3);

}

- (void)registerInsertedStringCategoryIdentifer:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stagedTextInsertionSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInsertedCategoryID:", v3);

}

- (void)setExecuting:(BOOL)a3
{
  -[CACSpokenCommand setExecuting:](self->_spokenCommand, "setExecuting:", a3);
}

- (void)setCompletionDeterminedManually:(BOOL)a3
{
  -[CACSpokenCommand setCompletionDeterminedManually:](self->_spokenCommand, "setCompletionDeterminedManually:", a3);
}

- (_NSRange)_rangeFromPreviousTextInsertionForAXElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v3 = a3;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousTextInsertionSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "axElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_msgSend(v5, "insertedRange");
    v10 = v9;
  }
  else
  {
    v10 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v11 = v8;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (id)_nBestListFromPreviousTextInsertionForAXElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousTextInsertionSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "insertedCategoryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isEqual:", v7);

  if (v8)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "recognizedParams");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", kCACCommandParameterTextSequence);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v10 = (void *)v13;
    if (v13)
    {
      v20 = v3;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v15);
          objc_msgSend(v16, "objectForKey:", kCACCommandParameterBuiltInIdentifier);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v6);

          if (v18)
          {
            objc_msgSend(v16, "objectForKey:", kCACCommandParameterTextVariants);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
          v15 = (char *)v15 + 1;
        }
        while (v10 != v15);
        v10 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v10)
          continue;
        break;
      }
LABEL_17:
      v3 = v20;
    }

  }
  return v10;
}

- (BOOL)marker:(id)a3 precedesMarker:(id)a4
{
  return +[CACTextMarker marker:precedesMarker:](CACTextMarker, "marker:precedesMarker:", a3, a4);
}

- (BOOL)marker:(id)a3 precedesOrEqualsMarker:(id)a4
{
  return +[CACTextMarker marker:precedesOrEqualsMarker:](CACTextMarker, "marker:precedesOrEqualsMarker:", a3, a4);
}

- (unint64_t)lengthFromMarker:(id)a3 toMarker:(id)a4
{
  return +[CACTextMarker lengthFromMarker:toMarker:](CACTextMarker, "lengthFromMarker:toMarker:", a3, a4);
}

- (SRCSTextEditing)textEditingEngine
{
  return (SRCSTextEditing *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEditingEngine, 0);
  objc_storeStrong((id *)&self->_axElement, 0);
  objc_storeStrong((id *)&self->_spokenCommand, 0);
}

@end
