@implementation CarStatusBannerOverlay

- (CarStatusBannerOverlay)initWithChromeViewController:(id)a3
{
  id v4;
  CarStatusBannerOverlay *v5;
  CarStatusBannerOverlay *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarStatusBannerOverlay;
  v5 = -[CarStatusBannerOverlay init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_chromeVC, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CarStatusBannerOverlay setContentView:layoutGuide:](self, "setContentView:layoutGuide:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)CarStatusBannerOverlay;
  -[CarStatusBannerOverlay dealloc](&v3, "dealloc");
}

- (void)setHost:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_host, v4);
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "overlayContentView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutGuideForOverlay:", self));
      -[CarStatusBannerOverlay setContentView:layoutGuide:](self, "setContentView:layoutGuide:", v6, v7);

      if (!self->_titleLabel)
      {
        v8 = sub_10043364C();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set up constraints for status stackView as it was nil at the time.", v10, 2u);
        }

      }
    }
    else
    {
      -[CarStatusBannerOverlay setContentView:layoutGuide:](self, "setContentView:layoutGuide:", 0, 0);
    }
  }

}

- (void)setContentView:(id)a3 layoutGuide:(id)a4
{
  id v6;
  id v7;
  id v8;
  CarStatusBannerLabel *titleLabel;
  id v10;
  NSObject *v11;
  UIView *v12;
  UIView *containerView;
  CarStatusBannerLabel *v14;
  id WeakRetained;
  CarStatusBannerLabel *v16;
  CarStatusBannerLabel *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *heightConstraint;
  id v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *leadingConstraint;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *v33;
  void *v34;
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
  id v51;
  id v52;
  uint8_t buf[16];
  _QWORD v54[6];

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel superview](self->_titleLabel, "superview"));
  if (v8 != v6)
  {
    -[CarStatusBannerLabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    titleLabel = self->_titleLabel;
    self->_titleLabel = 0;

    if (v6)
    {
      v50 = v8;
      v10 = sub_10043364C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Will create new status views container view", buf, 2u);
      }

      v12 = (UIView *)objc_alloc_init((Class)UIView);
      containerView = self->_containerView;
      self->_containerView = v12;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView setUserInteractionEnabled:](self->_containerView, "setUserInteractionEnabled:", 1);
      -[UIView setAlpha:](self->_containerView, "setAlpha:", 0.0);
      objc_msgSend(v6, "addSubview:", self->_containerView);
      v14 = [CarStatusBannerLabel alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_chromeVC);
      v16 = -[CarStatusBannerLabel initWithChromeViewController:](v14, "initWithChromeViewController:", WeakRetained);
      v17 = self->_titleLabel;
      self->_titleLabel = v16;

      -[CarStatusBannerLabel setHidden:](self->_titleLabel, "setHidden:", 1);
      -[CarStatusBannerLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CarStatusBannerLabel addTarget:action:forControlEvents:](self->_titleLabel, "addTarget:action:forControlEvents:", self, "_tappedLabel", 64);
      -[CarStatusBannerLabel setUserInteractionEnabled:](self->_titleLabel, "setUserInteractionEnabled:", 1);
      objc_msgSend(v6, "addSubview:", self->_titleLabel);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_containerView, "heightAnchor"));
      v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 0.0));
      heightConstraint = self->_heightConstraint;
      self->_heightConstraint = v19;

      v21 = objc_loadWeakRetained((id *)&self->_chromeVC);
      v22 = objc_msgSend(v21, "sceneType");

      v52 = v6;
      if (v22 == (id)1)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_leftRHDAnchor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_leftRHDAnchor](self->_containerView, "_maps_leftRHDAnchor"));
        LODWORD(v25) = 1148846080;
        v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v24, 0, -8.0, v25));
        leadingConstraint = self->_leadingConstraint;
        self->_leadingConstraint = v26;
      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
        v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
        v31 = self->_leadingConstraint;
        self->_leadingConstraint = v30;

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
        v32 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
        leadingConstraint = self->_trailingConstraint;
        self->_trailingConstraint = v32;
      }

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 2.5));
      v54[0] = v47;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, -2.5));
      v33 = self->_heightConstraint;
      v54[1] = v44;
      v54[2] = v33;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v34));
      v54[3] = v35;
      v51 = v7;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
      v54[4] = v38;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerLabel centerYAnchor](self->_titleLabel, "centerYAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_containerView, "centerYAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
      v54[5] = v41;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 6));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);

      v7 = v51;
      -[NSLayoutConstraint setActive:](self->_leadingConstraint, "setActive:", 1);
      -[NSLayoutConstraint setActive:](self->_trailingConstraint, "setActive:", 1);
      -[CarStatusBannerOverlay reloadAnimated:](self, "reloadAnimated:", 0);
      v6 = v52;
      v8 = v50;
    }
  }

}

