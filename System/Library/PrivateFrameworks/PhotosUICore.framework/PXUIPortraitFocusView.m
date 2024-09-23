@implementation PXUIPortraitFocusView

- (PXUIPortraitFocusView)initWithMediaView:(id)a3 isHDR:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  PXUIPortraitFocusView *v8;
  id v9;
  uint64_t v10;
  CEKSubjectIndicatorView *fixedFocusView;
  uint64_t v12;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v14;
  void *v16;
  objc_super v17;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIPortraitFocusView.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaView != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PXUIPortraitFocusView;
  v8 = -[PXPortraitFocusView initWithMediaView:isHDR:](&v17, sel_initWithMediaView_isHDR_, v7, v4);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D0D0A0]);
    v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    fixedFocusView = v8->_fixedFocusView;
    v8->_fixedFocusView = (CEKSubjectIndicatorView *)v10;

    -[CEKSubjectIndicatorView setShape:](v8->_fixedFocusView, "setShape:", 3);
    -[PXUIPortraitFocusView addSubview:](v8, "addSubview:", v8->_fixedFocusView);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v8, sel__viewTapped_);
    tapGestureRecognizer = v8->_tapGestureRecognizer;
    v8->_tapGestureRecognizer = (UITapGestureRecognizer *)v12;

    -[UITapGestureRecognizer setDelegate:](v8->_tapGestureRecognizer, "setDelegate:", v8);
    -[PXPortraitFocusView mediaView](v8, "mediaView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addGestureRecognizer:", v8->_tapGestureRecognizer);

    if (v4)
      -[PXUIPortraitFocusView setUpEDRGainLayer](v8, "setUpEDRGainLayer");
  }

  return v8;
}

- (void)setUpEDRGainLayer
{
  void *v3;
  id v4;

  +[PXEDRGainLayer layer](PXEDRGainLayer, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXUIPortraitFocusView setEdrGainLayer:](self, "setEdrGainLayer:", v4);
  -[PXUIPortraitFocusView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSublayer:", v4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXPortraitFocusView mediaView](self, "mediaView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXUIPortraitFocusView;
  -[PXUIPortraitFocusView layoutSubviews](&v13, sel_layoutSubviews);
  -[PXUIPortraitFocusView edrGainLayer](self, "edrGainLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXUIPortraitFocusView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PXUIPortraitFocusView edrGainLayer](self, "edrGainLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGPoint v23;
  CGRect v24;

  v4 = (UITapGestureRecognizer *)a3;
  if (self->_tapGestureRecognizer == v4)
  {
    -[PXPortraitFocusView mediaView](self, "mediaView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PXPortraitFocusView mediaView](self, "mediaView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITapGestureRecognizer locationInView:](v4, "locationInView:", v8);
      v10 = v9;
      v12 = v11;

      -[PXPortraitFocusView mediaView](self, "mediaView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageFrame");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      v24.origin.x = v15;
      v24.origin.y = v17;
      v24.size.width = v19;
      v24.size.height = v21;
      v23.x = v10;
      v23.y = v12;
      v5 = CGRectContainsPoint(v24, v23);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)_viewTapped:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v4, "locationInView:", self);
    -[PXPortraitFocusView focusPointChanged:](self, "focusPointChanged:");
  }

}

- (void)animateNextRender
{
  self->_animateNextRender = 1;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  id v16;

  if (-[PXUIPortraitFocusView drawingEnabled](self, "drawingEnabled", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    -[PXPortraitFocusView focusViewDelegate](self, "focusViewDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentFocusRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[CEKSubjectIndicatorView setFrame:](self->_fixedFocusView, "setFrame:", v6, v8, v10, v12);
    -[CEKSubjectIndicatorView layer](self->_fixedFocusView, "layer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllAnimations");
    if (self->_animateNextRender)
    {
      self->_animateNextRender = 0;
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDuration:", 0.2);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTimingFunction:", v14);

      objc_msgSend(v13, "setFromValue:", &unk_1E53EFF40);
      objc_msgSend(v13, "setToValue:", &unk_1E53EFF50);
      LODWORD(v15) = 0;
      objc_msgSend(v13, "setRepeatCount:", v15);
      objc_msgSend(v13, "setAutoreverses:", 0);
      objc_msgSend(v16, "addAnimation:forKey:", v13, CFSTR("shrink"));

    }
  }
}

- (BOOL)drawingEnabled
{
  return self->_drawingEnabled;
}

- (void)setDrawingEnabled:(BOOL)a3
{
  self->_drawingEnabled = a3;
}

- (CALayer)edrGainLayer
{
  return self->_edrGainLayer;
}

- (void)setEdrGainLayer:(id)a3
{
  objc_storeStrong((id *)&self->_edrGainLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edrGainLayer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_fixedFocusView, 0);
}

@end
