@implementation STUIUser

- (STUIUser)initWithUser:(id)a3
{
  id v4;
  STUIUser *v5;
  uint64_t v6;
  NSManagedObjectID *userObjectID;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSNumber *dsid;
  uint64_t v19;
  NSString *altDSID;
  uint64_t v21;
  NSString *passcode;
  void *v23;
  uint64_t v24;
  NSString *recoveryAltDSID;

  v4 = a3;
  v5 = -[STUIUser init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectID");
    v6 = objc_claimAutoreleasedReturnValue();
    userObjectID = v5->_userObjectID;
    v5->_userObjectID = (NSManagedObjectID *)v6;

    v5->_type = +[STUIUser userTypeFromUser:](STUIUser, "userTypeFromUser:", v4);
    objc_msgSend(v4, "localUserDeviceState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_remoteUser = v8 == 0;

    if (v5->_remoteUser)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v4, "familySettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isManaged");

      v9 = v11;
    }
    v5->_source = v9;
    v12 = (void *)objc_opt_new();
    objc_msgSend(v4, "givenName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGivenName:", v13);

    objc_msgSend(v4, "familyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFamilyName:", v14);

    objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", v12, 0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v15;

    objc_msgSend(v4, "dsid");
    v17 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v17;

    objc_msgSend(v4, "altDSID");
    v19 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v19;

    objc_msgSend(v4, "effectivePasscode");
    v21 = objc_claimAutoreleasedReturnValue();
    passcode = v5->_passcode;
    v5->_passcode = (NSString *)v21;

    objc_msgSend(v4, "effectiveRecoveryAltDSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    recoveryAltDSID = v5->_recoveryAltDSID;
    v5->_recoveryAltDSID = (NSString *)v24;

    v5->_screenTimeEnabled = objc_msgSend(v4, "screenTimeEnabled");
    v5->_webUsageEnabled = objc_msgSend(v4, "shareWebUsage");
    v5->_managed = objc_msgSend(v4, "isManaged");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[STUIUser name](self, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  -[STUIUser dsid](self, "dsid");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v7;

  -[STUIUser altDSID](self, "altDSID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v9;

  *(_BYTE *)(v4 + 11) = -[STUIUser isRemoteUser](self, "isRemoteUser");
  *(_BYTE *)(v4 + 8) = -[STUIUser isScreenTimeEnabled](self, "isScreenTimeEnabled");
  *(_BYTE *)(v4 + 10) = -[STUIUser isWebUsageEnabled](self, "isWebUsageEnabled");
  *(_QWORD *)(v4 + 48) = -[STUIUser type](self, "type");
  -[STUIUser passcode](self, "passcode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v12;

  -[STUIUser recoveryAltDSID](self, "recoveryAltDSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  v16 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v15;

  *(_BYTE *)(v4 + 12) = -[STUIUser hasAllowances](self, "hasAllowances");
  *(_QWORD *)(v4 + 16) = -[STUIUser source](self, "source");
  -[STUIUser userObjectID](self, "userObjectID");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v17;

  *(_BYTE *)(v4 + 9) = -[STUIUser isManaged](self, "isManaged");
  return (id)v4;
}

+ (id)keyPathsForValuesAffectingHasPasscode
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("passcode"));
}

- (BOOL)hasPasscode
{
  void *v2;
  BOOL v3;

  -[STUIUser passcode](self, "passcode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)needsRecoveryAppleID
{
  void *v3;
  BOOL v4;

  if (-[STUIUser type](self, "type") - 8 > 0xFFFFFFFFFFFFFFFCLL)
    return 0;
  -[STUIUser recoveryAltDSID](self, "recoveryAltDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)canRecoveryAuthenticate
{
  void *v3;
  void *v4;
  BOOL v5;

  -[STUIUser recoveryAltDSID](self, "recoveryAltDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[STUIUser isChild](self, "isChild") || !-[STUIUser type](self, "type"))
  {
    v5 = 0;
  }
  else
  {
    -[STUIUser altDSID](self, "altDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  return v3 || v5;
}

+ (unint64_t)userTypeFromUser:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v3 = a3;
  objc_msgSend(v3, "dsid");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "dsid"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToNumber:", &unk_24DBBEAA8),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    objc_msgSend(v3, "familyMemberType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE84720]))
    {
      objc_msgSend(v3, "familySettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isManaged");

      if ((v11 & 1) != 0)
      {
        v8 = 5;
      }
      else if ((objc_msgSend(v3, "isFamilyOrganizer") & 1) != 0)
      {
        v8 = 2;
      }
      else if (objc_msgSend(v3, "isParent"))
      {
        v8 = 3;
      }
      else
      {
        v8 = 4;
      }
    }
    else if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE84730]) & 1) != 0)
    {
      v8 = 6;
    }
    else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE84728]))
    {
      v8 = 7;
    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isParent
{
  return (-[STUIUser type](self, "type") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isChild
{
  return -[STUIUser type](self, "type") - 5 < 3;
}

+ (id)keyPathsForValuesAffectingGivenName
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("name"));
}

- (NSString)givenName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[STUIUser name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "personNameComponentsFromString:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "givenName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {

      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isScreenTimeEnabled
{
  return self->_screenTimeEnabled;
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  self->_screenTimeEnabled = a3;
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (BOOL)isWebUsageEnabled
{
  return self->_webUsageEnabled;
}

- (void)setWebUsageEnabled:(BOOL)a3
{
  self->_webUsageEnabled = a3;
}

- (BOOL)isRemoteUser
{
  return self->_remoteUser;
}

- (void)setRemoteUser:(BOOL)a3
{
  self->_remoteUser = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)hasAllowances
{
  return self->_hasAllowances;
}

- (void)setHasAllowances:(BOOL)a3
{
  self->_hasAllowances = a3;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)recoveryAltDSID
{
  return self->_recoveryAltDSID;
}

- (void)setRecoveryAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)hasDeviceWithoutUsageReported
{
  return self->_hasDeviceWithoutUsageReported;
}

- (void)setHasDeviceWithoutUsageReported:(BOOL)a3
{
  self->_hasDeviceWithoutUsageReported = a3;
}

- (NSManagedObjectID)userObjectID
{
  return self->_userObjectID;
}

- (void)setUserObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_userObjectID, 0);
  objc_storeStrong((id *)&self->_recoveryAltDSID, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
