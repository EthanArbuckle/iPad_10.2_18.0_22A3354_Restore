@implementation PKPaymentPreferenceAddListItem

- (PKPaymentPreferenceAddListItem)initWithAddPreferenceType:(int)a3 forSectionPreference:(id)a4 handler:(id)a5
{
  id v8;
  PKPaymentPreferenceAddListItem *v9;
  PKPaymentPreferenceAddListItem *v10;
  void *v11;
  id handler;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentPreferenceAddListItem;
  v9 = -[PKPaymentPreferenceListItem initWithSectionPreference:](&v14, sel_initWithSectionPreference_, a4);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    v11 = _Block_copy(v8);
    handler = v10->_handler;
    v10->_handler = v11;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPreferenceAddListItem;
  v4 = -[PKPaymentPreferenceListItem copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[4] = self->_type;
  v5 = _Block_copy(self->_handler);
  v6 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v5;

  return v4;
}

- (id)configuration
{
  void *v3;
  UIColor *buttonTextColor;
  UIColor *v5;
  UIColor *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPreferenceAddListItem;
  -[PKPaymentPreferenceListItem configuration](&v9, sel_configuration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  buttonTextColor = self->_buttonTextColor;
  if (buttonTextColor)
  {
    v5 = buttonTextColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v3, "textProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v6);

  return v3;
}

- (id)_text
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  int type;
  uint64_t v8;
  void *v9;

  -[PKPaymentPreferenceListItem sectionPreference](self, "sectionPreference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PKPaymentPreferenceListItem sectionPreference](self, "sectionPreference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    type = self->_type;
    if (type == 1)
    {
      objc_msgSend(v5, "addExistingTitle");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (type)
      {
        v9 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v5, "addNewTitle");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v8;
LABEL_9:

    return v9;
  }
  v9 = 0;
  return v9;
}

- (int)type
{
  return self->_type;
}

- (id)handler
{
  return self->_handler;
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (void)setButtonTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
