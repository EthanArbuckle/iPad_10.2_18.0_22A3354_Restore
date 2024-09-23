@implementation MenuContaineeViewController

- (MenuContaineeViewController)initWithContentView:(id)a3
{
  id v5;
  MenuContaineeViewController *v6;
  MenuContaineeViewController *v7;
  __int128 v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MenuContaineeViewController;
  v6 = -[MenuContaineeViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentView, a3);
    -[ContaineeViewController setPreferredPresentationStyle:](v7, "setPreferredPresentationStyle:", 5);
    v8 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v7->contentInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v7->contentInsets.bottom = v8;
  }

  return v7;
}

- (MenuContaineeViewController)initWithContentViewController:(id)a3
{
  id v5;
  MenuContaineeViewController *v6;
  MenuContaineeViewController *v7;
  __int128 v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MenuContaineeViewController;
  v6 = -[MenuContaineeViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentViewController, a3);
    -[ContaineeViewController setPreferredPresentationStyle:](v7, "setPreferredPresentationStyle:", 5);
    v8 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v7->contentInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v7->contentInsets.bottom = v8;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UIScrollView removeObserver:forKeyPath:](self->_trackedScrollview, "removeObserver:forKeyPath:", self, CFSTR("contentSize"));
  v3.receiver = self;
  v3.super_class = (Class)MenuContaineeViewController;
  -[MenuContaineeViewController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  CardView *v3;

  v3 = -[CardView initWithThickBlur]([CardView alloc], "initWithThickBlur");
  -[CardView setLayoutStyle:](v3, "setLayoutStyle:", 6);
  -[MenuContaineeViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  UIView *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MenuContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MenuContaineeViewController view](self, "view"));
  if (self->_contentViewController)
  {
    -[MenuContaineeViewController addChildViewController:](self, "addChildViewController:");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_contentViewController, "view"));
    -[UIViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);
  }
  else
  {
    v4 = self->_contentView;
  }
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](v4, "setFrame:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentView"));
  objc_msgSend(v5, "addSubview:", v4);

  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentView"));
  LODWORD(v8) = 1148846080;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfView:priority:](v4, "_maps_constraintsEqualToEdgesOfView:priority:", v7, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allConstraints"));
  objc_msgSend(v6, "addObjectsFromArray:", v10);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputEscape, 0, "escapePressed:"));
  objc_msgSend(v2, "setWantsPriorityOverSystemBehavior:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, "returnPressed:"));
  objc_msgSend(v3, "setWantsPriorityOverSystemBehavior:", 1);
  v6[0] = v2;
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

  return v4;
}

- (void)escapePressed:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController macMenuPresentationController](self, "macMenuPresentationController", a3));
  objc_msgSend(v3, "dismissAnimated:completion:", 1, 0);

}

- (void)returnPressed:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MenuContaineeViewController trackedScrollview](self, "trackedScrollview", a3));
  v5 = objc_opt_class(UITableView);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MenuContaineeViewController trackedScrollview](self, "trackedScrollview"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForSelectedRow"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForSelectedRow"));
      objc_msgSend(v9, "tableView:didSelectRowAtIndexPath:", v7, v10);

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MenuContaineeViewController trackedScrollview](self, "trackedScrollview"));
  v12 = objc_opt_class(UICollectionView);
  v13 = objc_opt_isKindOfClass(v11, v12);

  if ((v13 & 1) != 0)
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(-[MenuContaineeViewController trackedScrollview](self, "trackedScrollview"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "indexPathsForSelectedItems"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "delegate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "indexPathsForSelectedItems"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
      objc_msgSend(v15, "collectionView:didSelectItemAtIndexPath:", v18, v17);

    }
  }
}

- (void)setTrackedScrollview:(id)a3
{
  UIScrollView *v5;
  UIScrollView **p_trackedScrollview;
  UIScrollView *trackedScrollview;
  uint64_t v8;
  UIEdgeInsets *p_contentInsets;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  UIScrollView *v14;

  v5 = (UIScrollView *)a3;
  p_trackedScrollview = &self->_trackedScrollview;
  trackedScrollview = self->_trackedScrollview;
  if (trackedScrollview != v5)
  {
    v14 = v5;
    -[UIScrollView removeObserver:forKeyPath:](trackedScrollview, "removeObserver:forKeyPath:", self, CFSTR("contentSize"));
    objc_storeStrong((id *)&self->_trackedScrollview, a3);
    -[UIScrollView addObserver:forKeyPath:options:context:](*p_trackedScrollview, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 1, &unk_1014D2DB8);
    v8 = sub_1002A8AA0(*p_trackedScrollview);
    v5 = v14;
    if (v8 == 5)
    {
      p_contentInsets = &self->contentInsets;
      -[UIScrollView adjustedContentInset](v14, "adjustedContentInset");
      v5 = v14;
      p_contentInsets->top = v10;
      p_contentInsets->left = v11;
      p_contentInsets->bottom = v12;
      p_contentInsets->right = v13;
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &unk_1014D2DB8 && !-[NSDictionary isEqualToDictionary:](self->_change, "isEqualToDictionary:", v12))
  {
    if (qword_1014D2DC8 != -1)
      dispatch_once(&qword_1014D2DC8, &stru_1011BFF18);
    v13 = qword_1014D2DC0;
    if (os_log_type_enabled((os_log_t)qword_1014D2DC0, OS_LOG_TYPE_INFO))
    {
      v19 = 138412802;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "keyPath - %@, object - %@, change - %@", (uint8_t *)&v19, 0x20u);
    }
    objc_storeStrong((id *)&self->_change, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    objc_msgSend(v14, "CGSizeValue");
    v16 = v15;

    if (v16 + self->contentInsets.top + self->contentInsets.bottom >= 60.0)
      v17 = v16 + self->contentInsets.top + self->contentInsets.bottom;
    else
      v17 = 60.0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MenuContaineeViewController view](self, "view"));
    objc_msgSend(v18, "setOverriddenIntrinsicHeight:", v17);
    objc_msgSend(v18, "invalidateIntrinsicContentSize");

  }
}

- (UIScrollView)trackedScrollview
{
  return self->_trackedScrollview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedScrollview, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
