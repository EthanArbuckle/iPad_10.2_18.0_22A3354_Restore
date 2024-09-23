@implementation ICTrailingSidebarSplitViewController

- (void)setSidebarViewController:(id)a3
{
  -[ICTrailingSidebarSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", a3, 0);
}

- (void)setContentViewController:(id)a3
{
  -[ICTrailingSidebarSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", a3, 2);
}

- (ICTrailingSidebarSplitViewController)initWithViewControllerManager:(id)a3
{
  id v5;
  ICTrailingSidebarSplitViewController *v6;
  ICTrailingSidebarSplitViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTrailingSidebarSplitViewController;
  v6 = -[ICTrailingSidebarSplitViewController initWithStyle:](&v9, "initWithStyle:", 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewControllerManager, a3);

  return v7;
}

- (UIViewController)contentViewController
{
  return (UIViewController *)-[ICTrailingSidebarSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 2);
}

- (UIViewController)sidebarViewController
{
  return (UIViewController *)-[ICTrailingSidebarSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 0);
}

- (void)setSidebarHidden:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];

  v3 = a3;
  -[ICTrailingSidebarSplitViewController setTransitioning:](self, "setTransitioning:", 1);
  if (v3)
    -[ICTrailingSidebarSplitViewController hideColumn:](self, "hideColumn:", 0);
  else
    -[ICTrailingSidebarSplitViewController showColumn:](self, "showColumn:", 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007BF24;
  v5[3] = &unk_100550110;
  v5[4] = self;
  -[ICTrailingSidebarSplitViewController ic_performBlockAfterActiveTransition:](self, "ic_performBlockAfterActiveTransition:", v5);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICTrailingSidebarSplitViewController;
  -[ICSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007BFB0;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)shouldRenderAsOverlay
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarSplitViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  if (v7 > v5)
    return 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarSplitViewController view](self, "view"));
  v9 = objc_msgSend(v8, "ic_hasCompactSize");

  return v9;
}

- (ICViewControllerManager)viewControllerManager
{
  return self->_viewControllerManager;
}

- (void)setViewControllerManager:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerManager, a3);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerManager, 0);
}

@end
