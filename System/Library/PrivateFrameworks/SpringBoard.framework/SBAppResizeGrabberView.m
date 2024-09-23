@implementation SBAppResizeGrabberView

- (SBAppResizeGrabberView)initWithCorner:(unint64_t)a3
{
  return -[SBAppResizeGrabberView initWithCorner:cornerRadius:](self, "initWithCorner:cornerRadius:", a3, 0.0);
}

- (SBAppResizeGrabberView)initWithCorner:(unint64_t)a3 cornerRadius:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  SBAppResizeGrabberView *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  UIView *v24;
  void *v25;
  void *v26;
  void *v27;
  UIView *pillViewContainerView;
  UIView *v29;
  MTLumaDodgePillView *pillView;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SBAppResizeGrabberView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[SBAppResizeGrabberView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorWithAlphaComponent:", 0.0);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "setFillColor:", objc_msgSend(v13, "CGColor"));

    objc_msgSend(v11, "setLineCap:", *MEMORY[0x1E0CD3010]);
    objc_msgSend(v11, "setLineJoin:", *MEMORY[0x1E0CD3030]);
    objc_msgSend(v11, "setLineWidth:", 5.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v14, "CGColor"));

    v15 = objc_alloc(MEMORY[0x1E0D47490]);
    objc_msgSend(MEMORY[0x1E0D47488], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithFrame:settings:graphicsQuality:", v16, -100, v6, v7, v8, v9);

    objc_msgSend(v17, "setStyle:", 1);
    objc_msgSend(v17, "setBackgroundLumninanceObserver:", v10);
    objc_msgSend(v17, "bs_setHitTestingDisabled:", 1);
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    v20 = v18;
    if (v19)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v22 = v21;

    objc_msgSend(v22, "setScale:", 1.0);
    v23 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBAppResizeGrabberView _pillViewContainerViewFrame](v10, "_pillViewContainerViewFrame");
    v24 = (UIView *)objc_msgSend(v23, "initWithFrame:");
    -[UIView addSubview:](v24, "addSubview:", v17);
    -[UIView bs_setHitTestingDisabled:](v24, "bs_setHitTestingDisabled:", 1);
    -[UIView layer](v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMask:", v11);

    -[SBAppResizeGrabberView addSubview:](v10, "addSubview:", v24);
    -[SBAppResizeGrabberView setAlpha:](v10, "setAlpha:", 0.0);
    -[SBAppResizeGrabberView layer](v10, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHitTestsAsOpaque:", 1);

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v10);
    -[SBAppResizeGrabberView addInteraction:](v10, "addInteraction:", v27);
    v10->_corner = a3;
    v10->_cornerRadius = a4;
    pillViewContainerView = v10->_pillViewContainerView;
    v10->_pillViewContainerView = v24;
    v29 = v24;

    pillView = v10->_pillView;
    v10->_pillView = (MTLumaDodgePillView *)v17;

    -[SBAppResizeGrabberView _updateGrabberPathAnimated:](v10, "_updateGrabberPathAnimated:", 0);
    -[SBAppResizeGrabberView setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", CFSTR("resize-grabber"));

  }
  return v10;
}

