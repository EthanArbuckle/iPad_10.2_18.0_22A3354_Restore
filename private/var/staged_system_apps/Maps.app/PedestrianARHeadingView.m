@implementation PedestrianARHeadingView

- (PedestrianARHeadingView)initWithDataSource:(id)a3
{
  id v4;
  PedestrianARHeadingView *v5;
  PedestrianARHeadingView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  char *v32;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  void *v36;
  void *v37;
  id v38;
  objc_super v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const char *v49;

  v4 = a3;
  if (!v4)
  {
    v28 = sub_1004318FC();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v43 = "-[PedestrianARHeadingView initWithDataSource:]";
      v44 = 2080;
      v45 = "PedestrianARHeadingView.m";
      v46 = 1024;
      v47 = 31;
      v48 = 2080;
      v49 = "dataSource != nil";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v30 = sub_1004318FC();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v43 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)PedestrianARHeadingView;
  v5 = -[PedestrianARHeadingView initWithFrame:](&v39, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    -[PedestrianARHeadingView setAlpha:](v6, "setAlpha:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView textLabel](v6, "textLabel"));
    -[PedestrianARHeadingView addSubview:](v6, "addSubview:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView imageView](v6, "imageView"));
    -[PedestrianARHeadingView addSubview:](v6, "addSubview:", v8);

    v35 = objc_opt_new(NSMutableArray);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView imageView](v6, "imageView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerYAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView textLabel](v6, "textLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerYAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v9));
    v41[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView imageView](v6, "imageView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rightAnchor"));
    v38 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView textLabel](v6, "textLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leftAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -10.0));
    v41[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2));
    -[NSMutableArray addObjectsFromArray:](v35, "addObjectsFromArray:", v16);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView textLabel](v6, "textLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerXAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView centerXAnchor](v6, "centerXAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    v40[0] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView textLabel](v6, "textLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerYAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView centerYAnchor](v6, "centerYAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    v40[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
    -[NSMutableArray addObjectsFromArray:](v35, "addObjectsFromArray:", v24);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "colorWithAlphaComponent:", 0.800000012));
    -[PedestrianARHeadingView setBackgroundColor:](v6, "setBackgroundColor:", v26);

    v4 = v38;
  }

  return v6;
}

- (BOOL)isVisible
{
  BOOL v3;
  void *v4;
  void *v5;

  if ((-[PedestrianARHeadingView isHidden](self, "isHidden") & 1) != 0)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView textLabel](self, "textLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v3 = v5 != 0;

  return v3;
}

- (UILabel)textLabel
{
  UILabel *textLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;

  textLabel = self->_textLabel;
  if (!textLabel)
  {
    v4 = objc_opt_new(UILabel);
    v5 = self->_textLabel;
    self->_textLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v6);

    -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
    -[UILabel setFont:](self->_textLabel, "setFont:", v7);

    -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", 1);
    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (UIImageView)imageView
{
  UIImageView *imageView;
  UIImageView *v4;
  UIImageView *v5;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = objc_opt_new(UIImageView);
    v5 = self->_imageView;
    self->_imageView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 4);
    -[UIImageView setAlpha:](self->_imageView, "setAlpha:", 0.0);
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)redraw
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView textLabel](self, "textLabel"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView dataSource](self, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textForDisplayInHeadingView:", self));

  if (objc_msgSend(v6, "length") && !objc_msgSend(v5, "length"))
  {
    -[PedestrianARHeadingView updateFadeTransitionToHide](self, "updateFadeTransitionToHide");
LABEL_11:
    -[PedestrianARHeadingView transitionFromText:toText:](self, "transitionFromText:toText:", v6, v5);
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "length") && !objc_msgSend(v6, "length"))
  {
    -[PedestrianARHeadingView updateFadeTransitionToShow](self, "updateFadeTransitionToShow");
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "length")
    && objc_msgSend(v5, "length")
    && (objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {
    goto LABEL_11;
  }
LABEL_12:

}

- (void)transitionFromText:(id)a3 toText:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageForDisplayInHeadingView:", self));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView imageView](self, "imageView"));
  objc_msgSend(v8, "setImage:", v7);

  -[PedestrianARHeadingView layoutIfNeeded](self, "layoutIfNeeded");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](CATransition, "animation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(v9, "setTimingFunction:", v10);

  objc_msgSend(v9, "setType:", kCATransitionFade);
  objc_msgSend(v9, "setDuration:", 0.4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView textLabel](self, "textLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  objc_msgSend(v12, "addAnimation:forKey:", v9, CFSTR("PedestrianARTextTransitionAnimationKey"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARHeadingView textLabel](self, "textLabel"));
  objc_msgSend(v13, "setText:", v5);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100BE6468;
  v14[3] = &unk_1011AC860;
  v14[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v14, 0, 0.4, 0.0);

}

- (void)updateFadeTransitionToHide
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100BE6558;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v2, 0, 0.4, 0.0);
}

- (void)updateFadeTransitionToShow
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100BE65D4;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v2, 0, 0.4, 0.0);
}

- (PedestrianARHeadingViewDataSource)dataSource
{
  return (PedestrianARHeadingViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
