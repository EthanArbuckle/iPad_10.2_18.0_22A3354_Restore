@implementation STUIStatusBarPillView

- (void)setSubviewForBaselineAlignment:(id)a3
{
  objc_storeWeak((id *)&self->_subviewForBaselineAlignment, a3);
}

- (STUIStatusBarPillView)initWithFrame:(CGRect)a3
{
  STUIStatusBarPillView *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *visualEffectView;
  uint64_t v6;
  CALayer *pulseLayer;
  id v8;
  double v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarPillView;
  v3 = -[STUIStatusBarRoundedCornerView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
  visualEffectView = v3->_visualEffectView;
  v3->_visualEffectView = v4;

  -[UIVisualEffectView setHidden:](v3->_visualEffectView, "setHidden:", 1);
  -[STUIStatusBarPillView addSubview:](v3, "addSubview:", v3->_visualEffectView);
  v3->_pulsing = 1;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v6 = objc_claimAutoreleasedReturnValue();
  pulseLayer = v3->_pulseLayer;
  v3->_pulseLayer = (CALayer *)v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0980392157, 0.18);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v3->_pulseLayer, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

  LODWORD(v9) = 0;
  -[CALayer setOpacity:](v3->_pulseLayer, "setOpacity:", v9);
  -[STUIStatusBarPillView layer](v3, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSublayer:", v3->_pulseLayer);

  -[STUIStatusBarPillView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarPersistentAnimationView setPersistentAnimations:](v3, "setPersistentAnimations:", v11);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_pulseLayer, 0);
  objc_destroyWeak((id *)&self->_subviewForBaselineAlignment);
  objc_storeStrong((id *)&self->_pillColor, 0);
  objc_storeStrong((id *)&self->_visualEffect, 0);
}

- (void)setPillColor:(id)a3
{
  objc_storeStrong((id *)&self->_pillColor, a3);
  -[STUIStatusBarPillView _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)resumePersistentAnimation
{
  void *v3;
  double v4;
  id v5;
  CAFrameRateRange v6;

  -[STUIStatusBarPillView setNeedsLayout](self, "setNeedsLayout");
  if (self->_pulsing)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDuration:", 1.0);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimingFunction:", v3);

    objc_msgSend(v5, "setToValue:", &unk_1E8D805C0);
    LODWORD(v4) = 2139095040;
    objc_msgSend(v5, "setRepeatCount:", v4);
    objc_msgSend(v5, "setAutoreverses:", 1);
    objc_msgSend(v5, "setDiscretizesTime:", 1);
    v6 = CAFrameRateRangeMake(10.0, 120.0, 20.0);
    objc_msgSend(v5, "setPreferredFrameRateRange:", *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
    -[CALayer addAnimation:forKey:](self->_pulseLayer, "addAnimation:forKey:", v5, CFSTR("pulse"));

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CALayer *pulseLayer;
  UIVisualEffectView *visualEffectView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarPillView;
  -[STUIStatusBarRoundedCornerView layoutSubviews](&v14, sel_layoutSubviews);
  -[STUIStatusBarPillView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  pulseLayer = self->_pulseLayer;
  if (pulseLayer)
    -[CALayer setFrame:](pulseLayer, "setFrame:", v5, v7, v9, v11);
  visualEffectView = self->_visualEffectView;
  if (visualEffectView)
    -[UIVisualEffectView setFrame:](visualEffectView, "setFrame:", v5, v7, v9, v11);
}

- (void)setVisualEffect:(id)a3
{
  UIVisualEffect *v5;

  v5 = (UIVisualEffect *)a3;
  if (self->_visualEffect != v5)
  {
    objc_storeStrong((id *)&self->_visualEffect, a3);
    -[UIVisualEffectView setEffect:](self->_visualEffectView, "setEffect:", v5);
    -[UIVisualEffectView setHidden:](self->_visualEffectView, "setHidden:", v5 == 0);
  }

}

- (void)setPulsing:(BOOL)a3
{
  if (self->_pulsing != a3)
  {
    self->_pulsing = a3;
    if (a3)
      -[STUIStatusBarPillView resumePersistentAnimation](self, "resumePersistentAnimation");
    else
      -[CALayer removeAllAnimations](self->_pulseLayer, "removeAllAnimations");
  }
}

- (BOOL)canBecomeFocused
{
  void *v2;
  BOOL v3;

  -[STUIStatusBarPillView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 3;

  return v3;
}

- (BOOL)isUserInteractionEnabled
{
  void *v2;
  BOOL v3;

  -[STUIStatusBarPillView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 3;

  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarPillView;
  -[STUIStatusBarPillView didUpdateFocusInContext:withAnimationCoordinator:](&v5, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  -[STUIStatusBarPillView _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)_updateBackgroundColor
{
  void *v3;
  int v4;
  uint64_t v5;
  id v6;

  -[STUIStatusBarPillView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") != 3)
  {

    goto LABEL_5;
  }
  v4 = -[STUIStatusBarPillView isFocused](self, "isFocused");

  if (!v4)
  {
LABEL_5:
    -[STUIStatusBarPillView pillColor](self, "pillColor");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusColor");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = (id)v5;
  -[STUIStatusBarPillView setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[STUIStatusBarPillView subviews](self, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "applyStyleAttributes:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
}

- (BOOL)pulsing
{
  return self->_pulsing;
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (UIColor)pillColor
{
  return self->_pillColor;
}

- (UIView)subviewForBaselineAlignment
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_subviewForBaselineAlignment);
}

- (CALayer)pulseLayer
{
  return self->_pulseLayer;
}

- (void)setPulseLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pulseLayer, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

@end
