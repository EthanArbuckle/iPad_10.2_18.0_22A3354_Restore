@implementation UIKeyboardCandidateViewConfiguration

+ (id)configuration
{
  return objc_alloc_init((Class)a1);
}

- (void)setDarkKeyboard:(BOOL)a3
{
  self->_darkKeyboard = a3;
}

- (id)initialState
{
  UIKeyboardCandidateViewState *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CTFont *v9;
  CTFontRef CopyWithSymbolicTraits;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(UIKeyboardCandidateViewState);
  +[UIKeyboardCandidateViewStyle styleForDarkKeyboard:](UIKeyboardCandidateViewStyle, "styleForDarkKeyboard:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState setStyle:](v3, "setStyle:", v4);

  +[UIKeyboardCandidateViewStyle disambiguationStyleForDarkKeyboard:](UIKeyboardCandidateViewStyle, "disambiguationStyleForDarkKeyboard:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState setDisambiguationStyle:](v3, "setDisambiguationStyle:", v5);

  -[UIKeyboardCandidateViewState setPrimaryGridRowType:](v3, "setPrimaryGridRowType:", 0);
  -[UIKeyboardCandidateViewState setHasBackdrop:](v3, "setHasBackdrop:", 0);
  -[UIKeyboardCandidateViewConfiguration candidateDefaultFontSize](self, "candidateDefaultFontSize");
  -[UIKeyboardCandidateViewConfiguration candidateFontWithSize:](self, "candidateFontWithSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCandidateFont:", v6);

  -[UIKeyboardCandidateViewState style](v3, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "candidateFont");
  v9 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(v9, 0.0, 0, 2u, 2u);
  -[UIKeyboardCandidateViewState style](v3, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSupplementalLexiconCandidateFont:", CopyWithSymbolicTraits);

  -[UIKeyboardCandidateViewState style](v3, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMaxNumberOfProactiveCells:", 2);

  return v3;
}

- (id)extendedState
{
  return 0;
}

- (id)extendedScrolledState
{
  return 0;
}

- (unint64_t)rowsToExtend
{
  return 0;
}

- (unint64_t)maxNumberOfProactiveCandidates
{
  return 2;
}

- (BOOL)shouldResizeKeyboardBackdrop
{
  return 0;
}

- (BOOL)shouldAnimateStateTransition
{
  return 1;
}

- (id)candidateFontWithSize:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardCandidateViewConfiguration candidateFontWithSize:language:](self, "candidateFontWithSize:language:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)candidateFontWithSize:(double)a3 language:(id)a4
{
  void *v5;
  __CFString *v6;
  void *v7;
  double v8;
  const char *v9;
  double v10;
  float v11;
  double v12;
  CTFontRef UIFontForLanguage;

  v5 = (void *)UIApp;
  v6 = (__CFString *)a4;
  objc_msgSend(v5, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UICTContentSizeCategoryL")) & 1) == 0)
  {
    v8 = 2.0;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UICTContentSizeCategoryXL")) & 1) == 0)
    {
      v8 = 4.0;
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UICTContentSizeCategoryXXL")) & 1) == 0)
      {
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UICTContentSizeCategoryXXXL")) & 1) != 0
          || (v8 = 0.0, _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v7, v9)))
        {
          v8 = 6.0;
        }
      }
    }
  }
  objc_msgSend((id)objc_opt_class(), "fontSizeMultiplierForCurrentLanguage");
  if (v10 >= 1.0)
  {
    v12 = v8 + a3;
  }
  else
  {
    v11 = v10 * a3;
    v12 = ceilf(v11);
  }
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, v12, v6);

  return UIFontForLanguage;
}

- (double)candidateDefaultFontSize
{
  return 20.0;
}

+ (double)lineHeightMultiplierForCurrentLanguage
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  int v10;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "primaryLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(&unk_1E1A93740, "containsObject:", v7);

  if ((v4 & 1) != 0)
  {
    v8 = 1.18;
  }
  else
  {
    objc_msgSend(v6, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(&unk_1E1A93758, "containsObject:", v9);

    if (v10)
      v8 = 1.27;
    else
      v8 = 1.0;
  }

  return v8;
}

+ (double)fontSizeMultiplierForCurrentLanguage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(&unk_1E1A93770, "containsObject:", v7);

  if ((_DWORD)v4)
    v8 = 0.9;
  else
    v8 = 1.0;

  return v8;
}

- (BOOL)willCoverKeyboardLayout
{
  return 0;
}

- (BOOL)allowsPullDownGesture
{
  return 0;
}

- (CGSize)preferredInlineFloatingViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 588.0;
  v3 = 41.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)highlightedBackgroundColor
{
  if (-[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"))
    +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
  else
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBLightCandidateBarCellPressedBackgroundUseKeyboardBackground")));
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (int)inlineFloatingViewAdjustMode
{
  return 0;
}

- (BOOL)darkKeyboard
{
  return self->_darkKeyboard;
}

- (BOOL)shouldAlwaysShowSortControl
{
  return self->_shouldAlwaysShowSortControl;
}

- (BOOL)shouldUsePredictionViewSecureRenderTraits
{
  return self->_shouldUsePredictionViewSecureRenderTraits;
}

@end
