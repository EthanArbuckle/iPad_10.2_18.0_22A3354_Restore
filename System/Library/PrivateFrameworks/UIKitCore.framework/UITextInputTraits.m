@implementation UITextInputTraits

- (BOOL)isSecureTextEntry
{
  return self->secureTextEntry;
}

- (int64_t)keyboardAppearance
{
  return *((char *)self + 33);
}

- (void)takeTraitsFrom:(id)a3 lightweight:(BOOL)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  void *v17;
  uint64_t v18;
  int v19;
  char v20;
  unsigned int v21;
  id v22;

  v22 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v22, "conformsToProtocolCached:", &unk_1EE0CE288))
  {
    objc_msgSend(v22, "extendedTextInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_16;
LABEL_15:
    v6 = v5;

    v7 = v6;
LABEL_24:
    v22 = v7;
    -[UITextInputTraits extendedPathToObtainTraitsFrom:lightweight:](self, "extendedPathToObtainTraitsFrom:lightweight:");
    v9 = 0;
    v10 = 1;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v22, "conformsToProtocolCached:", &unk_1EE0CE228))
  {
    objc_msgSend(v22, "extendedTraitsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_15;
  }
  else
  {
    NSClassFromString(CFSTR("WKContentView"));
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v22, "conformsToProtocolCached:", &unk_1EE0CE228))
      {
        objc_msgSend(v22, "textInputTraits");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          goto LABEL_15;
      }
    }
  }
LABEL_16:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v22;
  }
  else
  {
    NSClassFromString(CFSTR("WKContentView"));
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v22, "conformsToProtocol:", &unk_1EDE24D00))
      goto LABEL_23;
    objc_msgSend(v22, "textInputTraits");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (!v8)
  {
LABEL_23:
    v6 = 0;
    v7 = v22;
    goto LABEL_24;
  }
  -[UITextInputTraits fastPathToObtainTraitsFrom:](self, "fastPathToObtainTraitsFrom:", v8);
  v10 = 0;
  v6 = 0;
LABEL_25:
  if (self->secureTextEntry && !self->displaySecureTextUsingPlainText)
  {
    self->autocorrectionType = 1;
    if (dyld_program_sdk_at_least())
      self->shortcutConversionType = 1;
    self->learnsCorrections = 0;
  }
  +[UITextInputTraits traitEnvironmentFromTraits:](UITextInputTraits, "traitEnvironmentFromTraits:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    if (*((_BYTE *)self + 32) == 127)
    {
      v12 = 0;
      *((_BYTE *)self + 33) = 0;
    }
    else
    {
      v12 = *((char *)self + 33);
    }
    *((_BYTE *)self + 33) = +[UITextInputTraits configuredAppearanceForAppearance:withTraitEnvironment:](UITextInputTraits, "configuredAppearanceForAppearance:withTraitEnvironment:", v12, v11);
  }
  objc_msgSend(v11, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (v14 == 2)
  {
    if (self->secureTextEntry)
    {
      if ((v15 = *((char *)self + 32), v15 <= 0xA) && ((1 << v15) & 0x68F) != 0 || v15 == 123 || v15 == 120)
      {
        v16 = 0;
        *((_BYTE *)self + 32) = 0;
        goto LABEL_43;
      }
    }
  }
  else
  {
    objc_msgSend(v11, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    v16 = 1;
    if (v18 != 3)
      goto LABEL_43;
    self->isCarPlayIdiom = 1;
  }
  v16 = 0;
LABEL_43:
  v19 = *((unsigned __int8 *)self + 32);
  if (v19 == 125)
  {
    *((_BYTE *)self + 32) = 12;
  }
  else if (v19 == 10)
  {
    self->returnKeyType = 1;
  }
  if (-[NSString isEqualToString:](self->textContentType, "isEqualToString:", CFSTR("cc-number")))
  {
    if (self->returnKeyType)
      v20 = 123;
    else
      v20 = 11;
    *((_BYTE *)self + 32) = v20;
  }
  if (v16 && (UIKeyboardTypeSupportsSmartTyping(*((char *)self + 32)) & 1) != 0)
    goto LABEL_59;
  if (!self->smartQuotesType)
    self->smartQuotesType = 1;
  if (!self->smartDashesType)
    self->smartDashesType = 1;
  if (self->smartInsertDeleteType)
  {
LABEL_59:
    if ((v10 & 1) != 0)
      goto LABEL_67;
  }
  else
  {
    self->smartInsertDeleteType = 1;
    if ((v10 & 1) != 0)
      goto LABEL_67;
  }
  if ((objc_msgSend(v9, "acceptsEmoji") & 1) == 0)
  {
    v21 = objc_msgSend(v9, "keyboardType");
    if ((v21 > 0xB || ((1 << v21) & 0x930) == 0) && v21 != 127)
      *((_BYTE *)self + 32) = 13;
  }
LABEL_67:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UITextInputTraits setAllowsTextAnimationsType:](self, "setAllowsTextAnimationsType:", objc_msgSend(v9, "allowsTextAnimationsType"));

}

+ (id)traitEnvironmentFromTraits:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = v4;
  }
  else if (objc_msgSend(v4, "__isKindOfUIResponder"))
  {
    objc_msgSend(v4, "nextResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "traitEnvironmentFromTraits:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)configuredAppearanceForAppearance:(int64_t)a3 withTraitEnvironment:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a4;
  v7 = objc_msgSend(a1, "accessibleAppearanceForAppearance:", a3);
  if (!v6)
    goto LABEL_29;
  objc_msgSend(v6, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 > 3 || v9 == 2 || v7) && v7 != 10)
  {
    v12 = 10;
    if (v7)
      v12 = v7;
    goto LABEL_24;
  }
  objc_msgSend(v6, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceStyle");

  v7 = 10;
  if (v11 > 1)
  {
    v12 = 1;
    v13 = 9;
    if (v11 != 1000)
      v13 = 10;
    if (v11 == 2)
      v7 = 1;
    else
      v7 = v13;
    if (v11 != 2)
      v12 = v13;
    goto LABEL_24;
  }
  if (v11)
  {
    v12 = 10;
    if (v11 != 1)
      goto LABEL_24;
    goto LABEL_23;
  }
  if (v9 != 2)
  {
LABEL_23:
    v7 = 2;
    v12 = 2;
    goto LABEL_24;
  }
  v7 = 10;
  v12 = 10;
LABEL_24:
  if (v9 != 2)
    v12 = v7;
  if (v12)
    v7 = v12;
  else
    v7 = 2;
LABEL_29:

  return v7;
}

+ (int64_t)accessibleAppearanceForAppearance:(int64_t)a3
{
  int64_t v3;

  v3 = a3;
  if (a3 != 127 && _AXSUseDarkerKeyboard())
  {
    if (_AXSInvertColorsEnabled())
      return 2;
    else
      return 1;
  }
  return v3;
}

- (BOOL)acceptsEmoji
{
  return self->acceptsEmoji;
}

- (UIColor)insertionPointColor
{
  return self->_insertionPointColor;
}

