@implementation SBSUserNotificationSystemApertureContentDefinition

- (id)_initWithDictionary:(id)a3
{
  id v5;
  SBSUserNotificationSystemApertureContentDefinition *v6;
  uint64_t v7;
  NSString *alertHeader;
  uint64_t v9;
  NSString *alertMessage;
  void *v11;
  SBSUserNotificationColorDefinition *v12;
  SBSUserNotificationColorDefinition *alertHeaderColor;
  void *v14;
  SBSUserNotificationColorDefinition *v15;
  SBSUserNotificationColorDefinition *keyColor;
  uint64_t v17;
  NSNumber *alertTextAlignment;
  uint64_t v19;
  NSString *defaultButtonTitle;
  uint64_t v21;
  NSString *alternateButtonTitle;
  void *v23;
  void *v24;
  uint64_t v25;
  SBSUserNotificationAssetDefinition *leadingAssetDefinition;
  SBSUserNotificationSystemApertureContentDefinition *v27;
  void *v29;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCFUserNotificationSystemApertureContentDefinition.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SBSUserNotificationSystemApertureContentDefinition init](self, "init");
    if (v6)
    {
      objc_msgSend(v5, "bs_safeStringForKey:", CFSTR("SBSCFUNSAAlertHeader"));
      v7 = objc_claimAutoreleasedReturnValue();
      alertHeader = v6->_alertHeader;
      v6->_alertHeader = (NSString *)v7;

      objc_msgSend(v5, "bs_safeStringForKey:", CFSTR("SBSCFUNSAAlertMessage"));
      v9 = objc_claimAutoreleasedReturnValue();
      alertMessage = v6->_alertMessage;
      v6->_alertMessage = (NSString *)v9;

      objc_msgSend(v5, "bs_safeDictionaryForKey:", CFSTR("SBSCFUNSAAlertHeaderColor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = -[SBSUserNotificationColorDefinition _initWithDictionary:]([SBSUserNotificationColorDefinition alloc], "_initWithDictionary:", v11);
        alertHeaderColor = v6->_alertHeaderColor;
        v6->_alertHeaderColor = v12;

      }
      objc_msgSend(v5, "bs_safeDictionaryForKey:", CFSTR("SBSCFUNSAKeyColor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = -[SBSUserNotificationColorDefinition _initWithDictionary:]([SBSUserNotificationColorDefinition alloc], "_initWithDictionary:", v14);
        keyColor = v6->_keyColor;
        v6->_keyColor = v15;

      }
      objc_msgSend(v5, "bs_safeNumberForKey:", CFSTR("SBSCFUNSAAlertTextAlignment"));
      v17 = objc_claimAutoreleasedReturnValue();
      alertTextAlignment = v6->_alertTextAlignment;
      v6->_alertTextAlignment = (NSNumber *)v17;

      objc_msgSend(v5, "bs_safeStringForKey:", CFSTR("SBSCFUNSADefaultButtonTitle"));
      v19 = objc_claimAutoreleasedReturnValue();
      defaultButtonTitle = v6->_defaultButtonTitle;
      v6->_defaultButtonTitle = (NSString *)v19;

      objc_msgSend(v5, "bs_safeStringForKey:", CFSTR("SBSCFUNSAAlternateButtonTitle"));
      v21 = objc_claimAutoreleasedReturnValue();
      alternateButtonTitle = v6->_alternateButtonTitle;
      v6->_alternateButtonTitle = (NSString *)v21;

      objc_msgSend(v5, "bs_safeNumberForKey:", CFSTR("SBSCFUNSAPreventsAutomaticDismissalKey"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_preventsAutomaticDismissal = objc_msgSend(v23, "BOOLValue");

      objc_msgSend(v5, "bs_safeDictionaryForKey:", CFSTR("SBSCFUNSALeadingAssetDefinition"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        +[SBSUserNotificationAssetDefinition _definitionFromSerializedDefinition:](SBSUserNotificationAssetDefinition, "_definitionFromSerializedDefinition:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
        leadingAssetDefinition = v6->_leadingAssetDefinition;
        v6->_leadingAssetDefinition = (SBSUserNotificationAssetDefinition *)v25;

      }
    }
    self = v6;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)build
{
  void *v3;
  void *v4;
  NSString *alertHeader;
  NSString *alertMessage;
  SBSUserNotificationColorDefinition *alertHeaderColor;
  void *v8;
  SBSUserNotificationColorDefinition *keyColor;
  void *v10;
  NSNumber *alertTextAlignment;
  NSString *defaultButtonTitle;
  NSString *alternateButtonTitle;
  SBSUserNotificationAssetDefinition *leadingAssetDefinition;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  alertHeader = self->_alertHeader;
  if (alertHeader)
    objc_msgSend(v3, "setObject:forKey:", alertHeader, CFSTR("SBSCFUNSAAlertHeader"));
  alertMessage = self->_alertMessage;
  if (alertMessage)
    objc_msgSend(v4, "setObject:forKey:", alertMessage, CFSTR("SBSCFUNSAAlertMessage"));
  alertHeaderColor = self->_alertHeaderColor;
  if (alertHeaderColor)
  {
    -[SBSUserNotificationColorDefinition build](alertHeaderColor, "build");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("SBSCFUNSAAlertHeaderColor"));

  }
  keyColor = self->_keyColor;
  if (keyColor)
  {
    -[SBSUserNotificationColorDefinition build](keyColor, "build");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("SBSCFUNSAKeyColor"));

  }
  alertTextAlignment = self->_alertTextAlignment;
  if (alertTextAlignment)
    objc_msgSend(v4, "setObject:forKey:", alertTextAlignment, CFSTR("SBSCFUNSAAlertTextAlignment"));
  defaultButtonTitle = self->_defaultButtonTitle;
  if (defaultButtonTitle)
    objc_msgSend(v4, "setObject:forKey:", defaultButtonTitle, CFSTR("SBSCFUNSADefaultButtonTitle"));
  alternateButtonTitle = self->_alternateButtonTitle;
  if (alternateButtonTitle)
    objc_msgSend(v4, "setObject:forKey:", alternateButtonTitle, CFSTR("SBSCFUNSAAlternateButtonTitle"));
  leadingAssetDefinition = self->_leadingAssetDefinition;
  if (leadingAssetDefinition)
  {
    -[SBSUserNotificationAssetDefinition build](leadingAssetDefinition, "build");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("SBSCFUNSALeadingAssetDefinition"));

  }
  if (self->_preventsAutomaticDismissal)
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("SBSCFUNSAPreventsAutomaticDismissalKey"));
  v16 = (void *)objc_msgSend(v4, "copy");

  return v16;
}

- (NSString)alertHeader
{
  return self->_alertHeader;
}

- (void)setAlertHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SBSUserNotificationColorDefinition)alertHeaderColor
{
  return self->_alertHeaderColor;
}

