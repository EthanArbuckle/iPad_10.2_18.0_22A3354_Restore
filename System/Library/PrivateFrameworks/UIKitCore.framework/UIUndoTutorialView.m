@implementation UIUndoTutorialView

- (UIUndoTutorialView)initWithKeyboardAppearance:(int64_t)a3
{
  UIUndoTutorialView *v3;
  UIUndoTutorialView *v4;
  UIUndoTutorialView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIUndoTutorialView;
  v3 = -[UIKBTutorialModalDisplay initWithKeyboardAppearance:](&v7, sel_initWithKeyboardAppearance_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (id)largeTitle
{
  return _UILocalizedStringInSystemLanguage(CFSTR("Productivity Gestures"), CFSTR("Productivity Gestures"));
}

- (BOOL)presentsFullScreen
{
  return 1;
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIUndoTutorialView;
  -[UIKBEditingGesturesIntroduction updateConstraints](&v4, sel_updateConstraints);
  -[UIKBEditingGesturesIntroduction topPaddingConstraint](self, "topPaddingConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", 0.0);

}

@end