- (void)extendedPathToObtainTraitsFrom:(id)a3 lightweight:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSString *v7;
  NSString *textContentType;
  UITextInputPasswordRules *v9;
  UITextInputPasswordRules *passwordRules;
  NSString *v11;
  NSString *v12;
  void *v13;
  UIColor *v14;
  UIColor *insertionPointColor;
  UIColor *v16;
  UIColor *selectionHighlightColor;
  UIColor *v18;
  UIColor *selectionBarColor;
  void *v20;
  char isKindOfClass;
  int v22;
  id v23;
  void *v24;
  id textSuggestionDelegate;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  UIColor *v29;
  UIColor *v30;
  UIColor *v31;
  UIColor *matchHighlightColor;
  UIColor *v33;
  UIColor *selectionBorderColor;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  void *v41;
  void *v42;
  id v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  id v54;

  v4 = a4;
  v6 = a3;
  -[UITextInputTraits setToDefaultValues](self, "setToDefaultValues");
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->autocorrectionType = objc_msgSend(v6, "autocorrectionType");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)self + 32) = objc_msgSend(v6, "keyboardType");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->secureTextEntry = objc_msgSend(v6, "isSecureTextEntry");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "textContentType");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      textContentType = self->textContentType;
      self->textContentType = v7;

    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->autocapitalizationType = objc_msgSend(v6, "autocapitalizationType");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->autocorrectionType = objc_msgSend(v6, "autocorrectionType");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->spellCheckingType = objc_msgSend(v6, "spellCheckingType");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)self + 32) = objc_msgSend(v6, "keyboardType");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)self + 33) = objc_msgSend(v6, "keyboardAppearance");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->returnKeyType = objc_msgSend(v6, "returnKeyType");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->enablesReturnKeyAutomatically = objc_msgSend(v6, "enablesReturnKeyAutomatically");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->secureTextEntry = objc_msgSend(v6, "isSecureTextEntry");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "passwordRules");
      v9 = (UITextInputPasswordRules *)objc_claimAutoreleasedReturnValue();
      passwordRules = self->passwordRules;
      self->passwordRules = v9;

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "textContentType");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      v12 = self->textContentType;
      self->textContentType = v11;

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->smartInsertDeleteType = objc_msgSend(v6, "smartInsertDeleteType");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->smartQuotesType = objc_msgSend(v6, "smartQuotesType");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->smartDashesType = objc_msgSend(v6, "smartDashesType");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "recentInputIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputTraits setRecentInputIdentifier:](self, "setRecentInputIdentifier:", v13);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UITextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", objc_msgSend(v6, "inlinePredictionType"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UITextInputTraits setMathExpressionCompletionType:](self, "setMathExpressionCompletionType:", objc_msgSend(v6, "mathExpressionCompletionType"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UITextInputTraits setWritingToolsBehavior:](self, "setWritingToolsBehavior:", objc_msgSend(v6, "writingToolsBehavior"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UITextInputTraits setAllowedWritingToolsResultOptions:](self, "setAllowedWritingToolsResultOptions:", objc_msgSend(v6, "allowedWritingToolsResultOptions"));
  }
  v54 = v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->isSingleLineDocument = objc_msgSend(v54, "isSingleLineDocument");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v54, "insertionPointColor");
    v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
    insertionPointColor = v14;
    if (!v14)
      insertionPointColor = self->_insertionPointColor;
    objc_storeStrong((id *)&self->_insertionPointColor, insertionPointColor);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v54, "selectionHighlightColor");
    v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
    selectionHighlightColor = v16;
    if (!v16)
      selectionHighlightColor = self->_selectionHighlightColor;
    objc_storeStrong((id *)&self->_selectionHighlightColor, selectionHighlightColor);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v54, "selectionHandleColor");
    v18 = (UIColor *)objc_claimAutoreleasedReturnValue();
    selectionBarColor = v18;
    if (!v18)
      selectionBarColor = self->_selectionBarColor;
    objc_storeStrong((id *)&self->_selectionBarColor, selectionBarColor);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->learnsCorrections = objc_msgSend(v54, "isTypingAdaptationEnabled");
  v20 = v54;
  if (self->secureTextEntry)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v20 = v54;
    if ((isKindOfClass & 1) != 0)
    {
      v22 = objc_msgSend(v54, "conformsToProtocolCached:", &unk_1EE0CF128);
      v20 = v54;
      if (v22)
      {
        -[UITextInputTraits setToSecureValues](self, "setToSecureValues");
        v20 = v54;
      }
    }
  }
  if (objc_msgSend(v20, "conformsToProtocol:", &unk_1EDE24368))
  {
    v23 = v54;
    if (v4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "textSuggestionDelegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        textSuggestionDelegate = self->textSuggestionDelegate;
        self->textSuggestionDelegate = v24;

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->acceptsPayloads = objc_msgSend(v23, "acceptsPayloads");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->displaySecureTextUsingPlainText = objc_msgSend(v23, "displaySecureTextUsingPlainText");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->displaySecureEditsUsingPlainText = objc_msgSend(v23, "displaySecureEditsUsingPlainText");
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UITextInputTraits setManageRecentInputs:](self, "setManageRecentInputs:", objc_msgSend(v23, "manageRecentInputs"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v26 = objc_msgSend(v23, "validTextRange");
        -[UITextInputTraits setValidTextRange:](self, "setValidTextRange:", v26, v27);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "PINEntrySeparatorIndexes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInputTraits setPINEntrySeparatorIndexes:](self, "setPINEntrySeparatorIndexes:", v28);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UITextInputTraits setTextTrimmingSet:](self, "setTextTrimmingSet:", objc_msgSend(v23, "textTrimmingSet"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "selectionBarColor");
        v29 = (UIColor *)objc_claimAutoreleasedReturnValue();
        v30 = self->_selectionBarColor;
        self->_selectionBarColor = v29;

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "matchHighlightColor");
        v31 = (UIColor *)objc_claimAutoreleasedReturnValue();
        matchHighlightColor = self->_matchHighlightColor;
        self->_matchHighlightColor = v31;

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "selectionBorderColor");
        v33 = (UIColor *)objc_claimAutoreleasedReturnValue();
        selectionBorderColor = self->_selectionBorderColor;
        self->_selectionBorderColor = v33;

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "selectionBorderWidth");
        self->_selectionBorderWidth = v35;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "selectionCornerRadius");
        self->_selectionCornerRadius = v36;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "selectionEdgeInsets");
        self->_selectionEdgeInsets.top = v37;
        self->_selectionEdgeInsets.left = v38;
        self->_selectionEdgeInsets.bottom = v39;
        self->_selectionEdgeInsets.right = v40;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "selectionDragDotImage");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInputTraits setSelectionDragDotImage:](self, "setSelectionDragDotImage:", v41);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->insertionPointWidth = objc_msgSend(v23, "insertionPointWidth");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->textLoupeVisibility = objc_msgSend(v23, "textLoupeVisibility");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->textSelectionBehavior = objc_msgSend(v23, "textSelectionBehavior");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "textSuggestionDelegate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = self->textSuggestionDelegate;
        self->textSuggestionDelegate = v42;

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->contentsIsSingleValue = objc_msgSend(v23, "contentsIsSingleValue");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->hasDefaultContents = objc_msgSend(v23, "hasDefaultContents");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->acceptsPayloads = objc_msgSend(v23, "acceptsPayloads");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->acceptsEmoji = objc_msgSend(v23, "acceptsEmoji");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->acceptsInitialEmojiKeyboard = objc_msgSend(v23, "acceptsInitialEmojiKeyboard");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->acceptsDictationSearchResults = objc_msgSend(v23, "acceptsDictationSearchResults");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->useAutomaticEndpointing = objc_msgSend(v23, "useAutomaticEndpointing");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->showDictationButton = objc_msgSend(v23, "showDictationButton");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->forceEnableDictation = objc_msgSend(v23, "forceEnableDictation");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->forceDisableDictation = objc_msgSend(v23, "forceDisableDictation");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->forceSpellingDictation = objc_msgSend(v23, "forceSpellingDictation");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->forceDefaultDictationInfo = objc_msgSend(v23, "forceDefaultDictationInfo");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->forceDictationKeyboardType = objc_msgSend(v23, "forceDictationKeyboardType");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->preferOnlineDictation = objc_msgSend(v23, "preferOnlineDictation");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->returnKeyGoesToNextResponder = objc_msgSend(v23, "returnKeyGoesToNextResponder");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->emptyContentReturnKeyType = objc_msgSend(v23, "emptyContentReturnKeyType");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->acceptsFloatingKeyboard = objc_msgSend(v23, "acceptsFloatingKeyboard");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->forceFloatingKeyboard = objc_msgSend(v23, "forceFloatingKeyboard");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "floatingKeyboardEdgeInsets");
        self->floatingKeyboardEdgeInsets.top = v44;
        self->floatingKeyboardEdgeInsets.left = v45;
        self->floatingKeyboardEdgeInsets.bottom = v46;
        self->floatingKeyboardEdgeInsets.right = v47;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->acceptsSplitKeyboard = objc_msgSend(v23, "acceptsSplitKeyboard");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->displaySecureTextUsingPlainText = objc_msgSend(v23, "displaySecureTextUsingPlainText");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->displaySecureEditsUsingPlainText = objc_msgSend(v23, "displaySecureEditsUsingPlainText");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->learnsCorrections = objc_msgSend(v23, "learnsCorrections");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->learnsCorrections = objc_msgSend(v23, "typingAdaptationDisabled") ^ 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->shortcutConversionType = objc_msgSend(v23, "shortcutConversionType");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->suppressReturnKeyStyling = objc_msgSend(v23, "suppressReturnKeyStyling");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->useInterfaceLanguageForLocalization = objc_msgSend(v23, "useInterfaceLanguageForLocalization");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->deferBecomingResponder = objc_msgSend(v23, "deferBecomingResponder");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->enablesReturnKeyOnNonWhiteSpaceContent = objc_msgSend(v23, "enablesReturnKeyOnNonWhiteSpaceContent");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "autocorrectionContext");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInputTraits setAutocorrectionContext:](self, "setAutocorrectionContext:", v48);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "responseContext");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInputTraits setResponseContext:](self, "setResponseContext:", v49);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "inputContextHistory");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInputTraits setInputContextHistory:](self, "setInputContextHistory:", v50);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->disablePrediction = objc_msgSend(v23, "disablePrediction");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->hidePrediction = objc_msgSend(v23, "hidePrediction");
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) == 0)
        -[UITextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", objc_msgSend(v23, "inlineCompletionType"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UITextInputTraits setDisableInputBars:](self, "setDisableInputBars:", objc_msgSend(v23, "disableInputBars"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->textScriptType = objc_msgSend(v23, "textScriptType");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->devicePasscodeEntry = objc_msgSend(v23, "isDevicePasscodeEntry");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_msgSend(v23, "wasEverSecureTextEntry"))
          v51 = 8;
        else
          v51 = 0;
        *(_BYTE *)&self->_privateInputTraitFlags = *(_BYTE *)&self->_privateInputTraitFlags & 0xF7 | v51;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->loadKeyboardsForSiriLanguage = objc_msgSend(v23, "loadKeyboardsForSiriLanguage");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UITextInputTraits setPreferredKeyboardStyle:](self, "setPreferredKeyboardStyle:", objc_msgSend(v23, "preferredKeyboardStyle"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "supplementalLexicon");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInputTraits setSupplementalLexicon:](self, "setSupplementalLexicon:", v52);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "supplementalLexiconAmbiguousItemIcon");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInputTraits setSupplementalLexiconAmbiguousItemIcon:](self, "setSupplementalLexiconAmbiguousItemIcon:", v53);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UITextInputTraits setDisableHandwritingKeyboard:](self, "setDisableHandwritingKeyboard:", objc_msgSend(v23, "disableHandwritingKeyboard"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UITextInputTraits setAllowsTextAnimationsType:](self, "setAllowsTextAnimationsType:", objc_msgSend(v23, "allowsTextAnimationsType"));
    }

  }
}

- (void)setIsSingleLineDocument:(BOOL)a3
{
  self->isSingleLineDocument = a3;
}

- (UITextInputTraits)init
{
  UITextInputTraits *v2;
  UITextInputTraits *v3;
  UITextInputTraits *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextInputTraits;
  v2 = -[UITextInputTraits init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UITextInputTraits setToDefaultValues](v2, "setToDefaultValues");
    v4 = v3;
  }

  return v3;
}