- (void)setAlertHeaderColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SBSUserNotificationColorDefinition)keyColor
{
  return self->_keyColor;
}

- (void)setKeyColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)alertTextAlignment
{
  return self->_alertTextAlignment;
}

- (void)setAlertTextAlignment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SBSUserNotificationAssetDefinition)leadingAssetDefinition
{
  return self->_leadingAssetDefinition;
}

- (void)setLeadingAssetDefinition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)preventsAutomaticDismissal
{
  return self->_preventsAutomaticDismissal;
}

- (void)setPreventsAutomaticDismissal:(BOOL)a3
{
  self->_preventsAutomaticDismissal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingAssetDefinition, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_alertTextAlignment, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_alertHeaderColor, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertHeader, 0);
}

- (SBSUserNotificationImageDefinition)leadingImageDefinition
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[SBSUserNotificationSystemApertureContentDefinition leadingAssetDefinition](self, "leadingAssetDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SBSUserNotificationSystemApertureContentDefinition leadingAssetDefinition](self, "leadingAssetDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (SBSUserNotificationImageDefinition *)v5;
}

- (void)setAlertHeaderColorName:(id)a3
{
  id v4;

  +[SBSUserNotificationColorDefinition definitionWithColorName:](SBSUserNotificationColorDefinition, "definitionWithColorName:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSUserNotificationSystemApertureContentDefinition setAlertHeaderColor:](self, "setAlertHeaderColor:", v4);

}

- (NSString)alertHeaderColorName
{
  void *v2;
  void *v3;

  -[SBSUserNotificationSystemApertureContentDefinition alertHeaderColor](self, "alertHeaderColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setKeyColorName:(id)a3
{
  id v4;

  +[SBSUserNotificationColorDefinition definitionWithColorName:](SBSUserNotificationColorDefinition, "definitionWithColorName:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSUserNotificationSystemApertureContentDefinition setKeyColor:](self, "setKeyColor:", v4);

}

- (NSString)keyColorName
{
  void *v2;
  void *v3;

  -[SBSUserNotificationSystemApertureContentDefinition keyColor](self, "keyColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
