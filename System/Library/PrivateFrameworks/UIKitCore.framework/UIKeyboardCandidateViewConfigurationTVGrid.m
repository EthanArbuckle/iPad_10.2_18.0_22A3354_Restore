@implementation UIKeyboardCandidateViewConfigurationTVGrid

- (id)initialState
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardCandidateViewConfigurationTVGrid;
  -[UIKeyboardCandidateViewConfiguration initialState](&v7, sel_initialState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryGridRowType:", 1);
  +[UIKeyboardCandidateViewStyle tvGridStyleForDarkKeyboard:](UIKeyboardCandidateViewStyle, "tvGridStyleForDarkKeyboard:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStyle:", v4);

  objc_msgSend(v3, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollDisabled:", 1);

  return v3;
}

- (id)extendedState
{
  void *v2;
  void *v3;

  -[UIKeyboardCandidateViewConfigurationTVGrid initialState](self, "initialState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPrimaryGridRowType:", 1);
  objc_msgSend(v2, "setAdditionalHeight:", 535.0);
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrollDisabled:", 0);

  return v2;
}

@end