- (void)fastPathToObtainTraitsFrom:(id)a3
{
  _BYTE *v4;
  UITextInputPasswordRules *v5;
  UITextInputPasswordRules *passwordRules;
  NSString *v7;
  NSString *textContentType;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  UIColor *v13;
  UIColor *insertionPointColor;
  UIColor *v15;
  UIColor *selectionBarColor;
  UIColor *v17;
  UIColor *selectionHighlightColor;
  UIColor *v19;
  UIColor *matchHighlightColor;
  UIColor *v21;
  UIColor *selectionBorderColor;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  void *v30;
  id textSuggestionDelegate;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _BYTE *v42;

  v4 = a3;
  self->autocapitalizationType = objc_msgSend(v4, "autocapitalizationType");
  self->autocorrectionType = objc_msgSend(v4, "autocorrectionType");
  self->spellCheckingType = objc_msgSend(v4, "spellCheckingType");
  *((_BYTE *)self + 32) = objc_msgSend(v4, "keyboardType");
  *((_BYTE *)self + 33) = objc_msgSend(v4, "keyboardAppearance");
  self->returnKeyType = objc_msgSend(v4, "returnKeyType");
  self->enablesReturnKeyAutomatically = objc_msgSend(v4, "enablesReturnKeyAutomatically");
  self->secureTextEntry = objc_msgSend(v4, "isSecureTextEntry");
  if (v4)
    *(_BYTE *)&self->_privateInputTraitFlags = *(_BYTE *)&self->_privateInputTraitFlags & 0xF7 | v4[340] & 8;
  self->devicePasscodeEntry = objc_msgSend(v4, "isDevicePasscodeEntry");
  objc_msgSend(v4, "passwordRules");
  v5 = (UITextInputPasswordRules *)objc_claimAutoreleasedReturnValue();
  passwordRules = self->passwordRules;
  self->passwordRules = v5;

  objc_msgSend(v4, "textContentType");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  textContentType = self->textContentType;
  self->textContentType = v7;

  self->smartInsertDeleteType = objc_msgSend(v4, "smartInsertDeleteType");
  self->smartQuotesType = objc_msgSend(v4, "smartQuotesType");
  self->smartDashesType = objc_msgSend(v4, "smartDashesType");
  objc_msgSend(v4, "recentInputIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputTraits setRecentInputIdentifier:](self, "setRecentInputIdentifier:", v9);

  -[UITextInputTraits setWritingToolsBehavior:](self, "setWritingToolsBehavior:", objc_msgSend(v4, "writingToolsBehavior"));
  -[UITextInputTraits setAllowedWritingToolsResultOptions:](self, "setAllowedWritingToolsResultOptions:", objc_msgSend(v4, "allowedWritingToolsResultOptions"));
  v42 = v4;
  -[UITextInputTraits setManageRecentInputs:](self, "setManageRecentInputs:", objc_msgSend(v42, "manageRecentInputs"));
  v10 = objc_msgSend(v42, "validTextRange");
  -[UITextInputTraits setValidTextRange:](self, "setValidTextRange:", v10, v11);
  objc_msgSend(v42, "PINEntrySeparatorIndexes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputTraits setPINEntrySeparatorIndexes:](self, "setPINEntrySeparatorIndexes:", v12);

  -[UITextInputTraits setTextTrimmingSet:](self, "setTextTrimmingSet:", objc_msgSend(v42, "textTrimmingSet"));
  objc_msgSend(v42, "insertionPointColor");
  v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
  insertionPointColor = self->_insertionPointColor;
  self->_insertionPointColor = v13;

  objc_msgSend(v42, "selectionBarColor");
  v15 = (UIColor *)objc_claimAutoreleasedReturnValue();
  selectionBarColor = self->_selectionBarColor;
  self->_selectionBarColor = v15;

  objc_msgSend(v42, "selectionHighlightColor");
  v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
  selectionHighlightColor = self->_selectionHighlightColor;
  self->_selectionHighlightColor = v17;

  objc_msgSend(v42, "matchHighlightColor");
  v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
  matchHighlightColor = self->_matchHighlightColor;
  self->_matchHighlightColor = v19;

  objc_msgSend(v42, "selectionBorderColor");
  v21 = (UIColor *)objc_claimAutoreleasedReturnValue();
  selectionBorderColor = self->_selectionBorderColor;
  self->_selectionBorderColor = v21;

  objc_msgSend(v42, "selectionBorderWidth");
  self->_selectionBorderWidth = v23;
  objc_msgSend(v42, "selectionCornerRadius");
  self->_selectionCornerRadius = v24;
  objc_msgSend(v42, "selectionEdgeInsets");
  self->_selectionEdgeInsets.top = v25;
  self->_selectionEdgeInsets.left = v26;
  self->_selectionEdgeInsets.bottom = v27;
  self->_selectionEdgeInsets.right = v28;
  objc_msgSend(v42, "selectionDragDotImage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputTraits setSelectionDragDotImage:](self, "setSelectionDragDotImage:", v29);

  self->insertionPointWidth = objc_msgSend(v42, "insertionPointWidth");
  self->textLoupeVisibility = objc_msgSend(v42, "textLoupeVisibility");
  self->textSelectionBehavior = objc_msgSend(v42, "textSelectionBehavior");
  objc_msgSend(v42, "textSuggestionDelegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  textSuggestionDelegate = self->textSuggestionDelegate;
  self->textSuggestionDelegate = v30;

  self->isSingleLineDocument = objc_msgSend(v42, "isSingleLineDocument");
  self->contentsIsSingleValue = objc_msgSend(v42, "contentsIsSingleValue");
  self->hasDefaultContents = objc_msgSend(v42, "hasDefaultContents");
  self->acceptsPayloads = objc_msgSend(v42, "acceptsPayloads");
  self->acceptsEmoji = objc_msgSend(v42, "acceptsEmoji");
  self->acceptsInitialEmojiKeyboard = objc_msgSend(v42, "acceptsInitialEmojiKeyboard");
  self->acceptsDictationSearchResults = objc_msgSend(v42, "acceptsDictationSearchResults");
  self->useAutomaticEndpointing = objc_msgSend(v42, "useAutomaticEndpointing");
  self->showDictationButton = objc_msgSend(v42, "showDictationButton");
  self->forceEnableDictation = objc_msgSend(v42, "forceEnableDictation");
  self->forceDisableDictation = objc_msgSend(v42, "forceDisableDictation");
  self->forceSpellingDictation = objc_msgSend(v42, "forceSpellingDictation");
  self->forceDefaultDictationInfo = objc_msgSend(v42, "forceDefaultDictationInfo");
  self->forceDictationKeyboardType = objc_msgSend(v42, "forceDictationKeyboardType");
  self->preferOnlineDictation = objc_msgSend(v42, "preferOnlineDictation");
  self->returnKeyGoesToNextResponder = objc_msgSend(v42, "returnKeyGoesToNextResponder");
  self->emptyContentReturnKeyType = objc_msgSend(v42, "emptyContentReturnKeyType");
  self->acceptsFloatingKeyboard = objc_msgSend(v42, "acceptsFloatingKeyboard");
  self->forceFloatingKeyboard = objc_msgSend(v42, "forceFloatingKeyboard");
  objc_msgSend(v42, "floatingKeyboardEdgeInsets");
  self->floatingKeyboardEdgeInsets.top = v32;
  self->floatingKeyboardEdgeInsets.left = v33;
  self->floatingKeyboardEdgeInsets.bottom = v34;
  self->floatingKeyboardEdgeInsets.right = v35;
  self->acceptsSplitKeyboard = objc_msgSend(v42, "acceptsSplitKeyboard");
  self->displaySecureTextUsingPlainText = objc_msgSend(v42, "displaySecureTextUsingPlainText");
  self->displaySecureEditsUsingPlainText = objc_msgSend(v42, "displaySecureEditsUsingPlainText");
  self->learnsCorrections = objc_msgSend(v42, "learnsCorrections");
  self->shortcutConversionType = objc_msgSend(v42, "shortcutConversionType");
  self->suppressReturnKeyStyling = objc_msgSend(v42, "suppressReturnKeyStyling");
  self->useInterfaceLanguageForLocalization = objc_msgSend(v42, "useInterfaceLanguageForLocalization");
  self->deferBecomingResponder = objc_msgSend(v42, "deferBecomingResponder");
  self->enablesReturnKeyOnNonWhiteSpaceContent = objc_msgSend(v42, "enablesReturnKeyOnNonWhiteSpaceContent");
  objc_msgSend(v42, "autocorrectionContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputTraits setAutocorrectionContext:](self, "setAutocorrectionContext:", v36);

  objc_msgSend(v42, "responseContext");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputTraits setResponseContext:](self, "setResponseContext:", v37);

  objc_msgSend(v42, "inputContextHistory");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputTraits setInputContextHistory:](self, "setInputContextHistory:", v38);

  self->disablePrediction = objc_msgSend(v42, "disablePrediction");
  self->hidePrediction = objc_msgSend(v42, "hidePrediction");
  -[UITextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", objc_msgSend(v42, "inlinePredictionType"));
  -[UITextInputTraits setDisableInputBars:](self, "setDisableInputBars:", objc_msgSend(v42, "disableInputBars"));
  self->isCarPlayIdiom = objc_msgSend(v42, "isCarPlayIdiom");
  self->textScriptType = objc_msgSend(v42, "textScriptType");
  self->loadKeyboardsForSiriLanguage = objc_msgSend(v42, "loadKeyboardsForSiriLanguage");
  -[UITextInputTraits setPreferredKeyboardStyle:](self, "setPreferredKeyboardStyle:", objc_msgSend(v42, "preferredKeyboardStyle"));
  objc_msgSend(v42, "supplementalLexicon");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputTraits setSupplementalLexicon:](self, "setSupplementalLexicon:", v39);

  objc_msgSend(v42, "supplementalLexiconAmbiguousItemIcon");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputTraits setSupplementalLexiconAmbiguousItemIcon:](self, "setSupplementalLexiconAmbiguousItemIcon:", v40);

  self->disableHandwritingKeyboard = objc_msgSend(v42, "disableHandwritingKeyboard");
  -[UITextInputTraits setMathExpressionCompletionType:](self, "setMathExpressionCompletionType:", objc_msgSend(v42, "mathExpressionCompletionType"));
  v41 = objc_msgSend(v42, "allowsTextAnimationsType");

  -[UITextInputTraits setAllowsTextAnimationsType:](self, "setAllowsTextAnimationsType:", v41);
}

- (void)setToDefaultValues
{
  UITextInputPasswordRules *passwordRules;
  NSString *textContentType;
  __CFCharacterSet *textTrimmingSet;
  UIColor *v6;
  UIColor *insertionPointColor;
  UIColor *v8;
  UIColor *selectionBarColor;
  UIColor *v10;
  UIColor *selectionHighlightColor;
  UIColor *v12;
  UIColor *matchHighlightColor;
  UIColor *selectionBorderColor;
  id textSuggestionDelegate;

  self->returnKeyType = 0;
  *(_WORD *)&self->enablesReturnKeyAutomatically = 0;
  self->autocorrectionType = 0;
  self->spellCheckingType = 0;
  self->autocapitalizationType = 2;
  *((_WORD *)self + 16) = 0;
  passwordRules = self->passwordRules;
  self->passwordRules = 0;

  self->devicePasscodeEntry = 0;
  textContentType = self->textContentType;
  self->textContentType = 0;

  self->smartInsertDeleteType = 0;
  self->smartQuotesType = 0;
  self->smartDashesType = 0;
  -[UITextInputTraits setRecentInputIdentifier:](self, "setRecentInputIdentifier:", 0);
  self->writingToolsBehavior = 0;
  self->allowedWritingToolsResultOptions = 0;
  -[UITextInputTraits setManageRecentInputs:](self, "setManageRecentInputs:", 0);
  -[UITextInputTraits setValidTextRange:](self, "setValidTextRange:", 0, -1);
  -[UITextInputTraits setPINEntrySeparatorIndexes:](self, "setPINEntrySeparatorIndexes:", 0);
  textTrimmingSet = self->textTrimmingSet;
  if (textTrimmingSet)
    CFRelease(textTrimmingSet);
  self->textTrimmingSet = 0;
  +[UIColor insertionPointColor](UIColor, "insertionPointColor");
  v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  insertionPointColor = self->_insertionPointColor;
  self->_insertionPointColor = v6;

  +[UIColor selectionGrabberColor](UIColor, "selectionGrabberColor");
  v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  selectionBarColor = self->_selectionBarColor;
  self->_selectionBarColor = v8;

  +[UIColor selectionHighlightColor](UIColor, "selectionHighlightColor");
  v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
  selectionHighlightColor = self->_selectionHighlightColor;
  self->_selectionHighlightColor = v10;

  _UIGetTextHighlightFillColor();
  v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
  matchHighlightColor = self->_matchHighlightColor;
  self->_matchHighlightColor = v12;

  selectionBorderColor = self->_selectionBorderColor;
  self->_selectionBorderColor = 0;

  self->_selectionBorderWidth = 0.0;
  self->_selectionCornerRadius = 0.0;
  *(_OWORD *)&self->_selectionEdgeInsets.top = 0u;
  *(_OWORD *)&self->_selectionEdgeInsets.bottom = 0u;
  -[UITextInputTraits setSelectionDragDotImage:](self, "setSelectionDragDotImage:", 0);
  self->insertionPointWidth = 3;
  *(_QWORD *)&self->textLoupeVisibility = 0;
  textSuggestionDelegate = self->textSuggestionDelegate;
  self->textSuggestionDelegate = 0;

  *(_WORD *)&self->isSingleLineDocument = 0;
  *(_WORD *)&self->hasDefaultContents = 0;
  self->acceptsEmoji = 1;
  self->acceptsInitialEmojiKeyboard = 0;
  *(_DWORD *)&self->acceptsDictationSearchResults = 0;
  *(_DWORD *)&self->forceEnableDictation = 0;
  self->forceDictationKeyboardType = 0x7FFFFFFFFFFFFFFFLL;
  self->emptyContentReturnKeyType = 0;
  *(_DWORD *)&self->preferOnlineDictation = 0x10000;
  *(_OWORD *)&self->floatingKeyboardEdgeInsets.top = 0u;
  *(_OWORD *)&self->floatingKeyboardEdgeInsets.bottom = 0u;
  self->acceptsSplitKeyboard = 1;
  self->learnsCorrections = 1;
  *(_QWORD *)&self->shortcutConversionType = 0;
  -[UITextInputTraits setAutocorrectionContext:](self, "setAutocorrectionContext:", 0);
  -[UITextInputTraits setResponseContext:](self, "setResponseContext:", 0);
  -[UITextInputTraits setInputContextHistory:](self, "setInputContextHistory:", 0);
  self->disablePrediction = 0;
  self->hidePrediction = 0;
  -[UITextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", 0);
  -[UITextInputTraits setDisableInputBars:](self, "setDisableInputBars:", 0);
  self->isCarPlayIdiom = 0;
  self->textScriptType = 0;
  self->loadKeyboardsForSiriLanguage = 0;
  -[UITextInputTraits setPreferredKeyboardStyle:](self, "setPreferredKeyboardStyle:", 0);
  -[UITextInputTraits setSupplementalLexicon:](self, "setSupplementalLexicon:", 0);
  -[UITextInputTraits setSupplementalLexiconAmbiguousItemIcon:](self, "setSupplementalLexiconAmbiguousItemIcon:", 0);
  self->disableHandwritingKeyboard = 0;
  self->mathExpressionCompletionType = 0;
  self->allowsTextAnimationsType = 0;
}

- (void)setInlinePredictionType:(int64_t)a3
{
  self->inlinePredictionType = a3;
}

- (void)setValidTextRange:(_NSRange)a3
{
  self->validTextRange = a3;
}

- (void)setSupplementalLexiconAmbiguousItemIcon:(id)a3
{
  objc_storeStrong((id *)&self->supplementalLexiconAmbiguousItemIcon, a3);
}

- (void)setSupplementalLexicon:(id)a3
{
  objc_storeStrong((id *)&self->supplementalLexicon, a3);
}

- (void)setSelectionDragDotImage:(id)a3
{
  objc_storeStrong((id *)&self->selectionDragDotImage, a3);
}

- (void)setResponseContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setRecentInputIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setPreferredKeyboardStyle:(int64_t)a3
{
  self->_preferredKeyboardStyle = a3;
}

- (void)setPINEntrySeparatorIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void)setManageRecentInputs:(BOOL)a3
{
  self->manageRecentInputs = a3;
}

- (void)setInputContextHistory:(id)a3
{
  objc_storeStrong((id *)&self->inputContextHistory, a3);
}

- (void)setDisableInputBars:(BOOL)a3
{
  self->disableInputBars = a3;
}

- (void)setAutocorrectionContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (int64_t)spellCheckingType
{
  return self->spellCheckingType;
}

- (BOOL)disablePrediction
{
  return self->disablePrediction;
}

- (int64_t)smartQuotesType
{
  return self->smartQuotesType;
}

- (int64_t)smartDashesType
{
  return self->smartDashesType;
}

- (BOOL)loadKeyboardsForSiriLanguage
{
  return self->loadKeyboardsForSiriLanguage;
}

- (NSString)textContentType
{
  return self->textContentType;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return self->enablesReturnKeyAutomatically;
}

- (int64_t)returnKeyType
{
  return self->returnKeyType;
}

- (int64_t)inlinePredictionType
{
  return self->inlinePredictionType;
}

- (__CFCharacterSet)textTrimmingSet
{
  return self->textTrimmingSet;
}

- (int64_t)autocapitalizationType
{
  return self->autocapitalizationType;
}

- (int64_t)smartInsertDeleteType
{
  return self->smartInsertDeleteType;
}

- (int64_t)textScriptType
{
  return self->textScriptType;
}

- (BOOL)forceDisableDictation
{
  return self->forceDisableDictation;
}

- (int)emptyContentReturnKeyType
{
  return self->emptyContentReturnKeyType;
}

- (BOOL)useInterfaceLanguageForLocalization
{
  return self->useInterfaceLanguageForLocalization;
}

- (BOOL)acceptsInitialEmojiKeyboard
{
  return self->acceptsInitialEmojiKeyboard;
}

- (_UISupplementalLexicon)supplementalLexicon
{
  return self->supplementalLexicon;
}

- (NSString)responseContext
{
  return self->responseContext;
}

- (BOOL)learnsCorrections
{
  return self->learnsCorrections;
}

- (UIInputContextHistory)inputContextHistory
{
  return self->inputContextHistory;
}

- (NSString)autocorrectionContext
{
  return self->autocorrectionContext;
}

- (BOOL)isDevicePasscodeEntry
{
  return self->devicePasscodeEntry;
}

- (BOOL)enablesReturnKeyOnNonWhiteSpaceContent
{
  return self->enablesReturnKeyOnNonWhiteSpaceContent;
}

- (BOOL)suppressReturnKeyStyling
{
  return self->suppressReturnKeyStyling;
}

- (BOOL)forceFloatingKeyboard
{
  return self->forceFloatingKeyboard;
}

- (unint64_t)insertionPointWidth
{
  return self->insertionPointWidth;
}

- (UIEdgeInsets)floatingKeyboardEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->floatingKeyboardEdgeInsets.top;
  left = self->floatingKeyboardEdgeInsets.left;
  bottom = self->floatingKeyboardEdgeInsets.bottom;
  right = self->floatingKeyboardEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int)textSelectionBehavior
{
  return self->textSelectionBehavior;
}

- (UIColor)selectionHighlightColor
{
  return self->_selectionHighlightColor;
}

- (int)shortcutConversionType
{
  return self->shortcutConversionType;
}

- (BOOL)acceptsPayloads
{
  return self->acceptsPayloads;
}

- (BOOL)useAutomaticEndpointing
{
  return self->useAutomaticEndpointing;
}

- (BOOL)isSingleLineDocument
{
  return self->isSingleLineDocument;
}

- (BOOL)forceEnableDictation
{
  return self->forceEnableDictation;
}

- (BOOL)displaySecureTextUsingPlainText
{
  return self->displaySecureTextUsingPlainText;
}

- (BOOL)acceptsDictationSearchResults
{
  return self->acceptsDictationSearchResults;
}

- (BOOL)showDictationButton
{
  return self->showDictationButton;
}

- (id)textSuggestionDelegate
{
  return self->textSuggestionDelegate;
}

- (BOOL)deferBecomingResponder
{
  return self->deferBecomingResponder;
}

- (BOOL)contentsIsSingleValue
{
  return self->contentsIsSingleValue;
}

- (_NSRange)validTextRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->validTextRange.length;
  location = self->validTextRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (int)textLoupeVisibility
{
  return self->textLoupeVisibility;
}

- (UIImage)supplementalLexiconAmbiguousItemIcon
{
  return self->supplementalLexiconAmbiguousItemIcon;
}

- (void)setTextTrimmingSet:(__CFCharacterSet *)a3
{
  __CFCharacterSet *textTrimmingSet;

  textTrimmingSet = self->textTrimmingSet;
  self->textTrimmingSet = a3;
  if (a3)
    CFRetain(a3);
  if (textTrimmingSet)
    CFRelease(textTrimmingSet);
}

- (UIEdgeInsets)selectionEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_selectionEdgeInsets.top;
  left = self->_selectionEdgeInsets.left;
  bottom = self->_selectionEdgeInsets.bottom;
  right = self->_selectionEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIImage)selectionDragDotImage
{
  return self->selectionDragDotImage;
}

