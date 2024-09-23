@implementation UIInterfaceActionGroupView

- (id)newActionSeparatorView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIInterfaceActionGroupView visualStyle](self, "visualStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIInterfaceActionGroupView visualStyle](self, "visualStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupViewState"));
  v6 = objc_msgSend(v3, "newActionSeparatorViewForGroupViewState:", v5);

  return v6;
}

@end
