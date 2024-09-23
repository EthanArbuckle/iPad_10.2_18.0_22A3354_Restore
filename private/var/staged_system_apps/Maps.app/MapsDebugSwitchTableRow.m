@implementation MapsDebugSwitchTableRow

- (MapsDebugSwitchTableRow)init
{
  MapsDebugSwitchTableRow *v2;
  MapsDebugSwitchTableRow *v3;
  MapsDebugSwitchTableRow *v4;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MapsDebugSwitchTableRow;
  v2 = -[MapsDebugTableRow init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    objc_initWeak(&location, v2);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10070F9A4;
    v6[3] = &unk_1011AD260;
    objc_copyWeak(&v7, &location);
    -[MapsDebugTableRow setSelectionAction:](v3, "setSelectionAction:", v6);
    v4 = v3;
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)invalidate
{
  objc_super v3;

  -[MapsDebugSwitchTableRow setGet:](self, "setGet:", 0);
  -[MapsDebugSwitchTableRow setSet:](self, "setSet:", 0);
  -[MapsDebugSwitchTableRow setEnabled:](self, "setEnabled:", 1);
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugSwitchTableRow;
  -[MapsDebugTableRow invalidate](&v3, "invalidate");
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[UISwitch setEnabled:](self->_toggle, "setEnabled:");
}

- (id)_createToggleForIdiom:(int64_t)a3
{
  Class *v4;
  id v5;
  void *v6;
  uint64_t (**v7)(void);

  v4 = (Class *)off_101197D20;
  if (a3 != 5)
    v4 = (Class *)UISwitch_ptr;
  v5 = objc_msgSend(objc_alloc(*v4), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "_switchDidChangeValue:", 4096);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugSwitchTableRow get](self, "get"));

  if (v6)
  {
    v7 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MapsDebugSwitchTableRow get](self, "get"));
    objc_msgSend(v5, "setOn:", v7[2]());

  }
  objc_msgSend(v5, "sizeToFit");
  objc_msgSend(v5, "setEnabled:", self->_enabled);
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("MapsDebugToggle"));
  return v5;
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  UISwitch *v6;
  UISwitch *toggle;
  UISwitch *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapsDebugSwitchTableRow;
  -[MapsDebugTableRow configureCell:](&v16, "configureCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v6 = (UISwitch *)objc_claimAutoreleasedReturnValue(-[MapsDebugSwitchTableRow _createToggleForIdiom:](self, "_createToggleForIdiom:", objc_msgSend(v5, "userInterfaceIdiom")));

  objc_msgSend(v4, "setAccessoryView:", v6);
  toggle = self->_toggle;
  self->_toggle = v6;
  v8 = v6;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentConfiguration"));
  if (self->_enabled)
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v11 = (void *)v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textProperties"));
  objc_msgSend(v12, "setColor:", v11);

  objc_msgSend(v4, "setContentConfiguration:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (v14 == (id)5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    -[MapsDebugSwitchTableRow _configureTapGesture:](self, "_configureTapGesture:", v15);

  }
}

- (void)configureCollectionViewCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  id v24;
  id v25;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MapsDebugSwitchTableRow;
  -[MapsDebugTableRow configureCollectionViewCell:](&v23, "configureCollectionViewCell:", v4);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugSwitchTableRow _createToggleForIdiom:](self, "_createToggleForIdiom:", objc_msgSend(v6, "userInterfaceIdiom")));

  v8 = objc_msgSend(objc_alloc((Class)_UICellAccessoryConfigurationCustomView), "initWithCustomView:", v7);
  objc_storeStrong((id *)&self->_toggle, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == (id)5)
  {
    v25 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    objc_msgSend(v5, "setLeadingAccessoryConfigurations:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
    -[MapsDebugSwitchTableRow _configureTapGesture:](self, "_configureTapGesture:", v12);
  }
  else
  {
    v24 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    objc_msgSend(v5, "setTrailingAccessoryConfigurations:", v12);
  }

  if (self->_enabled)
    v13 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v13 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
  objc_msgSend(v15, "setTextColor:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentConfiguration"));
  if (self->_enabled)
    v17 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v17 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v18 = (void *)v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textProperties"));
  objc_msgSend(v19, "setColor:", v18);

  if (!self->_enabled)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "image"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "image"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_mapkit_imageWithAlpha:", 0.5));
      objc_msgSend(v16, "setImage:", v22);

    }
  }
  objc_msgSend(v5, "setContentConfiguration:", v16);

}

- (void)_configureTapGesture:(id)a3
{
  id v4;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (tapGestureRecognizer)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITapGestureRecognizer view](tapGestureRecognizer, "view"));
      objc_msgSend(v6, "removeGestureRecognizer:", self->_tapGestureRecognizer);

    }
    v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_didTapContent:");
    v8 = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v7;

    objc_msgSend(v9, "setUserInteractionEnabled:", 1);
    objc_msgSend(v9, "addGestureRecognizer:", self->_tapGestureRecognizer);
    v4 = v9;
  }

}

- (void)_switchDidChangeValue:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, id);

  v4 = objc_msgSend(a3, "isOn");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugSwitchTableRow set](self, "set"));

  if (v5)
  {
    v6 = (void (**)(id, id))objc_claimAutoreleasedReturnValue(-[MapsDebugSwitchTableRow set](self, "set"));
    v6[2](v6, v4);

  }
}

- (void)_didTapContent:(id)a3
{
  UISwitch *toggle;

  toggle = self->_toggle;
  if (toggle)
  {
    -[UISwitch setOn:animated:](toggle, "setOn:animated:", -[UISwitch isOn](self->_toggle, "isOn", a3) ^ 1, 1);
    -[MapsDebugSwitchTableRow _switchDidChangeValue:](self, "_switchDidChangeValue:", self->_toggle);
  }
}

- (id)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)get
{
  return self->_get;
}

- (void)setGet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_get, 0);
  objc_storeStrong(&self->_set, 0);
  objc_storeStrong((id *)&self->_toggle, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end
