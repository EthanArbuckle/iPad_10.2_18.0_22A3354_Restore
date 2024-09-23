@implementation PXUISubjectTrackingView

- (PXUISubjectTrackingView)initWithMediaView:(id)a3 cineController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXUISubjectTrackingView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v22;
  void *v23;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISubjectTrackingView.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaView != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISubjectTrackingView.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cineController != nil"));

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)PXUISubjectTrackingView;
  v10 = -[PXSubjectTrackingView initWithMediaView:cineController:](&v24, sel_initWithMediaView_cineController_, v7, v9);
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v10, sel_viewTapped_);
    objc_msgSend(v11, "setDelegate:", v10);
    -[PXSubjectTrackingView mediaView](v10, "mediaView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addGestureRecognizer:", v11);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v10, sel_viewDoubleTapped_);
    objc_msgSend(v13, "setNumberOfTapsRequired:", 2);
    objc_msgSend(v13, "setDelegate:", v10);
    -[PXSubjectTrackingView mediaView](v10, "mediaView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addGestureRecognizer:", v13);

    objc_msgSend(v11, "requireGestureRecognizerToFail:", v13);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v10, sel_viewLongPressed_);
    objc_msgSend(v15, "setDelegate:", v10);
    -[PXSubjectTrackingView mediaView](v10, "mediaView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addGestureRecognizer:", v15);

    objc_msgSend(v9, "asset");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v9, "asset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isHDRVideo");

      if (v20)
        -[PXUISubjectTrackingView setUpEDRGainLayer](v10, "setUpEDRGainLayer");
    }

  }
  return v10;
}

- (void)setUpEDRGainLayer
{
  void *v3;
  id v4;

  +[PXEDRGainLayer layer](PXEDRGainLayer, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXUISubjectTrackingView setEdrGainLayer:](self, "setEdrGainLayer:", v4);
  -[PXUISubjectTrackingView layer](self, "layer");
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
  -[PXSubjectTrackingView mediaView](self, "mediaView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  -[PXSubjectTrackingView mediaView](self, "mediaView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[PXSubjectTrackingView normalizedPointForViewPoint:](self, "normalizedPointForViewPoint:", v7, v9);
  v12 = v11 >= 0.0;
  if (v11 > 1.0)
    v12 = 0;
  if (v10 < 0.0)
    v12 = 0;
  return v10 <= 1.0 && v12;
}

- (void)viewTapped:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  if (-[PXSubjectTrackingView viewEnabled](self, "viewEnabled"))
  {
    -[PXSubjectTrackingView handleInteractionBegan](self, "handleInteractionBegan");
    if (objc_msgSend(v9, "state") == 3)
    {
      -[PXSubjectTrackingView mediaView](self, "mediaView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locationInView:", v4);
      v6 = v5;
      v8 = v7;

      -[PXSubjectTrackingView handleSingleSelectOnPoint:](self, "handleSingleSelectOnPoint:", v6, v8);
    }
  }

}

- (void)viewDoubleTapped:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  if (-[PXSubjectTrackingView viewEnabled](self, "viewEnabled"))
  {
    -[PXSubjectTrackingView handleInteractionBegan](self, "handleInteractionBegan");
    if (objc_msgSend(v9, "state") == 3)
    {
      -[PXSubjectTrackingView mediaView](self, "mediaView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locationInView:", v4);
      v6 = v5;
      v8 = v7;

      -[PXSubjectTrackingView handleDoubleSelectOnPoint:](self, "handleDoubleSelectOnPoint:", v6, v8);
    }
  }

}

- (void)viewLongPressed:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  if (-[PXSubjectTrackingView viewEnabled](self, "viewEnabled"))
  {
    -[PXSubjectTrackingView handleInteractionBegan](self, "handleInteractionBegan");
    if (objc_msgSend(v9, "state") == 1)
    {
      -[PXSubjectTrackingView mediaView](self, "mediaView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locationInView:", v4);
      v6 = v5;
      v8 = v7;

      -[PXSubjectTrackingView handleLongSelectOnPoint:](self, "handleLongSelectOnPoint:", v6, v8);
    }
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXUISubjectTrackingView;
  -[PXSubjectTrackingView layoutSubviews](&v12, sel_layoutSubviews);
  -[PXUISubjectTrackingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXUISubjectTrackingView edrGainLayer](self, "edrGainLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)didAddSubview:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXUISubjectTrackingView;
  -[PXUISubjectTrackingView didAddSubview:](&v8, sel_didAddSubview_, a3);
  -[PXUISubjectTrackingView edrGainLayer](self, "edrGainLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXUISubjectTrackingView edrGainLayer](self, "edrGainLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperlayer");

    -[PXUISubjectTrackingView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUISubjectTrackingView edrGainLayer](self, "edrGainLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v7);

  }
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
}

@end
