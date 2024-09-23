@implementation MessageView

- (MessageView)initWithTitle:(id)a3
{
  id v4;
  double y;
  double width;
  double height;
  MessageView *v8;
  uint64_t v9;
  UIColor *color;
  void *v11;
  id v12;
  void *v13;
  UIVisualEffectView *v14;
  void *v15;
  UIVisualEffectView *visualEffectView;
  UIVisualEffectView *v17;
  UIView *v18;
  void *v19;
  UIView *animationView;
  UIView *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *offsetConstraint;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  objc_super v58;
  _QWORD v59[11];

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)MessageView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[MessageView initWithFrame:](&v58, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("HUD")));
    color = v8->_color;
    v8->_color = (UIColor *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.100000001));
    -[MessageView setBackgroundColor:](v8, "setBackgroundColor:", v11);

    -[MessageView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
    v12 = objc_alloc((Class)UIVisualEffectView);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 7));
    v14 = (UIVisualEffectView *)objc_msgSend(v12, "initWithEffect:", v13);

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MessageView addSubview:](v8, "addSubview:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v14, "layer"));
    objc_msgSend(v15, "setCornerRadius:", 15.0);

    -[UIVisualEffectView setClipsToBounds:](v14, "setClipsToBounds:", 1);
    visualEffectView = v8->_visualEffectView;
    v8->_visualEffectView = v14;
    v17 = v14;

    v18 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v17, "contentView"));
    objc_msgSend(v19, "addSubview:", v18);

    animationView = v8->_animationView;
    v8->_animationView = v18;
    v21 = v18;

    v22 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v17, "contentView"));
    objc_msgSend(v23, "addSubview:", v22);

    objc_msgSend(v22, "setTextAlignment:", 1);
    objc_msgSend(v22, "setAttributedText:", v4);
    objc_msgSend(v22, "setTextColor:", v8->_color);
    objc_msgSend(v22, "setNumberOfLines:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerYAnchor](v17, "centerYAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageView centerYAnchor](v8, "centerYAnchor"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    offsetConstraint = v8->_offsetConstraint;
    v8->_offsetConstraint = (NSLayoutConstraint *)v26;

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerXAnchor](v17, "centerXAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MessageView centerXAnchor](v8, "centerXAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
    v59[0] = v54;
    v59[1] = v8->_offsetConstraint;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView widthAnchor](v17, "widthAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToConstant:", 156.0));
    v59[2] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v21, "centerXAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerXAnchor](v17, "centerXAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
    v59[3] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v21, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v17, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 30.0));
    v59[4] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v21, "heightAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToConstant:", 56.0));
    v59[5] = v44;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v21, "widthAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToConstant:", 60.0));
    v59[6] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](v17, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 16.0));
    v59[7] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](v17, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, -16.0));
    v59[8] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v21, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v28, 16.0));
    v59[9] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v55 = v4;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v17, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -16.0));
    v59[10] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 11));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

    v4 = v55;
  }

  return v8;
}

- (void)layoutSubviews
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)MessageView;
  -[MessageView layoutSubviews](&v7, "layoutSubviews");
  if (!self->_animationStarted)
  {
    -[UIVisualEffectView frame](self->_visualEffectView, "frame");
    if (CGRectGetWidth(v8) != 0.0)
    {
      self->_animationStarted = 1;
      objc_initWeak(&location, self);
      v3 = dispatch_time(0, 100000000);
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_10068E9BC;
      v4[3] = &unk_1011AD260;
      objc_copyWeak(&v5, &location);
      dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

- (void)createAnimation
{
  UIView *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v3 = self->_animationView;
  v27 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView traitCollection](v3, "traitCollection"));
  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v4);

  -[UIView bounds](v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_alloc_init((Class)UIBezierPath);
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  v14 = CGRectGetWidth(v28) * 0.129999995;
  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = v10;
  v29.size.height = v12;
  objc_msgSend(v13, "moveToPoint:", v14, CGRectGetHeight(v29) * 0.5);
  v30.origin.x = v6;
  v30.origin.y = v8;
  v30.size.width = v10;
  v30.size.height = v12;
  v15 = CGRectGetWidth(v30) * 0.449999988;
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  objc_msgSend(v13, "addLineToPoint:", v15, CGRectGetMaxY(v31) * 0.899999976);
  v32.origin.x = v6;
  v32.origin.y = v8;
  v32.size.width = v10;
  v32.size.height = v12;
  v16 = CGRectGetMaxX(v32) * 0.899999976;
  v33.origin.x = v6;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = v12;
  objc_msgSend(v13, "addLineToPoint:", v16, CGRectGetHeight(v33) * 0.100000001);
  v17 = objc_alloc_init((Class)CAShapeLayer);
  v18 = objc_retainAutorelease(v13);
  objc_msgSend(v17, "setPath:", objc_msgSend(v18, "CGPath"));
  objc_msgSend(v17, "setStrokeColor:", -[UIColor CGColor](self->_color, "CGColor"));
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  objc_msgSend(v17, "setFillColor:", objc_msgSend(v19, "CGColor"));

  objc_msgSend(v17, "setLineWidth:", 7.0);
  objc_msgSend(v17, "setLineJoin:", kCALineJoinRound);
  objc_msgSend(v17, "setLineCap:", kCALineCapRound);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3, "layer"));

  objc_msgSend(v20, "addSublayer:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("strokeEnd")));
  LODWORD(v22) = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
  objc_msgSend(v21, "setFromValue:", v23);

  LODWORD(v24) = 1.0;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v24));
  objc_msgSend(v21, "setToValue:", v25);

  objc_msgSend(v21, "setDuration:", 0.349999994);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(v21, "setTimingFunction:", v26);

  objc_msgSend(v17, "addAnimation:forKey:", v21, CFSTR("drawRectStroke"));
  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v27);

}

- (NSLayoutConstraint)offsetConstraint
{
  return self->_offsetConstraint;
}

- (void)setOffsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_offsetConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetConstraint, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
