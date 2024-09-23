@implementation URTAlert

+ (id)alertWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:message:", v7, v6);

  return v8;
}

- (URTAlert)initWithTitle:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  URTAlert *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  NSArray *allowedApplicationBundleIDs;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)URTAlert;
  v9 = -[URTAlert init](&v15, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v9->_message, a4);
    allowedApplicationBundleIDs = v9->_allowedApplicationBundleIDs;
    v9->_allowedApplicationBundleIDs = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (URTAlert)initWithCoder:(id)a3
{
  id v4;
  URTAlert *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *message;
  uint64_t v12;
  URTAlertAction *defaultAction;
  uint64_t v14;
  URTAlertAction *otherAction;
  uint64_t v16;
  URTAlertAction *cancelAction;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *allowedApplicationBundleIDs;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)URTAlert;
  v5 = -[URTAlert init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URTAlertIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URTAlertTitleKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URTAlertMessageKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URTAlertDefaultActionKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    defaultAction = v5->_defaultAction;
    v5->_defaultAction = (URTAlertAction *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URTAlertOtherActionKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    otherAction = v5->_otherAction;
    v5->_otherAction = (URTAlertAction *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URTAlertCancelActionKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    cancelAction = v5->_cancelAction;
    v5->_cancelAction = (URTAlertAction *)v16;

    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("URTAlertAllowedApplicationsKey"));
    v21 = objc_claimAutoreleasedReturnValue();
    allowedApplicationBundleIDs = v5->_allowedApplicationBundleIDs;
    v5->_allowedApplicationBundleIDs = (NSArray *)v21;

    if (!v5->_allowedApplicationBundleIDs)
    {
      v5->_allowedApplicationBundleIDs = (NSArray *)MEMORY[0x24BDBD1A8];

    }
  }

  return v5;
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
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[URTAlert identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v4, CFSTR("URTAlertIdentifierKey"));

  -[URTAlert title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[URTAlert title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v6, CFSTR("URTAlertTitleKey"));

  }
  -[URTAlert message](self, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[URTAlert message](self, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v8, CFSTR("URTAlertMessageKey"));

  }
  -[URTAlert defaultAction](self, "defaultAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[URTAlert defaultAction](self, "defaultAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v10, CFSTR("URTAlertDefaultActionKey"));

  }
  -[URTAlert otherAction](self, "otherAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[URTAlert otherAction](self, "otherAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v12, CFSTR("URTAlertOtherActionKey"));

  }
  -[URTAlert cancelAction](self, "cancelAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[URTAlert cancelAction](self, "cancelAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v14, CFSTR("URTAlertCancelActionKey"));

  }
  -[URTAlert allowedApplicationBundleIDs](self, "allowedApplicationBundleIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("URTAlertAllowedApplicationsKey"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[URTAlert identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[URTAlert identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (URTAlertAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAction, a3);
}

- (URTAlertAction)otherAction
{
  return self->_otherAction;
}

- (void)setOtherAction:(id)a3
{
  objc_storeStrong((id *)&self->_otherAction, a3);
}

- (URTAlertAction)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
  objc_storeStrong((id *)&self->_cancelAction, a3);
}

- (NSArray)allowedApplicationBundleIDs
{
  return self->_allowedApplicationBundleIDs;
}

- (void)setAllowedApplicationBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedApplicationBundleIDs, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_otherAction, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)userNotificationRepresentation
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[URTAlert title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[URTAlert title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDBD6D8]);

  }
  -[URTAlert message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[URTAlert message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDBD6E0]);

  }
  -[URTAlert defaultAction](self, "defaultAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[URTAlert defaultAction](self, "defaultAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDBD6F8]);

  }
  -[URTAlert otherAction](self, "otherAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[URTAlert otherAction](self, "otherAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDBD718]);

  }
  -[URTAlert cancelAction](self, "cancelAction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[URTAlert cancelAction](self, "cancelAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDBD6F0]);

  }
  -[URTAlert allowedApplicationBundleIDs](self, "allowedApplicationBundleIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[URTAlert allowedApplicationBundleIDs](self, "allowedApplicationBundleIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("SBUserNotificationAllowedApplications"));

  }
  v20 = (void *)objc_msgSend(v3, "copy");

  return v20;
}

@end
