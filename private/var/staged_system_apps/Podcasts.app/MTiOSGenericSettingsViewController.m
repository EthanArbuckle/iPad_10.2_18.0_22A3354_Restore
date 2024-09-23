@implementation MTiOSGenericSettingsViewController

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MTiOSGenericSettingsViewController;
  -[MTGenericSettingsViewController configureCell:atIndexPath:withDescription:inGroupWithIdentifier:](&v26, "configureCell:atIndexPath:withDescription:inGroupWithIdentifier:", v10, v11, v12, v13);
  if (objc_msgSend(v12, "type") == (id)6)
  {
    v14 = v12;
    v15 = v10;
    objc_msgSend(v15, "setDelegate:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textField"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
    objc_msgSend(v16, "setText:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textField"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "placeholder"));
    objc_msgSend(v18, "setPlaceholder:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textField"));
    objc_msgSend(v20, "setReturnKeyType:", 9);

    objc_msgSend(v15, "setSelectionStyle:", 0);
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10004D1DC;
    v22[3] = &unk_1004A6068;
    objc_copyWeak(&v24, &location);
    v21 = v14;
    v23 = v21;
    objc_msgSend(v15, "setTextChanged:", v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
}

- (void)setCell:(id)a3 enabled:(BOOL)a4 withDescription:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  v6 = a4;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTiOSGenericSettingsViewController;
  v9 = a5;
  -[MTGenericSettingsViewController setCell:enabled:withDescription:](&v12, "setCell:enabled:withDescription:", v8, v6, v9);
  v10 = objc_msgSend(v9, "type", v12.receiver, v12.super_class);

  if (v10 == (id)6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textField"));
    objc_msgSend(v11, "setEnabled:", v6);

  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTiOSGenericSettingsViewController;
  v7 = -[MTGenericSettingsViewController tableView:willSelectRowAtIndexPath:](&v13, "tableView:willSelectRowAtIndexPath:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v6));
    v10 = objc_msgSend(v9, "type");
    v11 = 0;
    if (v10 && v10 != (id)6)
      v11 = v6;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  UITextField *v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tap;
  UITextField *activeTextField;
  UITextField *v8;
  id v9;

  v4 = (UITextField *)a3;
  v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "dismissKeyboard:");
  tap = self->_tap;
  self->_tap = v5;

  -[UITapGestureRecognizer setCancelsTouchesInView:](self->_tap, "setCancelsTouchesInView:", 0);
  activeTextField = self->_activeTextField;
  self->_activeTextField = v4;
  v8 = v4;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[MTiOSGenericSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v9, "addGestureRecognizer:", self->_tap);

}

- (void)textFieldDidEndEditing:(id)a3
{
  UITextField *activeTextField;
  id v5;

  activeTextField = self->_activeTextField;
  self->_activeTextField = 0;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTiOSGenericSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v5, "removeGestureRecognizer:", self->_tap);

}

- (void)dismissKeyboard:(id)a3
{
  UITextField *activeTextField;

  -[UITextField resignFirstResponder](self->_activeTextField, "resignFirstResponder", a3);
  activeTextField = self->_activeTextField;
  self->_activeTextField = 0;

}

- (id)optionsTableViewControllerWithOption:(id)a3
{
  id v3;
  MTOptionsTableViewController *v4;

  v3 = a3;
  v4 = -[MTOptionsTableViewController initWithOption:largeTitleDisplayMode:]([MTOptionsTableViewController alloc], "initWithOption:largeTitleDisplayMode:", v3, 2);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tap, 0);
  objc_storeStrong((id *)&self->_activeTextField, 0);
}

@end
