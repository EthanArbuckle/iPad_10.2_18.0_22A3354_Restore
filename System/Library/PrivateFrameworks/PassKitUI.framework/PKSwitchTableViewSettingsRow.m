@implementation PKSwitchTableViewSettingsRow

- (PKSwitchTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(BOOL)a5 changeHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  PKSwitchTableViewSettingsRow *v13;
  uint64_t v14;
  NSCopying *identifier;
  uint64_t v16;
  NSString *title;
  uint64_t v18;
  id value;
  uint64_t v20;
  id changeHandler;
  objc_super v23;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PKSwitchTableViewSettingsRow;
  v13 = -[PKSwitchTableViewSettingsRow init](&v23, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSCopying *)v14;

    v16 = objc_msgSend(v11, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v18 = objc_claimAutoreleasedReturnValue();
    value = v13->_value;
    v13->_value = (id)v18;

    v20 = objc_msgSend(v12, "copy");
    changeHandler = v13->_changeHandler;
    v13->_changeHandler = (id)v20;

  }
  return v13;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_value);
  PKCombinedHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKSwitchTableViewSettingsRow *v4;
  PKSwitchTableViewSettingsRow *v5;
  PKSwitchTableViewSettingsRow *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;

  v4 = (PKSwitchTableViewSettingsRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if (PKEqualObjects())
        {
          title = v6->_title;
          v8 = self->_title;
          v9 = title;
          if (v8 == v9)
          {

          }
          else
          {
            v10 = v9;
            if (!v8 || !v9)
            {

              goto LABEL_17;
            }
            v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

            if (!v11)
              goto LABEL_17;
          }
          if (PKEqualObjects() && self->_changeHandler == v6->_changeHandler)
          {
            v12 = self->_enabled == v6->_enabled;
LABEL_18:

            goto LABEL_19;
          }
        }
LABEL_17:
        v12 = 0;
        goto LABEL_18;
      }
    }
    v12 = 0;
  }
LABEL_19:

  return v12;
}

+ (id)cellReuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  PKSettingTableCell *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "cellReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v6);
  v7 = (PKSettingTableCell *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = -[PKSettingTableCell initWithStyle:reuseIdentifier:]([PKSettingTableCell alloc], "initWithStyle:reuseIdentifier:", 0, v6);
  -[PKSettingTableCell setOn:](v7, "setOn:", objc_msgSend(self->_value, "BOOLValue"));
  -[PKSettingTableCell setTarget:action:](v7, "setTarget:action:", self, sel__switchValueChanged_);
  -[PKSettingTableCell settingSwitch](v7, "settingSwitch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", self->_enabled);

  -[PKSettingTableCell textLabel](v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", self->_title);

  -[PKSettingTableCell textLabel](v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

  -[PKSettingTableCell setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", self->_identifier);
  return v7;
}

- (BOOL)shouldHighlight
{
  return 0;
}

- (void)_switchValueChanged:(id)a3
{
  void *v4;
  void (**changeHandler)(void);
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isOn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  changeHandler = (void (**)(void))self->_changeHandler;
  if (changeHandler)
  {
    v6 = v4;
    changeHandler[2]();
    v4 = v6;
  }

}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
