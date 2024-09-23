@implementation CompactListViewController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;

  v9.receiver = self;
  v9.super_class = (Class)CompactListViewController;
  -[ListViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138543362;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear", buf, 0xCu);

  }
}

- (id)cellFactory
{
  CompactDayNavigationViewCellFactory *v2;

  if (-[ListViewController showScrubber](self, "showScrubber"))
    v2 = objc_opt_new(CompactDayNavigationViewCellFactory);
  else
    v2 = 0;
  return v2;
}

- (BOOL)shouldAutoScrollToSelectedDateAfterFirstRefresh
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int)supportedToggleMode
{
  return 1;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  unsigned int v15;
  objc_super v16;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if ((id)-[ListViewController destination](self, "destination") != (id)2
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController delegate](self, "delegate")),
        v13 = objc_opt_respondsToSelector(v12, "listViewControllerShouldShowEvent:showMode:"),
        v12,
        (v13 & 1) == 0)
    || (v14 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController delegate](self, "delegate")),
        v15 = objc_msgSend(v14, "listViewControllerShouldShowEvent:showMode:", v10, a5),
        v14,
        v15))
  {
    v16.receiver = self;
    v16.super_class = (Class)CompactListViewController;
    -[ListViewController showEvent:animated:showMode:context:](&v16, "showEvent:animated:showMode:context:", v10, v8, a5, v11);
  }

}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

@end