- (double)selectionCornerRadius
{
  return self->_selectionCornerRadius;
}

- (double)selectionBorderWidth
{
  return self->_selectionBorderWidth;
}

- (UIColor)selectionBorderColor
{
  return self->_selectionBorderColor;
}

- (UIColor)selectionBarColor
{
  return self->_selectionBarColor;
}

- (BOOL)returnKeyGoesToNextResponder
{
  return self->returnKeyGoesToNextResponder;
}

- (int64_t)preferredKeyboardStyle
{
  return self->_preferredKeyboardStyle;
}

- (BOOL)preferOnlineDictation
{
  return self->preferOnlineDictation;
}

- (UITextInputPasswordRules)passwordRules
{
  return self->passwordRules;
}

- (UIColor)matchHighlightColor
{
  return self->_matchHighlightColor;
}

- (BOOL)manageRecentInputs
{
  return self->manageRecentInputs;
}

- (BOOL)hasDefaultContents
{
  return self->hasDefaultContents;
}

- (BOOL)forceSpellingDictation
{
  return self->forceSpellingDictation;
}

- (int64_t)forceDictationKeyboardType
{
  return self->forceDictationKeyboardType;
}

- (BOOL)forceDefaultDictationInfo
{
  return self->forceDefaultDictationInfo;
}

- (BOOL)displaySecureEditsUsingPlainText
{
  return self->displaySecureEditsUsingPlainText;
}

- (BOOL)disableHandwritingKeyboard
{
  return self->disableHandwritingKeyboard;
}

- (BOOL)acceptsSplitKeyboard
{
  return self->acceptsSplitKeyboard;
}

- (BOOL)acceptsFloatingKeyboard
{
  return self->acceptsFloatingKeyboard;
}

- (NSIndexSet)PINEntrySeparatorIndexes
{
  return self->PINEntrySeparatorIndexes;
}

- (BOOL)isCarPlayIdiom
{
  return self->isCarPlayIdiom;
}

- (BOOL)disableInputBars
{
  return self->disableInputBars;
}

- (int64_t)autocorrectionType
{
  return self->autocorrectionType;
}

- (void)setDisableHandwritingKeyboard:(BOOL)a3
{
  self->disableHandwritingKeyboard = a3;
}

- (BOOL)hidePrediction
{
  return self->hidePrediction;
}

+ (id)traitsByAdoptingTraits:(id)a3
{
  id v3;
  UITextInputTraits *v4;

  v3 = a3;
  v4 = objc_alloc_init(UITextInputTraits);
  -[UITextInputTraits takeTraitsFrom:lightweight:](v4, "takeTraitsFrom:lightweight:", v3, 0);

  return v4;
}

- (BOOL)allowsSuggestionsOnlyMode
{
  unint64_t v3;
  int v4;

  v3 = -[UITextInputTraits keyboardType](self, "keyboardType");
  LOBYTE(v4) = 0;
  if ((v3 > 0xC || ((1 << v3) & 0x15FE) == 0) && v3 != 120 && v3 != 124)
  {
    v4 = dyld_program_sdk_at_least();
    if (v4)
      LOBYTE(v4) = -[UITextInputTraits spellCheckingType](self, "spellCheckingType") != 1;
  }
  return v4;
}

- (void)takeTraitsFrom:(id)a3
{
  -[UITextInputTraits takeTraitsFrom:lightweight:](self, "takeTraitsFrom:lightweight:", a3, 0);
}

- (void)setShowDictationButton:(BOOL)a3
{
  self->showDictationButton = a3;
}

- (int64_t)keyboardType
{
  return *((char *)self + 32);
}

- (id)copyWithZone:(_NSZone *)a3
{
  UITextInputTraits *v4;

  v4 = objc_alloc_init(UITextInputTraits);
  -[UITextInputTraits takeTraitsFrom:lightweight:](v4, "takeTraitsFrom:lightweight:", self, 0);
  return v4;
}

+ (id)defaultTextInputTraits
{
  return objc_alloc_init(UITextInputTraits);
}

- (void)dealloc
{
  __CFCharacterSet *textTrimmingSet;
  objc_super v4;

  textTrimmingSet = self->textTrimmingSet;
  if (textTrimmingSet)
    CFRelease(textTrimmingSet);
  v4.receiver = self;
  v4.super_class = (Class)UITextInputTraits;
  -[UITextInputTraits dealloc](&v4, sel_dealloc);
}

- (int64_t)updateResultComparedToTraits:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int secureTextEntry;
  int acceptsEmoji;
  int acceptsInitialEmojiKeyboard;
  int isCarPlayIdiom;
  void *v13;
  uint64_t v14;
  void *v15;
  int64_t smartQuotesType;
  int64_t smartDashesType;
  BOOL v18;
  int64_t v19;
  int disableInputBars;
  int64_t returnKeyType;
  int enablesReturnKeyAutomatically;
  int emptyContentReturnKeyType;
  int enablesReturnKeyOnNonWhiteSpaceContent;
  int suppressReturnKeyStyling;

  v6 = a3;
  v7 = *((char *)self + 32);
  if (objc_msgSend(v6, "keyboardType") != v7)
    goto LABEL_19;
  v8 = *((char *)self + 33);
  if (objc_msgSend(v6, "keyboardAppearance") != v8)
    goto LABEL_19;
  secureTextEntry = self->secureTextEntry;
  if (secureTextEntry != objc_msgSend(v6, "isSecureTextEntry"))
    goto LABEL_19;
  acceptsEmoji = self->acceptsEmoji;
  if (acceptsEmoji != objc_msgSend(v6, "acceptsEmoji"))
    goto LABEL_19;
  acceptsInitialEmojiKeyboard = self->acceptsInitialEmojiKeyboard;
  if (acceptsInitialEmojiKeyboard != objc_msgSend(v6, "acceptsInitialEmojiKeyboard"))
    goto LABEL_19;
  isCarPlayIdiom = self->isCarPlayIdiom;
  if (isCarPlayIdiom != objc_msgSend(v6, "isCarPlayIdiom"))
    goto LABEL_19;
  -[UITextInputTraits recentInputIdentifier](self, "recentInputIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[UITextInputTraits recentInputIdentifier](self, "recentInputIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recentInputIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) == 0)
    {

LABEL_19:
      v19 = 2;
      goto LABEL_20;
    }
  }
  -[UITextInputTraits recentInputIdentifier](self, "recentInputIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
  }
  else
  {
    objc_msgSend(v6, "recentInputIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_15;
  }
  smartQuotesType = self->smartQuotesType;
  if (smartQuotesType == objc_msgSend(v6, "smartQuotesType"))
  {
    smartDashesType = self->smartDashesType;
    v18 = smartDashesType != objc_msgSend(v6, "smartDashesType");
    goto LABEL_16;
  }
LABEL_15:
  v18 = 1;
LABEL_16:

  if (v13)
  {

  }
  if (v18)
    goto LABEL_19;
  disableInputBars = self->disableInputBars;
  if (disableInputBars == objc_msgSend(v6, "disableInputBars"))
  {
    returnKeyType = self->returnKeyType;
    v19 = returnKeyType != objc_msgSend(v6, "returnKeyType")
       || (enablesReturnKeyAutomatically = self->enablesReturnKeyAutomatically,
           enablesReturnKeyAutomatically != objc_msgSend(v6, "enablesReturnKeyAutomatically"))
       || (emptyContentReturnKeyType = self->emptyContentReturnKeyType,
           emptyContentReturnKeyType != objc_msgSend(v6, "emptyContentReturnKeyType"))
       || (enablesReturnKeyOnNonWhiteSpaceContent = self->enablesReturnKeyOnNonWhiteSpaceContent,
           enablesReturnKeyOnNonWhiteSpaceContent != objc_msgSend(v6, "enablesReturnKeyOnNonWhiteSpaceContent"))|| (suppressReturnKeyStyling = self->suppressReturnKeyStyling, suppressReturnKeyStyling != objc_msgSend(v6, "suppressReturnKeyStyling"))|| self->enablesReturnKeyAutomatically|| self->enablesReturnKeyOnNonWhiteSpaceContent;
  }
  else
  {
    v19 = 3;
  }
LABEL_20:

  return v19;
}

- (NSString)recentInputIdentifier
{
  return self->recentInputIdentifier;
}

- (void)setKeyboardType:(int64_t)a3
{
  *((_BYTE *)self + 32) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->PINEntrySeparatorIndexes, 0);
  objc_storeStrong((id *)&self->_selectionBorderColor, 0);
  objc_storeStrong((id *)&self->_matchHighlightColor, 0);
  objc_storeStrong((id *)&self->_selectionHighlightColor, 0);
  objc_storeStrong((id *)&self->_selectionBarColor, 0);
  objc_storeStrong((id *)&self->_insertionPointColor, 0);
  objc_storeStrong((id *)&self->supplementalLexiconAmbiguousItemIcon, 0);
  objc_storeStrong((id *)&self->supplementalLexicon, 0);
  objc_storeStrong((id *)&self->inputContextHistory, 0);
  objc_storeStrong((id *)&self->recentInputIdentifier, 0);
  objc_storeStrong((id *)&self->responseContext, 0);
  objc_storeStrong((id *)&self->autocorrectionContext, 0);
  objc_storeStrong(&self->textSuggestionDelegate, 0);
  objc_storeStrong((id *)&self->underlineColorForSpelling, 0);
  objc_storeStrong((id *)&self->underlineColorForTextAlternatives, 0);
  objc_storeStrong((id *)&self->selectionDragDotImage, 0);
  objc_storeStrong((id *)&self->selectionHighlightColor, 0);
  objc_storeStrong((id *)&self->selectionBarColor, 0);
  objc_storeStrong((id *)&self->insertionPointColor, 0);
  objc_storeStrong((id *)&self->passwordRules, 0);
  objc_storeStrong((id *)&self->textContentType, 0);
}

