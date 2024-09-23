@implementation SBFTouchPassThroughClippingView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFTouchPassThroughClippingView;
  -[SBFTouchPassThroughClippingView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBFTouchPassThroughClippingView _layoutContentClippingView](self, "_layoutContentClippingView");
}

- (void)_layoutContentClippingView
{
  CGRect *p_contentClippingFrame;
  double v4;
  double x;
  double v6;
  double y;
  double v8;
  double width;
  double v10;
  double height;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (self->_contentClippingEnabled
    && (p_contentClippingFrame = &self->_contentClippingFrame, !CGRectIsNull(self->_contentClippingFrame)))
  {
    x = p_contentClippingFrame->origin.x;
    y = self->_contentClippingFrame.origin.y;
    v12 = 1;
    width = self->_contentClippingFrame.size.width;
    height = self->_contentClippingFrame.size.height;
  }
  else
  {
    -[SBFTouchPassThroughClippingView bounds](self, "bounds");
    x = v4;
    y = v6;
    width = v8;
    height = v10;
    v12 = 0;
  }
  BSRectGetCenter();
  v14 = v13;
  v16 = v15;
  -[_SBFActualClippingView setBounds:](self->_contentClippingView, "setBounds:", x, y, width, height);
  -[_SBFActualClippingView setCenter:](self->_contentClippingView, "setCenter:", v14, v16);
  -[_SBFActualClippingView _setContinuousCornerRadius:](self->_contentClippingView, "_setContinuousCornerRadius:", self->_contentCornerRadius);
  -[_SBFActualClippingView setClipsToBounds:](self->_contentClippingView, "setClipsToBounds:", v12);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFTouchPassThroughClippingView;
  -[SBFTouchPassThroughClippingView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentCornerRadius = a3;
    -[SBFTouchPassThroughClippingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentClippingEnabled:(BOOL)a3
{
  if (self->_contentClippingEnabled != a3)
  {
    self->_contentClippingEnabled = a3;
    -[SBFTouchPassThroughClippingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isContentClippingEnabled
{
  return self->_contentClippingEnabled;
}

- (void)setContentClippingFrame:(CGRect)a3 cornerRadii:(UIRectCornerRadii)a4
{
  double var0;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t i;
  CGRect *p_contentClippingFrame;
  _BYTE v12[8];
  double var3;
  double var1;
  double var2;
  uint64_t v16;

  var0 = a4.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = *MEMORY[0x1E0C80C00];
  var3 = a4.var3;
  var1 = a4.var1;
  var2 = a4.var2;
  for (i = 8; i != 32; i += 8)
  {
    if (var0 < *(double *)&v12[i])
      var0 = *(double *)&v12[i];
  }
  p_contentClippingFrame = &self->_contentClippingFrame;
  if (!CGRectEqualToRect(self->_contentClippingFrame, a3) || (BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentCornerRadius = var0;
    p_contentClippingFrame->origin.x = x;
    self->_contentClippingFrame.origin.y = y;
    self->_contentClippingFrame.size.width = width;
    self->_contentClippingFrame.size.height = height;
    -[SBFTouchPassThroughClippingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)hitTestsSubviewsOutsideBounds
{
  return self->_hitTestsSubviewsOutsideBounds;
}

- (void)bringSubviewToFront:(id)a3
{
  objc_super v3;

  if (self->_contentClippingView == a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView bringSubviewToFront:](&v3, sel_bringSubviewToFront_);
  }
  else
  {
    -[_SBFActualClippingView bringSubviewToFront:](self->_contentClippingView, "bringSubviewToFront:");
  }
}

- (void)setHitTestsSubviewsOutsideBounds:(BOOL)a3
{
  self->_hitTestsSubviewsOutsideBounds = a3;
  -[_SBFActualClippingView setHitTestsSubviewsOutsideBounds:](self->_contentClippingView, "setHitTestsSubviewsOutsideBounds:");
}

- (SBFTouchPassThroughClippingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  SBFTouchPassThroughClippingView *v8;
  __int128 v9;
  _SBFActualClippingView *v10;
  _SBFActualClippingView *contentClippingView;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SBFTouchPassThroughClippingView;
  v7 = -[SBFTouchPassThroughClippingView initWithFrame:](&v13, sel_initWithFrame_);
  v8 = (SBFTouchPassThroughClippingView *)v7;
  if (v7)
  {
    v9 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v7 + 440) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v7 + 456) = v9;
    v10 = -[_SBFActualClippingView initWithFrame:]([_SBFActualClippingView alloc], "initWithFrame:", x, y, width, height);
    contentClippingView = v8->_contentClippingView;
    v8->_contentClippingView = v10;

    -[SBFTouchPassThroughClippingView addSubview:](v8, "addSubview:", v8->_contentClippingView);
    -[SBFTouchPassThroughClippingView setContentClippingEnabled:](v8, "setContentClippingEnabled:", 1);
  }
  return v8;
}

- (CGRect)contentClippingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentClippingFrame.origin.x;
  y = self->_contentClippingFrame.origin.y;
  width = self->_contentClippingFrame.size.width;
  height = self->_contentClippingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFTouchPassThroughClippingView;
  v4 = a3;
  -[SBFTouchPassThroughClippingView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[_SBFActualClippingView setBackgroundColor:](self->_contentClippingView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);

}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBFTouchPassThroughClippingView;
  -[SBFTouchPassThroughClippingView setOpaque:](&v5, sel_setOpaque_);
  -[_SBFActualClippingView setOpaque:](self->_contentClippingView, "setOpaque:", v3);
}

- (void)addSubview:(id)a3
{
  objc_super v3;

  if (self->_contentClippingView == a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView addSubview:](&v3, sel_addSubview_);
  }
  else
  {
    -[_SBFActualClippingView addSubview:](self->_contentClippingView, "addSubview:");
  }
}

- (void)insertSubview:(id)a3 atIndex:(int64_t)a4
{
  objc_super v4;

  if (self->_contentClippingView == a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView insertSubview:atIndex:](&v4, sel_insertSubview_atIndex_);
  }
  else
  {
    -[_SBFActualClippingView insertSubview:atIndex:](self->_contentClippingView, "insertSubview:atIndex:");
  }
}

- (void)insertSubview:(id)a3 belowSubview:(id)a4
{
  _SBFActualClippingView *contentClippingView;
  objc_super v6;

  contentClippingView = self->_contentClippingView;
  if (contentClippingView == a3 || contentClippingView == a4)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView insertSubview:belowSubview:](&v6, sel_insertSubview_belowSubview_);
  }
  else
  {
    -[_SBFActualClippingView insertSubview:belowSubview:](self->_contentClippingView, "insertSubview:belowSubview:");
  }
}

- (void)insertSubview:(id)a3 aboveSubview:(id)a4
{
  _SBFActualClippingView *contentClippingView;
  objc_super v6;

  contentClippingView = self->_contentClippingView;
  if (contentClippingView == a3 || contentClippingView == a4)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView insertSubview:aboveSubview:](&v6, sel_insertSubview_aboveSubview_);
  }
  else
  {
    -[_SBFActualClippingView insertSubview:aboveSubview:](self->_contentClippingView, "insertSubview:aboveSubview:");
  }
}

- (void)sendSubviewToBack:(id)a3
{
  objc_super v3;

  if (self->_contentClippingView == a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)SBFTouchPassThroughClippingView;
    -[SBFTouchPassThroughClippingView sendSubviewToBack:](&v3, sel_sendSubviewToBack_);
  }
  else
  {
    -[_SBFActualClippingView sendSubviewToBack:](self->_contentClippingView, "sendSubviewToBack:");
  }
}

- (void)setContentClippingFrame:(CGRect)a3
{
  self->_contentClippingFrame = a3;
}

- (double)contentCornerRadius
{
  return self->_contentCornerRadius;
}

- (void)setContentCornerRadius:(double)a3
{
  self->_contentCornerRadius = a3;
}

- (_SBFActualClippingView)contentClippingView
{
  return self->_contentClippingView;
}

- (void)setContentClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_contentClippingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentClippingView, 0);
}

@end
