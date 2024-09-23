@implementation _UILabelContentLayer

- (void)display
{
  void *v3;
  void *v4;
  objc_super v5;

  -[_UILabelContentLayer superlayer](self, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layerWillDraw:", v3);

  v5.receiver = self;
  v5.super_class = (Class)_UILabelContentLayer;
  -[_UILabelContentLayer display](&v5, sel_display);

}

- (id)actionForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (self->_wantsAnimation)
  {
    -[_UILabelContentLayer superlayer](self, "superlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")&& objc_msgSend(v6, "_shouldAnimatePropertyWithKey:", v4))
    {
      +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "actionForLayer:forKey:forView:", self, v4, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 && +[UIView _isAnimationTracking](UIView, "_isAnimationTracking"))
      {
        +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_trackAnimation:withAnimationKey:forKeyPath:inLayer:", v8, v4, v4, self);

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  -[_UILabelContentLayer superlayer](self, "superlayer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[_UILabelContentLayer frame](self, "frame");
  v6 = v5;
  v8 = v7;
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, -v6, -v8);
  objc_msgSend(v11, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "drawInContext:", a3);

  CGContextRestoreGState(a3);
}

- (BOOL)wantsAnimation
{
  return self->_wantsAnimation;
}

- (void)setWantsAnimation:(BOOL)a3
{
  self->_wantsAnimation = a3;
}

@end
