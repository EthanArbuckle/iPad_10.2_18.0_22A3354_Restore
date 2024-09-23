@implementation MacSidebarTestContext

- (MacSidebarTestContext)init
{
  MacSidebarTestContext *v2;
  NSMutableArray *v3;
  NSMutableArray *controllers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MacSidebarTestContext;
  v2 = -[MacSidebarTestContext init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    controllers = v2->_controllers;
    v2->_controllers = v3;

  }
  return v2;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (BOOL)wantsSidebarControl
{
  return -[MKCatalystButton isSelected](self->_wantsControlButton, "isSelected");
}

- (id)desiredSidebarContentControllers
{
  return self->_controllers;
}

- (id)_createContainee
{
  ContaineeViewController *v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(ContaineeViewController);
  v4 = -[NSMutableArray count](self->_controllers, "count");
  v5 = (unint64_t)-[NSMutableArray count](self->_controllers, "count");
  v6 = v5 % 0xA;
  if ((unint64_t)v4 <= 0xA)
    v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", (float)((float)v6 * 0.1), 1.0, 0.800000012, 1.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController view](v3, "view"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

  return v3;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10060336C;
  v8[3] = &unk_1011AC8B0;
  v8[4] = self;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "viewport"));
  v7 = v9;
  objc_msgSend(v6, "addPreparation:", v8);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100603810;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(a4, "addAnimations:", v4);
}

- (void)_pop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MacSidebarTestContext macChromeViewController](self, "macChromeViewController"));
  objc_msgSend(v2, "popContextAnimated:completion:", 1, 0);

}

- (void)_toggleWantsControl
{
  id v3;

  -[MKCatalystButton setSelected:](self->_wantsControlButton, "setSelected:", -[MKCatalystButton isSelected](self->_wantsControlButton, "isSelected") ^ 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacSidebarTestContext macChromeViewController](self, "macChromeViewController"));
  objc_msgSend(v3, "setNeedsUpdateComponent:animated:", CFSTR("sidebar"), 1);

}

- (void)_pushSidebarController
{
  NSMutableArray *controllers;
  void *v4;
  id v5;

  controllers = self->_controllers;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacSidebarTestContext _createContainee](self, "_createContainee"));
  -[NSMutableArray addObject:](controllers, "addObject:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MacSidebarTestContext macChromeViewController](self, "macChromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateComponent:animated:", CFSTR("sidebar"), 1);

}

- (void)_popSidebarController
{
  id v3;

  -[NSMutableArray removeLastObject](self->_controllers, "removeLastObject");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacSidebarTestContext macChromeViewController](self, "macChromeViewController"));
  objc_msgSend(v3, "setNeedsUpdateComponent:animated:", CFSTR("sidebar"), 1);

}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_wantsControlButton, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
}

@end
