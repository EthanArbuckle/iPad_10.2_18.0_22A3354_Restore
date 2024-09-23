@implementation _TVInspectorCapturingView

- (_TVInspectorCapturingView)initWithFrame:(CGRect)a3
{
  _TVInspectorCapturingView *v3;
  _TVInspectorCapturingView *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_TVInspectorCapturingView;
  v3 = -[_TVInspectorCapturingView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_testingHits = 0;
    -[_TVInspectorCapturingView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVInspectorCapturingView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[_TVInspectorCapturingView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

    -[_TVInspectorCapturingView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderWidth:", 10.0);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v4, sel_didTapView_);
    objc_msgSend(v9, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v9, "setNumberOfTouchesRequired:", 1);
    -[_TVInspectorCapturingView addGestureRecognizer:](v4, "addGestureRecognizer:", v9);

  }
  return v4;
}

- (UILabel)descriptionLabel
{
  UILabel **p_descriptionLabel;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_descriptionLabel = &self->_descriptionLabel;
  WeakRetained = objc_loadWeakRetained((id *)&self->_descriptionLabel);

  if (!WeakRetained)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6B68]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

    objc_msgSend(v6, "setText:", CFSTR("Tap a view to inspect"));
    objc_msgSend(v6, "setTextAlignment:", 1);
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 11.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v9);

    -[_TVInspectorCapturingView addSubview:](self, "addSubview:", v6);
    objc_storeWeak((id *)p_descriptionLabel, v6);

  }
  return (UILabel *)objc_loadWeakRetained((id *)p_descriptionLabel);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double MidX;
  double v22;
  CGRect rect;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = _TVInspectorCapturingView;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  -[_TVInspectorCapturingView descriptionLabel](self, "descriptionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[_TVInspectorCapturingView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_TVInspectorCapturingView descriptionLabel](self, "descriptionLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  rect.origin.x = v13;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[_TVInspectorCapturingView descriptionLabel](self, "descriptionLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  MidX = CGRectGetMidX(v24);
  v25.origin.x = rect.origin.x;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  v22 = MidX - CGRectGetMidX(v25);
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  objc_msgSend(v20, "setFrame:", v22, CGRectGetMaxY(v26) + -10.0 - v19 + -10.0, v17 + 10.0, v19 + 10.0);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  unsigned __int8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVInspectorCapturingView;
  v5 = -[_TVInspectorCapturingView pointInside:withEvent:](&v7, sel_pointInside_withEvent_, a4, a3.x, a3.y);
  return v5 & ~-[_TVInspectorCapturingView isTestingHits](self, "isTestingHits");
}

- (void)didTapView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v4 = a3;
  -[_TVInspectorCapturingView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_TVInspectorCapturingView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootView");
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  self->_testingHits = 1;
  objc_msgSend(v4, "locationInView:", self);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v15, "hitTest:withEvent:", 0, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_testingHits = 0;
  if (v11)
  {
    -[_TVInspectorCapturingView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[_TVInspectorCapturingView delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "capturingView:didCaptureTapOnView:", self, v11);

    }
  }

}

- (BOOL)isTestingHits
{
  return self->_testingHits;
}

- (_TVInspectorCapturingViewDelegate)delegate
{
  return (_TVInspectorCapturingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_descriptionLabel);
}

@end
