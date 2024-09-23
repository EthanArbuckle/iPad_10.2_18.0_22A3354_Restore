@implementation _UIPrototypingMenuBoolCell

- (_UIPrototypingMenuBoolCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _UIPrototypingMenuBoolCell *v4;
  UISwitch *v5;
  uint64_t v6;
  UISwitch *valueSwitch;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIPrototypingMenuBoolCell;
  v4 = -[_UIPrototypingMenuCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = [UISwitch alloc];
    v6 = -[UISwitch initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    valueSwitch = v4->_valueSwitch;
    v4->_valueSwitch = (UISwitch *)v6;

    -[UIView sizeToFit](v4->_valueSwitch, "sizeToFit");
    -[UIControl addTarget:action:forControlEvents:](v4->_valueSwitch, "addTarget:action:forControlEvents:", v4, sel__switchDidChangeValue_, 4096);
    -[_UIPrototypingMenuCell stackView](v4, "stackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addArrangedSubview:", v4->_valueSwitch);

    -[UITableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  }
  return v4;
}

+ (int64_t)_layoutAxis
{
  return 0;
}

- (void)_prototypingSettingDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPrototypingMenuBoolCell;
  -[_UIPrototypingMenuCell _prototypingSettingDidChange](&v7, sel__prototypingSettingDidChange);
  -[_UIPrototypingMenuCell prototypingSetting](self, "prototypingSetting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");
  -[_UIPrototypingMenuBoolCell valueSwitch](self, "valueSwitch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOn:", v5);

}

- (void)_switchDidChangeValue:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isOn"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPrototypingMenuCell prototypingSetting](self, "prototypingSetting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentValue:", v5);

}

- (UISwitch)valueSwitch
{
  return self->_valueSwitch;
}

- (void)setValueSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_valueSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSwitch, 0);
}

@end
