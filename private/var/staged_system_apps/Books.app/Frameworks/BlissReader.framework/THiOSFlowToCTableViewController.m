@implementation THiOSFlowToCTableViewController

- (THiOSFlowToCTableViewController)initWithFlowTOCViewController:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  THiOSFlowToCTableViewController *v9;
  THiOSFlowToCTableViewController *v10;
  THBookCoverViewController *v11;
  THBookCoverViewController *coverViewController;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)THiOSFlowToCTableViewController;
  v9 = -[THiOSFlowToCTableViewController init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowToCViewController, a3);
    v11 = objc_alloc_init(THBookCoverViewController);
    coverViewController = v10->_coverViewController;
    v10->_coverViewController = v11;

    -[THBookCoverViewController setAsset:](v10->_coverViewController, "setAsset:", v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  CGSize size;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CGPoint v37;
  CGSize v38;
  CGPoint origin;
  CGSize v40;
  objc_super v41;
  _QWORD v42[8];

  v41.receiver = self;
  v41.super_class = (Class)THiOSFlowToCTableViewController;
  -[THiOSFlowToCTableViewController viewDidLoad](&v41, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THBookCoverViewController view](self->_coverViewController, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCViewController view](self->_flowToCViewController, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THiOSFlowToCTableViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  size = CGRectZero.size;
  origin = CGRectZero.origin;
  v40 = size;
  v37 = origin;
  v38 = size;
  -[THiOSFlowToCTableViewController th_determineLeftFrame:rightFrame:](self, "th_determineLeftFrame:rightFrame:", &origin, &v37);
  -[THiOSFlowToCTableViewController th_addChildViewController:withFrame:](self, "th_addChildViewController:withFrame:", self->_coverViewController, origin, v40);
  -[THiOSFlowToCTableViewController th_addChildViewController:withFrame:](self, "th_addChildViewController:withFrame:", self->_flowToCViewController, v37, v38);
  v7 = v5;
  v36 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safeAreaLayoutGuide"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leftAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leftAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v42[0] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rightAnchor"));
  v28 = (void *)v9;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v9));
  v42[1] = v30;
  v33 = v3;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v27));
  v42[2] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v23));
  v42[3] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v9));
  v42[4] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rightAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v42[5] = v10;
  v24 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v42[6] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v42[7] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  -[THiOSFlowToCTableViewController th_updateColorsForTheme](self, "th_updateColorsForTheme");
}

- (int64_t)preferredStatusBarStyle
{
  return (int64_t)-[THTheme contentStatusBarStyle](self->_theme, "contentStatusBarStyle");
}

- (void)setTheme:(id)a3
{
  objc_storeStrong((id *)&self->_theme, a3);
  -[THiOSFlowToCTableViewController th_updateColorsForTheme](self, "th_updateColorsForTheme");
  -[THiOSFlowToCTableViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)th_updateColorsForTheme
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[THTheme backgroundColorForTraitEnvironment:](self->_theme, "backgroundColorForTraitEnvironment:", self));
  if (-[THTheme isNight:](self->_theme, "isNight:", self))
    v3 = 2;
  else
    v3 = 1;
  -[THiOSFlowToCTableViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THiOSFlowToCTableViewController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v4, "setBackgroundColor:", v10);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THBookCoverViewController view](self->_coverViewController, "view"));
  if (-[THTheme overlayContentBackgroundColor](self->_theme, "overlayContentBackgroundColor"))
  {
    v6 = objc_alloc((Class)CAFilter);
    v7 = objc_msgSend(v6, "initWithType:", kCAFilterMultiplyColor);
    objc_msgSend(v7, "setValue:forKeyPath:", objc_msgSend(objc_retainAutorelease(v10), "CGColor"), CFSTR("inputColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v7));

  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v9, "setFilters:", v8);

}

- (void)th_determineLeftFrame:(CGRect *)a3 rightFrame:(CGRect *)a4
{
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat Height;
  double MaxX;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THiOSFlowToCTableViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v19.origin.x = v8;
  v19.origin.y = v10;
  v19.size.width = v12;
  v19.size.height = v14;
  v15 = CGRectGetWidth(v19) + -10.0;
  if (v15 <= 0.0)
    v16 = 0.0;
  else
    v16 = v15 * 0.5;
  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  Height = CGRectGetHeight(v20);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v16;
  v21.size.height = Height;
  MaxX = CGRectGetMaxX(v21);
  if (a3)
  {
    a3->origin.x = 0.0;
    a3->origin.y = 0.0;
    a3->size.width = v16;
    a3->size.height = Height;
  }
  if (a4)
  {
    a4->origin.x = MaxX;
    a4->origin.y = 0.0;
    a4->size.width = v16;
    a4->size.height = Height;
  }
}

- (void)th_addChildViewController:(id)a3 withFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  id v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v9, "willMoveToParentViewController:", 0);
  objc_msgSend(v11, "removeFromSuperview");
  objc_msgSend(v9, "removeFromParentViewController");
  -[THiOSFlowToCTableViewController addChildViewController:](self, "addChildViewController:", v9);
  objc_msgSend(v11, "setFrame:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THiOSFlowToCTableViewController view](self, "view"));
  objc_msgSend(v10, "addSubview:", v11);

  objc_msgSend(v9, "didMoveToParentViewController:", self);
}

- (THFlowTOCViewController)flowToCViewController
{
  return self->_flowToCViewController;
}

- (void)setFlowToCViewController:(id)a3
{
  objc_storeStrong((id *)&self->_flowToCViewController, a3);
}

- (THTheme)theme
{
  return self->_theme;
}

- (THBookCoverViewController)coverViewController
{
  return self->_coverViewController;
}

- (void)setCoverViewController:(id)a3
{
  objc_storeStrong((id *)&self->_coverViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverViewController, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_flowToCViewController, 0);
}

@end
