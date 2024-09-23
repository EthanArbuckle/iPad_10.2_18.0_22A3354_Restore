@implementation PHRingHighlightView

+ (CGSize)ringSize
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  unint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = (unint64_t)objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 480.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 1024.0;
  *(double *)&v8 = 75.0;
  if (v4 <= v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v10 = (unint64_t)objc_msgSend(v9, "userInterfaceIdiom");

    v8 = *((uint64_t *)&unk_100066E70 + ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1));
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

  objc_msgSend((id)objc_opt_class(a1), "ringSize");
  return v2 * 0.5;
}

+ (id)colorForLuminance
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0500000007);
}

+ (id)colorForDodge
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.600000024, 1.0);
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

  v3 = (void *)qword_1000A3710;
  if (!qword_1000A3710)
  {
    objc_msgSend(a1, "ringSize");
    v5 = v4;
    v7 = v6;
    objc_msgSend(a1, "ringStroke");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "colorForLuminance"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createRingImageWithSize:strokeWidth:color:", v10, v5, v7, v9));
    v12 = (void *)qword_1000A3710;
    qword_1000A3710 = v11;

    v3 = (void *)qword_1000A3710;
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

  v3 = (void *)qword_1000A3718;
  if (!qword_1000A3718)
  {
    objc_msgSend(a1, "ringSize");
    v5 = v4;
    v7 = v6;
    objc_msgSend(a1, "ringStroke");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "colorForDodge"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createRingImageWithSize:strokeWidth:color:", v10, v5, v7, v9));
    v12 = (void *)qword_1000A3718;
    qword_1000A3718 = v11;

    v3 = (void *)qword_1000A3718;
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
  double v14;
  void *v15;
  double v16;
  void *v17;
  UIImage *ImageFromCurrentImageContext;
  void *v19;
  CGRect v21;
  CGRect v22;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = width;
  v21.size.height = height;
  v22 = CGRectInset(v21, a4, a4);
  x = v22.origin.x;
  y = v22.origin.y;
  v12 = v22.size.width;
  v13 = v22.size.height;
  v22.origin.x = width;
  v22.origin.y = height;
  UIGraphicsBeginImageContextWithOptions((CGSize)v22.origin, 0, 0.0);
  objc_msgSend(a1, "ringCornerRadius");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, v14));
  objc_msgSend(a1, "ringCornerRadius");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, v12, v13, v16 - a4));
  objc_msgSend(v15, "appendPath:", v17);

  objc_msgSend(v15, "setUsesEvenOddFillRule:", 1);
  objc_msgSend(v9, "setFill");

  objc_msgSend(v15, "fill");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v19;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  double v7;

  v3 = a3;
  +[CATransaction begin](CATransaction, "begin");
  LODWORD(v5) = 1043207291;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", v6, kCATransactionAnimationDuration);

  LODWORD(v7) = 0;
  if (v3)
  {
    -[CALayer setOpacity:](self->_highlightDodgeLayer, "setOpacity:", v7);
    LODWORD(v7) = 1.0;
  }
  -[CALayer setOpacity:](self->_selectionLayer, "setOpacity:", v7);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  double v7;
  float v8;
  double v9;

  v3 = a3;
  +[CATransaction begin](CATransaction, "begin");
  LODWORD(v5) = 1043207291;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", v6, kCATransactionAnimationDuration);

  if (v3)
    v8 = 1.0;
  else
    v8 = 0.0;
  *(float *)&v7 = v8;
  -[CALayer setOpacity:](self->_highlightDodgeLayer, "setOpacity:", v7);
  *(float *)&v9 = v8;
  -[CALayer setOpacity:](self->_highlightLuminanceLayer, "setOpacity:", v9);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  double v5;
  void *v6;
  double v7;
  float v8;
  void *v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHRingHighlightView;
  -[PHRingHighlightView setUserInteractionEnabled:](&v11, "setUserInteractionEnabled:");
  +[CATransaction begin](CATransaction, "begin");
  LODWORD(v5) = 1043207291;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", v6, kCATransactionAnimationDuration);

  v8 = 1.0;
  if (!a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v8 = flt_100066E68[objc_msgSend(v9, "_graphicsQuality") == (id)10];

  }
  *(float *)&v7 = v8;
  -[CALayer setOpacity:](self->_luminanceRingLayer, "setOpacity:", v7);
  *(float *)&v10 = v8;
  -[CALayer setOpacity:](self->_dodgeRingLayer, "setOpacity:", v10);
  +[CATransaction commit](CATransaction, "commit");
}

