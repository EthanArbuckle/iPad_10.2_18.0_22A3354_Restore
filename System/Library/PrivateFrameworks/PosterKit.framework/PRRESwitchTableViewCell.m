@implementation PRRESwitchTableViewCell

- (PRRESwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PRRESwitchTableViewCell *v4;
  UISwitch *v5;
  UISwitch *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRRESwitchTableViewCell;
  v4 = -[PRRESwitchTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v6 = v4->_switch;
    v4->_switch = v5;

    -[UISwitch addTarget:action:forControlEvents:](v4->_switch, "addTarget:action:forControlEvents:", v4, sel__valueChanged_, 4096);
    -[PRRESwitchTableViewCell setAccessoryView:](v4, "setAccessoryView:", v4->_switch);
  }
  return v4;
}

- (id)_currentValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_switch, "isOn"));
}

- (void)_setCurrentValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  UISwitch *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = objc_opt_class();
  v10 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v10;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v8 = self->_switch;
  v9 = objc_msgSend(v7, "BOOLValue");

  -[UISwitch setOn:](v8, "setOn:", v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switch, 0);
}

@end
