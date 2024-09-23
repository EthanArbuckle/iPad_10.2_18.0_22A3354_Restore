@implementation ISQRCodeDialog

- (ISQRCodeDialog)initWithDialogDictionary:(id)a3 authenticationContext:(id)a4
{
  id v6;
  ISQRCodeDialog *v7;
  ISQRCodeDialog *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ISQRCodeDialog;
  v7 = -[ISDialog initWithDialogDictionary:authenticationContext:](&v19, sel_initWithDialogDictionary_authenticationContext_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[ISDialog setValue:forCFUserNotificationKey:](v7, "setValue:forCFUserNotificationKey:", CFSTR("PBCFUserNotificationTwoWaySignInTemplate"), CFSTR("PBCFUserNotificationTemplateType"));
    objc_msgSend(v6, "objectForKey:", CFSTR("PINCodeTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISDialog setValue:forCFUserNotificationKey:](v8, "setValue:forCFUserNotificationKey:", v9, CFSTR("PBCFUserNotificationPINCodeTitle"));
    objc_msgSend(v6, "objectForKey:", CFSTR("PINCodeUrlSubtitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISDialog setValue:forCFUserNotificationKey:](v8, "setValue:forCFUserNotificationKey:", v10, CFSTR("PBCFUserNotificationPINCodeURLSubtitle"));
    objc_msgSend(v6, "objectForKey:", CFSTR("PINCodeUrl"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISDialog setValue:forCFUserNotificationKey:](v8, "setValue:forCFUserNotificationKey:", v11, CFSTR("PBCFUserNotificationPINCodeURL"));
    objc_msgSend(v6, "objectForKey:", CFSTR("PINCodeSubtitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISDialog setValue:forCFUserNotificationKey:](v8, "setValue:forCFUserNotificationKey:", v12, CFSTR("PBCFUserNotificationPINCodeSubtitle"));
    objc_msgSend(v6, "objectForKey:", CFSTR("PINCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISDialog setValue:forCFUserNotificationKey:](v8, "setValue:forCFUserNotificationKey:", v13, CFSTR("PBCFUserNotificationPINCode"));
    objc_msgSend(v6, "objectForKey:", CFSTR("Divider"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISDialog setValue:forCFUserNotificationKey:](v8, "setValue:forCFUserNotificationKey:", v14, CFSTR("PBCFUserNotificationDividerText"));
    objc_msgSend(v6, "objectForKey:", CFSTR("QRCodeTitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISDialog setValue:forCFUserNotificationKey:](v8, "setValue:forCFUserNotificationKey:", v15, CFSTR("PBCFUserNotificationQRCodeTitle"));
    objc_msgSend(v6, "objectForKey:", CFSTR("QRCodeSubtitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISDialog setValue:forCFUserNotificationKey:](v8, "setValue:forCFUserNotificationKey:", v16, CFSTR("PBCFUserNotificationQRCodeSubtitle"));
    objc_msgSend(v6, "objectForKey:", CFSTR("QRCodeUrl"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISDialog setValue:forCFUserNotificationKey:](v8, "setValue:forCFUserNotificationKey:", v17, CFSTR("PBCFUserNotificationQRCodeURL"));

  }
  return v8;
}

@end