- (PHRingHighlightView)initWithFrame:(CGRect)a3
{
  PHRingHighlightView *v3;
  PHRingHighlightView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CALayer *luminanceRingLayer;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  CALayer *dodgeRingLayer;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  CALayer *highlightDodgeLayer;
  id v30;
  id v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double width;
  double height;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  uint64_t v51;
  CALayer *highlightLuminanceLayer;
  id v53;
  id v54;
  void *v55;
  double v56;
  void *v57;
  uint64_t v58;
  CALayer *selectionLayer;
  id v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  objc_super v67;
  CGRect v68;
  CGRect v69;

  v67.receiver = self;
  v67.super_class = (Class)PHRingHighlightView;
  v3 = -[PHRingHighlightView initWithFrame:](&v67, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PHRingHighlightView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[PHRingHighlightView setOpaque:](v4, "setOpaque:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHRingHighlightView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

    v8 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    luminanceRingLayer = v4->_luminanceRingLayer;
    v4->_luminanceRingLayer = (CALayer *)v8;

    v10 = objc_msgSend((id)objc_opt_class(v4), "ringImageForLuminance");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v10));
    -[CALayer setContents:](v4->_luminanceRingLayer, "setContents:", objc_msgSend(v11, "CGImage"));

    v12 = kCAFilterPlusL;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterPlusL));
    -[CALayer setCompositingFilter:](v4->_luminanceRingLayer, "setCompositingFilter:", v13);

    objc_msgSend((id)objc_opt_class(v4), "ringSize");
    v15 = v14;
    objc_msgSend((id)objc_opt_class(v4), "ringSize");
    -[CALayer setFrame:](v4->_luminanceRingLayer, "setFrame:", 0.0, 0.0, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v17, "addSublayer:", v4->_luminanceRingLayer);

    v18 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    dodgeRingLayer = v4->_dodgeRingLayer;
    v4->_dodgeRingLayer = (CALayer *)v18;

    v20 = objc_msgSend((id)objc_opt_class(v4), "ringImageForDodge");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v20));
    -[CALayer setContents:](v4->_dodgeRingLayer, "setContents:", objc_msgSend(v21, "CGImage"));

    v22 = kCAFilterColorDodgeBlendMode;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorDodgeBlendMode));
    -[CALayer setCompositingFilter:](v4->_dodgeRingLayer, "setCompositingFilter:", v23);

    objc_msgSend((id)objc_opt_class(v4), "ringSize");
    v25 = v24;
    objc_msgSend((id)objc_opt_class(v4), "ringSize");
    -[CALayer setFrame:](v4->_dodgeRingLayer, "setFrame:", 0.0, 0.0, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v27, "addSublayer:", v4->_dodgeRingLayer);

    v28 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    highlightDodgeLayer = v4->_highlightDodgeLayer;
    v4->_highlightDodgeLayer = (CALayer *)v28;

    v30 = objc_msgSend((id)objc_opt_class(v4), "colorForDodge");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v30));
    -[CALayer setBackgroundColor:](v4->_highlightDodgeLayer, "setBackgroundColor:", objc_msgSend(v31, "CGColor"));

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v22));
    -[CALayer setCompositingFilter:](v4->_highlightDodgeLayer, "setCompositingFilter:", v32);

    objc_msgSend((id)objc_opt_class(v4), "ringSize");
    v34 = v33;
    objc_msgSend((id)objc_opt_class(v4), "ringSize");
    v36 = v35;
    objc_msgSend((id)objc_opt_class(v4), "ringStroke");
    v38 = v37;
    objc_msgSend((id)objc_opt_class(v4), "ringStroke");
    v40 = v39;
    v68.origin.x = 0.0;
    v68.origin.y = 0.0;
    v68.size.width = v34;
    v68.size.height = v36;
    v69 = CGRectInset(v68, v38, v40);
    width = v69.size.width;
    height = v69.size.height;
    objc_msgSend((id)objc_opt_class(v4), "ringStroke");
    v44 = v43;
    objc_msgSend((id)objc_opt_class(v4), "ringStroke");
    -[CALayer setFrame:](v4->_highlightDodgeLayer, "setFrame:", v44, v45, width, height);
    objc_msgSend((id)objc_opt_class(v4), "ringCornerRadius");
    v47 = v46;
    objc_msgSend((id)objc_opt_class(v4), "ringStroke");
    -[CALayer setCornerRadius:](v4->_highlightDodgeLayer, "setCornerRadius:", v47 - v48);
    LODWORD(v49) = 0;
    -[CALayer setOpacity:](v4->_highlightDodgeLayer, "setOpacity:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v50, "addSublayer:", v4->_highlightDodgeLayer);

    v51 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    highlightLuminanceLayer = v4->_highlightLuminanceLayer;
    v4->_highlightLuminanceLayer = (CALayer *)v51;

    v53 = objc_msgSend((id)objc_opt_class(v4), "colorForLuminance");
    v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v53));
    -[CALayer setBackgroundColor:](v4->_highlightLuminanceLayer, "setBackgroundColor:", objc_msgSend(v54, "CGColor"));

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v12));
    -[CALayer setCompositingFilter:](v4->_highlightLuminanceLayer, "setCompositingFilter:", v55);

    -[CALayer frame](v4->_highlightDodgeLayer, "frame");
    -[CALayer setFrame:](v4->_highlightLuminanceLayer, "setFrame:");
    -[CALayer cornerRadius](v4->_highlightDodgeLayer, "cornerRadius");
    -[CALayer setCornerRadius:](v4->_highlightLuminanceLayer, "setCornerRadius:");
    LODWORD(v56) = 0;
    -[CALayer setOpacity:](v4->_highlightLuminanceLayer, "setOpacity:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v57, "insertSublayer:below:", v4->_highlightLuminanceLayer, v4->_highlightDodgeLayer);

    v58 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    selectionLayer = v4->_selectionLayer;
    v4->_selectionLayer = (CALayer *)v58;

    v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    -[CALayer setBackgroundColor:](v4->_selectionLayer, "setBackgroundColor:", objc_msgSend(v60, "CGColor"));

    objc_msgSend((id)objc_opt_class(v4), "ringSize");
    v62 = v61;
    objc_msgSend((id)objc_opt_class(v4), "ringSize");
    -[CALayer setFrame:](v4->_selectionLayer, "setFrame:", 0.0, 0.0, v62, v63);
    objc_msgSend((id)objc_opt_class(v4), "ringCornerRadius");
    -[CALayer setCornerRadius:](v4->_selectionLayer, "setCornerRadius:");
    LODWORD(v64) = 0;
    -[CALayer setOpacity:](v4->_selectionLayer, "setOpacity:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v65, "addSublayer:", v4->_selectionLayer);

  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(self), "ringSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CALayer)luminanceRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLuminanceRingLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CALayer)dodgeRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDodgeRingLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CALayer)highlightDodgeLayer
{
  return (CALayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHighlightDodgeLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CALayer)highlightLuminanceLayer
{
  return (CALayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHighlightLuminanceLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CALayer)selectionLayer
{
  return (CALayer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSelectionLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
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
