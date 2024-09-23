@implementation YearViewScrollTest

- (void)navigateToScrollView
{
  void *v3;
  YearViewController *v4;
  YearViewController *controller;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootNavigationController"));
  v4 = (YearViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resetToYearView"));
  controller = self->_controller;
  self->_controller = v4;

}

- (id)scrollView
{
  return -[InfiniteScrollViewController scrollView](self->_controller, "scrollView");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
