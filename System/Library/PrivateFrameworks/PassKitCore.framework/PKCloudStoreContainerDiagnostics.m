@implementation PKCloudStoreContainerDiagnostics

+ (id)turnedOff
{
  uint64_t v3;

  LODWORD(v3) = 0;
  return -[PKCloudStoreContainerDiagnostics initWithIsEnabled:isSetup:status:isSyncEnabled:syncToken:lastSyncDate:didFinishInitialSync:isAccountManateeCapable:isDeviceManateeCapable:isManateeEnabled:]([PKCloudStoreContainerDiagnostics alloc], "initWithIsEnabled:isSetup:status:isSyncEnabled:syncToken:lastSyncDate:didFinishInitialSync:isAccountManateeCapable:isDeviceManateeCapable:isManateeEnabled:", 0, 0, CFSTR("N/A"), 0, CFSTR("N/A"), CFSTR("N/A"), v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreContainerDiagnostics)initWithIsEnabled:(BOOL)a3 isSetup:(BOOL)a4 status:(id)a5 isSyncEnabled:(BOOL)a6 syncToken:(id)a7 lastSyncDate:(id)a8 didFinishInitialSync:(BOOL)a9 isAccountManateeCapable:(BOOL)a10 isDeviceManateeCapable:(BOOL)a11 isManateeEnabled:(BOOL)a12
{
  id v19;
  id v20;
  id v21;
  PKCloudStoreContainerDiagnostics *v22;
  PKCloudStoreContainerDiagnostics *v23;
  objc_super v25;

  v19 = a5;
  v20 = a7;
  v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PKCloudStoreContainerDiagnostics;
  v22 = -[PKCloudStoreContainerDiagnostics init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_isEnabled = a3;
    v22->_isSetup = a4;
    objc_storeStrong((id *)&v22->_status, a5);
    v23->_isSyncEnabled = a6;
    objc_storeStrong((id *)&v23->_syncToken, a7);
    objc_storeStrong((id *)&v23->_lastSyncDate, a8);
    v23->_didFinishInitialSync = a9;
    v23->_isAccountManateeCapable = a10;
    v23->_isDeviceManateeCapable = a11;
    v23->_isManateeEnabled = a12;
  }

  return v23;
}

- (PKCloudStoreContainerDiagnostics)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreContainerDiagnostics *v5;
  uint64_t v6;
  NSString *status;
  uint64_t v8;
  NSString *syncToken;
  uint64_t v10;
  NSString *lastSyncDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCloudStoreContainerDiagnostics;
  v5 = -[PKCloudStoreContainerDiagnostics init](&v13, sel_init);
  if (v5)
  {
    v5->_isEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEnabled"));
    v5->_isSetup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSetup"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v6 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSString *)v6;

    v5->_isSyncEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSyncEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syncToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    syncToken = v5->_syncToken;
    v5->_syncToken = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSyncDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastSyncDate = v5->_lastSyncDate;
    v5->_lastSyncDate = (NSString *)v10;

    v5->_didFinishInitialSync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didFinishInitialSync"));
    v5->_isAccountManateeCapable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAccountManateeCapable"));
    v5->_isDeviceManateeCapable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeviceManateeCapable"));
    v5->_isManateeEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isManateeEnabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isEnabled;
  id v5;

  isEnabled = self->_isEnabled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isEnabled, CFSTR("isEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSetup, CFSTR("isSetup"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSyncEnabled, CFSTR("isSyncEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_syncToken, CFSTR("syncToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastSyncDate, CFSTR("lastSyncDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didFinishInitialSync, CFSTR("didFinishInitialSync"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAccountManateeCapable, CFSTR("isAccountManateeCapable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDeviceManateeCapable, CFSTR("isDeviceManateeCapable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isManateeEnabled, CFSTR("isManateeEnabled"));

}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isSetup
{
  return self->_isSetup;
}

- (NSString)status
{
  return self->_status;
}

- (BOOL)isSyncEnabled
{
  return self->_isSyncEnabled;
}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (NSString)lastSyncDate
{
  return self->_lastSyncDate;
}

- (BOOL)didFinishInitialSync
{
  return self->_didFinishInitialSync;
}

- (BOOL)isAccountManateeCapable
{
  return self->_isAccountManateeCapable;
}

- (BOOL)isDeviceManateeCapable
{
  return self->_isDeviceManateeCapable;
}

- (BOOL)isManateeEnabled
{
  return self->_isManateeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
