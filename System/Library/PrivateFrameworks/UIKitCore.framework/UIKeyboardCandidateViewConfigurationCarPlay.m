@implementation UIKeyboardCandidateViewConfigurationCarPlay

- (id)initialState
{
  void *v3;
  _BOOL4 v4;
  __CFString **v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardCandidateViewConfigurationCarPlay;
  -[UIKeyboardCandidateViewConfigurationTenKeyCarPlay initialState](&v9, sel_initialState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryGridRowType:", 0);
  v4 = -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard");
  v5 = UIKBColorWhite_Alpha15;
  if (!v4)
    v5 = UIKBColorBlack_Alpha18;
  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(*v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  return v3;
}

@end
