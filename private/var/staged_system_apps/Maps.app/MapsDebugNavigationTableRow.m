@implementation MapsDebugNavigationTableRow

- (MapsDebugNavigationTableRow)init
{
  MapsDebugNavigationTableRow *v2;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsDebugNavigationTableRow;
  v2 = -[MapsDebugTableRow init](&v7, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1006654A0;
    v4[3] = &unk_1011AD260;
    objc_copyWeak(&v5, &location);
    -[MapsDebugTableRow setSelectionAction:](v2, "setSelectionAction:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setViewControllerClass:(Class)a3
{
  id v4;

  if (self->_viewControllerClass != a3)
  {
    self->_viewControllerClass = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[objc_class navigationDestinationTitle](a3, "navigationDestinationTitle"));
    -[MapsDebugTableRow setTitle:](self, "setTitle:", v4);

  }
}

- (void)present
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugNavigationTableRow makeViewControllerToPresent](self, "makeViewControllerToPresent"));
  if (v5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow section](self, "section"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayingViewController"));

    objc_msgSend(v4, "segueToViewController:", v5);
  }

}

- (id)makeViewControllerToPresent
{
  void *v3;
  MapsDebugValuesViewController *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow prepareContentBlock](self, "prepareContentBlock"));

  if (v3)
  {
    v4 = objc_alloc_init(MapsDebugValuesViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow prepareContentBlock](self, "prepareContentBlock"));
    -[MapsDebugValuesViewController setPrepareContentBlock:](v4, "setPrepareContentBlock:", v5);

  }
  else if (-[MapsDebugNavigationTableRow viewControllerClass](self, "viewControllerClass"))
  {
    v4 = (MapsDebugValuesViewController *)objc_alloc_init(-[MapsDebugNavigationTableRow viewControllerClass](self, "viewControllerClass"));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (Class)viewControllerClass
{
  return self->_viewControllerClass;
}

- (id)cellContentConfiguration
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow subtitle](self, "subtitle"));
  if (objc_msgSend(v2, "length"))
    v3 = objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration valueCellConfiguration](UIListContentConfiguration, "valueCellConfiguration"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration"));
  v4 = (void *)v3;

  return v4;
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsDebugNavigationTableRow;
  -[MapsDebugTableRow configureCell:](&v10, "configureCell:", v4);
  objc_msgSend(v4, "setAccessoryType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow selectionAction](self, "selectionAction"));
  if (v6)
    v7 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textProperties"));
  objc_msgSend(v9, "setColor:", v8);

  objc_msgSend(v4, "setContentConfiguration:", v5);
}

- (void)configureCollectionViewCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v14;
  id v15;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MapsDebugNavigationTableRow;
  -[MapsDebugTableRow configureCollectionViewCell:](&v14, "configureCollectionViewCell:", v4);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow selectionAction](self, "selectionAction"));
  if (v7)
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v9 = (void *)v8;

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textProperties"));
    objc_msgSend(v10, "setColor:", v9);

    objc_msgSend(v6, "setPrefersSideBySideTextAndSecondaryText:", 1);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
    objc_msgSend(v11, "setTextColor:", v9);

  }
  objc_msgSend(v5, "setContentConfiguration:", v6);
  v12 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
  v15 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  objc_msgSend(v5, "setAccessories:", v13);

}

@end