- (void)_setColorsToMatchTintColor:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  char privateInputTraitFlags;
  id v13;

  v13 = a3;
  if (v13)
  {
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v13)
    {
      v6 = 0;
    }
    else
    {
      +[UIColor _alternateSystemInteractionTintColor](UIColor, "_alternateSystemInteractionTintColor");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v5 != v13;

    }
  }
  else
  {
    v6 = 0;
  }
  +[UIColor insertionPointColor](UIColor, "insertionPointColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[UIColor selectionGrabberColor](UIColor, "selectionGrabberColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor selectionHighlightColor](UIColor, "selectionHighlightColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = v13;

    v7 = v10;
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.2);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = v7;
    v9 = (void *)v11;
  }
  privateInputTraitFlags = (char)self->_privateInputTraitFlags;
  if ((privateInputTraitFlags & 4) != 0)
  {
    if ((*(_BYTE *)&self->_privateInputTraitFlags & 2) != 0)
      goto LABEL_11;
LABEL_15:
    objc_storeStrong((id *)&self->_selectionHighlightColor, v9);
    if ((*(_BYTE *)&self->_privateInputTraitFlags & 1) != 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_storeStrong((id *)&self->_insertionPointColor, v7);
  privateInputTraitFlags = (char)self->_privateInputTraitFlags;
  if ((privateInputTraitFlags & 2) == 0)
    goto LABEL_15;
LABEL_11:
  if ((privateInputTraitFlags & 1) == 0)
LABEL_12:
    objc_storeStrong((id *)&self->_selectionBarColor, v8);
LABEL_13:

}

- (void)setAcceptsDictationSearchResults:(BOOL)a3
{
  self->acceptsDictationSearchResults = a3;
}

+ (BOOL)keyboardTypeRequiresASCIICapable:(int64_t)a3
{
  BOOL result;
  int v4;

  result = 1;
  if (a3 <= 0xD)
  {
    if (((1 << a3) & 0x3575) == 0)
      return result;
    return 0;
  }
  if ((a3 - 120) > 7)
    return 0;
  v4 = 1 << (a3 - 120);
  if ((v4 & 0x55) != 0 || (v4 & 0x88) == 0)
    return 0;
  return result;
}

- (void)overrideWithTraits:(id)a3
{
  UITextInputTraits *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  if (v20)
  {
    v4 = objc_alloc_init(UITextInputTraits);
    v5 = objc_msgSend(v20, "autocapitalizationType");
    if (v5 != -[UITextInputTraits autocapitalizationType](v4, "autocapitalizationType"))
      -[UITextInputTraits setAutocapitalizationType:](self, "setAutocapitalizationType:", objc_msgSend(v20, "autocapitalizationType"));
    v6 = objc_msgSend(v20, "autocorrectionType");
    if (v6 != -[UITextInputTraits autocorrectionType](v4, "autocorrectionType"))
      -[UITextInputTraits setAutocorrectionType:](self, "setAutocorrectionType:", objc_msgSend(v20, "autocorrectionType"));
    v7 = objc_msgSend(v20, "spellCheckingType");
    if (v7 != -[UITextInputTraits spellCheckingType](v4, "spellCheckingType"))
      -[UITextInputTraits setSpellCheckingType:](self, "setSpellCheckingType:", objc_msgSend(v20, "spellCheckingType"));
    v8 = objc_msgSend(v20, "keyboardType");
    if (v8 != -[UITextInputTraits keyboardType](v4, "keyboardType"))
      -[UITextInputTraits setKeyboardType:](self, "setKeyboardType:", objc_msgSend(v20, "keyboardType"));
    v9 = objc_msgSend(v20, "keyboardAppearance");
    if (v9 != -[UITextInputTraits keyboardAppearance](v4, "keyboardAppearance"))
      -[UITextInputTraits setKeyboardAppearance:](self, "setKeyboardAppearance:", objc_msgSend(v20, "keyboardAppearance"));
    v10 = objc_msgSend(v20, "returnKeyType");
    if (v10 != -[UITextInputTraits returnKeyType](v4, "returnKeyType"))
      -[UITextInputTraits setReturnKeyType:](self, "setReturnKeyType:", objc_msgSend(v20, "returnKeyType"));
    v11 = objc_msgSend(v20, "enablesReturnKeyAutomatically");
    if (v11 != -[UITextInputTraits enablesReturnKeyAutomatically](v4, "enablesReturnKeyAutomatically"))
      -[UITextInputTraits setEnablesReturnKeyAutomatically:](self, "setEnablesReturnKeyAutomatically:", objc_msgSend(v20, "enablesReturnKeyAutomatically"));
    objc_msgSend(v20, "textContentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputTraits textContentType](v4, "textContentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 != v13)
    {
      objc_msgSend(v20, "textContentType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputTraits setTextContentType:](self, "setTextContentType:", v14);

    }
    v15 = objc_msgSend(v20, "smartInsertDeleteType");
    if (v15 != -[UITextInputTraits smartInsertDeleteType](v4, "smartInsertDeleteType"))
      -[UITextInputTraits setSmartInsertDeleteType:](self, "setSmartInsertDeleteType:", objc_msgSend(v20, "smartInsertDeleteType"));
    v16 = objc_msgSend(v20, "smartQuotesType");
    if (v16 != -[UITextInputTraits smartQuotesType](v4, "smartQuotesType"))
      -[UITextInputTraits setSmartQuotesType:](self, "setSmartQuotesType:", objc_msgSend(v20, "smartQuotesType"));
    v17 = objc_msgSend(v20, "smartDashesType");
    if (v17 != -[UITextInputTraits smartDashesType](v4, "smartDashesType"))
      -[UITextInputTraits setSmartDashesType:](self, "setSmartDashesType:", objc_msgSend(v20, "smartDashesType"));
    v18 = objc_msgSend(v20, "writingToolsBehavior");
    if (v18 != -[UITextInputTraits writingToolsBehavior](v4, "writingToolsBehavior"))
      -[UITextInputTraits setWritingToolsBehavior:](self, "setWritingToolsBehavior:", objc_msgSend(v20, "writingToolsBehavior"));
    v19 = objc_msgSend(v20, "allowedWritingToolsResultOptions");
    if (v19 != -[UITextInputTraits allowedWritingToolsResultOptions](v4, "allowedWritingToolsResultOptions"))
      -[UITextInputTraits setAllowedWritingToolsResultOptions:](self, "setAllowedWritingToolsResultOptions:", objc_msgSend(v20, "allowedWritingToolsResultOptions"));
    -[UITextInputTraits overrideWithPrivateTraits:](self, "overrideWithPrivateTraits:", v20);

  }
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->autocapitalizationType = a3;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->autocorrectionType = a3;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->returnKeyType = a3;
}

- (void)setEnablesReturnKeyAutomatically:(BOOL)a3
{
  self->enablesReturnKeyAutomatically = a3;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  *((_BYTE *)self + 33) = a3;
}

- (void)overrideWithPrivateTraits:(id)a3
{
  id v4;
  UITextInputTraits *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v4 = a3;
  if (v4)
  {
    v29 = v4;
    v5 = objc_alloc_init(UITextInputTraits);
    v6 = objc_msgSend(v29, "forceFloatingKeyboard");
    if (v6 != -[UITextInputTraits forceFloatingKeyboard](v5, "forceFloatingKeyboard"))
      -[UITextInputTraits setForceFloatingKeyboard:](self, "setForceFloatingKeyboard:", objc_msgSend(v29, "forceFloatingKeyboard"));
    objc_msgSend(v29, "floatingKeyboardEdgeInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UITextInputTraits floatingKeyboardEdgeInsets](v5, "floatingKeyboardEdgeInsets");
    if (v10 != v18 || v8 != v15 || v14 != v17 || v12 != v16)
    {
      objc_msgSend(v29, "floatingKeyboardEdgeInsets");
      -[UITextInputTraits setFloatingKeyboardEdgeInsets:](self, "setFloatingKeyboardEdgeInsets:");
    }
    v22 = objc_msgSend(v29, "acceptsInitialEmojiKeyboard");
    if (v22 != -[UITextInputTraits acceptsInitialEmojiKeyboard](v5, "acceptsInitialEmojiKeyboard"))
      -[UITextInputTraits setAcceptsInitialEmojiKeyboard:](self, "setAcceptsInitialEmojiKeyboard:", objc_msgSend(v29, "acceptsInitialEmojiKeyboard"));
    objc_msgSend(v29, "recentInputIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputTraits recentInputIdentifier](v5, "recentInputIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 != v24)
    {
      objc_msgSend(v29, "recentInputIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInputTraits setRecentInputIdentifier:](self, "setRecentInputIdentifier:", v25);

    }
    v26 = objc_msgSend(v29, "inlinePredictionType");
    if (v26 != -[UITextInputTraits inlinePredictionType](v5, "inlinePredictionType"))
      -[UITextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", objc_msgSend(v29, "inlinePredictionType"));
    v27 = objc_msgSend(v29, "mathExpressionCompletionType");
    if (v27 != -[UITextInputTraits mathExpressionCompletionType](v5, "mathExpressionCompletionType"))
      -[UITextInputTraits setMathExpressionCompletionType:](self, "setMathExpressionCompletionType:", objc_msgSend(v29, "mathExpressionCompletionType"));
    v28 = objc_msgSend(v29, "allowsTextAnimationsType");
    if (v28 != -[UITextInputTraits allowsTextAnimationsType](v5, "allowsTextAnimationsType"))
      -[UITextInputTraits setAllowsTextAnimationsType:](self, "setAllowsTextAnimationsType:", objc_msgSend(v29, "allowsTextAnimationsType"));

    v4 = v29;
  }

}

- (void)setTextSelectionBehavior:(int)a3
{
  self->textSelectionBehavior = a3;
}

- (void)setTextContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setShortcutConversionType:(int)a3
{
  self->shortcutConversionType = a3;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->secureTextEntry = a3;
  if (a3)
    -[UITextInputTraits setToSecureValues](self, "setToSecureValues");
  else
    self->devicePasscodeEntry = 0;
}

- (void)setContentsIsSingleValue:(BOOL)a3
{
  self->contentsIsSingleValue = a3;
}

- (void)overlayWithTITextInputTraits:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UITextInputTraits setAutocapitalizationType:](self, "setAutocapitalizationType:", objc_msgSend((id)objc_opt_class(), "translateToUIAutocapitalizationType:", objc_msgSend(v5, "autocapitalizationType")));
  -[UITextInputTraits setAutocorrectionType:](self, "setAutocorrectionType:", objc_msgSend((id)objc_opt_class(), "translateToUIAutocorrectionType:", objc_msgSend(v5, "autocorrectionType")));
  -[UITextInputTraits setSpellCheckingType:](self, "setSpellCheckingType:", objc_msgSend((id)objc_opt_class(), "translateToUISpellCheckingType:", objc_msgSend(v5, "spellCheckingType")));
  -[UITextInputTraits setKeyboardType:](self, "setKeyboardType:", objc_msgSend((id)objc_opt_class(), "translateToUIKeyboardType:", objc_msgSend(v5, "keyboardType")));
  -[UITextInputTraits setKeyboardAppearance:](self, "setKeyboardAppearance:", objc_msgSend((id)objc_opt_class(), "translateToUIKeyboardAppearance:", objc_msgSend(v5, "keyboardAppearance")));
  -[UITextInputTraits setReturnKeyType:](self, "setReturnKeyType:", objc_msgSend((id)objc_opt_class(), "translateToUIReturnKeyType:", objc_msgSend(v5, "returnKeyType")));
  -[UITextInputTraits setEnablesReturnKeyAutomatically:](self, "setEnablesReturnKeyAutomatically:", objc_msgSend(v5, "enablesReturnKeyAutomatically"));
  -[UITextInputTraits setSecureTextEntry:](self, "setSecureTextEntry:", objc_msgSend(v5, "secureTextEntry"));
  objc_msgSend(v5, "textContentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputTraits setTextContentType:](self, "setTextContentType:", v4);

  -[UITextInputTraits setTextScriptType:](self, "setTextScriptType:", objc_msgSend((id)objc_opt_class(), "translateToUITextScriptType:", objc_msgSend(v5, "textScriptType")));
  -[UITextInputTraits setSmartInsertDeleteType:](self, "setSmartInsertDeleteType:", objc_msgSend((id)objc_opt_class(), "translateToUISmartInsertDeleteEnabled:", objc_msgSend(v5, "smartInsertDeleteEnabled")));
  -[UITextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", objc_msgSend((id)objc_opt_class(), "translateToUIInlinePredictionType:", objc_msgSend(v5, "inlineCompletionType")));
  -[UITextInputTraits setSmartDashesType:](self, "setSmartDashesType:", objc_msgSend((id)objc_opt_class(), "translateToUISmartDashesType:", objc_msgSend(v5, "smartDashesType")));
  -[UITextInputTraits setSmartQuotesType:](self, "setSmartQuotesType:", objc_msgSend((id)objc_opt_class(), "translateToUISmartQuotesType:", objc_msgSend(v5, "smartQuotesType")));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UITextInputTraits setMathExpressionCompletionType:](self, "setMathExpressionCompletionType:", objc_msgSend((id)objc_opt_class(), "translateToUITextMathExpressionCompletionType:", objc_msgSend(v5, "mathExpressionCompletionType")));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UITextInputTraits setAllowsTextAnimationsType:](self, "setAllowsTextAnimationsType:", objc_msgSend((id)objc_opt_class(), "translateToUITextAllowsTextAnimationsType:", objc_msgSend(v5, "allowsTextAnimationsType")));

}

+ (int64_t)translateToUIAutocapitalizationType:(unint64_t)a3
{
  if (a3 - 1 >= 3)
    return 0;
  else
    return a3;
}

+ (int64_t)translateToUIAutocorrectionType:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)translateToUISpellCheckingType:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)translateToUIKeyboardType:(unint64_t)a3
{
  if (a3 - 1 > 0x10)
    return 0;
  else
    return qword_18667F6A0[a3 - 1];
}

+ (int64_t)translateToUIKeyboardAppearance:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return 0;
  else
    return qword_18667F728[a3 - 1];
}

