@implementation PRFontWeightSlider

- (PRFontWeightSlider)init
{
  PRFontWeightSlider *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  UIColor *contentBackgroundColor;
  _PRFontWeightSliderTrackView *v7;
  _PRFontWeightSliderTrackView *trackView;
  void *v9;
  void *v10;
  uint64_t v11;
  UITraitChangeRegistration *userInterfaceStyleTraitChangeRegistration;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PRFontWeightSlider;
  v2 = -[PRFontWeightSlider init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRFontWeightSlider setMinimumTrackTintColor:](v2, "setMinimumTrackTintColor:", v3);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRFontWeightSlider setMaximumTrackTintColor:](v2, "setMaximumTrackTintColor:", v4);

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3658]), "initWithDynamicProvider:", &__block_literal_global_40);
    contentBackgroundColor = v2->_contentBackgroundColor;
    v2->_contentBackgroundColor = (UIColor *)v5;

    v7 = -[_PRFontWeightSliderTrackView initWithTrackBackgroundColor:]([_PRFontWeightSliderTrackView alloc], "initWithTrackBackgroundColor:", v2->_contentBackgroundColor);
    trackView = v2->_trackView;
    v2->_trackView = v7;

    -[PRFontWeightSlider addSubview:](v2, "addSubview:", v2->_trackView);
    -[PRFontWeightSlider sendSubviewToBack:](v2, "sendSubviewToBack:", v2->_trackView);
    objc_initWeak(&location, v2);
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __26__PRFontWeightSlider_init__block_invoke_2;
    v14[3] = &unk_1E2185EB0;
    objc_copyWeak(&v15, &location);
    -[PRFontWeightSlider registerForTraitChanges:withHandler:](v2, "registerForTraitChanges:withHandler:", v10, v14);
    v11 = objc_claimAutoreleasedReturnValue();
    userInterfaceStyleTraitChangeRegistration = v2->_userInterfaceStyleTraitChangeRegistration;
    v2->_userInterfaceStyleTraitChangeRegistration = (UITraitChangeRegistration *)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __26__PRFontWeightSlider_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(a2, "userInterfaceStyle") == 1)
    v2 = 2;
  else
    v2 = 1;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColorWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __26__PRFontWeightSlider_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "thumbContentLayer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentBackgroundColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(v3, "CGColor"));

    WeakRetained = v4;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[PRFontWeightSlider unregisterForTraitChanges:](self, "unregisterForTraitChanges:", self->_userInterfaceStyleTraitChangeRegistration);
  v3.receiver = self;
  v3.super_class = (Class)PRFontWeightSlider;
  -[PRFontWeightSlider dealloc](&v3, sel_dealloc);
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
  double v47;
  double v48;
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v49.receiver = self;
  v49.super_class = (Class)PRFontWeightSlider;
  -[PRFontWeightSlider layoutSubviews](&v49, sel_layoutSubviews);
  thumbContentLayer = self->_thumbContentLayer;
  -[UIImageView layer](self->_thumbView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[CALayer setFrame:](thumbContentLayer, "setFrame:");

  -[CAShapeLayer frame](self->_thumbClippingLayer, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIImageView bounds](self->_thumbView, "bounds");
  v55.origin.x = v13;
  v55.origin.y = v14;
  v55.size.width = v15;
  v55.size.height = v16;
  v50.origin.x = v6;
  v50.origin.y = v8;
  v50.size.width = v10;
  v50.size.height = v12;
  if (!CGRectEqualToRect(v50, v55))
  {
    thumbClippingLayer = self->_thumbClippingLayer;
    -[UIImageView layer](self->_thumbView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    -[CAShapeLayer setFrame:](thumbClippingLayer, "setFrame:");

    v19 = self->_thumbClippingLayer;
    v20 = (void *)MEMORY[0x1E0DC3508];
    -[UIImageView layer](self->_thumbView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v52 = CGRectInset(v51, 1.0, 1.0);
    objc_msgSend(v20, "bezierPathWithOvalInRect:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](v19, "setPath:", objc_msgSend(v22, "CGPath"));

    -[UIImageView layer](self->_thumbView, "layer");
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
    v53.origin.x = v25;
    v53.origin.y = v27;
    v53.size.width = v29;
    v53.size.height = v31;
    v54 = CGRectInset(v53, v33, v35);
    x = v54.origin.x;
    y = v54.origin.y;
    width = v54.size.width;
    height = v54.size.height;

    thumbBorderLayer = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", x, y, width, height);
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](thumbBorderLayer, "setPath:", objc_msgSend(v41, "CGPath"));

    v42 = self->_thumbBorderLayer;
    -[UIImageView layer](self->_thumbView, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    -[CAShapeLayer setFrame:](v42, "setFrame:");

    -[UIImageView layer](self->_thumbView, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setShadowPath:", -[CAShapeLayer path](self->_thumbBorderLayer, "path"));

    -[CALayer setShadowPath:](self->_thumbSoftShadowLayer, "setShadowPath:", -[CAShapeLayer path](self->_thumbBorderLayer, "path"));
  }
  -[PRFontWeightSlider bounds](self, "bounds");
  -[PRFontWeightSlider trackRectForBounds:](self, "trackRectForBounds:");
  v46 = v45;
  v48 = v47;
  -[PRFontWeightSlider bounds](self, "bounds");
  -[_PRFontWeightSliderTrackView setFrame:](self->_trackView, "setFrame:", v46, 0.0, v48);
}

- (id)_createCustomThumbView
{
  UIImageView *thumbView;
  UIImageView *v4;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CALayer *v11;
  CALayer *thumbSoftShadowLayer;
  double v13;
  void *v14;
  CALayer *v15;
  CALayer *thumbContentLayer;
  void *v17;
  CAShapeLayer *v18;
  CAShapeLayer *thumbBorderLayer;
  CAShapeLayer *v20;
  id v21;
  CAShapeLayer *v22;
  id v23;
  void *v24;
  CAShapeLayer *v25;
  CAShapeLayer *thumbClippingLayer;

  thumbView = self->_thumbView;
  if (!thumbView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v5 = self->_thumbView;
    self->_thumbView = v4;

    v6 = self->_thumbView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIImageView setContentMode:](self->_thumbView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](self->_thumbView, "setClipsToBounds:", 0);
    -[UIImageView layer](self->_thumbView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHitTestsAsOpaque:", 1);

    -[UIImageView layer](self->_thumbView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 1042536202;
    objc_msgSend(v9, "setShadowOpacity:", v10);
    objc_msgSend(v9, "setShadowOffset:", 1.0, 5.5);
    objc_msgSend(v9, "setShadowRadius:", 3.5);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v11 = (CALayer *)objc_claimAutoreleasedReturnValue();
    thumbSoftShadowLayer = self->_thumbSoftShadowLayer;
    self->_thumbSoftShadowLayer = v11;

    LODWORD(v13) = 1042536202;
    -[CALayer setShadowOpacity:](self->_thumbSoftShadowLayer, "setShadowOpacity:", v13);
    -[CALayer setShadowOffset:](self->_thumbSoftShadowLayer, "setShadowOffset:", 0.0, 0.0);
    -[CALayer setShadowRadius:](self->_thumbSoftShadowLayer, "setShadowRadius:", 6.5);
    -[UIImageView layer](self->_thumbView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", self->_thumbSoftShadowLayer);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v15 = (CALayer *)objc_claimAutoreleasedReturnValue();
    thumbContentLayer = self->_thumbContentLayer;
    self->_thumbContentLayer = v15;

    -[CALayer setBackgroundColor:](self->_thumbContentLayer, "setBackgroundColor:", -[UIColor CGColor](self->_contentBackgroundColor, "CGColor"));
    -[UIImageView layer](self->_thumbView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", self->_thumbContentLayer);

    v18 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    thumbBorderLayer = self->_thumbBorderLayer;
    self->_thumbBorderLayer = v18;

    v20 = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v20, "setFillColor:", objc_msgSend(v21, "CGColor"));

    v22 = self->_thumbBorderLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v22, "setStrokeColor:", objc_msgSend(v23, "CGColor"));

    -[CAShapeLayer setLineWidth:](self->_thumbBorderLayer, "setLineWidth:", 2.0);
    -[UIImageView layer](self->_thumbView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSublayer:", self->_thumbBorderLayer);

    v25 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    thumbClippingLayer = self->_thumbClippingLayer;
    self->_thumbClippingLayer = v25;

    -[CAShapeLayer setFillRule:](self->_thumbClippingLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
    -[CALayer setMask:](self->_thumbContentLayer, "setMask:", self->_thumbClippingLayer);

    thumbView = self->_thumbView;
  }
  return thumbView;
}

- (id)createThumbView
{
  -[PRFontWeightSlider _createCustomThumbView](self, "_createCustomThumbView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)PRFontWeightSlider;
  -[PRFontWeightSlider thumbRectForBounds:trackRect:value:](&v6, sel_thumbRectForBounds_trackRect_value_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
  return CGRectInset(v7, (v7.size.width + -34.0) * 0.5, (v7.size.width + -34.0) * 0.5);
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  v9.receiver = self;
  v9.super_class = (Class)PRFontWeightSlider;
  -[PRFontWeightSlider trackRectForBounds:](&v9, sel_trackRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5 + -3.0;
  v8 = v7 + 6.0;
  result.size.height = v4;
  result.size.width = v8;
  result.origin.y = v3;
  result.origin.x = v6;
  return result;
}

- (UIImageView)thumbView
{
  return self->_thumbView;
}

- (void)setThumbView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbView, a3);
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

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (void)setContentBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_contentBackgroundColor, a3);
}

- (UITraitChangeRegistration)userInterfaceStyleTraitChangeRegistration
{
  return self->_userInterfaceStyleTraitChangeRegistration;
}

- (void)setUserInterfaceStyleTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_userInterfaceStyleTraitChangeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceStyleTraitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_thumbBorderLayer, 0);
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, 0);
  objc_storeStrong((id *)&self->_thumbContentLayer, 0);
  objc_storeStrong((id *)&self->_thumbClippingLayer, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_trackView, 0);
}

@end
