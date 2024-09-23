@implementation VSCircularProgressView

- (VSCircularProgressView)initWithFrame:(CGRect)a3
{
  VSCircularProgressView *v3;
  VSCircularProgressView *v4;
  uint64_t v5;
  UIColor *progressFillColor;
  uint64_t v7;
  UIColor *progressBgColor;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)VSCircularProgressView;
  v3 = -[VSCircularProgressView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_progressWidth = 2.0;
    v3->_indeterminateWidth = 2.0;
    v3->_centerSquareWidth = 8.0;
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v5 = objc_claimAutoreleasedReturnValue();
    progressFillColor = v4->_progressFillColor;
    v4->_progressFillColor = (UIColor *)v5;

    objc_msgSend(MEMORY[0x24BDF6950], "systemLightGrayColor");
    v7 = objc_claimAutoreleasedReturnValue();
    progressBgColor = v4->_progressBgColor;
    v4->_progressBgColor = (UIColor *)v7;

    -[VSCircularProgressView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel__applicationWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);

    v14[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)-[VSCircularProgressView registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v10, &__block_literal_global_21);

  }
  return v4;
}

void __40__VSCircularProgressView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  objc_initWeak(&location, v6);
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__VSCircularProgressView_initWithFrame___block_invoke_2;
  v8[3] = &unk_24FE1A3F0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "performAsCurrentTraitCollection:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __40__VSCircularProgressView_initWithFrame___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "indeterminateLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "tintColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "setStrokeColor:", objc_msgSend(v2, "CGColor"));

  objc_msgSend(WeakRetained, "centerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "progressFillColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  objc_msgSend(WeakRetained, "progressLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "progressFillColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

  objc_msgSend(WeakRetained, "progressBackgroundLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "progressBgColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v8, "CGColor"));

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VSCircularProgressView;
  -[VSCircularProgressView dealloc](&v4, sel_dealloc);
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
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  id v50;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)VSCircularProgressView;
  -[VSCircularProgressView layoutSubviews](&v51, sel_layoutSubviews);
  -[VSCircularProgressView progressLayer](self, "progressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VSCircularProgressView _progressFrame](self, "_progressFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[VSCircularProgressView progressLayer](self, "progressLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    -[VSCircularProgressView progressBackgroundLayer](self, "progressBackgroundLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

    -[VSCircularProgressView progressLayer](self, "progressLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCircularProgressView _progressPath](self, "_progressPath");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setPath:", objc_msgSend(v15, "CGPath"));

    -[VSCircularProgressView progressBackgroundLayer](self, "progressBackgroundLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCircularProgressView _progressPath](self, "_progressPath");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v16, "setPath:", objc_msgSend(v17, "CGPath"));

    -[VSCircularProgressView centerSquareWidth](self, "centerSquareWidth");
    v19 = v18;
    -[VSCircularProgressView centerSquareWidth](self, "centerSquareWidth");
    v21 = v20;
    -[VSCircularProgressView bounds](self, "bounds");
    v23 = v22;
    -[VSCircularProgressView centerSquareWidth](self, "centerSquareWidth");
    v25 = (v23 - v24) * 0.5;
    -[VSCircularProgressView bounds](self, "bounds");
    v27 = v26;
    -[VSCircularProgressView centerSquareWidth](self, "centerSquareWidth");
    v29 = (v27 - v28) * 0.5;
    -[VSCircularProgressView centerLayer](self, "centerLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v25, v29, v19, v21);

  }
  -[VSCircularProgressView indeterminateLayer](self, "indeterminateLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[VSCircularProgressView indeterminateWidth](self, "indeterminateWidth");
    UIEdgeInsetsMakeWithEdges();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    -[VSCircularProgressView bounds](self, "bounds");
    v41 = v35 + v40;
    v43 = v33 + v42;
    v45 = v44 - (v35 + v39);
    v47 = v46 - (v33 + v37);
    -[VSCircularProgressView indeterminateLayer](self, "indeterminateLayer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

    -[VSCircularProgressView indeterminateLayer](self, "indeterminateLayer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCircularProgressView _indeterminatePath](self, "_indeterminatePath");
    v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v49, "setPath:", objc_msgSend(v50, "CGPath"));

  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSCircularProgressView;
  -[VSCircularProgressView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[VSCircularProgressView _configureProgress:](self, "_configureProgress:", -[VSCircularProgressView isIndeterminate](self, "isIndeterminate"));
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  if (-[VSCircularProgressView isIndeterminate](self, "isIndeterminate"))
  {
    -[VSCircularProgressView tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCircularProgressView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resolvedColorWithTraitCollection:", v4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");

    -[VSCircularProgressView indeterminateLayer](self, "indeterminateLayer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStrokeColor:", v6);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
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
    if (-[VSCircularProgressView _isInAWindow](self, "_isInAWindow"))
      -[VSCircularProgressView _configureProgress:](self, "_configureProgress:", v3);
    -[VSCircularProgressView setNeedsLayout](self, "setNeedsLayout");
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
    -[VSCircularProgressView progressLayer](self, "progressLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[VSCircularProgressView _addProgressLayer](self, "_addProgressLayer");
    v6 = 1.0;
    if (a3 <= 0.99)
    {
      if (a3 <= 0.0)
        v6 = 0.0;
      else
        v6 = a3;
    }
    -[VSCircularProgressView progressLayer](self, "progressLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStrokeEnd:", v6);

    -[VSCircularProgressView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setProgressFillColor:(id)a3
{
  UIColor *v5;
  void *v6;
  _QWORD v7[4];
  UIColor *v8;
  id v9;
  id location;

  v5 = (UIColor *)a3;
  if (self->_progressFillColor != v5)
  {
    objc_storeStrong((id *)&self->_progressFillColor, a3);
    objc_initWeak(&location, self);
    -[VSCircularProgressView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__VSCircularProgressView_setProgressFillColor___block_invoke;
    v7[3] = &unk_24FE19B80;
    objc_copyWeak(&v9, &location);
    v8 = v5;
    objc_msgSend(v6, "performAsCurrentTraitCollection:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __47__VSCircularProgressView_setProgressFillColor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "centerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));

  objc_msgSend(WeakRetained, "progressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));

}

- (void)setProgressBgColor:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  UIColor *v8;

  v8 = (UIColor *)a3;
  if (self->_progressBgColor != v8)
  {
    objc_storeStrong((id *)&self->_progressBgColor, a3);
    -[VSCircularProgressView progressBackgroundLayer](self, "progressBackgroundLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCircularProgressView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColor resolvedColorWithTraitCollection:](v8, "resolvedColorWithTraitCollection:", v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

  }
}

- (void)_configureProgress:(BOOL)a3
{
  if (a3)
  {
    -[VSCircularProgressView _addIndeterminateLayer](self, "_addIndeterminateLayer");
    -[VSCircularProgressView _removeProgressLayer](self, "_removeProgressLayer");
    -[VSCircularProgressView _startIndeterminateAnimation](self, "_startIndeterminateAnimation");
  }
  else
  {
    -[VSCircularProgressView _removeIndeterminateLayer](self, "_removeIndeterminateLayer");
    -[VSCircularProgressView _addProgressLayer](self, "_addProgressLayer");
  }
  -[VSCircularProgressView setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)_progressFrame
{
  double v3;
  double v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[VSCircularProgressView progressWidth](self, "progressWidth");
  UIEdgeInsetsMakeWithEdges();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VSCircularProgressView bounds](self, "bounds");
  v12 = v6 + v11;
  v14 = v4 + v13;
  v16 = v15 - (v6 + v10);
  v18 = v17 - (v4 + v8);
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v12;
  return result;
}

- (id)_progressPath
{
  double v2;
  double v3;

  -[VSCircularProgressView _progressFrame](self, "_progressFrame");
  return (id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v2 * 0.5, v3 * 0.5, v3 * 0.5, -1.57079633, 4.71238898);
}

- (void)_addProgressLayer
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  -[VSCircularProgressView progressLayer](self, "progressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDE5758]);
    objc_msgSend(v4, "setCornerRadius:", 1.5);
    -[VSCircularProgressView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSublayer:", v4);

    -[VSCircularProgressView setCenterLayer:](self, "setCenterLayer:", v4);
    v6 = objc_alloc_init(MEMORY[0x24BDE5758]);
    -[VSCircularProgressView progressWidth](self, "progressWidth");
    objc_msgSend(v6, "setLineWidth:");
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

    -[VSCircularProgressView _progressPath](self, "_progressPath");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setPath:", objc_msgSend(v8, "CGPath"));

    -[VSCircularProgressView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", v6);

    -[VSCircularProgressView setProgressBackgroundLayer:](self, "setProgressBackgroundLayer:", v6);
    v10 = objc_alloc_init(MEMORY[0x24BDE5758]);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    -[VSCircularProgressView progressWidth](self, "progressWidth");
    objc_msgSend(v10, "setLineWidth:");
    objc_msgSend(v10, "setLineCap:", *MEMORY[0x24BDE5CE8]);
    -[VSCircularProgressView _progressPath](self, "_progressPath");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setPath:", objc_msgSend(v12, "CGPath"));

    objc_msgSend(v10, "setStrokeEnd:", 0.0);
    -[VSCircularProgressView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v10);

    -[VSCircularProgressView setProgressLayer:](self, "setProgressLayer:", v10);
    objc_initWeak(&location, self);
    -[VSCircularProgressView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __43__VSCircularProgressView__addProgressLayer__block_invoke;
    v18[3] = &unk_24FE1B0D0;
    objc_copyWeak(&v22, &location);
    v15 = v4;
    v19 = v15;
    v16 = v6;
    v20 = v16;
    v17 = v10;
    v21 = v17;
    objc_msgSend(v14, "performAsCurrentTraitCollection:", v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
}

void __43__VSCircularProgressView__addProgressLayer__block_invoke(uint64_t a1)
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

  -[VSCircularProgressView progressLayer](self, "progressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  -[VSCircularProgressView setProgressLayer:](self, "setProgressLayer:", 0);
  -[VSCircularProgressView progressBackgroundLayer](self, "progressBackgroundLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[VSCircularProgressView setProgressBackgroundLayer:](self, "setProgressBackgroundLayer:", 0);
  -[VSCircularProgressView centerLayer](self, "centerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperlayer");

  -[VSCircularProgressView setCenterLayer:](self, "setCenterLayer:", 0);
}

- (id)_indeterminatePath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[VSCircularProgressView indeterminateWidth](self, "indeterminateWidth");
  UIEdgeInsetsMakeWithEdges();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VSCircularProgressView bounds](self, "bounds");
  return (id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, (v11 - (v6 + v10)) * 0.5, (v12 - (v4 + v8)) * 0.5, (v12 - (v4 + v8)) * 0.5, -1.57079633, 3.53429174);
}

- (void)_addIndeterminateLayer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  -[VSCircularProgressView indeterminateLayer](self, "indeterminateLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDE5758]);
    -[VSCircularProgressView tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCircularProgressView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolvedColorWithTraitCollection:", v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");

    objc_msgSend(v11, "setStrokeColor:", v7);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "setFillColor:", objc_msgSend(v8, "CGColor"));

    -[VSCircularProgressView indeterminateWidth](self, "indeterminateWidth");
    objc_msgSend(v11, "setLineWidth:");
    objc_msgSend(v11, "setLineCap:", *MEMORY[0x24BDE5CE8]);
    -[VSCircularProgressView _indeterminatePath](self, "_indeterminatePath");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "setPath:", objc_msgSend(v9, "CGPath"));

    -[VSCircularProgressView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", v11);

    -[VSCircularProgressView setIndeterminateLayer:](self, "setIndeterminateLayer:", v11);
  }
}

- (void)_startIndeterminateAnimation
{
  double v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", &unk_24FE3CF70);
  objc_msgSend(v5, "setDuration:", 1.0);
  LODWORD(v3) = 2139095040;
  objc_msgSend(v5, "setRepeatCount:", v3);
  -[VSCircularProgressView indeterminateLayer](self, "indeterminateLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("indeterminateAnimation"));

}

- (void)_removeIndeterminateLayer
{
  void *v3;

  -[VSCircularProgressView indeterminateLayer](self, "indeterminateLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  -[VSCircularProgressView setIndeterminateLayer:](self, "setIndeterminateLayer:", 0);
}

- (void)_applicationWillEnterForeground:(id)a3
{
  void *v4;
  id v5;

  -[VSCircularProgressView indeterminateLayer](self, "indeterminateLayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationForKey:", CFSTR("indeterminateAnimation"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5 && -[VSCircularProgressView isIndeterminate](self, "isIndeterminate"))
    -[VSCircularProgressView _startIndeterminateAnimation](self, "_startIndeterminateAnimation");

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

- (double)progressWidth
{
  return self->_progressWidth;
}

- (void)setProgressWidth:(double)a3
{
  self->_progressWidth = a3;
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
