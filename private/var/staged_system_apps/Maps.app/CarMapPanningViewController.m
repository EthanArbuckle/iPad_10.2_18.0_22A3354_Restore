@implementation CarMapPanningViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarMapPanningViewController;
  -[CarMapPanningViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[CarMapPanningViewController _updateContentViewIfNeeded](self, "_updateContentViewIfNeeded");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setNeedsFocusUpdate");

  v6.receiver = self;
  v6.super_class = (Class)CarMapPanningViewController;
  -[CarMapPanningViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  CarDoneButton *doneButton;
  CarPanButtonContainer *panButtonContainer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarMapPanningViewController;
  -[CarMapPanningViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  -[CarDoneButton removeFromSuperview](self->_doneButton, "removeFromSuperview");
  -[CarPanButtonContainer removeFromSuperview](self->_panButtonContainer, "removeFromSuperview");
  doneButton = self->_doneButton;
  self->_doneButton = 0;

  panButtonContainer = self->_panButtonContainer;
  self->_panButtonContainer = 0;

}

- (void)_updateContentViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewport"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewportLayoutGuide"));

  if (self->_doneButton)
    v7 = 1;
  else
    v7 = v4 == 0;
  v8 = v7 || v6 == 0;
  if (!v8 && -[CarMapPanningViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CarMapPanningViewController _createViewsIfNeeded](self, "_createViewsIfNeeded");
    objc_msgSend(v4, "addSubview:", self->_doneButton);
    objc_msgSend(v4, "addSubview:", self->_panButtonContainer);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarDoneButton _maps_rightRHDAnchor](self->_doneButton, "_maps_rightRHDAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safeAreaLayoutGuide"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_maps_rightRHDAnchor"));
    LODWORD(v9) = 1148846080;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v29, 0, -10.0, v9));
    v32[0] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarDoneButton topAnchor](self->_doneButton, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 10.0));
    v32[1] = v25;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarDoneButton heightAnchor](self->_doneButton, "heightAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:", 28.0));
    v32[2] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer topAnchor](self->_panButtonContainer, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
    v32[3] = v20;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer bottomAnchor](self->_panButtonContainer, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
    v32[4] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer leadingAnchor](self->_panButtonContainer, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    v32[5] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer trailingAnchor](self->_panButtonContainer, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    v32[6] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  }
}

- (void)_createViewsIfNeeded
{
  CarDoneButton *v3;
  CarDoneButton *doneButton;
  CarPanButtonContainer *v5;
  CarPanButtonContainer *panButtonContainer;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (!self->_doneButton)
  {
    v3 = -[CarDoneButton initWithFrame:]([CarDoneButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    doneButton = self->_doneButton;
    self->_doneButton = v3;

    -[CarDoneButton setTranslatesAutoresizingMaskIntoConstraints:](self->_doneButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarDoneButton addTarget:action:forControlEvents:](self->_doneButton, "addTarget:action:forControlEvents:", self, "_tappedDone", 64);
  }
  if (!self->_panButtonContainer)
  {
    v5 = -[CarPanButtonContainer initWithFrame:]([CarPanButtonContainer alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    panButtonContainer = self->_panButtonContainer;
    self->_panButtonContainer = v5;

    -[CarPanButtonContainer setTranslatesAutoresizingMaskIntoConstraints:](self->_panButtonContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panUpButton](self->_panButtonContainer, "panUpButton"));
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, "_beginImpulseUp", 0x2000000);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panUpButton](self->_panButtonContainer, "panUpButton"));
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "_endImpulseUp", 0x4000000);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panUpButton](self->_panButtonContainer, "panUpButton"));
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, "_momentaryImpulseUp", 0x1000000);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panLeftButton](self->_panButtonContainer, "panLeftButton"));
    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, "_beginImpulseLeft", 0x2000000);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panLeftButton](self->_panButtonContainer, "panLeftButton"));
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, "_endImpulseLeft", 0x4000000);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panLeftButton](self->_panButtonContainer, "panLeftButton"));
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "_momentaryImpulseLeft", 0x1000000);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panRightButton](self->_panButtonContainer, "panRightButton"));
    objc_msgSend(v13, "addTarget:action:forControlEvents:", self, "_beginImpulseRight", 0x2000000);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panRightButton](self->_panButtonContainer, "panRightButton"));
    objc_msgSend(v14, "addTarget:action:forControlEvents:", self, "_endImpulseRight", 0x4000000);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panRightButton](self->_panButtonContainer, "panRightButton"));
    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, "_momentaryImpulseRight", 0x1000000);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panDownButton](self->_panButtonContainer, "panDownButton"));
    objc_msgSend(v16, "addTarget:action:forControlEvents:", self, "_beginImpulseDown", 0x2000000);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panDownButton](self->_panButtonContainer, "panDownButton"));
    objc_msgSend(v17, "addTarget:action:forControlEvents:", self, "_endImpulseDown", 0x4000000);

    v18 = (id)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panDownButton](self->_panButtonContainer, "panDownButton"));
    objc_msgSend(v18, "addTarget:action:forControlEvents:", self, "_momentaryImpulseDown", 0x1000000);

  }
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  CarPanButtonContainer *panButtonContainer;

  if (self->_panButtonContainer)
  {
    panButtonContainer = self->_panButtonContainer;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &panButtonContainer, 1));
  }
  else
  {
    v2 = &__NSArray0__struct;
  }
  return (NSArray *)v2;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CarPanButtonContainer setFrame:](self->_panButtonContainer, "setFrame:", v5, v7, v9, v11);
}

