@implementation _UIDebugDot

+ (id)dotWithTitle:(id)a3 color:(id)a4
{
  return +[_UIDebugDot dotWithTitle:color:diameter:](_UIDebugDot, "dotWithTitle:color:diameter:", a3, a4, 10.0);
}

+ (id)dotWithTitle:(id)a3 color:(id)a4 diameter:(double)a5
{
  id v7;
  id v8;
  _UIDebugDot *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _UIDebugDot *v14;
  UIView *v15;
  double v16;
  double v17;
  void *v18;
  UILabel *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  CGRect v29;
  CGRect v30;

  v7 = a4;
  v8 = a3;
  v9 = [_UIDebugDot alloc];
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = -[UIView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
  v15 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, a5, a5);
  -[UIView _setCornerRadius:](v15, "_setCornerRadius:", a5 * 0.5);
  -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v7);
  v16 = *MEMORY[0x1E0C9D538];
  v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIView setCenter:](v15, "setCenter:", *MEMORY[0x1E0C9D538], v17);
  -[UIView layer](v15, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAllowsEdgeAntialiasing:", 1);

  -[UIView addSubview:](v14, "addSubview:", v15);
  v19 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v10, v11, v12, v13);
  -[UILabel setText:](v19, "setText:", v8);

  -[UILabel setTextAlignment:](v19, "setTextAlignment:", 1);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v19, "setTextColor:", v20);

  objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 9.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v19, "setFont:", v21);

  -[UIView layer](v19, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAnchorPoint:", v16, v17);

  -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v7);
  -[UIView sizeToFit](v19, "sizeToFit");
  -[UIView bounds](v19, "bounds");
  v30 = CGRectInset(v29, -3.0, -1.0);
  -[UILabel setBounds:](v19, "setBounds:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  -[UIView setCenter:](v19, "setCenter:", 9.0, 3.0);
  v23 = objc_retainAutorelease(v7);
  v24 = objc_msgSend(v23, "CGColor");

  -[UIView layer](v19, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBorderColor:", v24);

  -[UIView layer](v19, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBorderWidth:", 1.0);

  -[UIView layer](v19, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAllowsEdgeAntialiasing:", 1);

  -[UIView _setContinuousCornerRadius:](v19, "_setContinuousCornerRadius:", 3.0);
  -[UIView setClipsToBounds:](v19, "setClipsToBounds:", 1);
  -[UIView addSubview:](v14, "addSubview:", v19);

  return v14;
}

@end
