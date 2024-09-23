@implementation RAPSwitchTableViewCell

- (RAPSwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 delegate:(id)a5
{
  id v8;
  RAPSwitchTableViewCell *v9;
  RAPSwitchTableViewCell *v10;
  UISwitch *v11;
  UISwitch *toggle;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RAPSwitchTableViewCell;
  v9 = -[RAPSingleLineTableViewCell initWithStyle:reuseIdentifier:](&v14, "initWithStyle:reuseIdentifier:", a3, a4);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v11 = (UISwitch *)objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    toggle = v10->_toggle;
    v10->_toggle = v11;

    -[UISwitch addTarget:action:forControlEvents:](v10->_toggle, "addTarget:action:forControlEvents:", v10, "updateValue:", 4096);
    -[RAPSwitchTableViewCell setAccessoryView:](v10, "setAccessoryView:", v10->_toggle);
    -[RAPSwitchTableViewCell setSelectionStyle:](v10, "setSelectionStyle:", 0);
  }

  return v10;
}

- (void)setCorrectableFlag:(id)a3
{
  RAPPlaceCorrectableFlag *v5;
  RAPPlaceCorrectableFlag *v6;

  v5 = (RAPPlaceCorrectableFlag *)a3;
  if (self->_correctableFlag != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_correctableFlag, a3);
    -[RAPSwitchTableViewCell _updateContent](self, "_updateContent");
    v5 = v6;
  }

}

- (void)_updateContent
{
  void *v3;
  id v4;

  -[UISwitch setOn:animated:](self->_toggle, "setOn:animated:", -[RAPPlaceCorrectableFlag value](self->_correctableFlag, "value"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableFlag localizedTitle](self->_correctableFlag, "localizedTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSingleLineTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "setText:", v4);

}

- (int64_t)kind
{
  return -[RAPPlaceCorrectableFlag kind](self->_correctableFlag, "kind");
}

- (void)updateValue:(id)a3
{
  RAPSwitchTableViewCellDelegate **p_delegate;
  id v5;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_msgSend(v5, "isOn");

  objc_msgSend(WeakRetained, "switchTableViewCell:changedValue:", self, v6);
}

- (void)updateSwitchState:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UISwitch isOn](self->_toggle, "isOn") != a3)
    -[UISwitch setOn:animated:](self->_toggle, "setOn:animated:", v3, 1);
}

- (RAPPlaceCorrectableFlag)correctableFlag
{
  return self->_correctableFlag;
}

- (BOOL)switchState
{
  return self->_switchState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctableFlag, 0);
  objc_storeStrong((id *)&self->_toggle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
