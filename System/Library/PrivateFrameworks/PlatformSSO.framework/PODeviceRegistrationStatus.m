@implementation PODeviceRegistrationStatus

- (id)description
{
  const __CFString *v3;
  const __CFString *registeredBundleIdentifier;
  const __CFString *accountName;
  NSString *registeredExtensionName;
  const __CFString *v7;
  int64_t deviceRegistrationStatus;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[7];
  _QWORD v17[8];

  v17[7] = *MEMORY[0x24BDAC8D0];
  if (self->_platformSSOEnabled)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v16[0] = CFSTR("platformSSOEnabled");
  v16[1] = CFSTR("accountName");
  registeredBundleIdentifier = CFSTR("nil");
  accountName = (const __CFString *)self->_accountName;
  registeredExtensionName = self->_registeredExtensionName;
  if (!accountName)
    accountName = CFSTR("nil");
  v17[0] = v3;
  v17[1] = accountName;
  if (registeredExtensionName)
    v7 = (const __CFString *)registeredExtensionName;
  else
    v7 = CFSTR("nil");
  v16[2] = CFSTR("registeredExtensionName");
  v16[3] = CFSTR("registeredBundleIdentifier");
  deviceRegistrationStatus = self->_deviceRegistrationStatus;
  if (self->_registeredBundleIdentifier)
    registeredBundleIdentifier = (const __CFString *)self->_registeredBundleIdentifier;
  v17[2] = v7;
  v17[3] = registeredBundleIdentifier;
  v16[4] = CFSTR("deviceRegistrationStatus");
  +[POConstantUtil stringForRegistrationStatus:](POConstantUtil, "stringForRegistrationStatus:", deviceRegistrationStatus);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (self->_actionButtonEnabled)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v17[4] = v9;
  v17[5] = v11;
  v16[5] = CFSTR("actionButtonEnabled");
  v16[6] = CFSTR("actionButtonAction");
  +[POConstantUtil stringForDeviceAction:](POConstantUtil, "stringForDeviceAction:", self->_actionButtonAction);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PODeviceRegistrationStatus)initWithCoder:(id)a3
{
  id v4;
  PODeviceRegistrationStatus *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *accountName;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *registeredExtensionName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *registeredBundleIdentifier;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PODeviceRegistrationStatus;
  v5 = -[PODeviceRegistrationStatus init](&v31, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_isPlatformSSOEnabled);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_platformSSOEnabled = objc_msgSend(v8, "BOOLValue");

    v9 = objc_opt_class();
    NSStringFromSelector(sel_accountName);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    accountName = v5->_accountName;
    v5->_accountName = (NSString *)v11;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_registeredExtensionName);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    registeredExtensionName = v5->_registeredExtensionName;
    v5->_registeredExtensionName = (NSString *)v15;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_registeredBundleIdentifier);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    registeredBundleIdentifier = v5->_registeredBundleIdentifier;
    v5->_registeredBundleIdentifier = (NSString *)v19;

    v21 = objc_opt_class();
    NSStringFromSelector(sel_deviceRegistrationStatus);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceRegistrationStatus = (int)objc_msgSend(v23, "intValue");

    v24 = objc_opt_class();
    NSStringFromSelector(sel_isActionButtonEnabled);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_actionButtonEnabled = objc_msgSend(v26, "BOOLValue");

    v27 = objc_opt_class();
    NSStringFromSelector(sel_actionButtonAction);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_actionButtonAction = (int)objc_msgSend(v29, "intValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 platformSSOEnabled;
  id v6;
  void *v7;
  void *v8;
  NSString *registeredExtensionName;
  void *v10;
  NSString *accountName;
  void *v12;
  NSString *registeredBundleIdentifier;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = (void *)MEMORY[0x24BDD16E0];
  platformSSOEnabled = self->_platformSSOEnabled;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", platformSSOEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isPlatformSSOEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, v8);

  registeredExtensionName = self->_registeredExtensionName;
  NSStringFromSelector(sel_registeredExtensionName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", registeredExtensionName, v10);

  accountName = self->_accountName;
  NSStringFromSelector(sel_accountName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", accountName, v12);

  registeredBundleIdentifier = self->_registeredBundleIdentifier;
  NSStringFromSelector(sel_registeredBundleIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", registeredBundleIdentifier, v14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_deviceRegistrationStatus);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceRegistrationStatus);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v15, v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_actionButtonEnabled);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isActionButtonEnabled);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v17, v18);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_actionButtonAction);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_actionButtonAction);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v20, v19);

}

- (BOOL)isPlatformSSOEnabled
{
  return self->_platformSSOEnabled;
}

- (void)setPlatformSSOEnabled:(BOOL)a3
{
  self->_platformSSOEnabled = a3;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
  objc_storeStrong((id *)&self->_accountName, a3);
}

- (NSString)registeredExtensionName
{
  return self->_registeredExtensionName;
}

- (void)setRegisteredExtensionName:(id)a3
{
  objc_storeStrong((id *)&self->_registeredExtensionName, a3);
}

- (NSString)registeredBundleIdentifier
{
  return self->_registeredBundleIdentifier;
}

- (void)setRegisteredBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_registeredBundleIdentifier, a3);
}

- (int64_t)deviceRegistrationStatus
{
  return self->_deviceRegistrationStatus;
}

- (void)setDeviceRegistrationStatus:(int64_t)a3
{
  self->_deviceRegistrationStatus = a3;
}

- (BOOL)isActionButtonEnabled
{
  return self->_actionButtonEnabled;
}

- (void)setActionButtonEnabled:(BOOL)a3
{
  self->_actionButtonEnabled = a3;
}

- (int64_t)actionButtonAction
{
  return self->_actionButtonAction;
}

- (void)setActionButtonAction:(int64_t)a3
{
  self->_actionButtonAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_registeredExtensionName, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
}

@end
