@implementation _PXStoryScrubberClipView

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  char v40;
  char v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)_PXStoryScrubberClipView;
  -[PXGFocusEffectView layoutSubviews](&v42, sel_layoutSubviews);
  -[PXGFocusableView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGFocusEffectView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "cornerRadius");
  v14 = v13;
  v15 = objc_msgSend(v3, "isCurrent");
  v16 = objc_msgSend(v3, "shouldAdjustContent");
  -[_PXStoryScrubberClipView highlightOverlayView](self, "highlightOverlayView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v6, v8, v10, v12);
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", v14);

  -[PXGFocusEffectView contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bringSubviewToFront:", v17);

  -[_PXStoryScrubberClipView dimOverlayView](self, "dimOverlayView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v6, v8, v10, v12);
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCornerRadius:", v14);

  -[PXGFocusEffectView contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bringSubviewToFront:", v20);

  -[PXGFocusEffectView contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "colorWithAlphaComponent:", 0.5);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v24, "setShadowColor:", objc_msgSend(v26, "CGColor"));

  objc_msgSend(v24, "setShadowOffset:", 0.0, 2.0);
  objc_msgSend(v24, "setShadowRadius:", 20.0);
  LODWORD(v27) = 0;
  if ((v15 & v16) != 0)
    *(float *)&v27 = 1.0;
  objc_msgSend(v24, "setShadowOpacity:", v27);
  LODWORD(v28) = 0.25;
  LODWORD(v29) = 0;
  LODWORD(v30) = 0.75;
  LODWORD(v31) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0DC3F10];
  +[_PXCustomTimingFunctionAnimationFactory factoryWithTimingFunction:](_PXCustomTimingFunctionAnimationFactory, "factoryWithTimingFunction:", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __42___PXStoryScrubberClipView_layoutSubviews__block_invoke;
  v37[3] = &unk_1E512D848;
  v40 = v15;
  v41 = v16;
  v38 = v17;
  v39 = v20;
  v35 = v20;
  v36 = v17;
  objc_msgSend(v33, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v34, v37, 0, 0.2, 0.0);

}

- (UIView)dimOverlayView
{
  UIView *dimOverlayView;
  id v4;
  void *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  void *v9;
  void *v10;

  dimOverlayView = self->_dimOverlayView;
  if (!dimOverlayView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PXGFocusEffectView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v7 = self->_dimOverlayView;
    self->_dimOverlayView = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_dimOverlayView, "setBackgroundColor:", v9);

    -[PXGFocusEffectView contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_dimOverlayView);

    dimOverlayView = self->_dimOverlayView;
  }
  return dimOverlayView;
}

- (UIView)highlightOverlayView
{
  UIView *highlightOverlayView;
  PXGradientView *v4;
  void *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  UIView *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  highlightOverlayView = self->_highlightOverlayView;
  if (!highlightOverlayView)
  {
    v4 = [PXGradientView alloc];
    -[PXGFocusEffectView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = -[PXGradientView initWithFrame:](v4, "initWithFrame:");

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithAlphaComponent:", 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setColors:](v6, "setColors:", v11);

    -[UIView setLocations:](v6, "setLocations:", &unk_1E53E9708);
    -[UIView setStartPoint:](v6, "setStartPoint:", 0.5, 0.0);
    -[UIView setEndPoint:](v6, "setEndPoint:", 0.5, 1.0);
    v12 = *MEMORY[0x1E0CD2EA0];
    -[UIView layer](v6, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositingFilter:", v12);

    -[PXGFocusEffectView contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v6);

    v15 = self->_highlightOverlayView;
    self->_highlightOverlayView = v6;

    highlightOverlayView = self->_highlightOverlayView;
  }
  return highlightOverlayView;
}

- (void)setHighlightOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightOverlayView, a3);
}

- (void)setDimOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_dimOverlayView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimOverlayView, 0);
  objc_storeStrong((id *)&self->_highlightOverlayView, 0);
}

@end
