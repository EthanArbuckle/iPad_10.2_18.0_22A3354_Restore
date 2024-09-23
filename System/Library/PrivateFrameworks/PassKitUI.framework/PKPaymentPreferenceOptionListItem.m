@implementation PKPaymentPreferenceOptionListItem

- (PKPaymentPreferenceOptionListItem)initWithPreference:(id)a3 inSectionPreference:(id)a4 hasErrorHandler:(id)a5
{
  id v9;
  id v10;
  PKPaymentPreferenceOptionListItem *v11;
  PKPaymentPreferenceOptionListItem *v12;
  void *v13;
  id hasErrorHandler;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentPreferenceOptionListItem;
  v11 = -[PKPaymentPreferenceListItem initWithSectionPreference:](&v16, sel_initWithSectionPreference_, a4);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_preference, a3);
    v13 = _Block_copy(v10);
    hasErrorHandler = v12->_hasErrorHandler;
    v12->_hasErrorHandler = v13;

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPreferenceOptionListItem;
  v4 = -[PKPaymentPreferenceListItem copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 3, self->_preference);
  v5 = _Block_copy(self->_hasErrorHandler);
  v6 = v4[2];
  v4[2] = v5;

  return v4;
}

- (id)_internalConfiguration
{
  return (id)objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
}

- (id)_inlineEditingConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[PKListTextFieldContentConfiguration cellConfiguration](PKListTextFieldContentConfiguration, "cellConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferenceOptionListItem _text](self, "_text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  -[PKPaymentPreferenceOptionListItem _placeholderText](self, "_placeholderText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaceholderText:", v5);

  -[PKPaymentPreferenceOptionListItem _secondaryText](self, "_secondaryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryText:", v6);

  objc_msgSend(v3, "setAutocorrectionType:", 1);
  objc_msgSend(v3, "setHasErrorHandler:", self->_hasErrorHandler);
  objc_msgSend(v3, "directionalLayoutMargins");
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 10.0);
  return v3;
}

- (id)configuration
{
  void *v3;
  objc_super v5;

  if (-[PKPaymentPreferenceListItem supportsInlineEditing](self, "supportsInlineEditing"))
  {
    -[PKPaymentPreferenceOptionListItem _inlineEditingConfiguration](self, "_inlineEditingConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaymentPreferenceOptionListItem;
    -[PKPaymentPreferenceListItem configuration](&v5, sel_configuration);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_text
{
  return 0;
}

- (id)_placeholderText
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

- (BOOL)supportsSwipeActionType:(int)a3
{
  if (a3 == 1)
    return -[PKPaymentPreferenceOptionListItem _supportsEditAction](self, "_supportsEditAction");
  if (a3)
    return 0;
  return -[PKPaymentPreferenceOptionListItem _supportsDeleteAction](self, "_supportsDeleteAction");
}

- (BOOL)_supportsEditing
{
  void *v3;
  char v4;
  void *v5;

  -[PKPaymentPreferenceListItem sectionPreference](self, "sectionPreference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isReadOnly") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[PKPaymentPreferenceListItem sectionPreference](self, "sectionPreference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "supportsDeletion");

  }
  return v4;
}

- (BOOL)_supportsEditAction
{
  return 0;
}

- (id)preference
{
  return self->_preference;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preference, 0);
  objc_storeStrong(&self->_hasErrorHandler, 0);
}

@end
