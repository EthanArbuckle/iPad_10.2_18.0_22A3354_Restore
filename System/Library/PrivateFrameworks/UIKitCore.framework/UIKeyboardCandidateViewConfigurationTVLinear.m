@implementation UIKeyboardCandidateViewConfigurationTVLinear

- (id)initialState
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardCandidateViewConfigurationTVLinear;
  -[UIKeyboardCandidateViewConfiguration initialState](&v6, sel_initialState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardCandidateViewStyle tvLinearStyleForDarkKeyboard:](UIKeyboardCandidateViewStyle, "tvLinearStyleForDarkKeyboard:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStyle:", v4);

  return v3;
}

@end
