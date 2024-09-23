@implementation PREditingColorSlider

- (PREditingColorSlider)initWithVariationStore:(id)a3 contextIdentifier:(id)a4 pickerContext:(unint64_t)a5
{
  id v9;
  id v10;
  PREditingColorSlider *v11;
  PREditingColorSlider *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PREditingColorSlider;
  v11 = -[PREditingColorSlider initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_variationStore, a3);
    objc_storeStrong((id *)&v12->_contextIdentifier, a4);
    v12->_pickerContext = a5;
    -[PREditingColorSlider commonInit](v12, "commonInit");
  }

  return v12;
}

- (void)commonInit
{
  id v3;
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *panGesture;
  void *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *tapGesture;

  v3 = -[PREditingColorSlider createThumbView](self, "createThumbView");
  -[PREditingColorSlider createTrackLayer](self, "createTrackLayer");
  v4 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_thumbViewDidPan_);
  panGesture = self->_panGesture;
  self->_panGesture = v4;

  -[UIView addGestureRecognizer:](self->_thumbView, "addGestureRecognizer:", self->_panGesture);
  -[PREditingColorSlider addSubview:](self, "addSubview:", self->_thumbView);
  -[PREditingColorSlider layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSublayer:atIndex:", self->_trackLayer, 0);

  v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapTrackView_);
  tapGesture = self->_tapGesture;
  self->_tapGesture = v7;

  -[PREditingColorSlider addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGesture);
  -[PREditingColorSlider setClipsToBounds:](self, "setClipsToBounds:", 0);
}

