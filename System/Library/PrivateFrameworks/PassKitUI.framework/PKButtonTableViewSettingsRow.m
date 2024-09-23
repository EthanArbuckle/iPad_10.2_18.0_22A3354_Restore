@implementation PKButtonTableViewSettingsRow

- (PKButtonTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 tapHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKButtonTableViewSettingsRow *v11;
  uint64_t v12;
  NSCopying *identifier;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  id changeHandler;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKButtonTableViewSettingsRow;
  v11 = -[PKButtonTableViewSettingsRow init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSCopying *)v12;

    v14 = objc_msgSend(v9, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    changeHandler = v11->_changeHandler;
    v11->_changeHandler = (id)v16;

  }
  return v11;
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
  PKIntegerHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKButtonTableViewSettingsRow *v4;
  PKButtonTableViewSettingsRow *v5;
  PKButtonTableViewSettingsRow *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;

  v4 = (PKButtonTableViewSettingsRow *)a3;
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

              goto LABEL_18;
            }
            v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

            if (!v11)
              goto LABEL_18;
          }
          if (PKEqualObjects()
            && self->_style == v6->_style
            && self->_changeHandler == v6->_changeHandler)
          {
            v12 = self->_enabled == v6->_enabled;
LABEL_19:

            goto LABEL_20;
          }
        }
LABEL_18:
        v12 = 0;
        goto LABEL_19;
      }
    }
    v12 = 0;
  }
LABEL_20:

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
  int64_t style;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "cellReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, v6);
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", self->_title);

  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

  style = self->_style;
  switch(style)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 1;
LABEL_10:
      objc_msgSend(v7, "setAccessoryType:", v13);
      goto LABEL_12;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v12 = (void *)v11;
      v13 = 0;
      goto LABEL_10;
  }
  v12 = 0;
LABEL_12:
  if (!self->_enabled)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  objc_msgSend(v7, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v12);

  objc_msgSend(v7, "setAccessibilityIdentifier:", self->_identifier);
  return v7;
}

- (BOOL)shouldHighlight
{
  return self->_enabled;
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

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
