@implementation PKPaymentSetupFieldPickerItem

- (PKPaymentSetupFieldPickerItem)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PKPaymentSetupFieldPickerItem *v8;
  PKPaymentSetupFieldPickerItem *v9;
  uint64_t v10;
  NSString *localizedDisplayName;
  uint64_t v12;
  NSString *submissionValue;
  uint64_t v14;
  NSString *submissionConfirmationTitle;
  uint64_t v16;
  NSString *submissionConfirmationDescription;
  void *v18;
  PKPaymentSetupFieldPicker *v19;
  void *v20;
  uint64_t v21;
  PKPaymentSetupFieldPicker *nextLevelPicker;
  objc_super v24;

  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDisplayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("submissionValue"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v24.receiver = self;
    v24.super_class = (Class)PKPaymentSetupFieldPickerItem;
    v9 = -[PKPaymentSetupFieldPickerItem init](&v24, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(v5, "copy");
      localizedDisplayName = v9->_localizedDisplayName;
      v9->_localizedDisplayName = (NSString *)v10;

      v12 = objc_msgSend(v7, "copy");
      submissionValue = v9->_submissionValue;
      v9->_submissionValue = (NSString *)v12;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("submissionConfirmationTitle"));
      v14 = objc_claimAutoreleasedReturnValue();
      submissionConfirmationTitle = v9->_submissionConfirmationTitle;
      v9->_submissionConfirmationTitle = (NSString *)v14;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("submissionConfirmationDescription"));
      v16 = objc_claimAutoreleasedReturnValue();
      submissionConfirmationDescription = v9->_submissionConfirmationDescription;
      v9->_submissionConfirmationDescription = (NSString *)v16;

      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("nextPickerLevel"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = [PKPaymentSetupFieldPicker alloc];
        objc_msgSend(v18, "PKStringForKey:", CFSTR("submissionKey"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PKPaymentSetupField initWithIdentifier:configuration:](v19, "initWithIdentifier:configuration:", v20, v18);
        nextLevelPicker = v9->_nextLevelPicker;
        v9->_nextLevelPicker = (PKPaymentSetupFieldPicker *)v21;

      }
    }
    self = v9;
    v8 = self;
  }

  return v8;
}

+ (id)_itemWithDIAttributePickerItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "localizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithName:value:", v6, v7);

  objc_msgSend(v8, "setAttributePickerItem:", v4);
  return v8;
}

- (DIAttributePickerItem)attributePickerItem
{
  DIAttributePickerItem *attributePickerItem;
  id v4;
  void *v5;
  void *v6;
  DIAttributePickerItem *v7;
  DIAttributePickerItem *v8;

  attributePickerItem = self->_attributePickerItem;
  if (!attributePickerItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0D169D8]);
    -[PKPaymentSetupFieldPickerItem localizedDisplayName](self, "localizedDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldPickerItem submissionValue](self, "submissionValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (DIAttributePickerItem *)objc_msgSend(v4, "initWithName:value:", v5, v6);
    v8 = self->_attributePickerItem;
    self->_attributePickerItem = v7;

    attributePickerItem = self->_attributePickerItem;
  }
  return attributePickerItem;
}