+ (int64_t)translateToPublicUIKeyboardAppearance:(unint64_t)a3
{
  if (a3 == 6)
    return 1;
  else
    return objc_msgSend(a1, "translateToUIKeyboardAppearance:");
}

+ (int64_t)translateToUIReturnKeyType:(unint64_t)a3
{
  if (a3 - 1 > 0xC)
    return 0;
  else
    return qword_18667F758[a3 - 1];
}

+ (int64_t)translateToUITextScriptType:(unint64_t)a3
{
  if (a3 - 1 >= 4)
    return 0;
  else
    return a3;
}

+ (int64_t)translateToUISmartInsertDeleteEnabled:(BOOL)a3
{
  if (a3)
    return 2;
  else
    return 1;
}

+ (int64_t)translateToUIInlinePredictionType:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)translateToUITextMathExpressionCompletionType:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)translateToUITextAllowsTextAnimationsType:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)translateToUISmartDashesType:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)translateToUISmartQuotesType:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (BOOL)wasEverSecureTextEntry
{
  return (*(_BYTE *)&self->_privateInputTraitFlags >> 3) & 1;
}

- (void)setToSecureValues
{
  int64x2_t v2;

  *(_BYTE *)&self->_privateInputTraitFlags |= 8u;
  self->secureTextEntry = 1;
  *(_OWORD *)&self->autocapitalizationType = xmmword_1866794A0;
  self->spellCheckingType = 1;
  self->smartDashesType = 1;
  self->learnsCorrections = 0;
  v2 = vdupq_n_s64(1uLL);
  self->shortcutConversionType = 1;
  *(int64x2_t *)&self->smartInsertDeleteType = v2;
  self->inlinePredictionType = 1;
  *(int64x2_t *)&self->mathExpressionCompletionType = v2;
  -[UITextInputTraits setTextTrimmingSet:](self, "setTextTrimmingSet:", 0);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v22 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[UITextInputTraits keyboardType](self, "keyboardType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->acceptsEmoji);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->forceEnableDictation);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->returnKeyGoesToNextResponder);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[UITextInputTraits returnKeyType](self, "returnKeyType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UITextInputTraits isSecureTextEntry](self, "isSecureTextEntry"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[UITextInputTraits spellCheckingType](self, "spellCheckingType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[UITextInputTraits autocorrectionType](self, "autocorrectionType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[UITextInputTraits autocapitalizationType](self, "autocapitalizationType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[UITextInputTraits textSelectionBehavior](self, "textSelectionBehavior"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UITextInputTraits contentsIsSingleValue](self, "contentsIsSingleValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v21, CFSTR("Version"), v20, CFSTR("KeyboardType"), v19, CFSTR("AcceptsEmoji"), v18, CFSTR("ForceEnableDictation"), v17, CFSTR("ReturnKeyGoesToNextResponder"), v3, CFSTR("ReturnKeyType"), v16, CFSTR("SecureTextEntry"), v15, CFSTR("SpellCheckingTypeKey"), v14,
    CFSTR("AutocorrectionType"),
    v13,
    CFSTR("AutocapitalizationType"),
    v4,
    CFSTR("TextSelectionBehavior"),
    v5,
    CFSTR("ContentIsSingleValue"),
    0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[UITextInputTraits textContentType](self, "textContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UITextInputTraits textContentType](self, "textContentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("TextContentType"));

  }
  -[UITextInputTraits passwordRules](self, "passwordRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UITextInputTraits passwordRules](self, "passwordRules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("PasswordRules"));

  }
  return v7;
}

- (void)setTextSuggestionDelegate:(id)a3
{
  objc_storeStrong(&self->textSuggestionDelegate, a3);
}

- (void)setDevicePasscodeEntry:(BOOL)a3
{
  self->devicePasscodeEntry = a3;
  if (a3)
    -[UITextInputTraits setSecureTextEntry:](self, "setSecureTextEntry:", 1);
}

- (int64_t)dictationKeyboardType
{
  int64_t v3;

  v3 = -[UITextInputTraits keyboardType](self, "keyboardType");
  if (-[UITextInputTraits forceDictationKeyboardType](self, "forceDictationKeyboardType") == 0x7FFFFFFFFFFFFFFFLL)
    return v3;
  else
    return -[UITextInputTraits forceDictationKeyboardType](self, "forceDictationKeyboardType");
}

- (int64_t)dictationInfoKeyboardType
{
  int64_t v3;

  v3 = -[UITextInputTraits keyboardType](self, "keyboardType");
  if (-[UITextInputTraits forceDictationKeyboardType](self, "forceDictationKeyboardType") != 0x7FFFFFFFFFFFFFFFLL)
    return -[UITextInputTraits forceDictationKeyboardType](self, "forceDictationKeyboardType");
  if (-[UITextInputTraits forceDefaultDictationInfo](self, "forceDefaultDictationInfo"))
    return 0;
  return v3;
}

+ (id)traitsByAdoptingTraits:(id)a3 lightweight:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  UITextInputTraits *v6;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(UITextInputTraits);
  -[UITextInputTraits takeTraitsFrom:lightweight:](v6, "takeTraitsFrom:lightweight:", v5, v4);

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ : %p>\n"), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR("public\n"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   autocapitalization:                  %ld\n"), self->autocapitalizationType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   autocorrection:                      %ld\n"), self->autocorrectionType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   spellchecking:                       %ld\n"), self->spellCheckingType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   keyboard type:                       %ld\n"), *((char *)self + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   kb appearance:                       %ld\n"), *((char *)self + 33));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   return key type:                     %ld\n"), self->returnKeyType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v10);

  if (self->enablesReturnKeyAutomatically)
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   auto return key:                     %@\n"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v12);

  if (self->secureTextEntry)
    v13 = CFSTR("Y");
  else
    v13 = CFSTR("N");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   secure text entry:                   %@\n"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v14);

  if (!self->secureTextEntry)
  {
    if ((*(_BYTE *)&self->_privateInputTraitFlags & 8) != 0)
      v15 = CFSTR("Y");
    else
      v15 = CFSTR("N");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   was ever secure text entry:          %@\n"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v16);

  }
  if (self->devicePasscodeEntry)
    v17 = CFSTR("Y");
  else
    v17 = CFSTR("N");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   device passcode entry:               %@\n"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v18);

  -[UITextInputTraits passwordRules](self, "passwordRules");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    -[UITextInputTraits passwordRules](self, "passwordRules");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("   password rules:                      %@\n"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v22);

  }
  -[UITextInputTraits textContentType](self, "textContentType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    -[UITextInputTraits textContentType](self, "textContentType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("   text content type:                   %@\n"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v26);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   smart insert/delete type:            %ld\n"), self->smartInsertDeleteType);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v27);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   smart quotes type:                   %ld\n"), self->smartQuotesType);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v28);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   smart dashes type:                   %ld\n"), self->smartDashesType);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v29);

  -[UITextInputTraits recentInputIdentifier](self, "recentInputIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = (void *)MEMORY[0x1E0CB3940];
    -[UITextInputTraits recentInputIdentifier](self, "recentInputIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("   recent input identifier:             %@\n"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v33);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   writingToolsBehavior:            %ld\n"), self->writingToolsBehavior);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v34);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   allowedWritingToolsResultOptions:     %ld\n"), self->allowedWritingToolsResultOptions);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v35);

  objc_msgSend(v3, "appendString:", CFSTR("private\n"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   text trimming set:                   %p\n"), self->textTrimmingSet);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v36);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   ins. pt. color:                      %@\n"), self->insertionPointColor);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v37);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   ins. pt. width:                      %lu\n"), self->insertionPointWidth);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v38);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   text loupe vis.:                     %d\n"), self->textLoupeVisibility);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v39);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   selection behavior:                  %d\n"), self->textSelectionBehavior);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v40);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   text suggest. del.:                  %@\n"), self->textSuggestionDelegate);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v41);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   single-line document:                %d\n"), self->isSingleLineDocument);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v42);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   single value:                        %d\n"), self->contentsIsSingleValue);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v43);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   has default contents:                %d\n"), self->hasDefaultContents);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v44);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   accepts payloads:                    %d\n"), self->acceptsPayloads);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v45);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   accepts emoji:                       %d\n"), self->acceptsEmoji);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v46);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   acceptsInitialEmojiKeyboard:         %d\n"), self->acceptsInitialEmojiKeyboard);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v47);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   accepts dictation search results:    %d\n"), self->acceptsDictationSearchResults);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v48);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   use automatic endpointing:           %d\n"), self->useAutomaticEndpointing);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v49);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   show dictation button:               %d\n"), self->showDictationButton);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v50);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   force-enable dictation:              %d\n"), self->forceEnableDictation);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v51);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   force-disable dictation:             %d\n"), self->forceDisableDictation);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v52);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   force-spelling dictation: %d\n"), self->forceSpellingDictation);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v53);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   force default dictation info         %d\n"), self->forceDefaultDictationInfo);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v54);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   force dictation keyboard type:       %ld\n"), self->forceDictationKeyboardType);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v55);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   prefer online dictation              %d\n"), self->preferOnlineDictation);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v56);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   disabled return key:                 %d\n"), self->emptyContentReturnKeyType);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v57);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   return key goes to next responder:   %d\n"), self->returnKeyGoesToNextResponder);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v58);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   accepts floating keyboard:           %d\n"), self->acceptsFloatingKeyboard);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v59);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   force floating keyboard:             %d\n"), self->forceFloatingKeyboard);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v60);

  v61 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromUIEdgeInsets(self->floatingKeyboardEdgeInsets);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "stringWithFormat:", CFSTR("   floating keyboard edge insets:       %@\n"), v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v63);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   accepts split keyboard:              %d\n"), self->acceptsSplitKeyboard);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v64);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   displaySecureTextUsingPlainText:     %d\n"), self->displaySecureTextUsingPlainText);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v65);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   displaySecureEditsUsingPlainText:    %d\n"), self->displaySecureEditsUsingPlainText);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v66);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   learnsCorrections:        %d\n"), self->learnsCorrections);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v67);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   shortcut conversion:                 %d\n"), self->shortcutConversionType);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v68);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   suppress return key styling:         %d\n"), self->suppressReturnKeyStyling);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v69);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   localized with UI language:          %d\n"), self->useInterfaceLanguageForLocalization);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v70);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   defer becomeFirstResponder:          %d\n"), self->deferBecomingResponder);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v71);

  if (self->enablesReturnKeyOnNonWhiteSpaceContent)
    v72 = CFSTR("Y");
  else
    v72 = CFSTR("N");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   enables return key for NWS content:  %@\n"), v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v73);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   autocorrection context:              %@\n"), self->autocorrectionContext);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v74);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   response context:                    %@\n"), self->responseContext);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v75);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   input context history:               %@\n"), self->inputContextHistory);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v76);

  if (self->disablePrediction)
    v77 = CFSTR("Y");
  else
    v77 = CFSTR("N");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   disable prediction:                  %@\n"), v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v78);

  if (self->hidePrediction)
    v79 = CFSTR("Y");
  else
    v79 = CFSTR("N");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   hide prediction:                     %@\n"), v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v80);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   inline prediction type:              %ld\n"), self->inlinePredictionType);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v81);

  if (self->disableInputBars)
    v82 = CFSTR("Y");
  else
    v82 = CFSTR("N");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   disableInputBars:                    %@\n"), v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v83);

  if (self->isCarPlayIdiom)
    v84 = CFSTR("Y");
  else
    v84 = CFSTR("N");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   isCarPlayIdiom:                      %@\n"), v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v85);

  if (self->loadKeyboardsForSiriLanguage)
    v86 = CFSTR("Y");
  else
    v86 = CFSTR("N");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   loadKeyboardsForSiriLanguage:        %@\n"), v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v87);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   textScriptType:                      %ld\n"), self->textScriptType);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v88);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   supplemental lexicon:                %@\n"), self->supplementalLexicon);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v89);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   supplemental lexicon ambiguous item icon: %@\n"), self->supplementalLexiconAmbiguousItemIcon);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v90);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   disableHandwritingKeyboard:          %d\n"), self->disableHandwritingKeyboard);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v91);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   math expression completion:          %ld\n"), self->mathExpressionCompletionType);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v92);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("   text animations allowed:             %ld\n"), self->allowsTextAnimationsType);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v93);

  return (NSString *)v3;
}

