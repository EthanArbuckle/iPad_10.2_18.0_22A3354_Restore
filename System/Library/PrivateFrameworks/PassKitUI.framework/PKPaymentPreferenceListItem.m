@implementation PKPaymentPreferenceListItem

- (PKPaymentPreferenceListItem)initWithSectionPreference:(id)a3
{
  id v5;
  PKPaymentPreferenceListItem *v6;
  PKPaymentPreferenceListItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPreferenceListItem;
  v6 = -[PKPaymentPreferenceListItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sectionPreference, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_storeStrong(v4 + 1, self->_sectionPreference);
  return v4;
}

- (id)_internalConfiguration
{
  return (id)objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
}

- (id)configuration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PKPaymentPreferenceListItem _internalConfiguration](self, "_internalConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferenceListItem _text](self, "_text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  -[PKPaymentPreferenceListItem _secondaryText](self, "_secondaryText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryText:", v5);

  -[PKPaymentPreferenceListItem _image](self, "_image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

  objc_msgSend(v3, "secondaryTextProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v8);

  objc_msgSend(v3, "directionalLayoutMargins");
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 10.0);
  return v3;
}

- (id)_text
{
  return 0;
}

- (id)_secondaryText
{
  return 0;
}

- (id)_image
{
  return 0;
}

- (id)defaultAccessories
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsSwipeActionType:(int)a3
{
  return 0;
}

- (BOOL)supportsInlineEditing
{
  return 0;
}

- (BOOL)isOptionItem
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isAddItem
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (PKPaymentPreference)sectionPreference
{
  return self->_sectionPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionPreference, 0);
}

@end
