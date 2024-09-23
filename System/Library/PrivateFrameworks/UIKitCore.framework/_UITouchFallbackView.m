@implementation _UITouchFallbackView

- (_UITouchFallbackView)initWithFrame:(CGRect)a3
{
  _UITouchFallbackView *v3;
  _UITouchFallbackView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITouchFallbackView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

    -[UIView _setDisableDictationTouchCancellation:](v4, "_setDisableDictationTouchCancellation:", 1);
  }
  return v4;
}

- (int)textEffectsVisibilityLevel
{
  return 6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UITouchFallbackView;
  -[UIView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITouchFallbackView delegate](self, "delegate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        -[_UITouchFallbackView delegate](self, "delegate"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "touchFallbackView:shouldHitTestAtLocation:withEvent:", self, v7, x, y),
        v11,
        v10,
        !v12))
  {
    v13 = 0;
  }
  else
  {
    v13 = v8;
  }

  return v13;
}

- (_UITouchFallbackViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UITouchFallbackViewDelegate *)a3;
}

@end
