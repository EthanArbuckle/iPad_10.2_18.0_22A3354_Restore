@implementation ListViewContainerViewController

- (id)currentChildViewController
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ListViewContainerViewController;
  v2 = -[MainViewControllerContainer currentChildViewController](&v4, "currentChildViewController");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported
{
  return 1;
}

- (id)childViewControllerForCompactWidthRegularHeight
{
  void *v3;
  CompactListViewController *v4;
  void *v5;
  void *v6;
  CompactListViewController *v7;
  void *v8;

  v3 = *(void **)(&self->super._animatingViewTransition + 1);
  if (!v3)
  {
    v4 = [CompactListViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v7 = -[ListViewController initWithModel:window:](v4, "initWithModel:window:", v5, v6);
    v8 = *(void **)(&self->super._animatingViewTransition + 1);
    *(_QWORD *)(&self->super._animatingViewTransition + 1) = v7;

    objc_msgSend(*(id *)(&self->super._animatingViewTransition + 1), "setAllowExtendedHeightCells:", 1);
    v3 = *(void **)(&self->super._animatingViewTransition + 1);
  }
  return v3;
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  return 0;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  id v3;
  __objc2_class **v4;
  uint64_t v5;

  v3 = objc_msgSend(a3, "horizontalSizeClass");
  v4 = off_1001B1690;
  if (v3 != (id)2)
    v4 = off_1001B13B8;
  objc_opt_class(*v4);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v5);
}

- (BOOL)representsDayInViewHierarchy
{
  return 1;
}

- (CompactListViewController)compactController
{
  return *(CompactListViewController **)(&self->super._animatingViewTransition + 1);
}

- (void)setCompactController:(id)a3
{
  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), a3);
}

- (MultiColumnMonthViewController)regularController
{
  return *(MultiColumnMonthViewController **)((char *)&self->_compactController + 1);
}

- (void)setRegularController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_compactController + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_compactController + 1), 0);
  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), 0);
}

@end
