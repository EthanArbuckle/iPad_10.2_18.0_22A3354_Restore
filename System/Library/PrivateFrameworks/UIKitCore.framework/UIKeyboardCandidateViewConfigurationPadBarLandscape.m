@implementation UIKeyboardCandidateViewConfigurationPadBarLandscape

- (id)initialState
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCandidateViewConfigurationPadBarLandscape;
  -[UIKeyboardCandidateViewConfigurationPadBar initialState](&v5, sel_initialState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaxNumberOfProactiveCells:", 3);

  return v2;
}

- (id)extendedState
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCandidateViewConfigurationPadBarLandscape;
  -[UIKeyboardCandidateViewConfigurationPadBar extendedState](&v5, sel_extendedState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColumnsCount:", 19);

  return v2;
}

- (unint64_t)maxNumberOfProactiveCandidates
{
  return 3;
}

@end
