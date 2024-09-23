@implementation UIKBFocusGuide

- (void)_didUpdateFocusToPreferredFocusedView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKBFocusGuide;
  -[UIFocusGuide _didUpdateFocusToPreferredFocusedView](&v4, sel__didUpdateFocusToPreferredFocusedView);
  -[UIKBFocusGuide keyboardDelegate](self, "keyboardDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didFocusGuideWithHeading:", -[UIKBFocusGuide focusHeading](self, "focusHeading"));

}

- (BOOL)_isUnoccludable
{
  return 1;
}

- (BOOL)_isUnclippable
{
  return 1;
}

- (float)_focusPriority
{
  return 1000.0;
}

- (BOOL)_ignoresSpeedBumpEdges
{
  return 1;
}

- (id)focusGuideRegion:(id)a3 preferredFocusEnvironmentsForMovementRequest:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKBFocusGuide;
  -[UIFocusGuide focusGuideRegion:preferredFocusEnvironmentsForMovementRequest:](&v5, sel_focusGuideRegion_preferredFocusEnvironmentsForMovementRequest_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)UIKBFocusGuide;
  -[UIFocusGuide description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, focusHeading = %u"), v4, -[UIKBFocusGuide focusHeading](self, "focusHeading"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)focusHeading
{
  return self->focusHeading;
}

- (void)setFocusHeading:(unint64_t)a3
{
  self->focusHeading = a3;
}

- (UIKBFocusGuideDelegate)keyboardDelegate
{
  return (UIKBFocusGuideDelegate *)objc_loadWeakRetained((id *)&self->_keyboardDelegate);
}

- (void)setKeyboardDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyboardDelegate);
}

@end