- (BOOL)publicTraitsMatchTraits:(id)a3
{
  void *v3;
  id v5;
  int64_t autocapitalizationType;
  int64_t autocorrectionType;
  int64_t spellCheckingType;
  uint64_t v9;
  uint64_t v10;
  int64_t returnKeyType;
  int enablesReturnKeyAutomatically;
  int secureTextEntry;
  int64_t smartInsertDeleteType;
  int64_t smartQuotesType;
  int64_t smartDashesType;
  NSString *textContentType;
  NSString *v18;
  NSString *v19;
  BOOL v20;
  UITextInputPasswordRules *passwordRules;
  uint64_t v23;
  void *v24;
  UITextInputPasswordRules *v25;
  void *v26;
  int64_t v27;
  unint64_t v28;
  int64_t writingToolsBehavior;
  unint64_t allowedWritingToolsResultOptions;

  v5 = a3;
  autocapitalizationType = self->autocapitalizationType;
  if (autocapitalizationType == objc_msgSend(v5, "autocapitalizationType"))
  {
    autocorrectionType = self->autocorrectionType;
    if (autocorrectionType == objc_msgSend(v5, "autocorrectionType"))
    {
      spellCheckingType = self->spellCheckingType;
      if (spellCheckingType == objc_msgSend(v5, "spellCheckingType"))
      {
        v9 = *((char *)self + 32);
        if (objc_msgSend(v5, "keyboardType") == v9)
        {
          v10 = *((char *)self + 33);
          if (objc_msgSend(v5, "keyboardAppearance") == v10)
          {
            returnKeyType = self->returnKeyType;
            if (returnKeyType == objc_msgSend(v5, "returnKeyType"))
            {
              enablesReturnKeyAutomatically = self->enablesReturnKeyAutomatically;
              if (enablesReturnKeyAutomatically == objc_msgSend(v5, "enablesReturnKeyAutomatically"))
              {
                secureTextEntry = self->secureTextEntry;
                if (secureTextEntry == objc_msgSend(v5, "isSecureTextEntry"))
                {
                  smartInsertDeleteType = self->smartInsertDeleteType;
                  if (smartInsertDeleteType == objc_msgSend(v5, "smartInsertDeleteType"))
                  {
                    smartQuotesType = self->smartQuotesType;
                    if (smartQuotesType == objc_msgSend(v5, "smartQuotesType"))
                    {
                      smartDashesType = self->smartDashesType;
                      if (smartDashesType == objc_msgSend(v5, "smartDashesType"))
                      {
                        textContentType = self->textContentType;
                        objc_msgSend(v5, "textContentType");
                        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
                        if (textContentType == v18
                          || (v19 = self->textContentType,
                              objc_msgSend(v5, "textContentType"),
                              v3 = (void *)objc_claimAutoreleasedReturnValue(),
                              -[NSString isEqualToString:](v19, "isEqualToString:", v3)))
                        {
                          passwordRules = self->passwordRules;
                          objc_msgSend(v5, "passwordRules");
                          v23 = objc_claimAutoreleasedReturnValue();
                          if (passwordRules == (UITextInputPasswordRules *)v23)
                          {
                            writingToolsBehavior = self->writingToolsBehavior;
                            if (writingToolsBehavior == objc_msgSend(v5, "writingToolsBehavior"))
                            {
                              allowedWritingToolsResultOptions = self->allowedWritingToolsResultOptions;
                              v20 = allowedWritingToolsResultOptions == objc_msgSend(v5, "allowedWritingToolsResultOptions");
                            }
                            else
                            {
                              v20 = 0;
                            }

                          }
                          else
                          {
                            v24 = (void *)v23;
                            v25 = self->passwordRules;
                            objc_msgSend(v5, "passwordRules");
                            v26 = (void *)objc_claimAutoreleasedReturnValue();
                            if (-[UITextInputPasswordRules isEqual:](v25, "isEqual:", v26)
                              && (v27 = self->writingToolsBehavior, v27 == objc_msgSend(v5, "writingToolsBehavior")))
                            {
                              v28 = self->allowedWritingToolsResultOptions;
                              v20 = v28 == objc_msgSend(v5, "allowedWritingToolsResultOptions");
                            }
                            else
                            {
                              v20 = 0;
                            }

                          }
                          if (textContentType == v18)
                            goto LABEL_29;
                        }
                        else
                        {
                          v20 = 0;
                        }

LABEL_29:
                        goto LABEL_16;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v20 = 0;
LABEL_16:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  UIColor *insertionPointColor;
  void *v18;
  unint64_t insertionPointWidth;
  int textLoupeVisibility;
  int textSelectionBehavior;
  id textSuggestionDelegate;
  id v23;
  int isSingleLineDocument;
  int contentsIsSingleValue;
  int hasDefaultContents;
  int acceptsPayloads;
  int acceptsEmoji;
  int acceptsInitialEmojiKeyboard;
  int acceptsDictationSearchResults;
  int showDictationButton;
  int useAutomaticEndpointing;
  int forceEnableDictation;
  int forceDisableDictation;
  int forceSpellingDictation;
  int forceDefaultDictationInfo;
  int64_t forceDictationKeyboardType;
  int preferOnlineDictation;
  int emptyContentReturnKeyType;
  int returnKeyGoesToNextResponder;
  int learnsCorrections;
  int shortcutConversionType;
  int suppressReturnKeyStyling;
  int useInterfaceLanguageForLocalization;
  int deferBecomingResponder;
  int enablesReturnKeyOnNonWhiteSpaceContent;
  NSString *autocorrectionContext;
  NSString *v49;
  NSString *responseContext;
  NSString *v51;
  UIInputContextHistory *inputContextHistory;
  UIInputContextHistory *v53;
  int isCarPlayIdiom;
  int64_t textScriptType;
  _UISupplementalLexicon *supplementalLexicon;
  _UISupplementalLexicon *v57;
  UIImage *supplementalLexiconAmbiguousItemIcon;
  int disableHandwritingKeyboard;
  int64_t mathExpressionCompletionType;
  int64_t allowsTextAnimationsType;
  UIImage *v62;
  UIImage *v63;
  _UISupplementalLexicon *v64;
  void *v65;
  UIInputContextHistory *v66;
  void *v67;
  NSString *v68;
  UIInputContextHistory *v69;
  void *v70;
  NSString *v71;
  NSString *v72;
  NSString *v73;
  void *v74;

  v6 = a3;
  if (-[UITextInputTraits publicTraitsMatchTraits:](self, "publicTraitsMatchTraits:", v6))
  {
    -[UITextInputTraits recentInputIdentifier](self, "recentInputIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recentInputIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v8)
    {
      -[UITextInputTraits recentInputIdentifier](self, "recentInputIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recentInputIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqualToString:", v4))
      {
        v9 = 0;
        goto LABEL_28;
      }
    }
    v10 = -[UITextInputTraits manageRecentInputs](self, "manageRecentInputs");
    if (v10 != objc_msgSend(v6, "manageRecentInputs"))
      goto LABEL_26;
    v11 = -[UITextInputTraits validTextRange](self, "validTextRange");
    v13 = v12;
    if (v11 != objc_msgSend(v6, "validTextRange") || v13 != v14)
      goto LABEL_26;
    -[UITextInputTraits PINEntrySeparatorIndexes](self, "PINEntrySeparatorIndexes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PINEntrySeparatorIndexes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "isEqualToIndexSet:", v16))
      goto LABEL_25;
    if (!self->textTrimmingSet)
    {
      if (!objc_msgSend(v6, "textTrimmingSet"))
      {
LABEL_18:
        insertionPointColor = self->insertionPointColor;
        objc_msgSend(v6, "insertionPointColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[UIColor isEqual:](insertionPointColor, "isEqual:", v18))
        {
          insertionPointWidth = self->insertionPointWidth;
          if (insertionPointWidth == objc_msgSend(v6, "insertionPointWidth"))
          {
            textLoupeVisibility = self->textLoupeVisibility;
            if (textLoupeVisibility == objc_msgSend(v6, "textLoupeVisibility"))
            {
              textSelectionBehavior = self->textSelectionBehavior;
              if (textSelectionBehavior == objc_msgSend(v6, "textSelectionBehavior"))
              {
                textSuggestionDelegate = self->textSuggestionDelegate;
                objc_msgSend(v6, "textSuggestionDelegate");
                v23 = (id)objc_claimAutoreleasedReturnValue();
                if (textSuggestionDelegate != v23)
                {
                  v9 = 0;
LABEL_59:

LABEL_27:
                  if (v7 == v8)
                  {
LABEL_29:

                    goto LABEL_30;
                  }
LABEL_28:

                  goto LABEL_29;
                }
                v74 = v23;
                isSingleLineDocument = self->isSingleLineDocument;
                if (isSingleLineDocument != objc_msgSend(v6, "isSingleLineDocument"))
                  goto LABEL_57;
                contentsIsSingleValue = self->contentsIsSingleValue;
                if (contentsIsSingleValue != objc_msgSend(v6, "contentsIsSingleValue"))
                  goto LABEL_57;
                hasDefaultContents = self->hasDefaultContents;
                if (hasDefaultContents != objc_msgSend(v6, "hasDefaultContents"))
                  goto LABEL_57;
                acceptsPayloads = self->acceptsPayloads;
                if (acceptsPayloads != objc_msgSend(v6, "acceptsPayloads"))
                  goto LABEL_57;
                acceptsEmoji = self->acceptsEmoji;
                if (acceptsEmoji != objc_msgSend(v6, "acceptsEmoji"))
                  goto LABEL_57;
                acceptsInitialEmojiKeyboard = self->acceptsInitialEmojiKeyboard;
                if (acceptsInitialEmojiKeyboard != objc_msgSend(v6, "acceptsInitialEmojiKeyboard"))
                  goto LABEL_57;
                acceptsDictationSearchResults = self->acceptsDictationSearchResults;
                if (acceptsDictationSearchResults != objc_msgSend(v6, "acceptsDictationSearchResults"))
                  goto LABEL_57;
                showDictationButton = self->showDictationButton;
                if (showDictationButton != objc_msgSend(v6, "showDictationButton"))
                  goto LABEL_57;
                useAutomaticEndpointing = self->useAutomaticEndpointing;
                if (useAutomaticEndpointing != objc_msgSend(v6, "useAutomaticEndpointing"))
                  goto LABEL_57;
                forceEnableDictation = self->forceEnableDictation;
                if (forceEnableDictation != objc_msgSend(v6, "forceEnableDictation"))
                  goto LABEL_57;
                forceDisableDictation = self->forceDisableDictation;
                if (forceDisableDictation != objc_msgSend(v6, "forceDisableDictation"))
                  goto LABEL_57;
                forceSpellingDictation = self->forceSpellingDictation;
                if (forceSpellingDictation != objc_msgSend(v6, "forceSpellingDictation"))
                  goto LABEL_57;
                forceDefaultDictationInfo = self->forceDefaultDictationInfo;
                if (forceDefaultDictationInfo != objc_msgSend(v6, "forceDefaultDictationInfo"))
                  goto LABEL_57;
                forceDictationKeyboardType = self->forceDictationKeyboardType;
                if (forceDictationKeyboardType != objc_msgSend(v6, "forceDictationKeyboardType"))
                  goto LABEL_57;
                preferOnlineDictation = self->preferOnlineDictation;
                if (preferOnlineDictation != objc_msgSend(v6, "preferOnlineDictation"))
                  goto LABEL_57;
                emptyContentReturnKeyType = self->emptyContentReturnKeyType;
                if (emptyContentReturnKeyType != objc_msgSend(v6, "emptyContentReturnKeyType")
                  || (returnKeyGoesToNextResponder = self->returnKeyGoesToNextResponder,
                      returnKeyGoesToNextResponder != objc_msgSend(v6, "returnKeyGoesToNextResponder"))
                  || (learnsCorrections = self->learnsCorrections,
                      learnsCorrections != objc_msgSend(v6, "learnsCorrections"))
                  || (shortcutConversionType = self->shortcutConversionType,
                      shortcutConversionType != objc_msgSend(v6, "shortcutConversionType"))
                  || (suppressReturnKeyStyling = self->suppressReturnKeyStyling,
                      suppressReturnKeyStyling != objc_msgSend(v6, "suppressReturnKeyStyling"))
                  || (useInterfaceLanguageForLocalization = self->useInterfaceLanguageForLocalization,
                      useInterfaceLanguageForLocalization != objc_msgSend(v6, "useInterfaceLanguageForLocalization"))|| (deferBecomingResponder = self->deferBecomingResponder, deferBecomingResponder != objc_msgSend(v6, "deferBecomingResponder"))|| (enablesReturnKeyOnNonWhiteSpaceContent = self->enablesReturnKeyOnNonWhiteSpaceContent, enablesReturnKeyOnNonWhiteSpaceContent != objc_msgSend(v6, "enablesReturnKeyOnNonWhiteSpaceContent")))
                {
LABEL_57:
                  v9 = 0;
LABEL_58:
                  v23 = v74;
                  goto LABEL_59;
                }
                autocorrectionContext = self->autocorrectionContext;
                objc_msgSend(v6, "autocorrectionContext");
                v73 = (NSString *)objc_claimAutoreleasedReturnValue();
                v71 = autocorrectionContext;
                if (autocorrectionContext != v73)
                {
                  v49 = self->autocorrectionContext;
                  objc_msgSend(v6, "autocorrectionContext");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!-[NSString isEqualToString:](v49, "isEqualToString:"))
                  {
                    v9 = 0;
                    goto LABEL_81;
                  }
                }
                responseContext = self->responseContext;
                objc_msgSend(v6, "responseContext");
                v72 = (NSString *)objc_claimAutoreleasedReturnValue();
                v68 = responseContext;
                if (responseContext != v72)
                {
                  v51 = self->responseContext;
                  objc_msgSend(v6, "responseContext");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!-[NSString isEqualToString:](v51, "isEqualToString:"))
                  {
                    v9 = 0;
LABEL_79:

LABEL_80:
                    if (v71 == v73)
                    {
LABEL_82:

                      goto LABEL_58;
                    }
LABEL_81:

                    goto LABEL_82;
                  }
                }
                inputContextHistory = self->inputContextHistory;
                objc_msgSend(v6, "inputContextHistory");
                v69 = (UIInputContextHistory *)objc_claimAutoreleasedReturnValue();
                v66 = inputContextHistory;
                if (inputContextHistory != v69)
                {
                  v53 = self->inputContextHistory;
                  objc_msgSend(v6, "inputContextHistory");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!-[UIInputContextHistory isEqual:](v53, "isEqual:"))
                  {
                    v9 = 0;
LABEL_77:

LABEL_78:
                    if (v68 == v72)
                      goto LABEL_80;
                    goto LABEL_79;
                  }
                }
                isCarPlayIdiom = self->isCarPlayIdiom;
                if (isCarPlayIdiom == objc_msgSend(v6, "isCarPlayIdiom"))
                {
                  textScriptType = self->textScriptType;
                  if (textScriptType == objc_msgSend(v6, "textScriptType"))
                  {
                    supplementalLexicon = self->supplementalLexicon;
                    objc_msgSend(v6, "supplementalLexicon");
                    v57 = (_UISupplementalLexicon *)objc_claimAutoreleasedReturnValue();
                    v64 = supplementalLexicon;
                    if (supplementalLexicon == v57)
                    {
                      supplementalLexiconAmbiguousItemIcon = self->supplementalLexiconAmbiguousItemIcon;
                      objc_msgSend(v6, "supplementalLexiconAmbiguousItemIcon");
                      v62 = supplementalLexiconAmbiguousItemIcon;
                      v63 = (UIImage *)objc_claimAutoreleasedReturnValue();
                      if (supplementalLexiconAmbiguousItemIcon == v63)
                      {
                        disableHandwritingKeyboard = self->disableHandwritingKeyboard;
                        if (disableHandwritingKeyboard == objc_msgSend(v6, "disableHandwritingKeyboard"))
                        {
                          mathExpressionCompletionType = self->mathExpressionCompletionType;
                          if (mathExpressionCompletionType == objc_msgSend(v6, "mathExpressionCompletionType"))
                          {
                            allowsTextAnimationsType = self->allowsTextAnimationsType;
                            v9 = allowsTextAnimationsType == objc_msgSend(v6, "allowsTextAnimationsType");

                            goto LABEL_76;
                          }
                        }
                      }

                    }
                    else
                    {

                    }
                  }
                }
                v9 = 0;
LABEL_76:
                if (v66 == v69)
                  goto LABEL_78;
                goto LABEL_77;
              }
            }
          }
        }

LABEL_25:
LABEL_26:
        v9 = 0;
        goto LABEL_27;
      }
      if (!self->textTrimmingSet)
        goto LABEL_25;
    }
    if (!objc_msgSend(v6, "textTrimmingSet")
      || !CFCharacterSetIsSupersetOfSet(self->textTrimmingSet, (CFCharacterSetRef)objc_msgSend(v6, "textTrimmingSet"))
      || !CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)objc_msgSend(v6, "textTrimmingSet"), self->textTrimmingSet))
    {
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  v9 = 0;
LABEL_30:

  return v9;
}

- (void)setSelectionBarColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionBarColor, a3);
  *(_BYTE *)&self->_privateInputTraitFlags |= 1u;
}

- (void)setSelectionHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionHighlightColor, a3);
  *(_BYTE *)&self->_privateInputTraitFlags |= 2u;
}

- (void)setInsertionPointColor:(id)a3
{
  objc_storeStrong((id *)&self->_insertionPointColor, a3);
  *(_BYTE *)&self->_privateInputTraitFlags |= 4u;
}

- (int64_t)inlineCompletionType
{
  return self->inlinePredictionType;
}

- (void)setInlineCompletionType:(int64_t)a3
{
  self->inlinePredictionType = a3;
}

- (void)setSpellCheckingType:(int64_t)a3
{
  self->spellCheckingType = a3;
}

- (void)setSmartInsertDeleteType:(int64_t)a3
{
  self->smartInsertDeleteType = a3;
}

- (void)setSmartQuotesType:(int64_t)a3
{
  self->smartQuotesType = a3;
}

- (void)setSmartDashesType:(int64_t)a3
{
  self->smartDashesType = a3;
}

- (void)setPasswordRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)writingToolsBehavior
{
  return self->writingToolsBehavior;
}

- (void)setWritingToolsBehavior:(int64_t)a3
{
  self->writingToolsBehavior = a3;
}

- (unint64_t)allowedWritingToolsResultOptions
{
  return self->allowedWritingToolsResultOptions;
}

- (void)setAllowedWritingToolsResultOptions:(unint64_t)a3
{
  self->allowedWritingToolsResultOptions = a3;
}

- (void)setMatchHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_matchHighlightColor, a3);
}

- (void)setSelectionBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionBorderColor, a3);
}

- (void)setSelectionBorderWidth:(double)a3
{
  self->_selectionBorderWidth = a3;
}

- (void)setSelectionCornerRadius:(double)a3
{
  self->_selectionCornerRadius = a3;
}

- (void)setSelectionEdgeInsets:(UIEdgeInsets)a3
{
  self->_selectionEdgeInsets = a3;
}

- (void)setInsertionPointWidth:(unint64_t)a3
{
  self->insertionPointWidth = a3;
}

- (void)setTextLoupeVisibility:(int)a3
{
  self->textLoupeVisibility = a3;
}

- (void)setHasDefaultContents:(BOOL)a3
{
  self->hasDefaultContents = a3;
}

- (void)setAcceptsPayloads:(BOOL)a3
{
  self->acceptsPayloads = a3;
}

- (void)setAcceptsEmoji:(BOOL)a3
{
  self->acceptsEmoji = a3;
}

- (void)setAcceptsInitialEmojiKeyboard:(BOOL)a3
{
  self->acceptsInitialEmojiKeyboard = a3;
}

- (void)setUseAutomaticEndpointing:(BOOL)a3
{
  self->useAutomaticEndpointing = a3;
}

- (void)setForceEnableDictation:(BOOL)a3
{
  self->forceEnableDictation = a3;
}

- (void)setForceDisableDictation:(BOOL)a3
{
  self->forceDisableDictation = a3;
}

- (void)setForceSpellingDictation:(BOOL)a3
{
  self->forceSpellingDictation = a3;
}

- (void)setForceDefaultDictationInfo:(BOOL)a3
{
  self->forceDefaultDictationInfo = a3;
}

- (void)setForceDictationKeyboardType:(int64_t)a3
{
  self->forceDictationKeyboardType = a3;
}

- (void)setPreferOnlineDictation:(BOOL)a3
{
  self->preferOnlineDictation = a3;
}

- (void)setEmptyContentReturnKeyType:(int)a3
{
  self->emptyContentReturnKeyType = a3;
}

- (void)setReturnKeyGoesToNextResponder:(BOOL)a3
{
  self->returnKeyGoesToNextResponder = a3;
}

- (void)setAcceptsFloatingKeyboard:(BOOL)a3
{
  self->acceptsFloatingKeyboard = a3;
}

- (void)setForceFloatingKeyboard:(BOOL)a3
{
  self->forceFloatingKeyboard = a3;
}

- (void)setFloatingKeyboardEdgeInsets:(UIEdgeInsets)a3
{
  self->floatingKeyboardEdgeInsets = a3;
}

- (void)setAcceptsSplitKeyboard:(BOOL)a3
{
  self->acceptsSplitKeyboard = a3;
}

- (void)setDisplaySecureTextUsingPlainText:(BOOL)a3
{
  self->displaySecureTextUsingPlainText = a3;
}

- (void)setDisplaySecureEditsUsingPlainText:(BOOL)a3
{
  self->displaySecureEditsUsingPlainText = a3;
}

- (void)setLearnsCorrections:(BOOL)a3
{
  self->learnsCorrections = a3;
}

- (void)setSuppressReturnKeyStyling:(BOOL)a3
{
  self->suppressReturnKeyStyling = a3;
}

- (void)setUseInterfaceLanguageForLocalization:(BOOL)a3
{
  self->useInterfaceLanguageForLocalization = a3;
}

- (void)setDeferBecomingResponder:(BOOL)a3
{
  self->deferBecomingResponder = a3;
}

- (void)setEnablesReturnKeyOnNonWhiteSpaceContent:(BOOL)a3
{
  self->enablesReturnKeyOnNonWhiteSpaceContent = a3;
}

- (void)setDisablePrediction:(BOOL)a3
{
  self->disablePrediction = a3;
}

- (void)setHidePrediction:(BOOL)a3
{
  self->hidePrediction = a3;
}

- (void)setIsCarPlayIdiom:(BOOL)a3
{
  self->isCarPlayIdiom = a3;
}

- (void)setTextScriptType:(int64_t)a3
{
  self->textScriptType = a3;
}

- (void)setLoadKeyboardsForSiriLanguage:(BOOL)a3
{
  self->loadKeyboardsForSiriLanguage = a3;
}

- (int64_t)mathExpressionCompletionType
{
  return self->mathExpressionCompletionType;
}

- (void)setMathExpressionCompletionType:(int64_t)a3
{
  self->mathExpressionCompletionType = a3;
}

- (int64_t)allowsTextAnimationsType
{
  return self->allowsTextAnimationsType;
}

- (void)setAllowsTextAnimationsType:(int64_t)a3
{
  self->allowsTextAnimationsType = a3;
}

@end
