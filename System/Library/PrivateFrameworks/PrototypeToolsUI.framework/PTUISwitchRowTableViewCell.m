@implementation PTUISwitchRowTableViewCell

- (PTUISwitchRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PTUISwitchRowTableViewCell *v4;
  UISwitch *v5;
  UISwitch *v6;
  UISwitch *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PTUISwitchRowTableViewCell;
  v4 = -[PTUISwitchRowTableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UISwitch *)objc_alloc_init(MEMORY[0x24BDF6E28]);
    v6 = v4->_switch;
    v4->_switch = v5;

    v7 = v4->_switch;
    -[PTUISwitchRowTableViewCell _tableView](v4, "_tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitch setOnTintColor:](v7, "setOnTintColor:", v9);

    -[UISwitch addTarget:action:forControlEvents:](v4->_switch, "addTarget:action:forControlEvents:", v4, sel__valueChanged_, 4096);
    -[PTUISwitchRowTableViewCell setAccessoryView:](v4, "setAccessoryView:", v4->_switch);
  }
  return v4;
}

- (void)updateDisplayedValue
{
  void *v3;
  id v4;

  -[PTUIRowTableViewCell row](self, "row");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[UISwitch setOn:](self->_switch, "setOn:", objc_msgSend(v4, "BOOLValue"));
}

- (void)_valueChanged:(id)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = -[UISwitch isOn](self->_switch, "isOn", a3);
  -[PTUIRowTableViewCell row](self, "row");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switch, 0);
}

@end
