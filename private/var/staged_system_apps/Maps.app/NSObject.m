@implementation NSObject

- (CarChromeViewController)carChromeViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if ((objc_opt_respondsToSelector(self, "chromeViewController") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject chromeViewController](self, "chromeViewController"));
    v4 = objc_opt_class(CarChromeViewController);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      v5 = v3;
    else
      v5 = 0;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return (CarChromeViewController *)v6;
}

- (void)_maps_setNeedsUpdateWithSelector:(SEL)a3
{
  -[NSObject _maps_setNeedsUpdate:withSelector:](self, "_maps_setNeedsUpdate:withSelector:", 1, a3);
}

- (void)_maps_setNeedsUpdate:(BOOL)a3 withSelector:(SEL)a4
{
  _BOOL4 v5;
  id AssociatedObject;
  uint64_t v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  void *v13;
  NSString *v14;
  void *v15;
  _QWORD block[5];

  v5 = a3;
  AssociatedObject = objc_getAssociatedObject(self, off_1014A8118);
  v8 = objc_claimAutoreleasedReturnValue(AssociatedObject);
  v9 = (id)v8;
  if (v5)
  {
    if (!v8)
    {
      v9 = objc_alloc_init((Class)NSMutableSet);
      objc_setAssociatedObject(self, off_1014A8118, v9, (void *)1);
    }
    v10 = NSStringFromSelector(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "addObject:", v11);

    v12 = objc_getAssociatedObject(self, off_1014A8110);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (!v13)
    {
      objc_setAssociatedObject(self, off_1014A8110, &__kCFBooleanTrue, (void *)3);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10039D5C4;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v14 = NSStringFromSelector(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v9, "removeObject:", v15);

  }
}

- (BOOL)_maps_needsUpdateWithSelector:(SEL)a3
{
  id AssociatedObject;
  void *v5;
  NSString *v6;
  void *v7;
  unsigned __int8 v8;

  AssociatedObject = objc_getAssociatedObject(self, off_1014A8118);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "containsObject:", v7);

  return v8;
}

- (MacChromeViewController)macChromeViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if ((objc_opt_respondsToSelector(self, "chromeViewController") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject chromeViewController](self, "chromeViewController"));
    v4 = objc_opt_class(MacChromeViewController);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      v5 = v3;
    else
      v5 = 0;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return (MacChromeViewController *)v6;
}

- (IOSBasedChromeViewController)iosBasedChromeViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if ((objc_opt_respondsToSelector(self, "chromeViewController") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject chromeViewController](self, "chromeViewController"));
    v4 = objc_opt_class(IOSBasedChromeViewController);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      v5 = v3;
    else
      v5 = 0;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return (IOSBasedChromeViewController *)v6;
}

- (IOSChromeViewController)iosChromeViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if ((objc_opt_respondsToSelector(self, "chromeViewController") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject chromeViewController](self, "chromeViewController"));
    v4 = objc_opt_class(IOSChromeViewController);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      v5 = v3;
    else
      v5 = 0;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return (IOSChromeViewController *)v6;
}

@end
