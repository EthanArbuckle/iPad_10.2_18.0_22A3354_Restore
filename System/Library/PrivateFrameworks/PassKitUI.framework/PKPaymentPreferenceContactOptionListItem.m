@implementation PKPaymentPreferenceContactOptionListItem

- (BOOL)_isPostalAddress
{
  void *v2;
  void *v3;
  char v4;

  -[PKPaymentPreferenceContactOptionListItem contactSectionPreference](self, "contactSectionPreference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967F0]);

  return v4;
}

- (BOOL)_isPhoneNumber
{
  void *v2;
  void *v3;
  char v4;

  -[PKPaymentPreferenceContactOptionListItem contactSectionPreference](self, "contactSectionPreference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967C0]);

  return v4;
}

- (BOOL)_isEmail
{
  void *v2;
  void *v3;
  char v4;

  -[PKPaymentPreferenceContactOptionListItem contactSectionPreference](self, "contactSectionPreference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A8]);

  return v4;
}

- (BOOL)_isHideMyEmail
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PKPaymentPreferenceContactOptionListItem _isEmail](self, "_isEmail");
  if (v3)
  {
    -[PKPaymentPreferenceContactOptionListItem contactPreference](self, "contactPreference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHideMyEmail");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_inlineEditingConfiguration
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentPreferenceContactOptionListItem;
  -[PKPaymentPreferenceOptionListItem _inlineEditingConfiguration](&v11, sel__inlineEditingConfiguration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentPreferenceContactOptionListItem _isEmail](self, "_isEmail"))
  {
    v4 = 7;
LABEL_5:
    objc_msgSend(v3, "setKeyboardType:", v4);
    goto LABEL_6;
  }
  if (-[PKPaymentPreferenceContactOptionListItem _isPhoneNumber](self, "_isPhoneNumber"))
  {
    v4 = 5;
    goto LABEL_5;
  }
LABEL_6:
  -[PKPaymentPreferenceContactOptionListItem contactSectionPreference](self, "contactSectionPreference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreferenceContactOptionListItem contactPreference](self, "contactPreference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorsForPreference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_msgSend(v5, "selectedIndex");
    if (v8 == objc_msgSend(v5, "indexOfContact:", v6))
    {
      objc_msgSend(v7, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setError:", v9);

    }
  }

  return v3;
}

- (id)_text
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[PKPaymentPreferenceContactOptionListItem _isPostalAddress](self, "_isPostalAddress"))
  {
    -[PKPaymentPreferenceContactOptionListItem contactPreference](self, "contactPreference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pk_displayName");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v8 = (void *)v4;
    goto LABEL_8;
  }
  if (!-[PKPaymentPreferenceContactOptionListItem _isPhoneNumber](self, "_isPhoneNumber"))
  {
    if (!-[PKPaymentPreferenceContactOptionListItem _isEmail](self, "_isEmail"))
    {
      v8 = 0;
      return v8;
    }
    -[PKPaymentPreferenceContactOptionListItem contactPreference](self, "contactPreference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emailAddresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "value");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[PKPaymentPreferenceContactOptionListItem contactPreference](self, "contactPreference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pkFormattedStringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v8;
}

- (id)_placeholderText
{
  __CFString *v3;
  void *v4;

  if (-[PKPaymentPreferenceContactOptionListItem _isPhoneNumber](self, "_isPhoneNumber"))
  {
    v3 = CFSTR("SETTINGS_TRANSACTION_DEFAULTS_PHONE");
  }
  else
  {
    if (!-[PKPaymentPreferenceContactOptionListItem _isEmail](self, "_isEmail"))
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("SETTINGS_TRANSACTION_DEFAULTS_EMAIL");
  }
  PKLocalizedPaymentString(&v3->isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)_secondaryText
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (-[PKPaymentPreferenceContactOptionListItem _isPostalAddress](self, "_isPostalAddress"))
  {
    -[PKPaymentPreferenceContactOptionListItem contactPreference](self, "contactPreference");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pkSingleLineFormattedContactAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    return v4;
  }
  if (!-[PKPaymentPreferenceContactOptionListItem _isEmail](self, "_isEmail")
    && !-[PKPaymentPreferenceContactOptionListItem _isPhoneNumber](self, "_isPhoneNumber"))
  {
    v4 = 0;
    return v4;
  }
  -[PKPaymentPreferenceContactOptionListItem contactPreference](self, "contactPreference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PKPaymentPreferenceContactOptionListItem _isHideMyEmail](self, "_isHideMyEmail"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D66DC8]);
    objc_msgSend(v3, "forwardingEmailForPrimaryAccount");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      PKLocalizedHideMyEmailString(CFSTR("HME_SETTINGS_ROW_DESCRIPTION_FORMAT"), CFSTR("%@"), v6);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }

    goto LABEL_9;
  }
  return v4;
}

- (id)defaultAccessories
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PKPaymentPreferenceContactOptionListItem _supportsEditing](self, "_supportsEditing"))
  {
    if (-[PKPaymentPreferenceContactOptionListItem _isPostalAddress](self, "_isPostalAddress"))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0DC3568]);
      objc_msgSend(v4, "setDisplayedState:", 1);
      objc_msgSend(v3, "addObject:", v4);

    }
    -[PKPaymentPreferenceContactOptionListItem contactPreference](self, "contactPreference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "contactSource");

    if (v6 != 1)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0DC3558]);
      objc_msgSend(v3, "addObject:", v7);

    }
  }
  return v3;
}

- (BOOL)supportsInlineEditing
{
  if (-[PKPaymentPreferenceContactOptionListItem _isHideMyEmail](self, "_isHideMyEmail"))
    return 0;
  else
    return !-[PKPaymentPreferenceContactOptionListItem _isPostalAddress](self, "_isPostalAddress");
}

- (BOOL)_supportsDeleteAction
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  if (-[PKPaymentPreferenceContactOptionListItem _isHideMyEmail](self, "_isHideMyEmail"))
    return 0;
  -[PKPaymentPreferenceContactOptionListItem contactPreference](self, "contactPreference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contactSource");

  if (v4 == 1)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceContactOptionListItem;
  return -[PKPaymentPreferenceOptionListItem _supportsDeleteAction](&v6, sel__supportsDeleteAction);
}

- (BOOL)_supportsEditing
{
  objc_super v4;

  if (-[PKPaymentPreferenceContactOptionListItem _isHideMyEmail](self, "_isHideMyEmail"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferenceContactOptionListItem;
  return -[PKPaymentPreferenceOptionListItem _supportsEditing](&v4, sel__supportsEditing);
}

- (BOOL)_supportsEditAction
{
  objc_super v4;

  if (-[PKPaymentPreferenceContactOptionListItem _isHideMyEmail](self, "_isHideMyEmail"))
    return 0;
  if (-[PKPaymentPreferenceContactOptionListItem _supportsEditing](self, "_supportsEditing"))
    return -[PKPaymentPreferenceContactOptionListItem _isPostalAddress](self, "_isPostalAddress");
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferenceContactOptionListItem;
  return -[PKPaymentPreferenceOptionListItem _supportsEditAction](&v4, sel__supportsEditAction);
}

@end
