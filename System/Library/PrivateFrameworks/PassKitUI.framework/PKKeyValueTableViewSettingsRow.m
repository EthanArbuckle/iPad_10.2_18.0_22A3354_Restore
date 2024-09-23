@implementation PKKeyValueTableViewSettingsRow

- (PKKeyValueTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5
{
  return -[PKKeyValueTableViewSettingsRow initWithIdentifier:title:value:sectionID:](self, "initWithIdentifier:title:value:sectionID:", a3, a4, a5, 0);
}

- (PKKeyValueTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5 sectionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKKeyValueTableViewSettingsRow *v14;
  uint64_t v15;
  NSCopying *identifier;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  id value;
  uint64_t v21;
  NSString *sectionID;
  uint64_t v23;
  UIColor *secondaryTextColor;
  uint64_t v25;
  UIColor *primaryTextColor;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)PKKeyValueTableViewSettingsRow;
  v14 = -[PKKeyValueTableViewSettingsRow init](&v28, sel_init);
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
    sectionID = v14->_sectionID;
    v14->_sectionID = (NSString *)v21;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v23 = objc_claimAutoreleasedReturnValue();
    secondaryTextColor = v14->_secondaryTextColor;
    v14->_secondaryTextColor = (UIColor *)v23;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v25 = objc_claimAutoreleasedReturnValue();
    primaryTextColor = v14->_primaryTextColor;
    v14->_primaryTextColor = (UIColor *)v25;

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
  objc_msgSend(v3, "safelyAddObject:", self->_sectionID);
  v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKKeyValueTableViewSettingsRow *v4;
  PKKeyValueTableViewSettingsRow *v5;
  PKKeyValueTableViewSettingsRow *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  NSString *sectionID;
  NSString *v13;
  NSString *v14;

  v4 = (PKKeyValueTableViewSettingsRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
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
            LOBYTE(v11) = 0;
            if (!v8 || !v9)
            {
LABEL_20:

              goto LABEL_21;
            }
            v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

            if (!v11)
              goto LABEL_21;
          }
          if (PKEqualObjects())
          {
            sectionID = self->_sectionID;
            v13 = v6->_sectionID;
            v8 = sectionID;
            v14 = v13;
            if (v8 == v14)
            {
              LOBYTE(v11) = 1;
              v10 = v8;
            }
            else
            {
              v10 = v14;
              LOBYTE(v11) = 0;
              if (v8 && v14)
                LOBYTE(v11) = -[NSString isEqualToString:](v8, "isEqualToString:", v14);
            }
            goto LABEL_20;
          }
        }
        LOBYTE(v11) = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_22:

  return v11;
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
  void *v12;
  void *v13;

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

  objc_msgSend(v9, "setColor:", self->_secondaryTextColor);
  objc_msgSend(v8, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", self->_primaryTextColor);
  objc_msgSend(v7, "setContentConfiguration:", v8);
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

  objc_msgSend(v7, "detailTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);

  objc_msgSend(v7, "setAccessibilityIdentifier:", self->_identifier);
  objc_msgSend(v7, "pkui_setExcludedFromScreenCapture:andBroadcasting:", self->_sensitive, self->_sensitive);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)sensitive
{
  return self->_sensitive;
}

- (void)setSensitive:(BOOL)a3
{
  self->_sensitive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
