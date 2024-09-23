@implementation UIKeyboardCandidateViewConfigurationPadSplitBarJapanese

- (id)extendedState
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCandidateViewConfigurationPadSplitBarJapanese;
  -[UIKeyboardCandidateViewConfigurationPadSplitBar extendedState](&v5, sel_extendedState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColumnsCount:", 3);

  return v2;
}

@end