- (void)reloadAnimated:(BOOL)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  if (self->_titleLabel)
  {
    -[CarStatusBannerOverlay _reloadContent](self, "_reloadContent", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarStatusBannerOverlay host](self, "host"));
    objc_msgSend(v6, "setCollisionConstraintsEnabled:forOverlay:", -[CarStatusBannerOverlay isHidden](self, "isHidden"), self);

  }
  else
  {
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will not reload status views, overlay not active", buf, 2u);
    }

  }
}

- (BOOL)isHidden
{
  double v2;

  -[CarStatusBannerLabel alpha](self->_titleLabel, "alpha");
  return v2 == 0.0;
}

- (void)setHidden:(BOOL)a3
{
  -[CarStatusBannerOverlay setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  int v4;
  id v6;
  NSObject *v7;
  CarStatusBannerOverlay *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  int v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  double v19;
  unsigned int v20;
  _QWORD v21[5];
  char v22;
  uint8_t buf[4];
  const __CFString *v24;

  if (!self->_titleLabel)
    return;
  v4 = a3;
  if (!a4)
    goto LABEL_12;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_11:

LABEL_12:
      v15 = 0;
      goto LABEL_14;
    }
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarStatusBannerOverlay performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

    *(_DWORD *)buf = 138543362;
    v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Reduce motion enabled, running status view update without animation", buf, 0xCu);

    goto LABEL_11;
  }
  v15 = 1;
LABEL_14:
  if (-[CarStatusBannerLabel isHidden](self->_titleLabel, "isHidden") != v4)
  {
    v16 = sub_10043364C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = CFSTR("show");
      if (v4)
        v18 = CFSTR("hide");
      *(_DWORD *)buf = 138412290;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Will %@ status view", buf, 0xCu);
    }

    v19 = 0.0;
    if (v15)
    {
      v20 = +[UIView _maps_shouldAdoptImplicitAnimationParameters](UIView, "_maps_shouldAdoptImplicitAnimationParameters", 0.0);
      v19 = 0.1;
      if (v20)
        v19 = 0.0;
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002C8EAC;
    v21[3] = &unk_1011ACE58;
    v21[4] = self;
    v22 = v4;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v21, 0, v19, 0.0);
  }
}

- (void)_tappedLabel
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarStatusBannerOverlay delegate](self, "delegate"));
  objc_msgSend(v2, "carStatusBannerDidTapBanner");

}

- (void)_reloadContent
{
  -[CarStatusBannerLabel reloadContent](self->_titleLabel, "reloadContent");
}

- (NSArray)focusOrderSubItems
{
  void *v3;
  CarStatusBannerLabel *titleLabel;

  if (-[CarStatusBannerLabel isEnabled](self->_titleLabel, "isEnabled"))
  {
    titleLabel = self->_titleLabel;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &titleLabel, 1));
  }
  else
  {
    v3 = &__NSArray0__struct;
  }
  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  CarStatusBannerLabel *titleLabel;

  if (-[CarStatusBannerLabel isEnabled](self->_titleLabel, "isEnabled"))
  {
    titleLabel = self->_titleLabel;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &titleLabel, 1));
  }
  else
  {
    v3 = &__NSArray0__struct;
  }
  return (NSArray *)v3;
}

- (ChromeOverlayHosting)host
{
  return (ChromeOverlayHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (CarStatusBannerDelegate)delegate
{
  return (CarStatusBannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_host);
  objc_destroyWeak((id *)&self->_chromeVC);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
