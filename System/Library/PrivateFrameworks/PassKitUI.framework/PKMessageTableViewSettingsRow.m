@implementation PKMessageTableViewSettingsRow

+ (id)cellReuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (PKMessageTableViewSettingsRow)initWithIdentifier:(id)a3 contentConfiguration:(id)a4
{
  id v6;
  id v7;
  PKMessageTableViewSettingsRow *v8;
  uint64_t v9;
  NSCopying *identifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKMessageTableViewSettingsRow;
  v8 = -[PKMessageTableViewSettingsRow init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSCopying *)v9;

    objc_storeStrong((id *)&v8->_config, a4);
  }

  return v8;
}

- (void)setActionOnDismiss:(id)a3
{
  void *v4;
  id actionOnDismiss;

  v4 = _Block_copy(a3);
  actionOnDismiss = self->_actionOnDismiss;
  self->_actionOnDismiss = v4;

}

- (BOOL)shouldHighlight
{
  return 0;
}

- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  PKMessageTableCell *v7;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "cellReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v6);
  v7 = (PKMessageTableCell *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = -[PKMessageTableCell initWithStyle:reuseIdentifier:]([PKMessageTableCell alloc], "initWithStyle:reuseIdentifier:", 0, v6);
  -[PKMessageTableCell setContent:](v7, "setContent:", self->_config);
  -[PKMessageTableCell setActionOnDismiss:](v7, "setActionOnDismiss:", self->_actionOnDismiss);
  -[PKMessageTableCell setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", self->_identifier);

  return v7;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_actionOnDismiss, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
