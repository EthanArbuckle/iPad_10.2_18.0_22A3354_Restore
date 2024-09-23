@implementation VUICircularProgress

- (VUICircularProgress)initWithFrame:(CGRect)a3
{
  VUICircularProgress *v3;
  VUICircularProgress *v4;
  uint64_t v5;
  UIColor *progressFillColor;
  uint64_t v7;
  UIColor *progressBgColor;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VUICircularProgress;
  v3 = -[VUICircularProgress initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_progressWidth = 2.0;
    v3->_indeterminateWidth = 2.0;
    v3->_centerSquareWidth = 8.0;
    v3->_centerSquareCornerRadius = 1.5;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v5 = objc_claimAutoreleasedReturnValue();
    progressFillColor = v4->_progressFillColor;
    v4->_progressFillColor = (UIColor *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "vui_systemLightGrayColor");
    v7 = objc_claimAutoreleasedReturnValue();
    progressBgColor = v4->_progressBgColor;
    v4->_progressBgColor = (UIColor *)v7;

    v4->_progressBgHidden = 0;
    -[VUICircularProgress setVuiClipsToBounds:](v4, "setVuiClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC6AC0], 0);

    v10 = objc_initWeak(&location, v4);
    v17[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__VUICircularProgress_initWithFrame___block_invoke;
    v13[3] = &unk_1E9F99F98;
    objc_copyWeak(&v14, &location);
    -[VUICircularProgress vui_registerForTraitChanges:withHandler:](v4, "vui_registerForTraitChanges:withHandler:", v11, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __37__VUICircularProgress_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__VUICircularProgress_initWithFrame___block_invoke_2;
  v9[3] = &unk_1E9F99C98;
  objc_copyWeak(&v10, v7);
  objc_msgSend(WeakRetained, "vui_performAsCurrentTraitCollection:", v9);

  objc_destroyWeak(&v10);
}

void __37__VUICircularProgress_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateColors");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUICircularProgress;
  -[VUICircularProgress dealloc](&v4, sel_dealloc);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    -[VUICircularProgress vui_sizeThatFits:](self, "vui_sizeThatFits:", a3.width, a3.height);
    width = v7;
    height = v8;
  }
  else
  {
    -[VUICircularProgress progressLayer](self, "progressLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[VUICircularProgress bounds](self, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[VUICircularProgress progressLayer](self, "progressLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

      -[VUICircularProgress progressBackgroundLayer](self, "progressBackgroundLayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

      -[VUICircularProgress progressLayer](self, "progressLayer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUICircularProgress _progressPath](self, "_progressPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPath:", objc_msgSend(v21, "vuiCGPath"));

      -[VUICircularProgress progressBackgroundLayer](self, "progressBackgroundLayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUICircularProgress _progressPath](self, "_progressPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPath:", objc_msgSend(v23, "vuiCGPath"));

      -[VUICircularProgress progressBackgroundLayer](self, "progressBackgroundLayer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHidden:", -[VUICircularProgress progressBgHidden](self, "progressBgHidden"));

      -[VUICircularProgress centerSquareWidth](self, "centerSquareWidth");
      v26 = v25;
      -[VUICircularProgress centerSquareWidth](self, "centerSquareWidth");
      v28 = v27;
      -[VUICircularProgress bounds](self, "bounds");
      v30 = v29;
      -[VUICircularProgress centerSquareWidth](self, "centerSquareWidth");
      v32 = (v30 - v31) * 0.5;
      -[VUICircularProgress bounds](self, "bounds");
      v34 = v33;
      -[VUICircularProgress centerSquareWidth](self, "centerSquareWidth");
      v36 = (v34 - v35) * 0.5;
      -[VUICircularProgress centerLayer](self, "centerLayer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setFrame:", v32, v36, v26, v28);

    }
    -[VUICircularProgress indeterminateLayer](self, "indeterminateLayer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[VUICircularProgress indeterminateLayer](self, "indeterminateLayer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUICircularProgress bounds](self, "bounds");
      objc_msgSend(v39, "setFrame:");

      -[VUICircularProgress indeterminateLayer](self, "indeterminateLayer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUICircularProgress _indeterminatePath](self, "_indeterminatePath");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setPath:", objc_msgSend(v41, "vuiCGPath"));

    }
  }
  v42 = width;
  v43 = height;
  result.height = v43;
  result.width = v42;
  return result;
}

- (void)vui_didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUICircularProgress;
  -[VUICircularProgress vui_didMoveToWindow](&v3, sel_vui_didMoveToWindow);
  -[VUICircularProgress _configureProgress:](self, "_configureProgress:", -[VUICircularProgress isIndeterminate](self, "isIndeterminate"));
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  if (-[VUICircularProgress isIndeterminate](self, "isIndeterminate"))
  {
    -[VUICircularProgress vuiTintColor](self, "vuiTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUICircularProgress vuiTraitCollection](self, "vuiTraitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resolvedColorWithTraitCollection:", v4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");

    -[VUICircularProgress indeterminateLayer](self, "indeterminateLayer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStrokeColor:", v6);

  }
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  double width;
  double v4;
  double height;
  BOOL v6;
  double v7;
  CGSize result;

  width = a3.width;
  v4 = 28.0;
  if (width == 0.0)
  {
    v7 = 28.0;
  }
  else
  {
    if (width > 28.0)
      width = 28.0;
    if (a3.height <= 28.0)
      height = a3.height;
    else
      height = 28.0;
    v6 = a3.height == 0.0;
    if (a3.height == 0.0)
      v7 = 28.0;
    else
      v7 = height;
    if (!v6)
      v4 = width;
  }
  result.height = v7;
  result.width = v4;
  return result;
}

- (void)setIndeterminate:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_indeterminate != a3)
  {
    v3 = a3;
    self->_indeterminate = a3;
    if (-[VUICircularProgress vui_isInAWindow](self, "vui_isInAWindow"))
      -[VUICircularProgress _configureProgress:](self, "_configureProgress:", v3);
    -[VUICircularProgress vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }
}

- (void)setProgress:(double)a3
{
  void *v5;
  double v6;
  void *v7;

  if (self->_progress != a3)
  {
    self->_progress = a3;
    -[VUICircularProgress progressLayer](self, "progressLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[VUICircularProgress _addProgressLayer](self, "_addProgressLayer");
    v6 = 1.0;
    if (a3 <= 0.99)
    {
      if (a3 <= 0.0)
        v6 = 0.0;
      else
        v6 = a3;
    }
    -[VUICircularProgress progressLayer](self, "progressLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStrokeEnd:", v6);

    -[VUICircularProgress vui_setNeedsDisplay](self, "vui_setNeedsDisplay");
  }
}

- (void)setProgressFillColor:(id)a3
{
  UIColor *v5;
  _QWORD v6[4];
  UIColor *v7;
  id v8;
  id location;

  v5 = (UIColor *)a3;
  if (self->_progressFillColor != v5)
  {
    objc_storeStrong((id *)&self->_progressFillColor, a3);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__VUICircularProgress_setProgressFillColor___block_invoke;
    v6[3] = &unk_1E9F9A938;
    objc_copyWeak(&v8, &location);
    v7 = v5;
    -[VUICircularProgress vui_performAsCurrentTraitCollection:](self, "vui_performAsCurrentTraitCollection:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __44__VUICircularProgress_setProgressFillColor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  objc_msgSend(WeakRetained, "centerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));

  objc_msgSend(WeakRetained, "progressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setProgressBgColor:(id)a3
{
  UIColor *v5;
  _QWORD v6[4];
  UIColor *v7;
  id v8;
  id location;

  v5 = (UIColor *)a3;
  if (self->_progressBgColor != v5)
  {
    objc_storeStrong((id *)&self->_progressBgColor, a3);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__VUICircularProgress_setProgressBgColor___block_invoke;
    v6[3] = &unk_1E9F9A938;
    objc_copyWeak(&v8, &location);
    v7 = v5;
    -[VUICircularProgress vui_performAsCurrentTraitCollection:](self, "vui_performAsCurrentTraitCollection:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __42__VUICircularProgress_setProgressBgColor___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "progressBackgroundLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));

}

- (void)_updateColors
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  -[VUICircularProgress indeterminateLayer](self, "indeterminateLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUICircularProgress vuiTintColor](self, "vuiTintColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

  -[VUICircularProgress centerLayer](self, "centerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUICircularProgress progressFillColor](self, "progressFillColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

  -[VUICircularProgress progressLayer](self, "progressLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUICircularProgress progressFillColor](self, "progressFillColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v8, "CGColor"));

  -[VUICircularProgress progressBackgroundLayer](self, "progressBackgroundLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[VUICircularProgress progressBgColor](self, "progressBgColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

}

- (void)_configureProgress:(BOOL)a3
{
  if (a3)
  {
    -[VUICircularProgress _addIndeterminateLayer](self, "_addIndeterminateLayer");
    -[VUICircularProgress _removeProgressLayer](self, "_removeProgressLayer");
    -[VUICircularProgress _startIndeterminateAnimation](self, "_startIndeterminateAnimation");
  }
  else
  {
    -[VUICircularProgress _removeIndeterminateLayer](self, "_removeIndeterminateLayer");
    -[VUICircularProgress _addProgressLayer](self, "_addProgressLayer");
  }
  -[VUICircularProgress vui_setNeedsLayout](self, "vui_setNeedsLayout");
}

- (id)_progressPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[VUICircularProgress bounds](self, "bounds");
  VUIFloorValue();
  v4 = v3;
  VUIFloorValue();
  v6 = v5;
  -[VUICircularProgress progressWidth](self, "progressWidth");
  VUIFloorValue();
  return +[VUIBezierPath vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](VUIBezierPath, "vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v7, -1.57079633, 4.71238898);
}

- (void)_addProgressLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  -[VUICircularProgress progressLayer](self, "progressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    -[VUICircularProgress centerSquareCornerRadius](self, "centerSquareCornerRadius");
    objc_msgSend(v4, "setCornerRadius:");
    -[VUICircularProgress vuiLayer](self, "vuiLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSublayer:", v4);

    -[VUICircularProgress setCenterLayer:](self, "setCenterLayer:", v4);
    v6 = (void *)objc_opt_new();
    -[VUICircularProgress progressWidth](self, "progressWidth");
    objc_msgSend(v6, "setLineWidth:");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

    -[VUICircularProgress _progressPath](self, "_progressPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPath:", objc_msgSend(v8, "vuiCGPath"));

    -[VUICircularProgress vuiLayer](self, "vuiLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", v6);

    -[VUICircularProgress setProgressBackgroundLayer:](self, "setProgressBackgroundLayer:", v6);
    v10 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    -[VUICircularProgress progressWidth](self, "progressWidth");
    objc_msgSend(v10, "setLineWidth:");
    objc_msgSend(v10, "setLineCap:", *MEMORY[0x1E0CD3010]);
    -[VUICircularProgress _progressPath](self, "_progressPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPath:", objc_msgSend(v12, "vuiCGPath"));

    objc_msgSend(v10, "setStrokeEnd:", 0.0);
    -[VUICircularProgress vuiLayer](self, "vuiLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v10);

    -[VUICircularProgress setProgressLayer:](self, "setProgressLayer:", v10);
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__VUICircularProgress__addProgressLayer__block_invoke;
    v17[3] = &unk_1E9FA3000;
    objc_copyWeak(&v21, &location);
    v14 = v4;
    v18 = v14;
    v15 = v6;
    v19 = v15;
    v16 = v10;
    v20 = v16;
    -[VUICircularProgress vui_performAsCurrentTraitCollection:](self, "vui_performAsCurrentTraitCollection:", v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

void __40__VUICircularProgress__addProgressLayer__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "progressFillColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(v3, "CGColor"));

  v4 = *(void **)(a1 + 40);
  objc_msgSend(WeakRetained, "progressBgColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  v6 = *(void **)(a1 + 48);
  objc_msgSend(WeakRetained, "progressFillColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

}

- (void)_removeProgressLayer
{
  void *v3;
  void *v4;
  void *v5;

  -[VUICircularProgress progressLayer](self, "progressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  -[VUICircularProgress setProgressLayer:](self, "setProgressLayer:", 0);
  -[VUICircularProgress progressBackgroundLayer](self, "progressBackgroundLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[VUICircularProgress setProgressBackgroundLayer:](self, "setProgressBackgroundLayer:", 0);
  -[VUICircularProgress centerLayer](self, "centerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperlayer");

  -[VUICircularProgress setCenterLayer:](self, "setCenterLayer:", 0);
}

- (id)_indeterminatePath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[VUICircularProgress bounds](self, "bounds");
  VUIFloorValue();
  v4 = v3;
  VUIFloorValue();
  v6 = v5;
  -[VUICircularProgress indeterminateWidth](self, "indeterminateWidth");
  VUIFloorValue();
  return +[VUIBezierPath vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](VUIBezierPath, "vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v7, -1.57079633, 3.53429174);
}

- (void)_addIndeterminateLayer
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  -[VUICircularProgress indeterminateLayer](self, "indeterminateLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__VUICircularProgress__addIndeterminateLayer__block_invoke;
    v8[3] = &unk_1E9F9A938;
    objc_copyWeak(&v10, &location);
    v5 = v4;
    v9 = v5;
    -[VUICircularProgress vui_performAsCurrentTraitCollection:](self, "vui_performAsCurrentTraitCollection:", v8);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    -[VUICircularProgress indeterminateWidth](self, "indeterminateWidth");
    objc_msgSend(v5, "setLineWidth:");
    objc_msgSend(v5, "setLineCap:", *MEMORY[0x1E0CD3010]);
    -[VUICircularProgress vuiLayer](self, "vuiLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v5);

    -[VUICircularProgress setIndeterminateLayer:](self, "setIndeterminateLayer:", v5);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

void __45__VUICircularProgress__addIndeterminateLayer__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "vuiTintColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "CGColor");

  objc_msgSend(*(id *)(a1 + 32), "setStrokeColor:", v3);
}

- (void)_startIndeterminateAnimation
{
  double v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", &unk_1EA0BBDB8);
  objc_msgSend(v5, "setDuration:", 1.0);
  LODWORD(v3) = 2139095040;
  objc_msgSend(v5, "setRepeatCount:", v3);
  -[VUICircularProgress indeterminateLayer](self, "indeterminateLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("indeterminateAnimation"));

}

- (void)_removeIndeterminateLayer
{
  void *v3;

  -[VUICircularProgress indeterminateLayer](self, "indeterminateLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  -[VUICircularProgress setIndeterminateLayer:](self, "setIndeterminateLayer:", 0);
}

- (void)_applicationWillEnterForeground:(id)a3
{
  void *v4;
  id v5;

  -[VUICircularProgress indeterminateLayer](self, "indeterminateLayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationForKey:", CFSTR("indeterminateAnimation"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5 && -[VUICircularProgress isIndeterminate](self, "isIndeterminate"))
    -[VUICircularProgress _startIndeterminateAnimation](self, "_startIndeterminateAnimation");

}

- (double)indeterminateWidth
{
  return self->_indeterminateWidth;
}

- (void)setIndeterminateWidth:(double)a3
{
  self->_indeterminateWidth = a3;
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (UIColor)progressFillColor
{
  return self->_progressFillColor;
}

- (UIColor)progressBgColor
{
  return self->_progressBgColor;
}

- (BOOL)progressBgHidden
{
  return self->_progressBgHidden;
}

- (void)setProgressBgHidden:(BOOL)a3
{
  self->_progressBgHidden = a3;
}

- (double)progressWidth
{
  return self->_progressWidth;
}

- (void)setProgressWidth:(double)a3
{
  self->_progressWidth = a3;
}

- (double)progress
{
  return self->_progress;
}

- (double)centerSquareWidth
{
  return self->_centerSquareWidth;
}

- (void)setCenterSquareWidth:(double)a3
{
  self->_centerSquareWidth = a3;
}

- (double)centerSquareCornerRadius
{
  return self->_centerSquareCornerRadius;
}

- (void)setCenterSquareCornerRadius:(double)a3
{
  self->_centerSquareCornerRadius = a3;
}

- (CAShapeLayer)indeterminateLayer
{
  return self->_indeterminateLayer;
}

- (void)setIndeterminateLayer:(id)a3
{
  objc_storeStrong((id *)&self->_indeterminateLayer, a3);
}

- (CAShapeLayer)centerLayer
{
  return self->_centerLayer;
}

- (void)setCenterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_centerLayer, a3);
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressLayer, a3);
}

- (CAShapeLayer)progressBackgroundLayer
{
  return self->_progressBackgroundLayer;
}

- (void)setProgressBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressBackgroundLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_centerLayer, 0);
  objc_storeStrong((id *)&self->_indeterminateLayer, 0);
  objc_storeStrong((id *)&self->_progressBgColor, 0);
  objc_storeStrong((id *)&self->_progressFillColor, 0);
}

@end
