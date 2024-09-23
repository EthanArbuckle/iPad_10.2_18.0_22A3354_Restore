@implementation TPRingView

+ (CGSize)ringSize
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 480.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 1024.0;
  *(double *)&v8 = 75.0;
  if (v4 <= v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    v8 = *((uint64_t *)&unk_1BCFE74B0 + ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1));
  }

  v11 = *(double *)&v8;
  v12 = *(double *)&v8;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (double)ringStroke
{
  return 1.5;
}

+ (double)ringCornerRadius
{
  double v2;

  objc_msgSend((id)objc_opt_class(), "ringSize");
  return v2 * 0.5;
}

+ (id)colorForLuminance
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0500000007);
}

+ (id)colorForDodge
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.600000024, 1.0);
}

+ (id)ringImageForLuminance
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)ringImageForLuminance;
  if (!ringImageForLuminance)
  {
    objc_msgSend(a1, "ringSize");
    v5 = v4;
    v7 = v6;
    objc_msgSend(a1, "ringStroke");
    v9 = v8;
    objc_msgSend(a1, "colorForLuminance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createRingImageWithSize:strokeWidth:color:", v10, v5, v7, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)ringImageForLuminance;
    ringImageForLuminance = v11;

    v3 = (void *)ringImageForLuminance;
  }
  return v3;
}

+ (id)ringImageForDodge
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)ringImageForDodge;
  if (!ringImageForDodge)
  {
    objc_msgSend(a1, "ringSize");
    v5 = v4;
    v7 = v6;
    objc_msgSend(a1, "ringStroke");
    v9 = v8;
    objc_msgSend(a1, "colorForDodge");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createRingImageWithSize:strokeWidth:color:", v10, v5, v7, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)ringImageForDodge;
    ringImageForDodge = v11;

    v3 = (void *)ringImageForDodge;
  }
  return v3;
}