- (void)_tappedDone
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController panDelegate](self, "panDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "carMapPanningViewControllerDidTapDone:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController panDelegate](self, "panDelegate"));
    objc_msgSend(v5, "carMapPanningViewControllerDidTapDone:", self);

  }
}

- (void)_beginImpulseUp
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "beginImpulseInDirection:", 1);

}

- (void)_endImpulseUp
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "endImpluseInDirection:", 1);

}

- (void)_momentaryImpulseUp
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "momentaryImpulseInDirection:", 1);

}

- (void)_beginImpulseDown
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "beginImpulseInDirection:", 2);

}

- (void)_endImpulseDown
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "endImpluseInDirection:", 2);

}

- (void)_momentaryImpulseDown
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "momentaryImpulseInDirection:", 2);

}

- (void)_beginImpulseLeft
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "beginImpulseInDirection:", 3);

}

- (void)_endImpulseLeft
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "endImpluseInDirection:", 3);

}

- (void)_momentaryImpulseLeft
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "momentaryImpulseInDirection:", 3);

}

- (void)_beginImpulseRight
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "beginImpulseInDirection:", 4);

}

- (void)_endImpulseRight
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "endImpluseInDirection:", 4);

}

- (void)_momentaryImpulseRight
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v2, "momentaryImpulseInDirection:", 4);

}

- (NSArray)carFocusOrderSequences
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  void *v23;
  _QWORD v24[6];
  void *v25;

  if (!-[CarMapPanningViewController isViewLoaded](self, "isViewLoaded"))
    return (NSArray *)0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v4 = objc_msgSend(v3, "rightHandDrive");

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panRightButton](self->_panButtonContainer, "panRightButton"));
  v5 = objc_claimAutoreleasedReturnValue(+[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:"));
  v20 = (void *)v5;
  if (v4)
  {
    v24[0] = v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panDownButton](self->_panButtonContainer, "panDownButton"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:"));
    v24[1] = v18;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController chromeViewController](self, "chromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "itemRepresentingMapControls"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemFlippedForRHD"));
    v24[2] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panLeftButton](self->_panButtonContainer, "panLeftButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:", v8));
    v24[3] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:", self->_doneButton));
    v24[4] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panUpButton](self->_panButtonContainer, "panUpButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:", v11));
    v24[5] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 6));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v13, 10));
    v25 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));

  }
  else
  {
    v22[0] = v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController chromeViewController](self, "chromeViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "itemRepresentingMapControls"));
    v22[1] = v18;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panDownButton](self->_panButtonContainer, "panDownButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:"));
    v22[2] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panLeftButton](self->_panButtonContainer, "panLeftButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:", v7));
    v22[3] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panUpButton](self->_panButtonContainer, "panUpButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:", v9));
    v22[4] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:", self->_doneButton));
    v22[5] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 6));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v12, 9));
    v23 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  }

  return (NSArray *)v15;
}

- (void)nudgerizer:(id)a3 didGestureMapView:(id)a4 inDirection:(int64_t)a5
{
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController panDelegate](self, "panDelegate", a3, a4));
  v8 = objc_opt_respondsToSelector(v7, "carMapPanningViewControllerDidPan:inDirection:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapPanningViewController panDelegate](self, "panDelegate"));
    objc_msgSend(v9, "carMapPanningViewControllerDidPan:inDirection:", self, a5);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowScene"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "focusSystem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "focusedItem"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panUpButton](self->_panButtonContainer, "panUpButton"));
  v20[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panLeftButton](self->_panButtonContainer, "panLeftButton"));
  v20[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panRightButton](self->_panButtonContainer, "panRightButton"));
  v20[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarPanButtonContainer panDownButton](self->_panButtonContainer, "panDownButton"));
  v20[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));

  if (objc_msgSend(v19, "containsObject:", v14) && objc_msgSend(v14, "direction") != (id)a5)
  {
    -[CarPanButtonContainer setLastNudgedDirection:](self->_panButtonContainer, "setLastNudgedDirection:", a5);
    -[CarPanButtonContainer setNeedsFocusUpdate](self->_panButtonContainer, "setNeedsFocusUpdate");
  }

}

- (CarChromeViewController)chromeViewController
{
  return (CarChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (CarMapNudgerizer)nudgerizer
{
  return (CarMapNudgerizer *)objc_loadWeakRetained((id *)&self->_nudgerizer);
}

- (void)setNudgerizer:(id)a3
{
  objc_storeWeak((id *)&self->_nudgerizer, a3);
}

- (CarMapPanningViewControllerDelegate)panDelegate
{
  return (CarMapPanningViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_panDelegate);
}

- (void)setPanDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_panDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_panDelegate);
  objc_destroyWeak((id *)&self->_nudgerizer);
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_panButtonContainer, 0);
}

@end
