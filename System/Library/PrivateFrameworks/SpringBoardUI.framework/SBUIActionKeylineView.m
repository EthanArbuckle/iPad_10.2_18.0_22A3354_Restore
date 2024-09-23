@implementation SBUIActionKeylineView

- (SBUIActionKeylineView)init
{
  SBUIActionKeylineView *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIActionKeylineView;
  result = -[SBUIActionKeylineView init](&v3, sel_init);
  if (result)
    result->_height = 1.0;
  return result;
}

- (void)setHeight:(double)a3
{
  if (vabdd_f64(a3, self->_height) > 2.22044605e-16)
  {
    self->_height = a3;
    -[SBUIActionKeylineView _updateCornerMask](self, "_updateCornerMask");
    -[SBUIActionKeylineView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (double)heightInPixels
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[SBUIActionKeylineView height](self, "height");
  v4 = v3;
  -[SBUIActionKeylineView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v4 * (1.0 / v6);

  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIActionKeylineView;
  -[SBUIActionKeylineView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBUIActionKeylineView _updateVisualStylingIfNecessary](self, "_updateVisualStylingIfNecessary");
}

- (void)willMoveToSuperview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIActionKeylineView;
  -[SBUIActionKeylineView willMoveToSuperview:](&v4, sel_willMoveToSuperview_, a3);
  -[SBUIActionKeylineView _invalidateVisualStyling](self, "_invalidateVisualStyling");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v2 = *MEMORY[0x24BDF7FB8];
  -[SBUIActionKeylineView heightInPixels](self, "heightInPixels");
  v4 = v3;
  v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)_invalidateVisualStyling
{
  MTVisualStylingProvider *visualStylingProvider;

  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_visualStylingProvider, "stopAutomaticallyUpdatingView:", self);
  visualStylingProvider = self->_visualStylingProvider;
  self->_visualStylingProvider = 0;

  -[SBUIActionKeylineView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateVisualStylingIfNecessary
{
  MTVisualStylingProvider *v3;
  MTVisualStylingProvider *visualStylingProvider;

  if (!self->_visualStylingProvider)
  {
    -[SBUIActionKeylineView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 2);
    v3 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    visualStylingProvider = self->_visualStylingProvider;
    self->_visualStylingProvider = v3;

    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self, 5);
  }
}

- (void)_updateCornerMask
{
  double v3;
  double v4;
  BOOL v5;
  double v6;
  id v7;

  -[SBUIActionKeylineView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaskedCorners:", 5);
  -[SBUIActionKeylineView heightInPixels](self, "heightInPixels");
  v4 = v3 * 0.5;
  v5 = v3 < 1.0;
  v6 = 0.0;
  if (!v5)
    v6 = v4;
  -[SBUIActionKeylineView _setCornerRadius:](self, "_setCornerRadius:", v6);

}

- (double)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end