- (void)layoutSubviews
{
  UIView *pillViewContainerView;
  MTLumaDodgePillView *pillView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAppResizeGrabberView;
  -[SBAppResizeGrabberView layoutSubviews](&v5, sel_layoutSubviews);
  pillViewContainerView = self->_pillViewContainerView;
  -[SBAppResizeGrabberView _pillViewContainerViewFrame](self, "_pillViewContainerViewFrame");
  -[UIView setFrame:](pillViewContainerView, "setFrame:");
  pillView = self->_pillView;
  -[SBAppResizeGrabberView _pointerRegionRect](self, "_pointerRegionRect");
  -[SBAppResizeGrabberView convertRect:toView:](self, "convertRect:toView:", self->_pillViewContainerView);
  -[MTLumaDodgePillView setFrame:](pillView, "setFrame:");
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[SBAppResizeGrabberView _updateGrabberPathAnimated:](self, "_updateGrabberPathAnimated:", 1);
    -[SBAppResizeGrabberView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)frameInContentRect:(CGRect)a3
{
  unint64_t corner;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  corner = self->_corner;
  if (corner == 3)
  {
    v4 = a3.size.width + -20.0;
    v5 = a3.size.height + -20.0;
  }
  else
  {
    v4 = -20.0;
    if (corner == 2)
    {
      v5 = a3.size.height + -20.0;
    }
    else
    {
      v5 = -20.0;
      if (corner == 1)
        v4 = a3.size.width + -20.0;
    }
  }
  v6 = 40.0;
  v7 = 40.0;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)lumaDodgePillDidDetectBackgroundLuminanceChange:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "backgroundLuminance");
  v4 = 2;
  if (v3 == 1)
    v4 = 4;
  if (v3 == 2)
    v5 = 3;
  else
    v5 = v4;
  objc_msgSend(v6, "setStyle:", v5);

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v7 = a5;
  if ((objc_msgSend(a4, "_isPencilInitiated") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CEA870];
    -[SBAppResizeGrabberView _pointerRegionRect](self, "_pointerRegionRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v7, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "regionWithRect:identifier:", v18, v11, v13, v15, v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self->_pillViewContainerView);
  objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CEA880];
  objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithPath:", self->_grabberPath);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styleWithEffect:shape:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_grabberPathForLength:(double)a3 curve:(double)a4 rotation:(double)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  __double2 v20;
  double v21;
  __double2 v22;
  __int128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;

  v8 = a4 * 0.5;
  v9 = round(a4 * 3.14159265 + a4 * 3.14159265);
  v10 = a3 / v9 * 3.14159265 + a3 / v9 * 3.14159265;
  v11 = 1.57079633;
  if (v10 <= 1.57079633)
  {
    v14 = 0.785398163 - v10 * 0.5;
    v11 = v10 * 0.5 + 0.785398163;
    v13 = 0.0;
  }
  else
  {
    v12 = floor((a3 + v9 * -0.25) * 0.5);
    v13 = v12 + v12;
    v14 = 0.0;
  }
  v15 = -v8;
  v16 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  v17 = v16;
  if (v13 <= 0.0)
  {
    v20 = __sincos_stret(v11);
    v21 = a4 * v20.__sinval - v8;
    objc_msgSend(v17, "moveToPoint:", a4 * v20.__cosval - v8, v21);
    objc_msgSend(v17, "addLineToPoint:", a4 * v20.__cosval - v8, v21);
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v15, v15, a4, v11, v14);
    v22 = __sincos_stret(v14);
    v8 = a4 * v22.__cosval - v8;
    v19 = v15 + a4 * v22.__sinval;
  }
  else
  {
    v18 = v13 * 0.5;
    objc_msgSend(v16, "moveToPoint:", v15 - v18, a4 * 0.5);
    objc_msgSend(v17, "addLineToPoint:", -v8, a4 * 0.5);
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, -v8, -v8, a4, v11, v14);
    v19 = v15 / v18;
  }
  objc_msgSend(v17, "addLineToPoint:", v8, v19);
  CGAffineTransformMakeRotation(&v36, a5);
  objc_msgSend(v17, "applyTransform:", &v36);
  v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v34.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v34.c = v23;
  *(_OWORD *)&v34.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v33.a = *(_OWORD *)&v34.a;
  *(_OWORD *)&v33.c = v23;
  *(_OWORD *)&v33.tx = *(_OWORD *)&v34.tx;
  CGAffineTransformTranslate(&v34, &v33, 20.0, 20.0);
  -[SBAppResizeGrabberView _pillViewContainerViewOffset](self, "_pillViewContainerViewOffset");
  v25 = v24;
  -[SBAppResizeGrabberView _grabberCurve](self, "_grabberCurve");
  v27 = v26 * 0.5 + 7.5;
  v28 = v25 - v27;
  switch(self->_corner)
  {
    case 0uLL:
      v29 = -v28;
      v32 = v34;
      v30 = -v28;
      goto LABEL_13;
    case 1uLL:
      v30 = -v28;
      v32 = v34;
      v29 = v25 - v27;
      goto LABEL_13;
    case 2uLL:
      v29 = -v28;
      v32 = v34;
      goto LABEL_12;
    case 3uLL:
      v32 = v34;
      v29 = v25 - v27;
LABEL_12:
      v30 = v28;
LABEL_13:
      CGAffineTransformTranslate(&v33, &v32, v29, v30);
      v34 = v33;
      break;
    default:
      break;
  }
  v35 = v34;
  objc_msgSend(v17, "applyTransform:", &v35, *(_OWORD *)&v32.a, *(_OWORD *)&v32.c, *(_OWORD *)&v32.tx);
  return v17;
}

