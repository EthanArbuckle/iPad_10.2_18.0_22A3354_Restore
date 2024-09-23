@implementation PKSelectionTableViewSettingsRow

- (PKSelectionTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5 tapHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKSelectionTableViewSettingsRow *v14;
  uint64_t v15;
  NSCopying *identifier;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  id value;
  uint64_t v21;
  id changeHandler;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKSelectionTableViewSettingsRow;
  v14 = -[PKSelectionTableViewSettingsRow init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSCopying *)v15;

    v17 = objc_msgSend(v11, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    value = v14->_value;
    v14->_value = (id)v19;

    v21 = objc_msgSend(v13, "copy");
    changeHandler = v14->_changeHandler;
    v14->_changeHandler = (id)v21;

  }
  return v14;
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
  PKSelectionTableViewSettingsRow *v4;
  PKSelectionTableViewSettingsRow *v5;
  PKSelectionTableViewSettingsRow *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;

  v4 = (PKSelectionTableViewSettingsRow *)a3;
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "cellReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, v6);
  objc_msgSend(v7, "defaultContentConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", self->_title);
  objc_msgSend(v8, "setSecondaryText:", self->_value);
  objc_msgSend(v8, "setPrefersSideBySideTextAndSecondaryText:", 1);
  objc_msgSend(v8, "secondaryTextProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v11);

  objc_msgSend(v7, "setContentConfiguration:", v8);
  objc_msgSend(v7, "setAccessoryType:", 1);
  objc_msgSend(v7, "setAccessibilityIdentifier:", self->_identifier);

  return v7;
}

- (BOOL)shouldHighlight
{
  return 1;
}

- (void)handleCellSelection
{
  void (**changeHandler)(id, _QWORD);

  changeHandler = (void (**)(id, _QWORD))self->_changeHandler;
  if (changeHandler)
    changeHandler[2](changeHandler, 0);
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
