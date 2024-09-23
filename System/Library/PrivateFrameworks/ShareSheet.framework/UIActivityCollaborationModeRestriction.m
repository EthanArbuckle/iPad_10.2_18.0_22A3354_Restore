@implementation UIActivityCollaborationModeRestriction

- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3
{
  uint64_t v4;

  LOBYTE(v4) = 0;
  return (UIActivityCollaborationModeRestriction *)-[UIActivityCollaborationModeRestriction _initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:](self, "_initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:", a3, 0, 0, 0, 0, 0, v4);
}

- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  UIActivityCollaborationModeRestriction *v12;
  uint64_t v14;

  v8 = a5;
  v9 = a4;
  _ShareSheetBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Move to iCloud OK"), CFSTR("OK"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v14) = 0;
  v12 = -[UIActivityCollaborationModeRestriction _initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:](self, "_initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:", a3, v9, v8, v11, 0, 0, v14);

  return v12;
}

- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return (UIActivityCollaborationModeRestriction *)-[UIActivityCollaborationModeRestriction _initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:](self, "_initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:", a3, a4, a5, a6, 0, 0, v7);
}

- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6 alertRecoverySuggestionButtonTitle:(id)a7 alertRecoverySuggestionButtonLaunchURL:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return (UIActivityCollaborationModeRestriction *)-[UIActivityCollaborationModeRestriction _initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:](self, "_initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:", a3, a4, a5, a6, a7, a8, v9);
}

- (UIActivityCollaborationModeRestriction)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6 alertContinueToModeButtonTitle:(id)a7
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  return (UIActivityCollaborationModeRestriction *)-[UIActivityCollaborationModeRestriction _initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:](self, "_initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:", a3, a4, a5, a6, a7, 0, v8);
}

- (id)_initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertDismissButtonTitle:(id)a6 alertRecoverySuggestionButtonTitle:(id)a7 alertRecoverySuggestionButtonLaunchURL:(id)a8 allowContinueToMode:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  UIActivityCollaborationModeRestriction *v20;
  UIActivityCollaborationModeRestriction *v21;
  uint64_t v22;
  NSString *alertTitle;
  uint64_t v24;
  NSString *alertMessage;
  uint64_t v26;
  NSString *alertDismissButtonTitle;
  uint64_t v28;
  NSString *alertRecoverySuggestionButtonTitle;
  uint64_t v30;
  NSURL *alertRecoverySuggestionButtonLaunchURL;
  objc_super v33;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v33.receiver = self;
  v33.super_class = (Class)UIActivityCollaborationModeRestriction;
  v20 = -[UIActivityCollaborationModeRestriction init](&v33, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_disabledMode = a3;
    v22 = objc_msgSend(v15, "copy");
    alertTitle = v21->_alertTitle;
    v21->_alertTitle = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    alertMessage = v21->_alertMessage;
    v21->_alertMessage = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    alertDismissButtonTitle = v21->_alertDismissButtonTitle;
    v21->_alertDismissButtonTitle = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    alertRecoverySuggestionButtonTitle = v21->_alertRecoverySuggestionButtonTitle;
    v21->_alertRecoverySuggestionButtonTitle = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    alertRecoverySuggestionButtonLaunchURL = v21->_alertRecoverySuggestionButtonLaunchURL;
    v21->_alertRecoverySuggestionButtonLaunchURL = (NSURL *)v30;

    v21->_allowContinueToMode = a9;
  }

  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  const char *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)UIActivityCollaborationModeRestriction;
  -[UIActivityCollaborationModeRestriction description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityCollaborationModeRestriction descriptionForMode:](self, "descriptionForMode:", -[UIActivityCollaborationModeRestriction disabledMode](self, "disabledMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityCollaborationModeRestriction alertTitle](self, "alertTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityCollaborationModeRestriction alertMessage](self, "alertMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityCollaborationModeRestriction alertDismissButtonTitle](self, "alertDismissButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityCollaborationModeRestriction alertRecoverySuggestionButtonTitle](self, "alertRecoverySuggestionButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityCollaborationModeRestriction alertRecoverySuggestionButtonLaunchURL](self, "alertRecoverySuggestionButtonLaunchURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIActivityCollaborationModeRestriction allowContinueToMode](self, "allowContinueToMode");
  v12 = "no";
  if (v11)
    v12 = "yes";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: disabledMode:%@ alertTitle:%@ alertMessage:%@ alertDismissButtonTitle:%@ alertRecoverySuggestionButtonTitle:%@ alertRecoverySuggestionButtonLaunchURL:%@ allowContinueToMode:%s"), v4, v5, v6, v7, v8, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)descriptionForMode:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 1)
    v3 = CFSTR("collaborate");
  if (a3)
    return (id)v3;
  else
    return CFSTR("sendCopy");
}