- (PKPaymentSetupFieldPickerItem)initWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKPaymentSetupFieldPickerItem *v9;
  PKPaymentSetupFieldPickerItem *v10;
  uint64_t v11;
  NSString *localizedDisplayName;
  uint64_t v13;
  NSString *submissionValue;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)PKPaymentSetupFieldPickerItem;
    v10 = -[PKPaymentSetupFieldPickerItem init](&v16, sel_init);
    if (v10)
    {
      v11 = objc_msgSend(v6, "copy");
      localizedDisplayName = v10->_localizedDisplayName;
      v10->_localizedDisplayName = (NSString *)v11;

      v13 = objc_msgSend(v8, "copy");
      submissionValue = v10->_submissionValue;
      v10->_submissionValue = (NSString *)v13;

    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_storeStrong(v4 + 1, self->_localizedDisplayName);
  objc_storeStrong(v4 + 2, self->_submissionValue);
  objc_storeStrong(v4 + 3, self->_attributePickerItem);
  objc_storeStrong(v4 + 4, self->_submissionConfirmationTitle);
  objc_storeStrong(v4 + 5, self->_submissionConfirmationDescription);
  objc_storeStrong(v4 + 6, self->_nextLevelPicker);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  char v11;
  void *v12;
  NSString *v13;
  _BOOL4 v14;
  DIAttributePickerItem *attributePickerItem;
  DIAttributePickerItem *v16;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  void *v20;
  NSString *v21;
  _BOOL4 v22;
  PKPaymentSetupFieldPicker *nextLevelPicker;
  PKPaymentSetupFieldPicker *v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)v5[1];
    v7 = self->_localizedDisplayName;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (!v7 || !v8)
        goto LABEL_31;
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v10)
        goto LABEL_32;
    }
    v12 = (void *)v5[2];
    v7 = self->_submissionValue;
    v13 = v12;
    if (v7 == v13)
    {

    }
    else
    {
      v9 = v13;
      if (!v7 || !v13)
        goto LABEL_31;
      v14 = -[NSString isEqualToString:](v7, "isEqualToString:", v13);

      if (!v14)
        goto LABEL_32;
    }
    attributePickerItem = self->_attributePickerItem;
    v16 = (DIAttributePickerItem *)v5[3];
    if (attributePickerItem && v16)
    {
      if ((-[DIAttributePickerItem isEqual:](attributePickerItem, "isEqual:") & 1) == 0)
        goto LABEL_32;
    }
    else if (attributePickerItem != v16)
    {
      goto LABEL_32;
    }
    v17 = (void *)v5[4];
    v7 = self->_submissionConfirmationTitle;
    v18 = v17;
    if (v7 == v18)
    {

    }
    else
    {
      v9 = v18;
      if (!v7 || !v18)
        goto LABEL_31;
      v19 = -[NSString isEqualToString:](v7, "isEqualToString:", v18);

      if (!v19)
        goto LABEL_32;
    }
    v20 = (void *)v5[5];
    v7 = self->_submissionConfirmationDescription;
    v21 = v20;
    if (v7 == v21)
    {

LABEL_36:
      nextLevelPicker = self->_nextLevelPicker;
      v25 = (PKPaymentSetupFieldPicker *)v5[6];
      if (nextLevelPicker && v25)
        v11 = -[PKPaymentSetupFieldPicker isEqual:](nextLevelPicker, "isEqual:");
      else
        v11 = nextLevelPicker == v25;
      goto LABEL_33;
    }
    v9 = v21;
    if (v7 && v21)
    {
      v22 = -[NSString isEqualToString:](v7, "isEqualToString:", v21);

      if (v22)
        goto LABEL_36;
LABEL_32:
      v11 = 0;
LABEL_33:

      goto LABEL_34;
    }
LABEL_31:

    goto LABEL_32;
  }
  v11 = 0;
LABEL_34:

  return v11;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)submissionValue
{
  return self->_submissionValue;
}

- (void)setAttributePickerItem:(id)a3
{
  objc_storeStrong((id *)&self->_attributePickerItem, a3);
}

- (NSString)submissionConfirmationTitle
{
  return self->_submissionConfirmationTitle;
}

- (NSString)submissionConfirmationDescription
{
  return self->_submissionConfirmationDescription;
}

- (PKPaymentSetupFieldPicker)nextLevelPicker
{
  return self->_nextLevelPicker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextLevelPicker, 0);
  objc_storeStrong((id *)&self->_submissionConfirmationDescription, 0);
  objc_storeStrong((id *)&self->_submissionConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_attributePickerItem, 0);
  objc_storeStrong((id *)&self->_submissionValue, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end
