@implementation _TVRMAlertButton

- (void)layoutSubviews
{
  UIView *burnView;
  UIView *plusDView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVRMAlertButton;
  -[_TVRMAlertButton layoutSubviews](&v5, sel_layoutSubviews);
  -[_TVRMAlertButton insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_burnView, 0);
  -[_TVRMAlertButton insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_plusDView, 1);
  burnView = self->_burnView;
  -[_TVRMAlertButton bounds](self, "bounds");
  -[UIView setFrame:](burnView, "setFrame:");
  plusDView = self->_plusDView;
  -[_TVRMAlertButton bounds](self, "bounds");
  -[UIView setFrame:](plusDView, "setFrame:");
  -[UIView setHidden:](self->_burnView, "setHidden:", !self->_showingBackgroundEffect);
  -[UIView setHidden:](self->_plusDView, "setHidden:", !self->_showingBackgroundEffect);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVRMAlertButton;
  -[_TVRMAlertButton touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[_TVRMAlertButton setShowingBackgroundEffect:](self, "setShowingBackgroundEffect:", 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TVRMAlertButton;
  v6 = a4;
  v7 = a3;
  -[_TVRMAlertButton touchesMoved:withEvent:](&v10, sel_touchesMoved_withEvent_, v7, v6);
  objc_msgSend(v7, "anyObject", v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "locationInView:", self);
  v9 = -[_TVRMAlertButton pointInside:withEvent:](self, "pointInside:withEvent:", v6);

  -[_TVRMAlertButton setShowingBackgroundEffect:](self, "setShowingBackgroundEffect:", v9);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVRMAlertButton;
  -[_TVRMAlertButton touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[_TVRMAlertButton setShowingBackgroundEffect:](self, "setShowingBackgroundEffect:", 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVRMAlertButton;
  -[_TVRMAlertButton touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[_TVRMAlertButton setShowingBackgroundEffect:](self, "setShowingBackgroundEffect:", 0);
}

- (void)setShowingBackgroundEffect:(BOOL)a3
{
  if (self->_showingBackgroundEffect != a3)
  {
    self->_showingBackgroundEffect = a3;
    -[_TVRMAlertButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)showingBackgroundEffect
{
  return self->_showingBackgroundEffect;
}

- (UIView)burnView
{
  return self->_burnView;
}

- (void)setBurnView:(id)a3
{
  objc_storeStrong((id *)&self->_burnView, a3);
}

- (UIView)plusDView
{
  return self->_plusDView;
}

- (void)setPlusDView:(id)a3
{
  objc_storeStrong((id *)&self->_plusDView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusDView, 0);
  objc_storeStrong((id *)&self->_burnView, 0);
}

@end
