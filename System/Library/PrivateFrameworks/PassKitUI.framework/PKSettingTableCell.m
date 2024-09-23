@implementation PKSettingTableCell

- (PKSettingTableCell)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  PKSettingTableCell *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  v10 = -[PKSettingTableCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, 0);
  -[PKSettingTableCell setTarget:action:](v10, "setTarget:action:", v8, a5);

  -[PKSettingTableCell textLabel](v10, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v9);

  -[PKSettingTableCell textLabel](v10, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  -[PKSettingTableCell textLabel](v10, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

  return v10;
}

- (PKSettingTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKSettingTableCell *v4;
  UISwitch *v5;
  UISwitch *settingSwitch;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKSettingTableCell;
  v4 = -[PKSettingTableCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    settingSwitch = v4->_settingSwitch;
    v4->_settingSwitch = v5;

    -[PKSettingTableCell setAccessoryView:](v4, "setAccessoryView:", v4->_settingSwitch);
    -[PKSettingTableCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  }
  -[PKSettingTableCell textLabel](v4, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 0);

  -[PKSettingTableCell textLabel](v4, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKSettingTableCell;
  -[PKSettingTableCell dealloc](&v2, sel_dealloc);
}

- (BOOL)isOn
{
  return -[UISwitch isOn](self->_settingSwitch, "isOn");
}

- (void)setOn:(BOOL)a3
{
  -[PKSettingTableCell setOn:notify:](self, "setOn:notify:", a3, 1);
}

- (void)setOn:(BOOL)a3 notify:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  id v7;

  v4 = a3;
  if (!a4 && self->_action && (WeakRetained = objc_loadWeakRetained(&self->_target)) != 0)
  {
    v7 = WeakRetained;
    -[UISwitch removeTarget:action:forControlEvents:](self->_settingSwitch, "removeTarget:action:forControlEvents:", WeakRetained, self->_action, 4096);
    -[UISwitch setOn:](self->_settingSwitch, "setOn:", v4);
    -[UISwitch addTarget:action:forControlEvents:](self->_settingSwitch, "addTarget:action:forControlEvents:", v7, self->_action, 4096);

  }
  else
  {
    -[UISwitch setOn:](self->_settingSwitch, "setOn:", v4);
  }
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  id WeakRetained;
  void *v7;
  id *p_target;
  id obj;

  obj = a3;
  if (self->_action)
  {
    WeakRetained = objc_loadWeakRetained(&self->_target);
    if (WeakRetained)
    {
      v7 = WeakRetained;
      -[UISwitch removeTarget:action:forControlEvents:](self->_settingSwitch, "removeTarget:action:forControlEvents:", WeakRetained, self->_action, 4096);

    }
  }
  p_target = &self->_target;
  if (obj && a4)
  {
    objc_storeWeak(p_target, obj);
    self->_action = a4;
    -[UISwitch addTarget:action:forControlEvents:](self->_settingSwitch, "addTarget:action:forControlEvents:", obj, a4, 4096);
  }
  else
  {
    objc_storeWeak(p_target, 0);
    self->_action = 0;
  }

}

- (void)showSpinner:(BOOL)a3
{
  UIActivityIndicatorView **p_spinner;
  UIActivityIndicatorView *spinner;
  uint64_t v6;
  UIActivityIndicatorView *v7;

  if (self->_showingSpinner != a3)
  {
    self->_showingSpinner = a3;
    if (a3)
    {
      p_spinner = &self->_spinner;
      spinner = self->_spinner;
      if (!spinner)
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        v7 = *p_spinner;
        *p_spinner = (UIActivityIndicatorView *)v6;

        spinner = *p_spinner;
      }
      -[UIActivityIndicatorView startAnimating](spinner, "startAnimating");
    }
    else
    {
      p_spinner = (UIActivityIndicatorView **)&self->_settingSwitch;
    }
    -[PKSettingTableCell setAccessoryView:](self, "setAccessoryView:", *p_spinner);
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSettingTableCell;
  -[PKTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKSettingTableCell showSpinner:](self, "showSpinner:", 0);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)action
{
  return self->_action;
}

- (UISwitch)settingSwitch
{
  return self->_settingSwitch;
}

- (void)setSettingSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_settingSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingSwitch, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
