@implementation BKActivityIndicatorOverlayView

- (BKActivityIndicatorOverlayView)initWithBackgroundColor:(id)a3 foregroundColor:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  BKActivityIndicatorOverlayView *v25;
  BKActivityIndicatorOverlayView *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  objc_super v49;
  _QWORD v50[6];
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setColor:", v7);

  objc_msgSend(v8, "startAnimating");
  objc_msgSend(v8, "setHidesWhenStopped:", 0);
  objc_msgSend(v8, "sizeToFit");
  v9 = objc_msgSend(v8, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = CGRectMultiply(v9);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v49.receiver = self;
  v49.super_class = (Class)BKActivityIndicatorOverlayView;
  v25 = -[BKActivityIndicatorOverlayView initWithFrame:](&v49, "initWithFrame:");
  v26 = v25;
  if (v25)
  {
    -[BKActivityIndicatorOverlayView setAutoresizingMask:](v25, "setAutoresizingMask:", 45);
    -[BKActivityIndicatorOverlayView setBackgroundColor:](v26, "setBackgroundColor:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityIndicatorOverlayView layer](v26, "layer"));
    objc_msgSend(v27, "setCornerRadius:", 10.0);

    -[BKActivityIndicatorOverlayView setUserInteractionEnabled:](v26, "setUserInteractionEnabled:", 0);
    -[BKActivityIndicatorOverlayView setAlpha:](v26, "setAlpha:", 0.0);
    objc_storeStrong((id *)&v26->_activityIndicator, v8);
    -[BKActivityIndicatorOverlayView addSubview:](v26, "addSubview:", v26->_activityIndicator);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView widthAnchor](v26->_activityIndicator, "widthAnchor"));
    v51.origin.x = v11;
    v51.origin.y = v13;
    v51.size.width = v15;
    v51.size.height = v17;
    v28 = objc_msgSend(v47, "constraintEqualToConstant:", CGRectGetWidth(v51));
    v46 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v50[0] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView heightAnchor](v26->_activityIndicator, "heightAnchor"));
    v52.origin.x = v11;
    v52.origin.y = v13;
    v52.size.width = v15;
    v52.size.height = v17;
    v29 = objc_msgSend(v45, "constraintEqualToConstant:", CGRectGetHeight(v52));
    v44 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v50[1] = v44;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityIndicatorOverlayView widthAnchor](v26, "widthAnchor"));
    v53.origin.x = v18;
    v53.origin.y = v20;
    v53.size.width = v22;
    v53.size.height = v24;
    v30 = objc_msgSend(v43, "constraintEqualToConstant:", CGRectGetWidth(v53));
    v42 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v50[2] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityIndicatorOverlayView heightAnchor](v26, "heightAnchor"));
    v54.origin.x = v18;
    v54.origin.y = v20;
    v54.size.width = v22;
    v54.size.height = v24;
    v31 = objc_msgSend(v41, "constraintEqualToConstant:", CGRectGetHeight(v54));
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v50[3] = v32;
    v48 = v6;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](v26->_activityIndicator, "centerXAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityIndicatorOverlayView centerXAnchor](v26, "centerXAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
    v50[4] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](v26->_activityIndicator, "centerYAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityIndicatorOverlayView centerYAnchor](v26, "centerYAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
    v50[5] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v39);

    v6 = v48;
  }

  return v26;
}

- (void)setAlpha:(double)a3
{
  UIActivityIndicatorView *activityIndicator;
  objc_super v6;

  activityIndicator = self->_activityIndicator;
  if (a3 <= 0.0)
    -[UIActivityIndicatorView stopAnimating](activityIndicator, "stopAnimating");
  else
    -[UIActivityIndicatorView startAnimating](activityIndicator, "startAnimating");
  v6.receiver = self;
  v6.super_class = (Class)BKActivityIndicatorOverlayView;
  -[BKActivityIndicatorOverlayView setAlpha:](&v6, "setAlpha:", a3);
}

- (void)_setAlpha:(double)a3 animated:(BOOL)a4 animationDelay:(double)a5
{
  _BOOL4 v6;
  _QWORD *v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[4];
  _QWORD *v13;
  _QWORD v14[6];

  v6 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_71DAC;
  v14[3] = &unk_1C03B0;
  v14[4] = self;
  *(double *)&v14[5] = a3;
  v9 = objc_retainBlock(v14);
  v10 = v9;
  if (v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_71DB8;
    v12[3] = &unk_1BEC70;
    v13 = v9;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_71DC4;
    v11[3] = &unk_1C0740;
    *(double *)&v11[5] = a3;
    v11[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v12, v11, 0.3, a5);

  }
  else
  {
    ((void (*)(_QWORD *))v9[2])(v9);
  }

}

- (void)showIndicatorCenteredInView:(id)a3 animated:(BOOL)a4 animationDelay:(double)a5
{
  _BOOL8 v6;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MidX;
  CGRect v18;
  CGRect v19;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "addSubview:", self);
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v18.origin.x = v10;
  v18.origin.y = v12;
  v18.size.width = v14;
  v18.size.height = v16;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  -[BKActivityIndicatorOverlayView setCenter:](self, "setCenter:", MidX, CGRectGetMidY(v19));
  -[BKActivityIndicatorOverlayView _setAlpha:animated:animationDelay:](self, "_setAlpha:animated:animationDelay:", v6, 1.0, a5);
}

- (void)hideIndicatorAnimated:(BOOL)a3 animationDelay:(double)a4
{
  -[BKActivityIndicatorOverlayView _setAlpha:animated:animationDelay:](self, "_setAlpha:animated:animationDelay:", a3, 0.0, a4);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
