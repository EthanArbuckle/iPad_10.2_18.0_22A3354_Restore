@implementation PKTitleSubtitleTableViewSettingsRow

- (PKTitleSubtitleTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKTitleSubtitleTableViewSettingsRow *v11;
  uint64_t v12;
  NSCopying *identifier;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  id value;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKTitleSubtitleTableViewSettingsRow;
  v11 = -[PKTitleSubtitleTableViewSettingsRow init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSCopying *)v12;

    v14 = objc_msgSend(v9, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    value = v11->_value;
    v11->_value = (id)v16;

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
  v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKTitleSubtitleTableViewSettingsRow *v4;
  PKTitleSubtitleTableViewSettingsRow *v5;
  PKTitleSubtitleTableViewSettingsRow *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  char v12;

  v4 = (PKTitleSubtitleTableViewSettingsRow *)a3;
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

            goto LABEL_13;
          }
          v10 = v9;
          if (v8 && v9)
          {
            v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

            if (!v11)
              goto LABEL_15;
LABEL_13:
            v12 = PKEqualObjects();
LABEL_16:

            goto LABEL_17;
          }

        }
LABEL_15:
        v12 = 0;
        goto LABEL_16;
      }
    }
    v12 = 0;
  }
LABEL_17:

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
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

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
  objc_msgSend(v8, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSString *)*MEMORY[0x1E0DC4A88];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], 0, 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v12);

  objc_msgSend(v8, "secondaryTextProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign(v10, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColor:", v15);

  objc_msgSend(v7, "setContentConfiguration:", v8);
  objc_msgSend(v7, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

  objc_msgSend(v7, "detailTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);

  objc_msgSend(v7, "setAccessibilityIdentifier:", self->_identifier);
  return v7;
}

- (BOOL)shouldHighlight
{
  return 0;
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