+ (id)createRingImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5
{
  double height;
  double width;
  id v9;
  double x;
  double y;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  CGRect v22;
  CGRect v23;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = width;
  v22.size.height = height;
  v23 = CGRectInset(v22, a4, a4);
  x = v23.origin.x;
  y = v23.origin.y;
  v12 = v23.size.width;
  v13 = v23.size.height;
  v23.origin.x = width;
  v23.origin.y = height;
  UIGraphicsBeginImageContextWithOptions((CGSize)v23.origin, 0, 0.0);
  v14 = (void *)MEMORY[0x1E0DC3508];
  objc_msgSend(a1, "ringCornerRadius");
  objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3508];
  objc_msgSend(a1, "ringCornerRadius");
  objc_msgSend(v17, "bezierPathWithRoundedRect:cornerRadius:", x, y, v12, v13, v18 - a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendPath:", v19);

  objc_msgSend(v16, "setUsesEvenOddFillRule:", 1);
  objc_msgSend(v9, "setFill");

  objc_msgSend(v16, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v20;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  double v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v5 = (void *)MEMORY[0x1E0CD28B0];
  LODWORD(v6) = 1043207291;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, *MEMORY[0x1E0CD3150]);

  LODWORD(v8) = 0;
  if (v3)
  {
    -[CALayer setOpacity:](self->_highlightDodgeLayer, "setOpacity:", v8);
    LODWORD(v8) = 1.0;
  }
  -[CALayer setOpacity:](self->_selectionLayer, "setOpacity:", v8);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  double v8;
  float v9;
  double v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v5 = (void *)MEMORY[0x1E0CD28B0];
  LODWORD(v6) = 1043207291;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, *MEMORY[0x1E0CD3150]);

  if (v3)
    v9 = 1.0;
  else
    v9 = 0.0;
  *(float *)&v8 = v9;
  -[CALayer setOpacity:](self->_highlightDodgeLayer, "setOpacity:", v8);
  *(float *)&v10 = v9;
  -[CALayer setOpacity:](self->_highlightLuminanceLayer, "setOpacity:", v10);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setEnabled:(BOOL)a3
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  float v9;
  void *v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v5 = (void *)MEMORY[0x1E0CD28B0];
  LODWORD(v6) = 1043207291;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, *MEMORY[0x1E0CD3150]);

  v9 = 1.0;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = flt_1BCFE74A0[objc_msgSend(v10, "_graphicsQuality") == 10];

  }
  *(float *)&v8 = v9;
  -[CALayer setOpacity:](self->_luminanceRingLayer, "setOpacity:", v8);
  *(float *)&v11 = v9;
  -[CALayer setOpacity:](self->_dodgeRingLayer, "setOpacity:", v11);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (TPRingView)initWithFrame:(CGRect)a3
{
  TPRingView *v3;
  TPRingView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CALayer *luminanceRingLayer;
  id v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  CALayer *dodgeRingLayer;
  id v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  CALayer *highlightDodgeLayer;
  id v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double width;
  double height;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  CALayer *highlightLuminanceLayer;
  id v50;
  void *v51;
  double v52;
  void *v53;
  uint64_t v54;
  CALayer *selectionLayer;
  id v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  objc_super v63;
  CGRect v64;
  CGRect v65;

  v63.receiver = self;
  v63.super_class = (Class)TPRingView;
  v3 = -[TPRingView initWithFrame:](&v63, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TPRingView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[TPRingView setOpaque:](v4, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPRingView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[TPRingView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    -[TPRingView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v8 = objc_claimAutoreleasedReturnValue();
    luminanceRingLayer = v4->_luminanceRingLayer;
    v4->_luminanceRingLayer = (CALayer *)v8;

    objc_msgSend((id)objc_opt_class(), "ringImageForLuminance");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setContents:](v4->_luminanceRingLayer, "setContents:", objc_msgSend(v10, "CGImage"));

    v11 = *MEMORY[0x1E0CD2EA0];
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setCompositingFilter:](v4->_luminanceRingLayer, "setCompositingFilter:", v12);

    objc_msgSend((id)objc_opt_class(), "ringSize");
    v14 = v13;
    objc_msgSend((id)objc_opt_class(), "ringSize");
    -[CALayer setFrame:](v4->_luminanceRingLayer, "setFrame:", 0.0, 0.0, v14, v15);
    -[TPRingView layer](v4, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v4->_luminanceRingLayer);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v17 = objc_claimAutoreleasedReturnValue();
    dodgeRingLayer = v4->_dodgeRingLayer;
    v4->_dodgeRingLayer = (CALayer *)v17;

    objc_msgSend((id)objc_opt_class(), "ringImageForDodge");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setContents:](v4->_dodgeRingLayer, "setContents:", objc_msgSend(v19, "CGImage"));

    v20 = *MEMORY[0x1E0CD2BD0];
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BD0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setCompositingFilter:](v4->_dodgeRingLayer, "setCompositingFilter:", v21);

    objc_msgSend((id)objc_opt_class(), "ringSize");
    v23 = v22;
    objc_msgSend((id)objc_opt_class(), "ringSize");
    -[CALayer setFrame:](v4->_dodgeRingLayer, "setFrame:", 0.0, 0.0, v23, v24);
    -[TPRingView layer](v4, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSublayer:", v4->_dodgeRingLayer);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v26 = objc_claimAutoreleasedReturnValue();
    highlightDodgeLayer = v4->_highlightDodgeLayer;
    v4->_highlightDodgeLayer = (CALayer *)v26;

    objc_msgSend((id)objc_opt_class(), "colorForDodge");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4->_highlightDodgeLayer, "setBackgroundColor:", objc_msgSend(v28, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setCompositingFilter:](v4->_highlightDodgeLayer, "setCompositingFilter:", v29);

    objc_msgSend((id)objc_opt_class(), "ringSize");
    v31 = v30;
    objc_msgSend((id)objc_opt_class(), "ringSize");
    v33 = v32;
    objc_msgSend((id)objc_opt_class(), "ringStroke");
    v35 = v34;
    objc_msgSend((id)objc_opt_class(), "ringStroke");
    v37 = v36;
    v64.origin.x = 0.0;
    v64.origin.y = 0.0;
    v64.size.width = v31;
    v64.size.height = v33;
    v65 = CGRectInset(v64, v35, v37);
    width = v65.size.width;
    height = v65.size.height;
    objc_msgSend((id)objc_opt_class(), "ringStroke");
    v41 = v40;
    objc_msgSend((id)objc_opt_class(), "ringStroke");
    -[CALayer setFrame:](v4->_highlightDodgeLayer, "setFrame:", v41, v42, width, height);
    objc_msgSend((id)objc_opt_class(), "ringCornerRadius");
    v44 = v43;
    objc_msgSend((id)objc_opt_class(), "ringStroke");
    -[CALayer setCornerRadius:](v4->_highlightDodgeLayer, "setCornerRadius:", v44 - v45);
    LODWORD(v46) = 0;
    -[CALayer setOpacity:](v4->_highlightDodgeLayer, "setOpacity:", v46);
    -[TPRingView layer](v4, "layer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addSublayer:", v4->_highlightDodgeLayer);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v48 = objc_claimAutoreleasedReturnValue();
    highlightLuminanceLayer = v4->_highlightLuminanceLayer;
    v4->_highlightLuminanceLayer = (CALayer *)v48;

    objc_msgSend((id)objc_opt_class(), "colorForLuminance");
    v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4->_highlightLuminanceLayer, "setBackgroundColor:", objc_msgSend(v50, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v11);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setCompositingFilter:](v4->_highlightLuminanceLayer, "setCompositingFilter:", v51);

    -[CALayer frame](v4->_highlightDodgeLayer, "frame");
    -[CALayer setFrame:](v4->_highlightLuminanceLayer, "setFrame:");
    -[CALayer cornerRadius](v4->_highlightDodgeLayer, "cornerRadius");
    -[CALayer setCornerRadius:](v4->_highlightLuminanceLayer, "setCornerRadius:");
    LODWORD(v52) = 0;
    -[CALayer setOpacity:](v4->_highlightLuminanceLayer, "setOpacity:", v52);
    -[TPRingView layer](v4, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "insertSublayer:below:", v4->_highlightLuminanceLayer, v4->_highlightDodgeLayer);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v54 = objc_claimAutoreleasedReturnValue();
    selectionLayer = v4->_selectionLayer;
    v4->_selectionLayer = (CALayer *)v54;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4->_selectionLayer, "setBackgroundColor:", objc_msgSend(v56, "CGColor"));

    objc_msgSend((id)objc_opt_class(), "ringSize");
    v58 = v57;
    objc_msgSend((id)objc_opt_class(), "ringSize");
    -[CALayer setFrame:](v4->_selectionLayer, "setFrame:", 0.0, 0.0, v58, v59);
    objc_msgSend((id)objc_opt_class(), "ringCornerRadius");
    -[CALayer setCornerRadius:](v4->_selectionLayer, "setCornerRadius:");
    LODWORD(v60) = 0;
    -[CALayer setOpacity:](v4->_selectionLayer, "setOpacity:", v60);
    -[TPRingView layer](v4, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSublayer:", v4->_selectionLayer);

  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "ringSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CALayer)luminanceRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 416, 1);
}

- (void)setLuminanceRingLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (CALayer)dodgeRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 424, 1);
}

- (void)setDodgeRingLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (CALayer)highlightDodgeLayer
{
  return (CALayer *)objc_getProperty(self, a2, 432, 1);
}

- (void)setHighlightDodgeLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (CALayer)highlightLuminanceLayer
{
  return (CALayer *)objc_getProperty(self, a2, 440, 1);
}

- (void)setHighlightLuminanceLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (CALayer)selectionLayer
{
  return (CALayer *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSelectionLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_highlightLuminanceLayer, 0);
  objc_storeStrong((id *)&self->_highlightDodgeLayer, 0);
  objc_storeStrong((id *)&self->_dodgeRingLayer, 0);
  objc_storeStrong((id *)&self->_luminanceRingLayer, 0);
}

@end
