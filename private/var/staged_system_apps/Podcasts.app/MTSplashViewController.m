@implementation MTSplashViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  dispatch_time_t v5;
  _QWORD block[5];
  objc_super v7;

  v3 = a3;
  -[MTSplashViewController setVisible:](self, "setVisible:", 1);
  v7.receiver = self;
  v7.super_class = (Class)MTSplashViewController;
  -[MTSplashViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = dispatch_time(0, 1500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117824;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  CGFloat Width;
  double v40;
  double Height;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double MinY;
  void *v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  objc_super v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v79.receiver = self;
  v79.super_class = (Class)MTSplashViewController;
  -[MTSplashViewController viewDidLayoutSubviews](&v79, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController spinner](self, "spinner"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController vc](self, "vc"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v78 = v12;

    if (-[MTSplashViewController isHorizontallyCompact](self, "isHorizontallyCompact"))
    {
      v13 = v7 + 15.0;
      v14 = v9 + 0.0;
      v15 = v11 + -30.0;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController vc](self, "vc"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
      v18 = objc_msgSend(v17, "bounds");
      v13 = IMRectCenteredXInRectScale(v18, v7, v9, 256.0, v78, v19, v20, v21, v22, 0.0);
      v14 = v23;
      v15 = v24;
      v78 = v25;

    }
    v74 = v13;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController spinner](self, "spinner"));
    objc_msgSend(v26, "frame");
    v28 = v27;
    v71 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController label](self, "label"));
    objc_msgSend(v35, "frame");
    v76 = v36;
    v77 = v37;

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController label](self, "label"));
    v80.origin.x = v13;
    v80.origin.y = v14;
    v80.size.width = v15;
    v80.size.height = v78;
    Width = CGRectGetWidth(v80);
    v81.origin.y = v14;
    v75 = v14;
    v40 = Width;
    v81.origin.x = v13;
    v81.size.width = v15;
    v81.size.height = v78;
    Height = CGRectGetHeight(v81);
    v82.origin.x = v28;
    v82.origin.y = v30;
    v70 = v32;
    v82.size.width = v32;
    v82.size.height = v34;
    objc_msgSend(v38, "sizeThatFits:", v40, Height - CGRectGetHeight(v82) + -15.0);
    v43 = v42;
    v72 = v42;
    v73 = v44;
    v45 = v44;

    v83.origin.x = v28;
    v83.origin.y = v30;
    v83.size.width = v32;
    v83.size.height = v34;
    v46 = CGRectGetHeight(v83);
    v47 = IMRectCenteredYInRectScale(v76, v77, v43, v45 + v46 + 15.0, v74, v75, v15, v78, 0.0);
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = IMRectCenteredXInRectScale(v54, v71, v30, v70, v34, v74, v75, v15, v78, 0.0);
    v57 = v56;
    v59 = v58;
    v84.origin.x = v47;
    v84.origin.y = v49;
    v84.size.width = v51;
    v84.size.height = v53;
    MinY = CGRectGetMinY(v84);
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController spinner](self, "spinner"));
    objc_msgSend(v61, "setFrame:", v55, MinY, v57, v59);

    v63 = IMRectCenteredXInRectScale(v62, v76, v77, v72, v73, v74, v75, v15, v78, 0.0);
    v65 = v64;
    v67 = v66;
    v85.origin.x = v55;
    v85.origin.y = MinY;
    v85.size.width = v57;
    v85.size.height = v59;
    v68 = CGRectGetMaxY(v85) + 15.0;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController label](self, "label"));
    objc_msgSend(v69, "setFrame:", v63, v68, v65, v67);

  }
}

- (void)viewDidLoad
{
  UIViewController *v3;
  UITabBarController *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  id v16;

  v15.receiver = self;
  v15.super_class = (Class)MTSplashViewController;
  -[MTSplashViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = objc_opt_new(UIViewController);
  -[MTSplashViewController setVc:](self, "setVc:", v3);

  v4 = objc_opt_new(UITabBarController);
  v5 = objc_alloc((Class)UINavigationController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController vc](self, "vc"));
  v7 = objc_msgSend(v5, "initWithRootViewController:", v6);

  -[UITabBarController setTabBarHidden:animated:](v4, "setTabBarHidden:animated:", 1, 0);
  v16 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  -[UITabBarController setViewControllers:](v4, "setViewControllers:", v8);

  -[MTSplashViewController addChildViewController:](self, "addChildViewController:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController view](v4, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "setFrame:");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController view](v4, "view"));
  objc_msgSend(v11, "addSubview:", v12);

  -[UITabBarController didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTSplashViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v13, "setBackgroundColor:", v14);

}

- (UIViewController)vc
{
  return self->_vc;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void)setVc:(id)a3
{
  objc_storeStrong((id *)&self->_vc, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MTSplashViewController setVisible:](self, "setVisible:", 0);
  v5.receiver = self;
  v5.super_class = (Class)MTSplashViewController;
  -[MTSplashViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)visible
{
  return self->_visible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_vc, 0);
}

@end
