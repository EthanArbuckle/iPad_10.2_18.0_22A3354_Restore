@implementation PREditingVariationSlider

+ (double)defaultHeight
{
  return 34.0;
}

+ (double)defaultTrackHeight
{
  double v2;

  objc_msgSend(a1, "defaultHeight");
  return v2 * 0.444444444;
}

- (PREditingVariationSlider)initWithStyleCoordinator:(id)a3 contextIdentifier:(id)a4
{
  id v7;
  id v8;
  PREditingVariationSlider *v9;
  PREditingVariationSlider *v10;
  uint64_t v11;
  UIPanGestureRecognizer *panGesture;
  void *v13;
  int v14;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PREditingVariationSlider;
  v9 = -[PREditingVariationSlider initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_styleCoordinator, a3);
    objc_storeStrong((id *)&v10->_contextIdentifier, a4);
    -[PREditingVariationSlider _setupThumbView](v10, "_setupThumbView");
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v10, sel_thumbViewDidPan_);
    panGesture = v10->_panGesture;
    v10->_panGesture = (UIPanGestureRecognizer *)v11;

    -[UIView addGestureRecognizer:](v10->_thumbContainerView, "addGestureRecognizer:", v10->_panGesture);
    -[PREditingVariationSlider addSubview:](v10, "addSubview:", v10->_thumbContainerView);
    -[PREditingVariationSlider setClipsToBounds:](v10, "setClipsToBounds:", 0);
    -[PREditingVariationSlider updateTrack](v10, "updateTrack");
    objc_msgSend(v7, "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "allowsVariation");

    if (v14)
    {
      objc_msgSend(v7, "style");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "variation");
      -[PREditingVariationSlider _setSliderValue:](v10, "_setSliderValue:");

    }
  }

  return v10;
}

