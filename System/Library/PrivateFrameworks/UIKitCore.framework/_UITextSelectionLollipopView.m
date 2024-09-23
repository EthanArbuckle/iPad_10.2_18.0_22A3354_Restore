@implementation _UITextSelectionLollipopView

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextSelectionLollipopView;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  -[_UITextSelectionLollipopView _layoutStemView](self, "_layoutStemView");
  -[_UITextSelectionLollipopView _layoutDotView](self, "_layoutDotView");
  -[UIView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextSelectionLollipopView _updateFillColorsForTintColor:](self, "_updateFillColorsForTintColor:", v3);

}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextSelectionLollipopView;
  -[UIView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[UIView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextSelectionLollipopView _updateFillColorsForTintColor:](self, "_updateFillColorsForTintColor:", v3);

}

- (void)_updateFillColorsForTintColor:(id)a3
{
  _UIContainerWindowPortalInteraction *dotPortalInteraction;
  id v5;
  BOOL v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  UIView *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  dotPortalInteraction = self->_dotPortalInteraction;
  v5 = a3;
  v6 = -[_UIContainerWindowPortalInteraction isEnabled](dotPortalInteraction, "isEnabled");
  v7 = 1.0;
  if (!v6)
    objc_msgSend(v5, "alphaComponent", 1.0);
  -[UIView setAlpha:](self, "setAlpha:", v7);
  objc_msgSend(v5, "colorWithAlphaComponent:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_retainAutorelease(v8);
  v9 = objc_msgSend(v20, "CGColor");
  -[UIView layer](self->_dotView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  if (self->_customShape)
  {
    v11 = self->_stemView;
    v12 = objc_retainAutorelease(v20);
    v13 = objc_msgSend(v12, "CGColor");
    -[UIView shapeLayer](v11, "shapeLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFillColor:", v13);

    -[_UITextSelectionLollipopView customShape](self, "customShape");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lineWidth");
    if (v16 <= 0.0)
      v17 = 0;
    else
      v17 = objc_msgSend(objc_retainAutorelease(v12), "CGColor");
    -[UIView shapeLayer](v11, "shapeLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStrokeColor:", v17);

  }
  else
  {
    v18 = objc_msgSend(objc_retainAutorelease(v20), "CGColor");
    -[UIView layer](self->_stemView, "layer");
    v11 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v18);
  }

}

- (void)_layoutDotView
{
  double v3;
  double v4;
  double shapeScale;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  id v12;
  CGRect v13;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[_UITextSelectionLollipopView _dotSize](self, "_dotSize");
  shapeScale = self->_shapeScale;
  v7 = v6 * shapeScale;
  v9 = v8 * shapeScale;
  -[UIView setBounds:](self->_dotView, "setBounds:", v3, v4, v6 * shapeScale, v8 * shapeScale);
  -[_UITextSelectionLollipopView _dotCenterForDotBounds:stemPoint:](self, "_dotCenterForDotBounds:stemPoint:", -[_UITextSelectionLollipopView _configuredStemPoint](self, "_configuredStemPoint"), v3, v4, v7, v9);
  -[UIView setCenter:](self->_dotView, "setCenter:");
  v13.origin.x = v3;
  v13.origin.y = v4;
  v13.size.width = v7;
  v13.size.height = v9;
  v10 = CGRectGetWidth(v13) * 0.5;
  -[UIView layer](self->_dotView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", v10);

  if (self->_hiddenForLoupeAnimation)
  {
    -[UIView setAlpha:](self->_dotView, "setAlpha:", 0.0);
  }
  else
  {
    -[_UITextSelectionLollipopView visualStyle](self, "visualStyle");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "grabberOpacity");
    -[UIView setAlpha:](self->_dotView, "setAlpha:");

  }
}

- (CGSize)_dotSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[_UITextSelectionLollipopView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dotSizeWithEngagedEffect:", -[_UITextSelectionLollipopView isEngaged](self, "isEngaged"));
  v5 = v4;

  v6 = v5;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)isEngaged
{
  return self->_engaged;
}

- (CGPoint)_dotCenterForDotBounds:(CGRect)a3 stemPoint:(unint64_t)a4
{
  double width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double MidX;
  double MidY;
  UIBezierPath *customShape;
  uint64_t v14;
  const CGPath *v15;
  uint64_t v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  width = a3.size.width;
  -[_UITextSelectionLollipopView visualStyle](self, "visualStyle", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dotOverlapOffset");
  v9 = v8 * self->_shapeScale;

  v10 = width * 0.5 - v9;
  MidX = *MEMORY[0x1E0C9D538];
  MidY = *(double *)(MEMORY[0x1E0C9D538] + 8);
  customShape = self->_customShape;
  if (customShape)
  {
    v14 = -[UIBezierPath CGPath](customShape, "CGPath");
    if (!-[_UITextSelectionLollipopView isVertical](self, "isVertical"))
    {
      if (a4)
      {
        v25 = -v10;
        v15 = (const CGPath *)v14;
        v16 = 4;
LABEL_17:
        MidX = CornerPointFromPath(v15, v16, v25);
        MidY = v26;
        goto LABEL_21;
      }
      v15 = (const CGPath *)v14;
      v16 = 2;
LABEL_15:
      v25 = v10;
      goto LABEL_17;
    }
    if (a4 == 1)
    {
      v25 = -v10;
      v15 = (const CGPath *)v14;
      v16 = 8;
      goto LABEL_17;
    }
    if (!a4)
    {
      v15 = (const CGPath *)v14;
      v16 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    -[UIView frame](self->_stemView, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    if (-[_UITextSelectionLollipopView isVertical](self, "isVertical"))
    {
      if (a4 == 1)
      {
        v31.origin.x = v18;
        v31.origin.y = v20;
        v31.size.width = v22;
        v31.size.height = v24;
        MidX = CGRectGetMidX(v31);
        v32.origin.x = v18;
        v32.origin.y = v20;
        v32.size.width = v22;
        v32.size.height = v24;
        MidY = v10 + CGRectGetHeight(v32);
      }
      else if (!a4)
      {
        v30.origin.x = v18;
        v30.origin.y = v20;
        v30.size.width = v22;
        v30.size.height = v24;
        MidX = CGRectGetMidX(v30);
        MidY = -v10;
      }
    }
    else
    {
      if (a4)
      {
        MidX = -v10;
      }
      else
      {
        v33.origin.x = v18;
        v33.origin.y = v20;
        v33.size.width = v22;
        v33.size.height = v24;
        MidX = v10 + CGRectGetMaxX(v33);
      }
      v34.origin.x = v18;
      v34.origin.y = v20;
      v34.size.width = v22;
      v34.size.height = v24;
      MidY = CGRectGetMidY(v34);
    }
  }
LABEL_21:
  v27 = MidX;
  v28 = MidY;
  result.y = v28;
  result.x = v27;
  return result;
}

- (void)_layoutStemView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  double v13;
  double v14;
  UIBezierPath *customShape;
  UIView *stemView;
  UIBezierPath *v17;
  UIBezierPath *v18;
  uint64_t v19;
  double v20;
  unint64_t direction;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  double shapeScale;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[_UITextSelectionLollipopView isVertical](self, "isVertical");
  -[_UITextSelectionLollipopView visualStyle](self, "visualStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stemWidth");
  v14 = v13;

  if (v11)
    v8 = v14;
  else
    v10 = v14;
  customShape = self->_customShape;
  if (customShape)
  {
    stemView = self->_stemView;
    v17 = customShape;
    -[UIView setFrame:](stemView, "setFrame:", v4, v6, v8, v10);
    v18 = objc_retainAutorelease(v17);
    v19 = -[UIBezierPath CGPath](v18, "CGPath");
    -[UIView shapeLayer](self->_stemView, "shapeLayer");
    v36 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "setPath:", v19);
  }
  else
  {
    if (v8 * 0.5 >= v10 * 0.5)
      v20 = v10 * 0.5;
    else
      v20 = v8 * 0.5;
    direction = self->_direction;
    v22 = -[_UITextSelectionLollipopView isVertical](self, "isVertical");
    v23 = 4;
    if (v22)
      v23 = 8;
    v24 = 10;
    if (v22)
      v24 = 3;
    v25 = 1;
    if (v22)
      v25 = 2;
    v26 = 5;
    if (v22)
      v26 = 12;
    v27 = v23 == direction;
    v28 = 15;
    if (v27)
      v28 = v24;
    if (v25 == direction)
      v29 = v26;
    else
      v29 = v28;
    if (fabs(self->_shapeScale + -1.0) >= 2.22044605e-16)
    {
      v30 = -[_UITextSelectionLollipopView isVertical](self, "isVertical");
      shapeScale = self->_shapeScale;
      v32 = v10 * shapeScale;
      v33 = v8 / shapeScale;
      v34 = v8 * shapeScale;
      if (v30)
        v4 = 0.0;
      else
        v6 = 0.0;
      if (v30)
        v8 = v34;
      else
        v8 = v33;
      if (!v30)
      {
        v10 = v32;
        v34 = v32;
      }
      v20 = v34 * 0.5;
    }
    -[UIView setFrame:](self->_stemView, "setFrame:", v4, v6, v8, v10);
    -[UIView layer](self->_stemView, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setMaskedCorners:", v29);

    -[UIView layer](self->_stemView, "layer");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCornerRadius:", v20);
  }

}

- (BOOL)isVertical
{
  unint64_t direction;

  direction = self->_direction;
  return direction == 2 || direction == 8;
}

- (_UITextSelectionLollipopView)initWithFrame:(CGRect)a3
{
  _UITextSelectionLollipopView *v3;
  _UITextSelectionLollipopView *v4;
  void *v5;
  UIView *v6;
  uint64_t v7;
  UIView *dotView;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)_UITextSelectionLollipopView;
  v3 = -[UIView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_shapeScale = 1.0;
    v3->_direction = 2;
    +[UIColor selectionGrabberColor](UIColor, "selectionGrabberColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v4, "setTintColor:", v5);

    -[_UITextSelectionLollipopView _usePlainViewForStemView](v4, "_usePlainViewForStemView");
    v6 = [UIView alloc];
    v7 = -[UIView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    dotView = v4->_dotView;
    v4->_dotView = (UIView *)v7;

    +[UIColor blackColor](UIColor, "blackColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "CGColor");
    -[UIView layer](v4->_dotView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowColor:", v10);

    -[_UITextSelectionLollipopView visualStyle](v4, "visualStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shadowRadius");
    v14 = v13;
    -[UIView layer](v4->_dotView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowRadius:", v14);

    -[_UITextSelectionLollipopView visualStyle](v4, "visualStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shadowOffset");
    v18 = v17;
    v20 = v19;
    -[UIView layer](v4->_dotView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShadowOffset:", v18, v20);

    -[_UITextSelectionLollipopView visualStyle](v4, "visualStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shadowOpacity");
    *(float *)&v18 = v23;
    -[UIView layer](v4->_dotView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = LODWORD(v18);
    objc_msgSend(v24, "setShadowOpacity:", v25);

    -[UIView layer](v4->_dotView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setShadowPathIsBounds:", 1);

    -[UIView addSubview:](v4, "addSubview:", v4->_dotView);
  }
  return v4;
}

- (id)visualStyle
{
  return (id)objc_msgSend((id)objc_opt_class(), "_visualStyle");
}

+ (id)_visualStyle
{
  if (_MergedGlobals_5_1 != -1)
    dispatch_once(&_MergedGlobals_5_1, &__block_literal_global_54);
  return (id)qword_1ECD7A888;
}

- (void)_usePlainViewForStemView
{
  UIView *v3;
  UIView *v4;
  UIView *stemView;
  uint64_t v6;
  void *v7;
  void *v8;

  -[UIView removeFromSuperview](self->_stemView, "removeFromSuperview");
  v3 = [UIView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  stemView = self->_stemView;
  self->_stemView = v4;

  v6 = *MEMORY[0x1E0CD2A68];
  -[UIView layer](self->_stemView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerCurve:", v6);

  -[UIView layer](self->_stemView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsEdgeAntialiasing:", 1);

  -[UIView addSubview:](self, "addSubview:", self->_stemView);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (unint64_t)_configuredStemPoint
{
  return ((self->_direction - 4) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UITextSelectionLollipopView;
  -[UIView setHidden:](&v5, sel_setHidden_);
  if (v3)
    -[_UITextSelectionLollipopView setPortalsDotToContainerWindow:](self, "setPortalsDotToContainerWindow:", 0);
}

- (void)setPortalsDotToContainerWindow:(BOOL)a3
{
  BOOL v4;
  BOOL *p_portalsDotToContainerWindow;
  _BOOL8 v6;
  UIView *p_super;
  void *v8;
  double v9;
  double v10;
  _UITextSelectionLollipopView *v11;
  _UIContainerWindowPortalInteraction *v12;
  _UIContainerWindowPortalInteraction *dotPortalInteraction;

  if (a3)
  {
    v4 = -[UIView isHidden](self, "isHidden");
    p_portalsDotToContainerWindow = &self->_portalsDotToContainerWindow;
    self->_portalsDotToContainerWindow = !v4;
    if (v4)
    {
      v6 = 0;
    }
    else if (self->_dotPortalInteraction)
    {
      v6 = 1;
    }
    else
    {
      p_super = self->_dotView;
      -[_UITextSelectionLollipopView visualStyle](self, "visualStyle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minimumStemLength");
      v10 = v9;

      if (v10 > 0.0)
      {
        v11 = self;

        p_super = &v11->super;
      }
      v12 = objc_alloc_init(_UIContainerWindowPortalInteraction);
      dotPortalInteraction = self->_dotPortalInteraction;
      self->_dotPortalInteraction = v12;

      -[_UIContainerWindowPortalInteraction setAttemptsToUseAncestorViewContainer:](self->_dotPortalInteraction, "setAttemptsToUseAncestorViewContainer:", 1);
      -[UIView addInteraction:](p_super, "addInteraction:", self->_dotPortalInteraction);

      v6 = *p_portalsDotToContainerWindow;
    }
  }
  else
  {
    v6 = 0;
    p_portalsDotToContainerWindow = &self->_portalsDotToContainerWindow;
    self->_portalsDotToContainerWindow = 0;
  }
  -[_UIContainerWindowPortalInteraction setEnabled:](self->_dotPortalInteraction, "setEnabled:", v6);
  if (*p_portalsDotToContainerWindow)
    -[_UIContainerWindowPortalInteraction ensureVisibilityInContainerWindow](self->_dotPortalInteraction, "ensureVisibilityInContainerWindow");
}

- (void)setEngaged:(BOOL)a3
{
  self->_engaged = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCustomShape:(id)a3
{
  UIBezierPath *v5;
  UIBezierPath *customShape;
  UIBezierPath *v7;

  v5 = (UIBezierPath *)a3;
  customShape = self->_customShape;
  if (customShape != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_customShape, a3);
    v5 = v7;
    if (v7 && !customShape)
    {
      -[_UITextSelectionLollipopView _useShapeViewForStemView](self, "_useShapeViewForStemView");
LABEL_8:
      v5 = v7;
      goto LABEL_9;
    }
    if (!v7 && customShape)
    {
      -[_UITextSelectionLollipopView _usePlainViewForStemView](self, "_usePlainViewForStemView");
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)_useShapeViewForStemView
{
  _UIShapeView *v3;
  UIView *v4;
  UIView *stemView;

  -[UIView removeFromSuperview](self->_stemView, "removeFromSuperview");
  v3 = [_UIShapeView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  stemView = self->_stemView;
  self->_stemView = v4;

  -[UIView addSubview:](self, "addSubview:", self->_stemView);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)dotViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_dotView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITextSelectionLollipopView;
  return -[UIView pointInside:withEvent:](&v5, sel_pointInside_withEvent_, a4, a3.x, a3.y);
}

- (void)_setShapeScale:(double)a3
{
  self->_shapeScale = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)preferredFrameForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  _BOOL4 v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[_UITextSelectionLollipopView isVertical](self, "isVertical");
  v9 = x;
  v10 = y;
  v11 = width;
  v12 = height;
  if (v8)
    v13 = CGRectGetHeight(*(CGRect *)&v9);
  else
    v13 = CGRectGetWidth(*(CGRect *)&v9);
  v14 = v13;
  -[_UITextSelectionLollipopView visualStyle](self, "visualStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minimumStemLength");
  v17 = v16;

  if (v14 < v17)
  {
    -[_UITextSelectionLollipopView visualStyle](self, "visualStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "minimumStemLength");
    v20 = v19 - v14;

    v14 = v14 + v20;
    if (!-[_UITextSelectionLollipopView _configuredStemPoint](self, "_configuredStemPoint"))
    {
      if (-[_UITextSelectionLollipopView isVertical](self, "isVertical"))
        y = y - v20;
      else
        x = x - v20;
    }
  }
  -[_UITextSelectionLollipopView _dotSize](self, "_dotSize");
  v22 = v21;
  v23 = -[_UITextSelectionLollipopView isVertical](self, "isVertical");
  if (v23)
    v24 = v22;
  else
    v24 = v14;
  if (v23)
    v25 = v14;
  else
    v25 = v22;
  v26 = x;
  v27 = y;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)crossfadeOnDismissal
{
  return 0;
}

- ($1B3FB7A12BCE93AE4CB0A35ACEA563C0)originShape
{
  CGFloat v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  $1B3FB7A12BCE93AE4CB0A35ACEA563C0 *result;

  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  -[UIView center](self->_dotView, "center");
  retstr->var0.x = v5;
  retstr->var0.y = v6;
  -[_UITextSelectionLollipopView _dotSize](self, "_dotSize");
  v8 = v7;
  -[_UITextSelectionLollipopView _dotSize](self, "_dotSize");
  retstr->var1.origin.x = 0.0;
  retstr->var1.origin.y = 0.0;
  retstr->var1.size.width = v8;
  retstr->var1.size.height = v9;
  -[_UITextSelectionLollipopView _dotSize](self, "_dotSize");
  retstr->var2 = v10 * 0.5;
  -[UIView tintColor](self, "tintColor");
  result = ($1B3FB7A12BCE93AE4CB0A35ACEA563C0 *)objc_claimAutoreleasedReturnValue();
  retstr->var3 = result;
  return result;
}

- ($6269591C569AE6F7CC7995ADEDD8665A)originShadow
{
  double v5;
  void *v6;
  double v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  $6269591C569AE6F7CC7995ADEDD8665A *result;
  id v12;

  +[UIColor blackColor](UIColor, "blackColor");
  retstr->var0 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITextSelectionLollipopView visualStyle](self, "visualStyle");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shadowOpacity");
  retstr->var1 = v5;
  -[_UITextSelectionLollipopView visualStyle](self, "visualStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shadowRadius");
  retstr->var2 = v7;
  -[_UITextSelectionLollipopView visualStyle](self, "visualStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shadowOffset");
  retstr->var3.width = v9;
  retstr->var3.height = v10;

  return result;
}

- (void)setHiddenForLoupeAnimation:(BOOL)a3
{
  self->_hiddenForLoupeAnimation = a3;
  -[_UITextSelectionLollipopView _layoutDotView](self, "_layoutDotView");
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (UIBezierPath)customShape
{
  return self->_customShape;
}

- (double)_shapeScale
{
  return self->_shapeScale;
}

- (BOOL)hiddenForLoupeAnimation
{
  return self->_hiddenForLoupeAnimation;
}

- (_UIContainerWindowPortalInteraction)dotPortalInteraction
{
  return self->_dotPortalInteraction;
}

- (void)setDotPortalInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dotPortalInteraction, a3);
}

- (BOOL)portalsDotToContainerWindow
{
  return self->_portalsDotToContainerWindow;
}

- (UIView)stemView
{
  return self->_stemView;
}

- (void)setStemView:(id)a3
{
  objc_storeStrong((id *)&self->_stemView, a3);
}

- (UIView)dotView
{
  return self->_dotView;
}

- (void)setDotView:(id)a3
{
  objc_storeStrong((id *)&self->_dotView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotView, 0);
  objc_storeStrong((id *)&self->_stemView, 0);
  objc_storeStrong((id *)&self->_dotPortalInteraction, 0);
  objc_storeStrong((id *)&self->_customShape, 0);
}

@end
