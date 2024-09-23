@implementation SSVPlayActivityEnqueuerProperties

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSNumber *privateListeningEnabled;
  const __CFString *v8;
  const __CFString *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSString length](self->_buildVersion, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" buildVersion: %@"), self->_buildVersion);
  if (-[NSString length](self->_deviceGUID, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" deviceGUID: %@"), self->_deviceGUID);
  if (-[NSString length](self->_deviceName, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" deviceName: %@"), self->_deviceName);
  privateListeningEnabled = self->_privateListeningEnabled;
  if (privateListeningEnabled)
  {
    if (-[NSNumber BOOLValue](privateListeningEnabled, "BOOLValue"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    objc_msgSend(v6, "appendFormat:", CFSTR(" privateListeningEnabled: %@"), v8);
  }
  if (self->_systemReleaseType)
    objc_msgSend(v6, "appendFormat:", CFSTR(" systemReleaseType: %li"), self->_systemReleaseType);
  if (self->_SBEnabled)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" SBEnabled: %@"), v9);
  if (self->_storeAccountID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" storeAccountID: %llu"), self->_storeAccountID);
  if (-[NSString length](self->_storeFrontID, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" storeFrontID: %@"), self->_storeFrontID);
  if (self->_timeZone)
    objc_msgSend(v6, "appendFormat:", CFSTR(" timeZone:%@"), self->_timeZone);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *buildVersion;
  id v5;

  buildVersion = self->_buildVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", buildVersion, CFSTR("buildVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceGUID, CFSTR("deviceGUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateListeningEnabled, CFSTR("privateListeningEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_SBEnabled, CFSTR("SBEnabled"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_storeAccountID, CFSTR("storeAccountID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeFrontID, CFSTR("storeFrontID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_systemReleaseType, CFSTR("internalBuild"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));

}

- (SSVPlayActivityEnqueuerProperties)initWithCoder:(id)a3
{
  id v4;
  SSVPlayActivityEnqueuerProperties *v5;
  uint64_t v6;
  NSString *buildVersion;
  uint64_t v8;
  NSString *deviceGUID;
  uint64_t v10;
  NSString *deviceName;
  uint64_t v12;
  NSNumber *privateListeningEnabled;
  uint64_t v14;
  NSString *storeFrontID;
  uint64_t v16;
  NSTimeZone *timeZone;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SSVPlayActivityEnqueuerProperties;
  v5 = -[SSVPlayActivityEnqueuerProperties init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buildVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceGUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceGUID = v5->_deviceGUID;
    v5->_deviceGUID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateListeningEnabled"));
    v12 = objc_claimAutoreleasedReturnValue();
    privateListeningEnabled = v5->_privateListeningEnabled;
    v5->_privateListeningEnabled = (NSNumber *)v12;

    v5->_systemReleaseType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("internalBuild"));
    v5->_SBEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SBEnabled"));
    v5->_storeAccountID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("storeAccountID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeFrontID"));
    v14 = objc_claimAutoreleasedReturnValue();
    storeFrontID = v5->_storeFrontID;
    v5->_storeFrontID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v16 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v16;

  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SSVPlayActivityEnqueuerProperties _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = -[objc_class init](-[objc_class allocWithZone:](a3, "allocWithZone:", a4), "init");
  if (v6)
  {
    v7 = -[NSString copyWithZone:](self->_buildVersion, "copyWithZone:", a4);
    v8 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v7;

    v9 = -[NSString copyWithZone:](self->_deviceGUID, "copyWithZone:", a4);
    v10 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v9;

    v11 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a4);
    v12 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v11;

    v13 = -[NSNumber copyWithZone:](self->_privateListeningEnabled, "copyWithZone:", a4);
    v14 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v13;

    *((_BYTE *)v6 + 40) = self->_SBEnabled;
    *((_QWORD *)v6 + 6) = self->_storeAccountID;
    v15 = -[NSString copyWithZone:](self->_storeFrontID, "copyWithZone:", a4);
    v16 = (void *)*((_QWORD *)v6 + 7);
    *((_QWORD *)v6 + 7) = v15;

    *((_QWORD *)v6 + 8) = self->_systemReleaseType;
    v17 = -[NSTimeZone copyWithZone:](self->_timeZone, "copyWithZone:", a4);
    v18 = (void *)*((_QWORD *)v6 + 9);
    *((_QWORD *)v6 + 9) = v17;

  }
  return v6;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSNumber)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)systemReleaseType
{
  return self->_systemReleaseType;
}

- (BOOL)isSBEnabled
{
  return self->_SBEnabled;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
