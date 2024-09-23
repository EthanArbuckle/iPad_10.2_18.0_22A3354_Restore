@implementation MapsDebugCheckmarkRow

- (MapsDebugCheckmarkRow)init
{
  MapsDebugCheckmarkRow *v2;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsDebugCheckmarkRow;
  v2 = -[MapsDebugTableRow init](&v7, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10025A19C;
    v4[3] = &unk_1011AD260;
    objc_copyWeak(&v5, &location);
    -[MapsDebugCheckmarkRow setSelectionAction:](v2, "setSelectionAction:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (void)invalidate
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow rowsGroup](self, "rowsGroup"));
  objc_msgSend(v3, "checkmarkRowWillInvalidate:", self);

  -[MapsDebugCheckmarkRow setRowsGroup:](self, "setRowsGroup:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MapsDebugCheckmarkRow;
  -[MapsDebugTableRow invalidate](&v4, "invalidate");
}

- (void)setValue:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_value != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_value, a3);
    -[MapsDebugCheckmarkRow update](self, "update");
    v5 = v6;
  }

}

- (void)setCurrentCollectionViewCell:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsDebugCheckmarkRow;
  -[MapsDebugTableRow setCurrentCollectionViewCell:](&v4, "setCurrentCollectionViewCell:", a3);
  -[MapsDebugCheckmarkRow update](self, "update");
}

- (void)update
{
  -[MapsDebugCheckmarkRow updateChecked](self, "updateChecked");
  -[MapsDebugCheckmarkRow updateConfiguration](self, "updateConfiguration");
}

- (void)updateChecked
{
  void *v3;
  uint64_t (**v4)(void);
  uint64_t v5;
  id v6;
  void *v7;
  BOOL *p_checked;
  void *v9;
  unsigned int v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow get](self, "get"));

  if (v3)
  {
    v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow get](self, "get"));
    v5 = v4[2]();
    v14 = (id)objc_claimAutoreleasedReturnValue(v5);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow value](self, "value"));
    if (v6 == v14)
    {
      p_checked = &self->_checked;
      self->_checked = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow value](self, "value"));
      p_checked = &self->_checked;
      self->_checked = objc_msgSend(v7, "isEqual:", v14);

    }
    if (!*p_checked)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow rowsGroup](self, "rowsGroup"));
      v10 = objc_msgSend(v9, "allowsMultipleSelection");

      if (v10)
      {
        v11 = v14;
        v12 = objc_opt_class(NSArray);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow value](self, "value"));
          *p_checked = objc_msgSend(v11, "containsObject:", v13);

        }
        else
        {
          *p_checked = 0;
        }

      }
    }

  }
  else
  {
    self->_checked = 0;
  }
}

- (void)updateConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCell](self, "currentCell"));
    -[MapsDebugCheckmarkRow _configureCellForCheckedValue:](self, "_configureCellForCheckedValue:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCollectionViewCell](self, "currentCollectionViewCell"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow currentCollectionViewCell](self, "currentCollectionViewCell"));
    -[MapsDebugCheckmarkRow _configureCollectionViewCellForCheckedValue:](self, "_configureCollectionViewCellForCheckedValue:", v6);

  }
}

- (id)selectionAction
{
  id v4;
  objc_super v5;

  if (-[MapsDebugCheckmarkRow isDisabled](self, "isDisabled"))
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)MapsDebugCheckmarkRow;
  v4 = -[MapsDebugTableRow selectionAction](&v5, "selectionAction");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)get
{
  return self->_get;
}

- (void)setGet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)value
{
  return self->_value;
}

- (MapsDebugCheckmarkRowsGroup)rowsGroup
{
  return self->_rowsGroup;
}

- (void)setRowsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_rowsGroup, a3);
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowsGroup, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong(&self->_get, 0);
  objc_storeStrong(&self->_controlSelectionAction, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

- (BOOL)isDisabled
{
  void *v3;
  void *v4;
  unsigned int v5;

  if (self->_checked)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow rowsGroup](self, "rowsGroup"));
    if (objc_msgSend(v3, "allowsMultipleSelection"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow rowsGroup](self, "rowsGroup"));
      v5 = objc_msgSend(v4, "canDeselectRows") ^ 1;

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setSelectionAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id controlSelectionAction;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)5)
  {
    v7 = objc_msgSend(v4, "copy");

    controlSelectionAction = self->_controlSelectionAction;
    self->_controlSelectionAction = v7;

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MapsDebugCheckmarkRow;
    -[MapsDebugTableRow setSelectionAction:](&v9, "setSelectionAction:", v4);

  }
}

- (void)_configureCellForCheckedValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == (id)5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow _createAccessoryView](self, "_createAccessoryView"));
    objc_msgSend(v17, "setAccessoryView:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textLabel"));
    -[MapsDebugCheckmarkRow _configureTapGestureOnLabel:](self, "_configureTapGestureOnLabel:", v7);

  }
  else
  {
    if (self->_checked)
      v8 = 3;
    else
      v8 = 0;
    objc_msgSend(v17, "setAccessoryType:", v8);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow get](self, "get"));

  if (v9)
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textLabel"));
  objc_msgSend(v12, "setTextColor:", v11);

  if (-[MapsDebugCheckmarkRow isDisabled](self, "isDisabled"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    objc_msgSend(v17, "setTintColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentView"));
    v15 = v14;
    v16 = 0.5;
  }
  else
  {
    objc_msgSend(v17, "setTintColor:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentView"));
    v15 = v14;
    v16 = 1.0;
  }
  objc_msgSend(v14, "setAlpha:", v16);

}

- (void)_configureCollectionViewCellForCheckedValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)5)
  {
    objc_msgSend(v4, "_setBackgroundViewConfiguration:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow _createAccessoryView](self, "_createAccessoryView"));
    v8 = objc_msgSend(objc_alloc((Class)_UICellAccessoryConfigurationCustomView), "initWithCustomView:", v7);
    v26 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    objc_msgSend(v4, "setLeadingAccessoryConfigurations:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
    -[MapsDebugCheckmarkRow _configureTapGestureOnLabel:](self, "_configureTapGestureOnLabel:", v10);

  }
  else
  {
    if (self->_checked)
    {
      v11 = objc_alloc_init((Class)_UICellAccessoryConfigurationCheckmark);
      if (-[MapsDebugCheckmarkRow isDisabled](self, "isDisabled"))
        v12 = objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
      else
        v12 = objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor"));
      v13 = (void *)v12;
      objc_msgSend(v11, "setTintColor:", v12);

      v25 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
      objc_msgSend(v4, "setTrailingAccessoryConfigurations:", v14);

    }
    else
    {
      objc_msgSend(v4, "setTrailingAccessoryConfigurations:", &__NSArray0__struct);
    }
    v7 = 0;
  }
  if (-[MapsDebugCheckmarkRow isDisabled](self, "isDisabled"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
    objc_msgSend(v16, "setTintColor:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    objc_msgSend(v17, "setAlpha:", 0.5);

    v18 = objc_opt_class(UISwitch);
    if ((objc_opt_isKindOfClass(v7, v18) & 1) != 0)
      objc_msgSend(v7, "setEnabled:", 0);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
    objc_msgSend(v19, "setTintColor:", 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    objc_msgSend(v20, "setAlpha:", 1.0);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow get](self, "get"));

  if (v21)
    v22 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v22 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v23 = (void *)v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
  objc_msgSend(v24, "setTextColor:", v23);

}

- (void)_configureTapGestureOnLabel:(id)a3
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
    v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_didTapLabel:");
    v8 = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v7;

    objc_msgSend(v9, "setUserInteractionEnabled:", 1);
    objc_msgSend(v9, "addGestureRecognizer:", self->_tapGestureRecognizer);
    v4 = v9;
  }

}

- (id)_createAccessoryView
{
  void *v3;
  unsigned int v4;
  NonFocusableSwitch *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow rowsGroup](self, "rowsGroup"));
  v4 = objc_msgSend(v3, "allowsMultipleSelection");

  if (v4)
  {
    v5 = -[NonFocusableSwitch initWithFrame:]([NonFocusableSwitch alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[NonFocusableSwitch addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, "_didSelectAccessory:", 4096);
    -[NonFocusableSwitch setOn:](v5, "setOn:", self->_checked);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow rowsGroup](self, "rowsGroup"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
    v5 = (NonFocusableSwitch *)objc_claimAutoreleasedReturnValue(+[MapsRadioButton buttonWithGroupIdentifier:](MapsRadioButton, "buttonWithGroupIdentifier:", v7));

    -[NonFocusableSwitch addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, "_didSelectAccessory:", 4096);
    -[NonFocusableSwitch setSelected:](v5, "setSelected:", self->_checked);
  }
  -[NonFocusableSwitch sizeToFit](v5, "sizeToFit");
  return v5;
}

- (void)_didSelectAccessory:(id)a3
{
  -[MapsDebugCheckmarkRow _fireControlSelectionAction](self, "_fireControlSelectionAction", a3);
}

- (void)_didTapLabel:(id)a3
{
  uint64_t v4;

  v4 = objc_opt_class(MapsDebugCheckmarkRow, a2);
  if ((objc_opt_isKindOfClass(self, v4) & 1) != 0)
    -[MapsDebugCheckmarkRow _fireControlSelectionAction](self, "_fireControlSelectionAction");
}

- (void)_fireControlSelectionAction
{
  void (**controlSelectionAction)(void);
  void *v4;
  unsigned int v5;
  void *v6;
  void (**v7)(void);

  controlSelectionAction = (void (**)(void))self->_controlSelectionAction;
  if (controlSelectionAction)
  {
    if (!self->_checked)
    {
LABEL_5:
      controlSelectionAction[2]();
      return;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow rowsGroup](self, "rowsGroup"));
    v5 = objc_msgSend(v4, "canDeselectRows");

    if (v5)
    {
      controlSelectionAction = (void (**)(void))self->_controlSelectionAction;
      goto LABEL_5;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow selectionAction](self, "selectionAction"));

  if (v6)
  {
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRow selectionAction](self, "selectionAction"));
    v7[2]();

  }
}

- (void)configureCell:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsDebugCheckmarkRow;
  v4 = a3;
  -[MapsDebugTableRow configureCell:](&v5, "configureCell:", v4);
  -[MapsDebugCheckmarkRow _configureCellForCheckedValue:](self, "_configureCellForCheckedValue:", v4, v5.receiver, v5.super_class);

}

- (void)configureCollectionViewCell:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsDebugCheckmarkRow;
  v4 = a3;
  -[MapsDebugTableRow configureCollectionViewCell:](&v5, "configureCollectionViewCell:", v4);
  -[MapsDebugCheckmarkRow _configureCollectionViewCellForCheckedValue:](self, "_configureCollectionViewCellForCheckedValue:", v4, v5.receiver, v5.super_class);

}

@end
