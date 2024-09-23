@implementation ICMainSplitViewController

- (ICViewControllerManager)viewControllerManager
{
  return self->_viewControllerManager;
}

- (void)updateStateForTrailingSidebarVisible:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v3 = a3;
  v5 = objc_opt_class(ICSplitViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICMainSplitViewController viewControllerManager](self, "viewControllerManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingSidebarViewController"));
  v8 = ICDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100015838;
    v13[3] = &unk_100550688;
    v15 = v3;
    v13[4] = self;
    v10 = v9;
    v14 = v10;
    v11 = objc_retainBlock(v13);
    v12 = v11;
    if (v3)
      ((void (*)(_QWORD *))v11[2])(v11);
    else
      objc_msgSend(v10, "ic_performBlockAfterActiveTransition:", v11);

  }
}

- (double)preferredDisplacedColumnWidth
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double result;

  if (!-[ICMainSplitViewController isDisplacingColumn](self, "isDisplacingColumn")
    && -[ICMainSplitViewController displayMode](self, "displayMode") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMainSplitViewController view](self, "view"));
    objc_msgSend(v3, "frame");
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICMainSplitViewController view](self, "view"));
    objc_msgSend(v6, "frame");
    v8 = v7;

    if (v5 < v8)
      return 0.0;
  }
  if ((id)-[ICMainSplitViewController preferredDisplacedColumn](self, "preferredDisplacedColumn") == (id)1)
    -[ICMainSplitViewController supplementaryColumnWidth](self, "supplementaryColumnWidth");
  else
    -[ICMainSplitViewController primaryColumnWidth](self, "primaryColumnWidth");
  return result;
}

- (BOOL)isDisplacingColumn
{
  return self->_isDisplacingColumn;
}

- (ICMainSplitViewController)initWithStyle:(int64_t)a3 viewControllerManager:(id)a4
{
  id v7;
  ICMainSplitViewController *v8;
  ICMainSplitViewController *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICMainSplitViewController;
  v8 = -[ICMainSplitViewController initWithStyle:](&v11, "initWithStyle:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewControllerManager, a4);
    -[ICMainSplitViewController registerForTraitChanges](v9, "registerForTraitChanges");
  }

  return v9;
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMainSplitViewController viewControllerManager](self, "viewControllerManager"));
  v4 = objc_msgSend(v3, "behavior");

  if (v4 == (id)1)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICMainSplitViewController viewControllerManager](self, "viewControllerManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "noteEditorViewController"));
    v12 = objc_opt_class(UITraitUserInterfaceStyle);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10010CE70;
    v9[3] = &unk_100550500;
    objc_copyWeak(&v10, &location);
    v8 = objc_msgSend(v6, "registerForTraitChanges:withHandler:", v7, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (BOOL)shouldDisplaceColumn
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICMainSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", -[ICMainSplitViewController preferredDisplacedColumn](self, "preferredDisplacedColumn")));
  v3 = objc_msgSend(v2, "ic_isViewVisible");

  return v3;
}

- (int64_t)preferredDisplacedColumn
{
  void *v3;
  id v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMainSplitViewController viewControllerManager](self, "viewControllerManager"));
  v4 = objc_msgSend(v3, "noteContainerViewMode");

  if (v4 == (id)-1)
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_10040C2B4(v7);

    return 0;
  }
  if (v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICMainSplitViewController viewControllerManager](self, "viewControllerManager"));
  v6 = (objc_msgSend(v5, "canTilePrimaryContent") & 1) == 0
    && -[ICMainSplitViewController style](self, "style") != (id)1;

  return v6;
}

- (double)nonDisplacedColumnWidth
{
  void *v3;
  unsigned int v4;
  double result;

  if (-[ICMainSplitViewController preferredDisplacedColumn](self, "preferredDisplacedColumn"))
    return 0.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMainSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 1));
  v4 = objc_msgSend(v3, "ic_isViewVisible");

  if (!v4)
    return 0.0;
  -[ICMainSplitViewController supplementaryColumnWidth](self, "supplementaryColumnWidth");
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICMainSplitViewController viewControllerManager](self, "viewControllerManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingSidebarViewController"));
  v10 = objc_msgSend(v9, "isTransitioning");

  if ((v10 & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)ICMainSplitViewController;
    -[ICSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  }

}

- (BOOL)requiresNotificationForSecondaryColumnSize:(CGSize)a3
{
  double width;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  width = a3.width;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICMainSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 2, a3.width, a3.height));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "frame");
  v7 = v6 - width;

  v8 = -v7;
  if (v7 >= 0.0)
    v8 = v7;
  v9 = v8 >= 10.0;

  return v9;
}

- (void)setShouldDisplaceColumn:(BOOL)a3
{
  self->_shouldDisplaceColumn = a3;
}

- (void)setPreferredDisplacedColumn:(int64_t)a3
{
  self->_preferredDisplacedColumn = a3;
}

- (void)setPreferredDisplacedColumnWidth:(double)a3
{
  self->_preferredDisplacedColumnWidth = a3;
}

- (void)setNonDisplacedColumnWidth:(double)a3
{
  self->_nonDisplacedColumnWidth = a3;
}

- (void)setIsDisplacingColumn:(BOOL)a3
{
  self->_isDisplacingColumn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerManager, 0);
}

@end
