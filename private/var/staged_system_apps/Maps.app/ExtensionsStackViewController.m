@implementation ExtensionsStackViewController

- (void)viewDidLoad
{
  UIView *v3;
  UIView *headerView;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIStackView *v13;
  UIStackView *stackView;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_super v59;
  _QWORD v60[7];

  v59.receiver = self;
  v59.super_class = (Class)ExtensionsStackViewController;
  -[ContaineeViewController viewDidLoad](&v59, "viewDidLoad");
  v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  headerView = self->_headerView;
  self->_headerView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](self->_headerView, "setBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_headerView);

  v7 = objc_alloc_init((Class)UIScrollView);
  -[ExtensionsStackViewController setScrollView:](self, "setScrollView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "setAlwaysBounceVertical:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController scrollView](self, "scrollView"));
  objc_msgSend(v10, "setDelegate:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController scrollView](self, "scrollView"));
  objc_msgSend(v11, "addSubview:", v12);

  v13 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  stackView = self->_stackView;
  self->_stackView = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController stackView](self, "stackView"));
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController stackView](self, "stackView"));
  objc_msgSend(v16, "setAxis:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController stackView](self, "stackView"));
  objc_msgSend(v17, "setAlignment:", 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController stackView](self, "stackView"));
  objc_msgSend(v18, "setDistribution:", 3);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController stackView](self, "stackView"));
  objc_msgSend(v19, "setSpacing:", 0.0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController scrollView](self, "scrollView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController stackView](self, "stackView"));
  objc_msgSend(v20, "addSubview:", v21);

  -[ExtensionsStackViewController _updateScrollViewForLayout:](self, "_updateScrollViewForLayout:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController stackView](self, "stackView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController scrollView](self, "scrollView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_maps_constraintsForCenteringInView:", v23));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v24));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController stackView](self, "stackView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "widthAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController scrollView](self, "scrollView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "widthAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
  objc_msgSend(v58, "addObject:", v29);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_headerView, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController view](self, "view"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v60[0] = v54;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_headerView, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController view](self, "view"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v60[1] = v50;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_headerView, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController view](self, "view"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
  v60[2] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_headerView, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v60[3] = v43;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v60[4] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));
  v60[5] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v37));
  v60[6] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 7));
  objc_msgSend(v58, "addObjectsFromArray:", v39);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v58);
}

- (NSArray)stackedViews
{
  return 0;
}

- (id)headerView
{
  return self->_headerView;
}

- (void)didChangeLayout:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ExtensionsStackViewController;
  -[ContaineeViewController didChangeLayout:](&v5, "didChangeLayout:");
  -[ExtensionsStackViewController _updateScrollViewForLayout:](self, "_updateScrollViewForLayout:", a3);
}

- (void)_updateScrollViewForLayout:(unint64_t)a3
{
  double y;
  id v4;

  if (a3 - 1 <= 1)
  {
    y = CGPointZero.y;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionsStackViewController scrollView](self, "scrollView"));
    objc_msgSend(v4, "setContentOffset:", CGPointZero.x, y);

  }
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