- (void)_updateGrabberPathAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v3 = a3;
  -[SBAppResizeGrabberView _grabberCurve](self, "_grabberCurve");
  v6 = v5;
  -[SBAppResizeGrabberView _grabberRotation](self, "_grabberRotation");
  -[SBAppResizeGrabberView _grabberPathForLength:curve:rotation:](self, "_grabberPathForLength:curve:rotation:", 20.0, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_pillViewContainerView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v8);
  if (!CGPathEqualToPath((CGPathRef)objc_msgSend(v14, "CGPath"), (CGPathRef)objc_msgSend(v10, "path")))
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("path"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentationLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFromValue:", objc_msgSend(v12, "path"));

      objc_msgSend(v11, "setToValue:", objc_msgSend(objc_retainAutorelease(v14), "CGPath"));
      objc_msgSend(v10, "removeAnimationForKey:", CFSTR("path"));
      objc_msgSend(v10, "addAnimation:forKey:", v11, CFSTR("path"));

    }
    v13 = objc_retainAutorelease(v14);
    objc_msgSend(v10, "setPath:", objc_msgSend(v13, "CGPath"));
    objc_storeStrong((id *)&self->_grabberPath, v13);
  }

}

- (double)_grabberCurve
{
  return self->_cornerRadius + -7.5;
}

- (double)_grabberRotation
{
  unint64_t corner;
  double result;

  corner = self->_corner;
  result = 0.0;
  if (corner <= 2)
    return dbl_1D0E88B90[corner];
  return result;
}

- (CGRect)_pillViewContainerViewFrame
{
  double v3;
  double v4;
  uint64_t v5;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGRect result;

  -[SBAppResizeGrabberView _pillViewContainerViewOffset](self, "_pillViewContainerViewOffset");
  v4 = v3;
  switch(self->_corner)
  {
    case 0uLL:
      -[SBAppResizeGrabberView bounds](self, "bounds");
      v9 = v4;
      goto LABEL_5;
    case 1uLL:
      -[SBAppResizeGrabberView bounds](self, "bounds");
      v9 = -v4;
LABEL_5:
      v14 = v4;
      goto LABEL_8;
    case 2uLL:
      -[SBAppResizeGrabberView bounds](self, "bounds");
      v14 = -v4;
      v9 = v4;
      goto LABEL_8;
    case 3uLL:
      -[SBAppResizeGrabberView bounds](self, "bounds");
      v9 = -v4;
      v14 = -v4;
LABEL_8:
      *(CGRect *)&v13 = CGRectOffset(*(CGRect *)&v5, v9, v14);
      break;
    default:
      v10 = 0.0;
      v11 = 0.0;
      v12 = 0.0;
      v13 = 0.0;
      break;
  }
  result.size.height = v10;
  result.size.width = v11;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (double)_pillViewContainerViewOffset
{
  return round(self->_cornerRadius + self->_cornerRadius * -0.707106781);
}

- (CGRect)_pointerRegionRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SBAppResizeGrabberView _pillViewContainerViewOffset](self, "_pillViewContainerViewOffset");
  v4 = 20.0;
  v5 = v3 + 20.0;
  switch(self->_corner)
  {
    case 0uLL:
      goto LABEL_5;
    case 1uLL:
      v6 = -v3;
      break;
    case 2uLL:
      v4 = -v3;
LABEL_5:
      v6 = 20.0;
      break;
    case 3uLL:
      v4 = -v3;
      v6 = -v3;
      break;
    default:
      v5 = 0.0;
      v4 = 0.0;
      v6 = 0.0;
      break;
  }
  v7 = v5;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberPath, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_pillViewContainerView, 0);
}

@end
