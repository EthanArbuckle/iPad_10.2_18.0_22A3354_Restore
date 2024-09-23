@implementation UISwipeActionCircularButton

- (UISwipeActionCircularButton)initWithFrame:(CGRect)a3
{
  UISwipeActionCircularButton *v3;
  UIView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UISwipeActionCircularButton;
  v3 = -[UISwipeActionButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 48.0, 48.0);
    -[UISwipeActionButton setBackgroundView:](v3, "setBackgroundView:", v4);

    -[UISwipeActionButton visualStyle](v3, "visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultButtonBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwipeActionButton backgroundView](v3, "backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[UISwipeActionButton backgroundView](v3, "backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 24.0);

    -[UISwipeActionButton backgroundView](v3, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsEdgeAntialiasing:", 1);

    -[UISwipeActionButton backgroundView](v3, "backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v3, "addSubview:", v12);

  }
  return v3;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
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
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)UISwipeActionCircularButton;
  -[UIButton layoutSubviews](&v56, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UISwipeActionButton _allowableContentRectForContentRect:](self, "_allowableContentRectForContentRect:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UISwipeActionButton backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = UIRectCenteredIntegralRectScale(v13, v15, v17, v19, v4, v6, v8, v10, 0.0);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[UISwipeActionButton backgroundView](self, "backgroundView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  -[UISwipeActionButton backgroundView](self, "backgroundView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", v28);

  -[UIButton imageView](self, "imageView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sizeToFit");

  -[UIButton imageView](self, "imageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "frame");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  if (v38 >= 33.9411255 || v36 >= 33.9411255)
  {
    if (v38 >= v36)
      v47 = v38;
    else
      v47 = v36;
    v48 = UIRectCenteredIntegralRectScale(v32, v34, v36 * (33.9411255 / v47), v38 * (33.9411255 / v47), v4, v6, v8, v10, 0.0);
    v50 = v49;
    v52 = v51;
    v54 = v53;
    -[UIButton imageView](self, "imageView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

    -[UIButton imageView](self, "imageView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setContentMode:", 1);
  }
  else
  {
    v39 = UIRectCenteredIntegralRectScale(v32, v34, v36, v38, v4, v6, v8, v10, 0.0);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    -[UIButton imageView](self, "imageView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);
  }

}

+ (double)defaultButtonWidth
{
  return 69.0;
}

+ (double)maximumButtonHeight
{
  return 100.0;
}

+ (id)titleFont
{
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 13.0, *(double *)off_1E167DC68);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISwipeActionCircularButton;
  v4 = a3;
  -[UISwipeActionButton setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[UIButton setTitleColor:forState:](self, "setTitleColor:forState:", v4, 0, v5.receiver, v5.super_class);

}

@end
