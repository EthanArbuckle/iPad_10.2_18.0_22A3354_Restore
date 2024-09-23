@implementation MFArrowControlsView

- (MFArrowControlsView)initWithFrame:(CGRect)a3
{
  MFArrowControlsView *v3;
  uint64_t v4;
  UIButton *upButton;
  uint64_t v6;
  UIButton *downButton;
  UIButton *v8;
  id v9;
  UIButton *v10;
  id v11;
  UIButton *v12;
  id v13;
  void *v14;
  UIButton *v15;
  id v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MFArrowControlsView;
  v3 = -[MFArrowControlsView initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    upButton = v3->_upButton;
    v3->_upButton = (UIButton *)v4;

    -[UIButton setContentMode:](v3->_upButton, "setContentMode:", 4);
    -[UIButton addTarget:action:forControlEvents:](v3->_upButton, "addTarget:action:forControlEvents:", v3, "_arrowButtonWasTapped:", 1);
    -[UIButton setAccessibilityIdentifier:](v3->_upButton, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMessageViewUpArrow);
    -[MFArrowControlsView addSubview:](v3, "addSubview:", v3->_upButton);
    v6 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    downButton = v3->_downButton;
    v3->_downButton = (UIButton *)v6;

    -[UIButton setContentMode:](v3->_downButton, "setContentMode:", 4);
    -[UIButton addTarget:action:forControlEvents:](v3->_downButton, "addTarget:action:forControlEvents:", v3, "_arrowButtonWasTapped:", 1);
    -[UIButton setAccessibilityIdentifier:](v3->_downButton, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMessageViewDownArrow);
    -[MFArrowControlsView addSubview:](v3, "addSubview:", v3->_downButton);
    -[MFArrowControlsView setBounds:](v3, "setBounds:", 0.0, 0.0, 0.0, 44.0);
    -[MFArrowControlsView setAutoresizingMask:](v3, "setAutoresizingMask:", 56);
    v8 = v3->_upButton;
    v9 = objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", v3);
    -[UIButton addInteraction:](v8, "addInteraction:", v9);

    v10 = v3->_downButton;
    v11 = objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", v3);
    -[UIButton addInteraction:](v10, "addInteraction:", v11);

    v12 = v3->_upButton;
    v13 = sub_100146464(-1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[UIButton setImage:forState:](v12, "setImage:forState:", v14, 0);

    -[UIButton sizeToFit](v3->_upButton, "sizeToFit");
    v15 = v3->_downButton;
    v16 = sub_100146464(1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[UIButton setImage:forState:](v15, "setImage:forState:", v17, 0);

    -[UIButton sizeToFit](v3->_downButton, "sizeToFit");
  }
  return v3;
}

- (void)_arrowButtonWasTapped:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  UIButton *v6;

  v6 = (UIButton *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "arrowControlsView:didTapButtonWithDirection:") & 1) != 0)
  {
    if (self->_upButton == v6)
      v5 = 0xFFFFFFFFLL;
    else
      v5 = 1;
    objc_msgSend(WeakRetained, "arrowControlsView:didTapButtonWithDirection:", self, v5);
  }

}

- (void)setFrame:(CGRect)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double MaxX;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  objc_super v40;
  CGRect v41;

  y = a3.origin.y;
  x = a3.origin.x;
  -[UIButton frame](self->_upButton, "frame", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton imageView](self->_upButton, "imageView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "image"));
  objc_msgSend(v11, "size");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton imageView](self->_upButton, "imageView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "image"));
  objc_msgSend(v15, "size");
  v17 = v16 + 24.0;

  -[UIButton setFrame:](self->_upButton, "setFrame:", v7, v9, v13 + 16.0, v17);
  -[UIButton frame](self->_downButton, "frame");
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton imageView](self->_downButton, "imageView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "image"));
  objc_msgSend(v21, "size");
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton imageView](self->_downButton, "imageView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "image"));
  objc_msgSend(v25, "size");
  v26 = v23 + 16.0;
  v28 = v27 + 24.0;

  -[UIButton frame](self->_upButton, "frame");
  MaxX = CGRectGetMaxX(v41);
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
    v30 = 18.0;
  else
    v30 = 20.0;
  -[UIButton setFrame:](self->_downButton, "setFrame:", MaxX + v30 + -16.0, v19, v26, v28);
  -[UIButton frame](self->_upButton, "frame");
  v32 = v31;
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
    v33 = 18.0;
  else
    v33 = 20.0;
  v34 = v32 + v33;
  -[UIButton frame](self->_downButton, "frame");
  v36 = v34 + v35 + -24.0;
  -[UIButton frame](self->_upButton, "frame");
  v38 = v37;
  -[UIButton frame](self->_downButton, "frame");
  if (v38 >= v39)
    v39 = v38;
  v40.receiver = self;
  v40.super_class = (Class)MFArrowControlsView;
  -[MFArrowControlsView setFrame:](&v40, "setFrame:", x, y, v36, v39);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  UIButton *v18;
  UIButton *v19;
  CGPoint v21;
  CGPoint v22;
  CGRect v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  -[UIButton frame](self->_downButton, "frame", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIButton frame](self->_upButton, "frame");
  v23.origin.x = v15 + -10.0;
  v23.size.width = v16 + 10.0;
  v21.x = x;
  v21.y = y;
  v17 = v12 + 10.0;
  if (CGRectContainsPoint(v23, v21))
    v18 = self->_upButton;
  else
    v18 = 0;
  v24.origin.x = v8;
  v24.origin.y = v10;
  v24.size.width = v17;
  v24.size.height = v14;
  v22.x = x;
  v22.y = y;
  if (CGRectContainsPoint(v24, v22))
  {
    v19 = self->_downButton;

    v18 = v19;
  }
  return v18;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v8 = objc_opt_class(UIButton);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0 && objc_msgSend(v7, "isEnabled"))
    v9 = v6;
  else
    v9 = 0;

  return v9;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)UITargetedPreview);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v7 = objc_msgSend(v5, "initWithView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerEffect effectWithPreview:](UIPointerEffect, "effectWithPreview:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v8, 0));
  return v9;
}

- (MFArrowControlsViewDelegate)delegate
{
  return (MFArrowControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)downButton
{
  return self->_downButton;
}

- (UIButton)upButton
{
  return self->_upButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upButton, 0);
  objc_storeStrong((id *)&self->_downButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
