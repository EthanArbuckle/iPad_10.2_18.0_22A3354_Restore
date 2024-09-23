@implementation UIKeyboardCandidateViewConfigurationTenKey

- (id)initialState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  __CFString **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)UIKeyboardCandidateViewConfigurationTenKey;
  -[UIKeyboardCandidateViewConfiguration initialState](&v20, sel_initialState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortControlPosition:", 4);
  objc_msgSend(v3, "setPrimaryGridRowType:", 1);
  objc_msgSend(v3, "setDisambiguationGridRowType:", 1);
  objc_msgSend(v3, "setDisambiguationGridPosition:", 1);
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortControlBackgroundColor:", v4);

  if (-[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"))
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorWhite_Alpha30")));
  else
    +[UIColor whiteColor](UIColor, "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGridBackgroundColor:", v6);

  if (-[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"))
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorWhite_Alpha30")));
  else
    +[UIColor whiteColor](UIColor, "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disambiguationStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGridBackgroundColor:", v8);

  v10 = -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard");
  v11 = UIKBColorWhite_Alpha60;
  if (!v10)
    v11 = UIKBCandidateBarCellSecondaryCandidateText;
  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(*v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disambiguationStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

  if (-[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"))
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disambiguationStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHighlightedTextColor:", v14);

  objc_msgSend(v3, "disambiguationStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHighlightedCellBackgroundImage:", 0);

  objc_msgSend(v3, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFillGridWithLines:", 1);

  objc_msgSend(v3, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMaxNumberOfProactiveCells:", 1);

  return v3;
}

- (unint64_t)maxNumberOfProactiveCandidates
{
  return 4;
}

@end