- (UIActivityCollaborationModeRestriction)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIActivityCollaborationModeRestriction *v16;
  uint64_t v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("disabledMode"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertMessage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertDismissButtonTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertRecoverySuggestionButtonTitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertRecoverySuggestionButtonLaunchURL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  LOBYTE(v14) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowContinueToMode"));
  LOBYTE(v18) = (_BYTE)v14;
  v16 = -[UIActivityCollaborationModeRestriction _initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:](self, "_initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:", v5, v7, v9, v11, v13, v15, v18);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "encodeInteger:forKey:", -[UIActivityCollaborationModeRestriction disabledMode](self, "disabledMode"), CFSTR("disabledMode"));
  -[UIActivityCollaborationModeRestriction alertTitle](self, "alertTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIActivityCollaborationModeRestriction alertTitle](self, "alertTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("alertTitle"));

  }
  -[UIActivityCollaborationModeRestriction alertMessage](self, "alertMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIActivityCollaborationModeRestriction alertMessage](self, "alertMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("alertMessage"));

  }
  -[UIActivityCollaborationModeRestriction alertDismissButtonTitle](self, "alertDismissButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIActivityCollaborationModeRestriction alertDismissButtonTitle](self, "alertDismissButtonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("alertDismissButtonTitle"));

  }
  -[UIActivityCollaborationModeRestriction alertRecoverySuggestionButtonTitle](self, "alertRecoverySuggestionButtonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIActivityCollaborationModeRestriction alertRecoverySuggestionButtonTitle](self, "alertRecoverySuggestionButtonTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("alertRecoverySuggestionButtonTitle"));

  }
  -[UIActivityCollaborationModeRestriction alertRecoverySuggestionButtonLaunchURL](self, "alertRecoverySuggestionButtonLaunchURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIActivityCollaborationModeRestriction alertRecoverySuggestionButtonLaunchURL](self, "alertRecoverySuggestionButtonLaunchURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("alertRecoverySuggestionButtonLaunchURL"));

  }
  objc_msgSend(v14, "encodeBool:forKey:", -[UIActivityCollaborationModeRestriction allowContinueToMode](self, "allowContinueToMode"), CFSTR("allowContinueToMode"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v5 = -[UIActivityCollaborationModeRestriction disabledMode](self, "disabledMode");
  -[UIActivityCollaborationModeRestriction alertTitle](self, "alertTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);

  -[UIActivityCollaborationModeRestriction alertMessage](self, "alertMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);

  -[UIActivityCollaborationModeRestriction alertDismissButtonTitle](self, "alertDismissButtonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);

  -[UIActivityCollaborationModeRestriction alertRecoverySuggestionButtonTitle](self, "alertRecoverySuggestionButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);

  -[UIActivityCollaborationModeRestriction alertRecoverySuggestionButtonLaunchURL](self, "alertRecoverySuggestionButtonLaunchURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);

  LOBYTE(v18) = -[UIActivityCollaborationModeRestriction allowContinueToMode](self, "allowContinueToMode");
  v16 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertRecoverySuggestionButtonTitle:alertRecoverySuggestionButtonLaunchURL:allowContinueToMode:", v5, v7, v9, v11, v13, v15, v18);

  return v16;
}

- (int64_t)disabledMode
{
  return self->_disabledMode;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (NSString)alertDismissButtonTitle
{
  return self->_alertDismissButtonTitle;
}

- (NSString)alertRecoverySuggestionButtonTitle
{
  return self->_alertRecoverySuggestionButtonTitle;
}

- (NSURL)alertRecoverySuggestionButtonLaunchURL
{
  return self->_alertRecoverySuggestionButtonLaunchURL;
}

- (BOOL)allowContinueToMode
{
  return self->_allowContinueToMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertRecoverySuggestionButtonLaunchURL, 0);
  objc_storeStrong((id *)&self->_alertRecoverySuggestionButtonTitle, 0);
  objc_storeStrong((id *)&self->_alertDismissButtonTitle, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
}

@end