- (void)_setupThumbView
{
  UIView *v3;
  UIView *thumbContainerView;
  UIView *v5;
  void *v6;
  double v7;
  CALayer *v8;
  CALayer *thumbSoftShadowLayer;
  double v10;
  void *v11;
  CALayer *v12;
  CALayer *thumbContentLayer;
  void *v14;
  CAShapeLayer *v15;
  CAShapeLayer *thumbBorderLayer;
  CAShapeLayer *v17;
  id v18;
  CAShapeLayer *v19;
  id v20;
  void *v21;
  id v22;

  if (!self->_thumbContainerView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    thumbContainerView = self->_thumbContainerView;
    self->_thumbContainerView = v3;

    v5 = self->_thumbContainerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[UIView setContentMode:](self->_thumbContainerView, "setContentMode:", 2);
    -[UIView setClipsToBounds:](self->_thumbContainerView, "setClipsToBounds:", 0);
    -[UIView layer](self->_thumbContainerView, "layer");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1042536202;
    objc_msgSend(v22, "setShadowOpacity:", v7);
    objc_msgSend(v22, "setShadowOffset:", 1.0, 5.5);
    objc_msgSend(v22, "setShadowRadius:", 3.5);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v8 = (CALayer *)objc_claimAutoreleasedReturnValue();
    thumbSoftShadowLayer = self->_thumbSoftShadowLayer;
    self->_thumbSoftShadowLayer = v8;

    LODWORD(v10) = 1042536202;
    -[CALayer setShadowOpacity:](self->_thumbSoftShadowLayer, "setShadowOpacity:", v10);
    -[CALayer setShadowOffset:](self->_thumbSoftShadowLayer, "setShadowOffset:", 0.0, 0.0);
    -[CALayer setShadowRadius:](self->_thumbSoftShadowLayer, "setShadowRadius:", 6.5);
    -[UIView layer](self->_thumbContainerView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", self->_thumbSoftShadowLayer);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v12 = (CALayer *)objc_claimAutoreleasedReturnValue();
    thumbContentLayer = self->_thumbContentLayer;
    self->_thumbContentLayer = v12;

    -[UIView layer](self->_thumbContainerView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", self->_thumbContentLayer);

    v15 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    thumbBorderLayer = self->_thumbBorderLayer;
    self->_thumbBorderLayer = v15;

    v17 = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v17, "setFillColor:", objc_msgSend(v18, "CGColor"));

    v19 = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v19, "setStrokeColor:", objc_msgSend(v20, "CGColor"));

    -[CAShapeLayer setLineWidth:](self->_thumbBorderLayer, "setLineWidth:", 2.0);
    -[UIView layer](self->_thumbContainerView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSublayer:", self->_thumbBorderLayer);

    -[PREditingVariationSlider updateThumbContentView](self, "updateThumbContentView");
  }
}

- (void)updateTrack
{
  uint64_t v3;
  UIView **p_trackView;
  UIView *trackView;
  UIView *v6;
  id obj;

  -[PREditingPosterContentStyleCoordinator variationSliderTrackView](self->_styleCoordinator, "variationSliderTrackView");
  v3 = objc_claimAutoreleasedReturnValue();
  p_trackView = &self->_trackView;
  trackView = self->_trackView;
  obj = (id)v3;
  if ((UIView *)v3 != trackView)
  {
    -[UIView removeFromSuperview](trackView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_trackView, obj);
    -[PREditingVariationSlider insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_trackView, 0);
    -[UIView setAutoresizingMask:](*p_trackView, "setAutoresizingMask:", 18);
    v6 = *p_trackView;
    -[PREditingVariationSlider bounds](self, "bounds");
    -[UIView setFrame:](v6, "setFrame:");
  }

}

- (void)updateThumbContentView
{
  uint64_t v3;
  UIView **p_thumbContentView;
  UIView *thumbContentView;
  CAShapeLayer *v6;
  CAShapeLayer *thumbClippingLayer;
  void *v8;
  id obj;

  -[PREditingPosterContentStyleCoordinator variationSliderThumbView](self->_styleCoordinator, "variationSliderThumbView");
  v3 = objc_claimAutoreleasedReturnValue();
  p_thumbContentView = &self->_thumbContentView;
  thumbContentView = self->_thumbContentView;
  obj = (id)v3;
  if ((UIView *)v3 != thumbContentView)
  {
    -[UIView removeFromSuperview](thumbContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_thumbContentView, obj);
    -[UIView setUserInteractionEnabled:](*p_thumbContentView, "setUserInteractionEnabled:", 0);
    -[UIView setContentMode:](*p_thumbContentView, "setContentMode:", 2);
    -[UIView setClipsToBounds:](*p_thumbContentView, "setClipsToBounds:", 0);
    -[UIView addSubview:](self->_thumbContainerView, "addSubview:", *p_thumbContentView);
  }
  if (!self->_thumbClippingLayer)
  {
    v6 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    thumbClippingLayer = self->_thumbClippingLayer;
    self->_thumbClippingLayer = v6;

    -[CAShapeLayer setFillRule:](self->_thumbClippingLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  }
  -[UIView layer](*p_thumbContentView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMask:", self->_thumbClippingLayer);

}

- (void)layoutThumbView
{
  double v3;
  double v4;
  double v5;

  -[PREditingVariationSlider bounds](self, "bounds");
  v4 = v3;
  -[PREditingVariationSlider bounds](self, "bounds");
  -[UIView setFrame:](self->_thumbContainerView, "setFrame:", (v5 - v4) * 0.5 + self->_value * ((v5 - v4) * 0.5), 0.0, v4, v4);
}

- (void)layoutSubviews
{
  UIView *thumbContentView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CAShapeLayer *thumbClippingLayer;
  CAShapeLayer *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double x;
  double y;
  double width;
  double height;
  CAShapeLayer *thumbBorderLayer;
  id v38;
  CAShapeLayer *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  objc_super v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v46.receiver = self;
  v46.super_class = (Class)PREditingVariationSlider;
  -[PREditingVariationSlider layoutSubviews](&v46, sel_layoutSubviews);
  thumbContentView = self->_thumbContentView;
  -[UIView bounds](self->_thumbContainerView, "bounds");
  -[UIView setFrame:](thumbContentView, "setFrame:");
  -[PREditingVariationSlider layoutThumbView](self, "layoutThumbView");
  -[CAShapeLayer frame](self->_thumbClippingLayer, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView bounds](self->_thumbContentView, "bounds");
  v52.origin.x = v12;
  v52.origin.y = v13;
  v52.size.width = v14;
  v52.size.height = v15;
  v47.origin.x = v5;
  v47.origin.y = v7;
  v47.size.width = v9;
  v47.size.height = v11;
  if (!CGRectEqualToRect(v47, v52))
  {
    thumbClippingLayer = self->_thumbClippingLayer;
    -[UIView bounds](self->_thumbContentView, "bounds");
    -[CAShapeLayer setFrame:](thumbClippingLayer, "setFrame:");
    v17 = self->_thumbClippingLayer;
    v18 = (void *)MEMORY[0x1E0DC3508];
    -[UIView bounds](self->_thumbContainerView, "bounds");
    v49 = CGRectInset(v48, 1.0, 1.0);
    objc_msgSend(v18, "bezierPathWithOvalInRect:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](v17, "setPath:", objc_msgSend(v19, "CGPath"));

    -[UIView layer](self->_thumbContainerView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[CAShapeLayer lineWidth](self->_thumbBorderLayer, "lineWidth");
    v30 = v29 * 0.5;
    -[CAShapeLayer lineWidth](self->_thumbBorderLayer, "lineWidth");
    v32 = v31 * 0.5;
    v50.origin.x = v22;
    v50.origin.y = v24;
    v50.size.width = v26;
    v50.size.height = v28;
    v51 = CGRectInset(v50, v30, v32);
    x = v51.origin.x;
    y = v51.origin.y;
    width = v51.size.width;
    height = v51.size.height;

    thumbBorderLayer = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", x, y, width, height);
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](thumbBorderLayer, "setPath:", objc_msgSend(v38, "CGPath"));

    v39 = self->_thumbBorderLayer;
    -[UIView layer](self->_thumbContainerView, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bounds");
    -[CAShapeLayer setFrame:](v39, "setFrame:");

    -[UIView layer](self->_thumbContainerView, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setShadowPath:", -[CAShapeLayer path](self->_thumbBorderLayer, "path"));

    -[CALayer setShadowPath:](self->_thumbSoftShadowLayer, "setShadowPath:", -[CAShapeLayer path](self->_thumbBorderLayer, "path"));
  }
  if (self->_trackView)
  {
    -[PREditingVariationSlider bounds](self, "bounds");
    v43 = v42 * 0.444444444;
    -[UIView setFrame:](self->_trackView, "setFrame:", 0.0, (v42 - v42 * 0.444444444) * 0.5);
    -[UIView _setContinuousCornerRadius:](self->_trackView, "_setContinuousCornerRadius:", v43 * 0.5);
    -[UIView layer](self->_trackView, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setBorderWidth:", 2.0);

    -[UIView layer](self->_trackView, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setBorderColor:", -[PREditingVariationSlider trackBorderColor](self, "trackBorderColor"));

  }
}

- (CGColor)trackBorderColor
{
  id v2;
  CGColor *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (CGColor *)objc_msgSend(v2, "CGColor");

  return v3;
}

- (void)setStyleCoordinator:(id)a3
{
  PREditingPosterContentStyleCoordinator *v5;
  void *v6;
  int v7;
  void *v8;
  PREditingPosterContentStyleCoordinator *v9;

  v5 = (PREditingPosterContentStyleCoordinator *)a3;
  if (v5)
  {
    v9 = v5;
    -[PREditingPosterContentStyleCoordinator style](v5, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowsVariation");

    v5 = v9;
    if (v7)
    {
      -[PREditingPosterContentStyleCoordinator style](v9, "style");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_styleCoordinator != v9)
        objc_storeStrong((id *)&self->_styleCoordinator, a3);
      -[PREditingVariationSlider updateTrack](self, "updateTrack");
      -[PREditingVariationSlider updateThumbContentView](self, "updateThumbContentView");
      objc_msgSend(v8, "variation");
      -[PREditingVariationSlider _setSliderValue:](self, "_setSliderValue:");
      -[PREditingVariationSlider setNeedsLayout](self, "setNeedsLayout");

      v5 = v9;
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CATransform3D v15;
  CATransform3D v16;

  v4 = a3;
  -[PREditingVariationSlider traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutDirection");
  v7 = objc_msgSend(v4, "layoutDirection");

  if (v6 != v7)
  {
    v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v16.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v16.m33 = v8;
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v16.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v16.m43 = v9;
    v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v16.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v16.m13 = v10;
    v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v16.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v16.m23 = v11;
    -[PREditingVariationSlider traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "layoutDirection");

    if (v13 == 1)
      CATransform3DMakeRotation(&v16, 3.14159265, 0.0, 1.0, 0.0);
    -[UIView layer](self->_trackView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16;
    objc_msgSend(v14, "setTransform:", &v15);

  }
}

- (void)thumbViewDidPan:(id)a3
{
  double v4;
  PREditingVariationSlider *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MidX;
  double v14;
  double v15;
  double v16;
  UIView *thumbContainerView;
  double v18;
  id v19;
  CGRect v20;

  v19 = a3;
  if (objc_msgSend(v19, "state") == 1)
  {
    -[UIView center](self->_thumbContainerView, "center");
    self->_startPanOffset = v4;
    -[PREditingVariationSlider bringSubviewToFront:](self, "bringSubviewToFront:", self->_thumbContainerView);
    v5 = self;
    v6 = 0x10000;
LABEL_13:
    -[PREditingVariationSlider sendActionsForControlEvents:](v5, "sendActionsForControlEvents:", v6);
    goto LABEL_14;
  }
  if (objc_msgSend(v19, "state") == 2 || objc_msgSend(v19, "state") == 3)
  {
    -[PREditingVariationSlider bounds](self, "bounds");
    v8 = v7;
    -[UIView bounds](self->_thumbContainerView, "bounds");
    v10 = v9;
    objc_msgSend(v19, "translationInView:", self);
    v12 = v11 + self->_startPanOffset;
    -[UIView bounds](self->_thumbContainerView, "bounds");
    MidX = CGRectGetMidX(v20);
    v14 = v12 >= MidX ? v12 : MidX;
    v15 = v8 - MidX;
    v16 = v14 >= v15 ? v15 : v14;
    thumbContainerView = self->_thumbContainerView;
    -[UIView center](thumbContainerView, "center");
    -[UIView setCenter:](thumbContainerView, "setCenter:", v16);
    -[UIView frame](self->_thumbContainerView, "frame");
    self->_value = v18 / (v8 - v10) - (1.0 - v18 / (v8 - v10));
    -[PREditingPosterContentStyleCoordinator setVariation:](self->_styleCoordinator, "setVariation:");
    -[PREditingVariationSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    if (objc_msgSend(v19, "state") == 3)
    {
      v5 = self;
      v6 = 0x40000;
      goto LABEL_13;
    }
  }
LABEL_14:

}

- (void)_setSliderValue:(double)a3
{
  self->_value = a3;
  -[PREditingPosterContentStyleCoordinator variation](self->_styleCoordinator, "variation");
  if ((BSFloatEqualToFloat() & 1) == 0)
    -[PREditingPosterContentStyleCoordinator setVariation:](self->_styleCoordinator, "setVariation:", a3);
  -[PREditingVariationSlider layoutThumbView](self, "layoutThumbView");
}

- (double)variation
{
  return self->_value;
}

- (void)setVariation:(double)a3
{
  self->_variation = a3;
}

- (PREditingPosterContentStyleCoordinator)styleCoordinator
{
  return self->_styleCoordinator;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contextIdentifier, a3);
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
  objc_storeStrong((id *)&self->_panGesture, a3);
}

- (double)startPanOffset
{
  return self->_startPanOffset;
}

- (void)setStartPanOffset:(double)a3
{
  self->_startPanOffset = a3;
}

- (UIView)trackView
{
  return self->_trackView;
}

- (void)setTrackView:(id)a3
{
  objc_storeStrong((id *)&self->_trackView, a3);
}

- (CAShapeLayer)thumbClippingLayer
{
  return self->_thumbClippingLayer;
}

- (void)setThumbClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbClippingLayer, a3);
}

- (CALayer)thumbContentLayer
{
  return self->_thumbContentLayer;
}

- (void)setThumbContentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbContentLayer, a3);
}

- (CALayer)thumbSoftShadowLayer
{
  return self->_thumbSoftShadowLayer;
}

- (void)setThumbSoftShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, a3);
}

- (CAShapeLayer)thumbBorderLayer
{
  return self->_thumbBorderLayer;
}

- (void)setThumbBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbBorderLayer, a3);
}

- (UIView)thumbContainerView
{
  return self->_thumbContainerView;
}

- (void)setThumbContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbContainerView, a3);
}

- (UIView)thumbContentView
{
  return self->_thumbContentView;
}

- (void)setThumbContentView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbContentView, 0);
  objc_storeStrong((id *)&self->_thumbContainerView, 0);
  objc_storeStrong((id *)&self->_thumbBorderLayer, 0);
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, 0);
  objc_storeStrong((id *)&self->_thumbContentLayer, 0);
  objc_storeStrong((id *)&self->_thumbClippingLayer, 0);
  objc_storeStrong((id *)&self->_trackView, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_styleCoordinator, 0);
}

@end
