@implementation SFAutoUnlockNotificationModel

- (SFAutoUnlockNotificationModel)initWithDeviceName:(id)a3 modelIdentifier:(id)a4 type:(int64_t)a5
{
  id v7;
  id v8;
  SFAutoUnlockNotificationModel *v9;
  uint64_t v10;
  NSString *deviceName;
  uint64_t v12;
  NSString *modelIdentifier;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SFAutoUnlockNotificationModel;
  v7 = a4;
  v8 = a3;
  v9 = -[SFAutoUnlockNotificationModel init](&v15, sel_init);
  v10 = objc_msgSend(v8, "copy", v15.receiver, v15.super_class);

  deviceName = v9->_deviceName;
  v9->_deviceName = (NSString *)v10;

  v12 = objc_msgSend(v7, "copy");
  modelIdentifier = v9->_modelIdentifier;
  v9->_modelIdentifier = (NSString *)v12;

  v9->_type = a5;
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[SFAutoUnlockNotificationModel deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SFAutoUnlockNotificationModel modelIdentifier](self, "modelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_modelIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[SFAutoUnlockNotificationModel type](self, "type");
  NSStringFromSelector(sel_type);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  -[SFAutoUnlockNotificationModel subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_subtitle);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[SFAutoUnlockNotificationModel applicationName](self, "applicationName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[SFAutoUnlockNotificationModel applicationIconData](self, "applicationIconData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationIconData);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[SFAutoUnlockNotificationModel navBarTitle](self, "navBarTitle");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_navBarTitle);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, v17);

}

- (SFAutoUnlockNotificationModel)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  SFAutoUnlockNotificationModel *v25;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_deviceName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_modelIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_type);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", v11);

  v13 = objc_opt_class();
  NSStringFromSelector(sel_subtitle);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  NSStringFromSelector(sel_applicationName);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_opt_class();
  NSStringFromSelector(sel_applicationIconData);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_opt_class();
  NSStringFromSelector(sel_navBarTitle);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  if (v7 && v10)
  {
    self = -[SFAutoUnlockNotificationModel initWithDeviceName:modelIdentifier:type:](self, "initWithDeviceName:modelIdentifier:type:", v7, v10, v12);
    -[SFAutoUnlockNotificationModel setSubtitle:](self, "setSubtitle:", v15);
    -[SFAutoUnlockNotificationModel setApplicationName:](self, "setApplicationName:", v18);
    -[SFAutoUnlockNotificationModel setApplicationIconData:](self, "setApplicationIconData:", v21);
    -[SFAutoUnlockNotificationModel setNavBarTitle:](self, "setNavBarTitle:", v24);
    v25 = self;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)navBarTitle
{
  return self->_navBarTitle;
}

- (void)setNavBarTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)applicationIconData
{
  return self->_applicationIconData;
}

- (void)setApplicationIconData:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIconData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIconData, 0);
  objc_storeStrong((id *)&self->_navBarTitle, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
