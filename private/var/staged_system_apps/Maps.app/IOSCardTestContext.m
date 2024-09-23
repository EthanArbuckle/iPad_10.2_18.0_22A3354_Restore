@implementation IOSCardTestContext

- (IOSCardTestContext)initWithFloatingControlsOptions:(int64_t)a3
{
  IOSCardTestContext *result;

  result = -[IOSCardTestContext init](self, "init");
  if (result)
    result->_floatingControls = a3;
  return result;
}

- (IOSCardTestContext)init
{
  IOSCardTestContext *v2;
  CardTestContainee *v3;
  NSMutableArray *v4;
  NSMutableArray *containees;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IOSCardTestContext;
  v2 = -[IOSCardTestContext init](&v7, "init");
  if (v2)
  {
    v3 = -[CardTestContainee initWithContext:]([CardTestContainee alloc], "initWithContext:", v2);
    v4 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v3, 0);
    containees = v2->_containees;
    v2->_containees = v4;

    v2->_floatingControls = 67;
  }
  return v2;
}

- (BOOL)showsMapView
{
  return 1;
}

- (id)desiredCards
{
  return self->_containees;
}

- (unint64_t)indexOfContext
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contexts"));
  v5 = objc_msgSend(v4, "indexOfObject:", self);

  return (unint64_t)v5;
}

- (unint64_t)indexOfContainee:(id)a3
{
  return (unint64_t)-[NSMutableArray indexOfObject:](self->_containees, "indexOfObject:", a3);
}

- (void)pushContainee
{
  void *v3;
  CardTestContainee *v4;

  v4 = -[CardTestContainee initWithContext:]([CardTestContainee alloc], "initWithContext:", self);
  -[NSMutableArray addObject:](self->_containees, "addObject:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v3, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

}

- (void)popContainee
{
  id v3;

  if ((unint64_t)-[NSMutableArray count](self->_containees, "count") >= 2)
  {
    -[NSMutableArray removeLastObject](self->_containees, "removeLastObject");
    v3 = (id)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v3, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

  }
}

- (void)pushContext
{
  IOSCardTestContext *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
  v2 = objc_alloc_init(IOSCardTestContext);
  objc_msgSend(v3, "pushContext:animated:completion:", v2, 1, 0);

}

- (void)pushContextWithFloatingControls:(int64_t)a3
{
  IOSCardTestContext *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
  v4 = -[IOSCardTestContext initWithFloatingControlsOptions:]([IOSCardTestContext alloc], "initWithFloatingControlsOptions:", a3);
  objc_msgSend(v5, "pushContext:animated:completion:", v4, 1, 0);

}

- (void)popContext
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contexts"));
  v5 = objc_msgSend(v4, "count");

  if ((unint64_t)v5 >= 2)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v6, "popContextAnimated:completion:", 1, 0);

  }
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = -[NSMutableArray containsObject:](self->_containees, "containsObject:", v13);
  v6 = v13;
  if (v5)
  {
    -[NSMutableArray removeObject:](self->_containees, "removeObject:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext popover](self, "popover"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapSelectionManager"));
      objc_msgSend(v9, "clearSelectionAnimated:", 1);

    }
    v10 = -[NSMutableArray count](self->_containees, "count");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
    v12 = v11;
    if (v10)
      objc_msgSend(v11, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);
    else
      objc_msgSend(v11, "popContext:animated:completion:", self, 1, 0);

    v6 = v13;
  }

}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (BOOL)chromeDidSelectLabelMarker:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CardTestPopoverContainee *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
  v6 = sub_1002A8AA0(v5);

  if (v6 == 5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext popover](self, "popover"));
    if (v7)
      -[NSMutableArray removeObject:](self->_containees, "removeObject:", v7);
    v8 = -[CardTestPopoverContainee initWithContext:forLabelMarker:]([CardTestPopoverContainee alloc], "initWithContext:forLabelMarker:", self, v4);
    -[NSMutableArray addObject:](self->_containees, "addObject:", v8);
    -[IOSCardTestContext setPopover:](self, "setPopover:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v9, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

  }
  return v6 == 5;
}

- (BOOL)chromeDidClearMapSelection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext popover](self, "popover"));
  if (v3)
  {
    -[NSMutableArray removeObject:](self->_containees, "removeObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardTestContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

  }
  return 1;
}

- (int64_t)desiredFloatingControls
{
  return self->_floatingControls;
}

- (BOOL)wantsWeatherShowing
{
  return 1;
}

- (BOOL)permitsWeatherShowing
{
  return 1;
}

- (BOOL)wantsLookAroundShowing
{
  return 1;
}

- (BOOL)permitsLookAroundShowing
{
  return 1;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (NSMutableArray)containees
{
  return self->_containees;
}

- (void)setContainees:(id)a3
{
  objc_storeStrong((id *)&self->_containees, a3);
}

- (CardTestPopoverContainee)popover
{
  return (CardTestPopoverContainee *)objc_loadWeakRetained((id *)&self->_popover);
}

- (void)setPopover:(id)a3
{
  objc_storeWeak((id *)&self->_popover, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_popover);
  objc_storeStrong((id *)&self->_containees, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end
