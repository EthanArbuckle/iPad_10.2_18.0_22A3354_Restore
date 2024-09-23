@implementation UIKeyboardCandidateViewConfigurationTenKeyCarPlay

- (id)initialState
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  const __CTFont *v9;
  CTFontRef CopyWithSymbolicTraits;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  __CFString **v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)UIKeyboardCandidateViewConfigurationTenKeyCarPlay;
  -[UIKeyboardCandidateViewConfigurationTenKey initialState](&v25, sel_initialState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortControlPosition:", 0);
  objc_msgSend(v3, "setDisambiguationGridPosition:", 0);
  -[UIKeyboardCandidateViewConfiguration candidateDefaultFontSize](self, "candidateDefaultFontSize");
  v5 = round(v4 * 0.8);
  -[UIKeyboardCandidateViewConfiguration candidateFontWithSize:](self, "candidateFontWithSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCandidateFont:", v6);

  objc_msgSend(v3, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "candidateFont");
  v9 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(v9, 0.0, 0, 2u, 2u);
  objc_msgSend(v3, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSupplementalLexiconCandidateFont:", CopyWithSymbolicTraits);

  -[UIKeyboardCandidateViewConfiguration candidateFontWithSize:](self, "candidateFontWithSize:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlternativeTextFont:", v12);

  +[UIColor clearColor](UIColor, "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setGridBackgroundColor:", v14);

  if (-[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"))
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorCarDarkDivider")));
  else
    +[UIColor whiteColor](UIColor, "whiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLineColor:", v16);

  v18 = -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard");
  v19 = UIKBColorCarTeal;
  if (!v18)
    v19 = UIKBColorKeyBlueKeyBackground;
  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(*v19));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHighlightedBackgroundColor:", v20);

  if (-[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"))
    +[UIColor darkTextColor](UIColor, "darkTextColor");
  else
    +[UIColor whiteColor](UIColor, "whiteColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHighlightedTextColor:", v22);

  return v3;
}

@end