- (id)createThumbView
{
  UIView *thumbView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  double v9;
  CALayer *v10;
  CALayer *thumbSoftShadowLayer;
  double v12;
  void *v13;
  CALayer *v14;
  CALayer *thumbContentLayer;
  void *v16;
  CAShapeLayer *v17;
  CAShapeLayer *thumbBorderLayer;
  CAShapeLayer *v19;
  id v20;
  CAShapeLayer *v21;
  id v22;
  void *v23;
  CAShapeLayer *v24;
  CAShapeLayer *thumbClippingLayer;

  thumbView = self->_thumbView;
  if (!thumbView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_thumbView;
    self->_thumbView = v4;

    v6 = self->_thumbView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIView setContentMode:](self->_thumbView, "setContentMode:", 2);
    -[UIView setClipsToBounds:](self->_thumbView, "setClipsToBounds:", 0);
    -[UIView layer](self->_thumbView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1042536202;
    objc_msgSend(v8, "setShadowOpacity:", v9);
    objc_msgSend(v8, "setShadowOffset:", 1.0, 5.5);
    objc_msgSend(v8, "setShadowRadius:", 3.5);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v10 = (CALayer *)objc_claimAutoreleasedReturnValue();
    thumbSoftShadowLayer = self->_thumbSoftShadowLayer;
    self->_thumbSoftShadowLayer = v10;

    LODWORD(v12) = 1042536202;
    -[CALayer setShadowOpacity:](self->_thumbSoftShadowLayer, "setShadowOpacity:", v12);
    -[CALayer setShadowOffset:](self->_thumbSoftShadowLayer, "setShadowOffset:", 0.0, 0.0);
    -[CALayer setShadowRadius:](self->_thumbSoftShadowLayer, "setShadowRadius:", 6.5);
    -[UIView layer](self->_thumbView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", self->_thumbSoftShadowLayer);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v14 = (CALayer *)objc_claimAutoreleasedReturnValue();
    thumbContentLayer = self->_thumbContentLayer;
    self->_thumbContentLayer = v14;

    -[UIView layer](self->_thumbView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", self->_thumbContentLayer);

    v17 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    thumbBorderLayer = self->_thumbBorderLayer;
    self->_thumbBorderLayer = v17;

    v19 = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v19, "setFillColor:", objc_msgSend(v20, "CGColor"));

    v21 = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v21, "setStrokeColor:", objc_msgSend(v22, "CGColor"));

    -[CAShapeLayer setLineWidth:](self->_thumbBorderLayer, "setLineWidth:", 2.0);
    -[UIView layer](self->_thumbView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSublayer:", self->_thumbBorderLayer);

    v24 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    thumbClippingLayer = self->_thumbClippingLayer;
    self->_thumbClippingLayer = v24;

    -[CAShapeLayer setFillRule:](self->_thumbClippingLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
    -[CALayer setMask:](self->_thumbContentLayer, "setMask:", self->_thumbClippingLayer);

    thumbView = self->_thumbView;
  }
  return thumbView;
}

- (void)createTrackLayer
{
  CAGradientLayer *v3;
  CAGradientLayer *trackLayer;

  if (!self->_trackLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v3 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setStartPoint:](v3, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v3, "setEndPoint:", 1.0, 0.5);
    -[CAGradientLayer setCornerCurve:](v3, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    trackLayer = self->_trackLayer;
    self->_trackLayer = v3;

    -[PREditingColorSlider updateTrackLayerColors](self, "updateTrackLayerColors");
  }
}

- (void)updateTrackLayerColors
{
  UIColor *color1;
  CAGradientLayer *trackLayer;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  color1 = self->_color1;
  if (color1 && self->_color2)
  {
    if (self->_color3)
    {
      trackLayer = self->_trackLayer;
      v6[1] = -[UIColor CGColor](self->_color2, "CGColor", -[UIColor CGColor](color1, "CGColor"));
      v6[2] = -[UIColor CGColor](self->_color3, "CGColor");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAGradientLayer setColors:](trackLayer, "setColors:", v5);

    }
  }
}

- (void)layoutThumbView
{
  double v3;
  double v4;
  double v5;

  -[PREditingColorSlider bounds](self, "bounds");
  v4 = v3;
  -[PREditingColorSlider bounds](self, "bounds");
  -[UIView setFrame:](self->_thumbView, "setFrame:", (v5 - v4) * 0.5 + self->_value * ((v5 - v4) * 0.5), 0.0, v4, v4);
}

- (void)layoutSubviews
{
  CALayer *thumbContentLayer;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CAShapeLayer *thumbClippingLayer;
  void *v18;
  CAShapeLayer *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double x;
  double y;
  double width;
  double height;
  CAShapeLayer *thumbBorderLayer;
  id v41;
  CAShapeLayer *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v47.receiver = self;
  v47.super_class = (Class)PREditingColorSlider;
  -[PREditingColorSlider layoutSubviews](&v47, sel_layoutSubviews);
  thumbContentLayer = self->_thumbContentLayer;
  -[UIView layer](self->_thumbView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[CALayer setFrame:](thumbContentLayer, "setFrame:");

  -[PREditingColorSlider layoutThumbView](self, "layoutThumbView");
  -[CAShapeLayer frame](self->_thumbClippingLayer, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView bounds](self->_thumbView, "bounds");
  v53.origin.x = v13;
  v53.origin.y = v14;
  v53.size.width = v15;
  v53.size.height = v16;
  v48.origin.x = v6;
  v48.origin.y = v8;
  v48.size.width = v10;
  v48.size.height = v12;
  if (!CGRectEqualToRect(v48, v53))
  {
    thumbClippingLayer = self->_thumbClippingLayer;
    -[UIView layer](self->_thumbView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    -[CAShapeLayer setFrame:](thumbClippingLayer, "setFrame:");

    v19 = self->_thumbClippingLayer;
    v20 = (void *)MEMORY[0x1E0DC3508];
    -[UIView layer](self->_thumbView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v50 = CGRectInset(v49, 1.0, 1.0);
    objc_msgSend(v20, "bezierPathWithOvalInRect:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](v19, "setPath:", objc_msgSend(v22, "CGPath"));

    -[UIView layer](self->_thumbView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[CAShapeLayer lineWidth](self->_thumbBorderLayer, "lineWidth");
    v33 = v32 * 0.5;
    -[CAShapeLayer lineWidth](self->_thumbBorderLayer, "lineWidth");
    v35 = v34 * 0.5;
    v51.origin.x = v25;
    v51.origin.y = v27;
    v51.size.width = v29;
    v51.size.height = v31;
    v52 = CGRectInset(v51, v33, v35);
    x = v52.origin.x;
    y = v52.origin.y;
    width = v52.size.width;
    height = v52.size.height;

    thumbBorderLayer = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", x, y, width, height);
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](thumbBorderLayer, "setPath:", objc_msgSend(v41, "CGPath"));

    v42 = self->_thumbBorderLayer;
    -[UIView layer](self->_thumbView, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    -[CAShapeLayer setFrame:](v42, "setFrame:");

    -[UIView layer](self->_thumbView, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setShadowPath:", -[CAShapeLayer path](self->_thumbBorderLayer, "path"));

    -[CALayer setShadowPath:](self->_thumbSoftShadowLayer, "setShadowPath:", -[CAShapeLayer path](self->_thumbBorderLayer, "path"));
  }
  if (self->_trackLayer)
  {
    -[PREditingColorSlider bounds](self, "bounds");
    v46 = v45 * 0.444444444;
    -[CAGradientLayer setFrame:](self->_trackLayer, "setFrame:", 0.0, (v45 - v45 * 0.444444444) * 0.5);
    -[CAGradientLayer setCornerCurve:](self->_trackLayer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    -[CAGradientLayer setCornerRadius:](self->_trackLayer, "setCornerRadius:", v46 * 0.5);
    -[CAGradientLayer setBorderWidth:](self->_trackLayer, "setBorderWidth:", 2.0);
    -[CAGradientLayer setBorderColor:](self->_trackLayer, "setBorderColor:", -[PREditingColorSlider trackBorderColor](self, "trackBorderColor"));
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

- (void)setPickerColor:(id)a3
{
  PREditorColorPickerColor *v5;
  void *v6;
  UIColor *v7;
  void *v8;
  UIColor *v9;
  void *v10;
  UIColor *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  PREditorColorPickerColor *v17;

  v5 = (PREditorColorPickerColor *)a3;
  if (v5 && self->_pickerColor != v5)
  {
    v17 = v5;
    objc_storeStrong((id *)&self->_pickerColor, a3);
    -[PREditorColorPickerColor displayColorWithVariation:](v17, "displayColorWithVariation:", -1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v7 = (UIColor *)objc_claimAutoreleasedReturnValue();

    -[PREditorColorPickerColor displayColorWithVariation:](v17, "displayColorWithVariation:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "color");
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue();

    -[PREditorColorPickerColor displayColorWithVariation:](v17, "displayColorWithVariation:", 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "color");
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();

    if (self->_color1 != v7)
      objc_storeStrong((id *)&self->_color1, v7);
    if (self->_color2 != v9)
      objc_storeStrong((id *)&self->_color2, v9);
    if (self->_color3 != v11)
      objc_storeStrong((id *)&self->_color3, v11);
    -[PREditorColorPickerColor initialVariation](v17, "initialVariation");
    v13 = v12;
    -[PREditingColorVariationStore variationForPickerColor:forContextIdentifier:](self->_variationStore, "variationForPickerColor:forContextIdentifier:", v17, self->_contextIdentifier);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "doubleValue");
      v13 = v16;
    }
    -[PREditingColorSlider updateTrackLayerColors](self, "updateTrackLayerColors");
    -[PREditingColorSlider _setSliderValue:](self, "_setSliderValue:", v13);

    v5 = v17;
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
  CAGradientLayer *trackLayer;
  CATransform3D v15;
  CATransform3D v16;

  v4 = a3;
  -[PREditingColorSlider traitCollection](self, "traitCollection");
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
    -[PREditingColorSlider traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "layoutDirection");

    if (v13 == 1)
      CATransform3DMakeRotation(&v16, 3.14159265, 0.0, 1.0, 0.0);
    trackLayer = self->_trackLayer;
    v15 = v16;
    -[CAGradientLayer setTransform:](trackLayer, "setTransform:", &v15);
  }
}

- (void)thumbViewDidPan:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MidX;
  double v12;
  double v13;
  double v14;
  UIView *thumbView;
  double v16;
  id v17;
  CGRect v18;

  v17 = a3;
  if (objc_msgSend(v17, "state") == 1)
  {
    -[UIView center](self->_thumbView, "center");
    self->_startPanOffset = v4;
    -[PREditingColorSlider bringSubviewToFront:](self, "bringSubviewToFront:", self->_thumbView);
  }
  else if (objc_msgSend(v17, "state") == 2 || objc_msgSend(v17, "state") == 3)
  {
    -[PREditingColorSlider bounds](self, "bounds");
    v6 = v5;
    -[UIView bounds](self->_thumbView, "bounds");
    v8 = v7;
    objc_msgSend(v17, "translationInView:", self);
    v10 = v9 + self->_startPanOffset;
    -[UIView bounds](self->_thumbView, "bounds");
    MidX = CGRectGetMidX(v18);
    if (v10 >= MidX)
      v12 = v10;
    else
      v12 = MidX;
    v13 = v6 - MidX;
    if (v12 >= v13)
      v14 = v13;
    else
      v14 = v12;
    thumbView = self->_thumbView;
    -[UIView center](thumbView, "center");
    -[UIView setCenter:](thumbView, "setCenter:", v14);
    -[UIView frame](self->_thumbView, "frame");
    self->_value = v16 / (v6 - v8) - (1.0 - v16 / (v6 - v8));
    -[PREditingColorSlider updateCurrentColorForCurrentValue](self, "updateCurrentColorForCurrentValue");
    -[PREditingColorSlider updateThumbForCurrentColor](self, "updateThumbForCurrentColor");
    if (objc_msgSend(v17, "state") == 3)
      -[PREditingColorSlider updateVariationInStore](self, "updateVariationInStore");
    -[PREditingColorSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }

}

- (void)didTapTrackView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MidX;
  double v12;
  double v13;
  double v14;
  double v15;
  UIView *v16;
  void *v17;
  UIView *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  UIView *v24;
  double v25;
  CGRect v26;

  v4 = a3;
  -[PREditingColorSlider bounds](self, "bounds");
  v6 = v5;
  -[UIView bounds](self->_thumbView, "bounds");
  v8 = v7;
  objc_msgSend(v4, "locationInView:", self);
  v10 = v9;

  -[UIView bounds](self->_thumbView, "bounds");
  MidX = CGRectGetMidX(v26);
  if (v10 >= MidX)
    v12 = v10;
  else
    v12 = MidX;
  if (v12 >= v6 - MidX)
    v13 = v6 - MidX;
  else
    v13 = v12;
  v14 = vabdd_f64(MidX, v10) / v6 * 0.25;
  if (v14 >= 0.1)
    v15 = v14;
  else
    v15 = 0.1;
  v16 = self->_thumbView;
  v17 = (void *)MEMORY[0x1E0DC3F10];
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __40__PREditingColorSlider_didTapTrackView___block_invoke;
  v23 = &unk_1E21847C0;
  v24 = v16;
  v25 = v13;
  v18 = v16;
  objc_msgSend(v17, "animateWithDuration:animations:", &v20, v15);
  -[UIView frame](self->_thumbView, "frame", v20, v21, v22, v23);
  self->_value = v19 / (v6 - v8) - (1.0 - v19 / (v6 - v8));
  -[PREditingColorSlider updateCurrentColorForCurrentValue](self, "updateCurrentColorForCurrentValue");
  -[PREditingColorSlider updateThumbForCurrentColor](self, "updateThumbForCurrentColor");
  -[PREditingColorSlider updateVariationInStore](self, "updateVariationInStore");
  -[PREditingColorSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);

}

uint64_t __40__PREditingColorSlider_didTapTrackView___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;

  v1 = *(void **)(a1 + 32);
  v2 = *(double *)(a1 + 40);
  objc_msgSend(v1, "center");
  return objc_msgSend(v1, "setCenter:", v2);
}

- (void)_setSliderValue:(double)a3
{
  self->_value = a3;
  -[PREditingColorSlider layoutThumbView](self, "layoutThumbView");
  -[PREditingColorSlider updateCurrentColorForCurrentValue](self, "updateCurrentColorForCurrentValue");
  -[PREditingColorSlider updateThumbForCurrentColor](self, "updateThumbForCurrentColor");
}

- (double)variation
{
  return self->_value;
}

- (void)updateVariationInStore
{
  -[PREditingColorVariationStore setVariation:forPickerColor:forContextIdentifier:](self->_variationStore, "setVariation:forPickerColor:forContextIdentifier:", self->_pickerColor, self->_contextIdentifier, self->_value);
}

- (void)updateCurrentColorForCurrentValue
{
  PRPosterColor *v3;
  PRPosterColor *v4;
  PRPosterColor *displayCurrentColor;
  PRPosterColor *v6;
  PRPosterColor *currentColor;
  id v8;

  -[PREditingColorSlider pickerColor](self, "pickerColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithVariation:", self->_value);
  v3 = (PRPosterColor *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayColorWithVariation:", self->_value);
  v4 = (PRPosterColor *)objc_claimAutoreleasedReturnValue();
  displayCurrentColor = self->_displayCurrentColor;
  self->_displayCurrentColor = v4;
  v6 = v4;

  currentColor = self->_currentColor;
  self->_currentColor = v3;

}

- (void)updateThumbForCurrentColor
{
  CALayer *thumbContentLayer;
  id v4;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  thumbContentLayer = self->_thumbContentLayer;
  -[PRPosterColor color](self->_displayCurrentColor, "color");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](thumbContentLayer, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (PREditorColorPickerColor)pickerColor
{
  return self->_pickerColor;
}

- (PRPosterColor)currentColor
{
  return self->_currentColor;
}

- (void)setCurrentColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentColor, a3);
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (UIColor)color1
{
  return self->_color1;
}

- (void)setColor1:(id)a3
{
  objc_storeStrong((id *)&self->_color1, a3);
}

- (UIColor)color2
{
  return self->_color2;
}

- (void)setColor2:(id)a3
{
  objc_storeStrong((id *)&self->_color2, a3);
}

- (UIColor)color3
{
  return self->_color3;
}

- (void)setColor3:(id)a3
{
  objc_storeStrong((id *)&self->_color3, a3);
}

- (PRPosterColor)displayCurrentColor
{
  return self->_displayCurrentColor;
}

- (void)setDisplayCurrentColor:(id)a3
{
  objc_storeStrong((id *)&self->_displayCurrentColor, a3);
}

- (PREditingColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void)setVariationStore:(id)a3
{
  objc_storeStrong((id *)&self->_variationStore, a3);
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contextIdentifier, a3);
}

- (unint64_t)pickerContext
{
  return self->_pickerContext;
}

- (void)setPickerContext:(unint64_t)a3
{
  self->_pickerContext = a3;
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
  objc_storeStrong((id *)&self->_panGesture, a3);
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapGesture, a3);
}

- (double)startPanOffset
{
  return self->_startPanOffset;
}

- (void)setStartPanOffset:(double)a3
{
  self->_startPanOffset = a3;
}

- (CAGradientLayer)trackLayer
{
  return self->_trackLayer;
}

- (void)setTrackLayer:(id)a3
{
  objc_storeStrong((id *)&self->_trackLayer, a3);
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

- (UIView)thumbView
{
  return self->_thumbView;
}

- (void)setThumbView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_thumbBorderLayer, 0);
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, 0);
  objc_storeStrong((id *)&self->_thumbContentLayer, 0);
  objc_storeStrong((id *)&self->_thumbClippingLayer, 0);
  objc_storeStrong((id *)&self->_trackLayer, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
  objc_storeStrong((id *)&self->_displayCurrentColor, 0);
  objc_storeStrong((id *)&self->_color3, 0);
  objc_storeStrong((id *)&self->_color2, 0);
  objc_storeStrong((id *)&self->_color1, 0);
  objc_storeStrong((id *)&self->_currentColor, 0);
  objc_storeStrong((id *)&self->_pickerColor, 0);
}

@end
