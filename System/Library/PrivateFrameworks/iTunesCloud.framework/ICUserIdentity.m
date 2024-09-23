@implementation ICUserIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

+ (id)activeAccount
{
  _QWORD *v2;
  void *v3;

  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[3] = 0;
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v2 + 18) = objc_msgSend(v3, "isWatch") ^ 1;

  return v2;
}

- (ICUserIdentity)init
{
  ICUserIdentity *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICUserIdentity;
  v2 = -[ICUserIdentity init](&v4, sel_init);
  if (v2)
    v2->_creationTime = mach_absolute_time();
  return v2;
}

+ (id)nullIdentity
{
  _QWORD *v2;

  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[3] = 5;
  return v2;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)hasResolvedDSID
{
  return self->_hasResolvedDSID;
}

- (unint64_t)creationTime
{
  return self->_creationTime;
}

- (BOOL)allowsDelegation
{
  return self->_allowsDelegation;
}

- (NSString)description
{
  NSNumber *DSID;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  if (self->_hasResolvedDSID)
  {
    DSID = self->_DSID;
    if (DSID)
    {
      ICCreateLoggableValueForDSID(DSID);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = CFSTR("signed out");
    }
  }
  else
  {
    v4 = CFSTR("unresolved");
  }
  switch(self->_type)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Active Account: <%@>"), v4);
      goto LABEL_15;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Active Locker Account: <%@>"), v4);
      goto LABEL_15;
    case 2:
      v5 = CFSTR("Autoupdating Active Account");
      break;
    case 3:
      v5 = CFSTR("Autoupdating Active Locker Account");
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Carrier Bundle: %@"), self->_deviceIdentifier);
      goto LABEL_15;
    case 5:
      v5 = CFSTR("Null");
      break;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Account: <%@>"), v4);
LABEL_15:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: [%@]>"), objc_opt_class(), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)accountDSID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  -[ICUserIdentity DSID](self, "DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICUserIdentity DSID](self, "DSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
  }
  else
  {
    +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v7, "DSIDForUserIdentity:outError:", self, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;

    v6 = 0;
    if (v8)
      goto LABEL_5;
    v4 = v5;
  }
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return (NSString *)v6;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)_setResolvedDSID:(id)a3
{
  NSNumber *v4;
  NSNumber *DSID;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  DSID = self->_DSID;
  self->_DSID = v4;

  self->_hasResolvedDSID = 1;
}

+ (id)autoupdatingActiveAccount
{
  _QWORD *v2;
  void *v3;

  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[3] = 2;
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v2 + 18) = objc_msgSend(v3, "isWatch") ^ 1;

  return v2;
}

- (void)_performEncodingTaskUsingSpecificIdentityStore:(id)a3 encodingHandler:(id)a4
{
  _BOOL4 isEncodingUsingSpecificIdentityStore;
  BOOL v7;
  BOOL v8;
  void (**v9)(_QWORD);

  isEncodingUsingSpecificIdentityStore = self->_isEncodingUsingSpecificIdentityStore;
  if (a3)
    v7 = 0;
  else
    v7 = !isEncodingUsingSpecificIdentityStore;
  v8 = !v7;
  self->_isEncodingUsingSpecificIdentityStore = v8;
  v9 = (void (**)(_QWORD))a4;
  -[ICUserIdentity _ensureResolvedDSIDUsingSpecificIdentityStore:](self, "_ensureResolvedDSIDUsingSpecificIdentityStore:", a3);
  v9[2](v9);

  self->_isEncodingUsingSpecificIdentityStore = isEncodingUsingSpecificIdentityStore;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICUserIdentity _ensureResolvedDSIDUsingSpecificIdentityStore:](self, "_ensureResolvedDSIDUsingSpecificIdentityStore:", 0);
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsDelegation, CFSTR("delegation"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_creationTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("time"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("deviceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_DSID, CFSTR("dsid"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasResolvedDSID, CFSTR("hasResolvedDSID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICUserIdentity hashInStore:](self, "hashInStore:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ICUserIdentity *v4;
  ICUserIdentity *v5;
  void *v6;
  BOOL v7;

  v4 = (ICUserIdentity *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[ICUserIdentity isEqualToIdentity:inStore:](self, "isEqualToIdentity:inStore:", v5, v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)_ensureResolvedDSIDUsingSpecificIdentityStore:(id)a3
{
  id v3;

  v3 = -[ICUserIdentity _resolvedDSIDUsingSpecificIdentityStore:](self, "_resolvedDSIDUsingSpecificIdentityStore:", a3);
}

- (BOOL)isEqualToIdentity:(id)a3 inStore:(id)a4
{
  ICUserIdentity *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;

  v6 = (ICUserIdentity *)a3;
  v7 = a4;
  if (!v6)
    goto LABEL_10;
  if (self == v6)
  {
    v11 = 1;
    goto LABEL_14;
  }
  if (!-[ICUserIdentity _isComparableUsingResolvedDSID](self, "_isComparableUsingResolvedDSID")
    || !-[ICUserIdentity _isComparableUsingResolvedDSID](v6, "_isComparableUsingResolvedDSID"))
  {
    if (self->_type == v6->_type)
    {
      -[ICUserIdentity deviceIdentifier](self, "deviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICUserIdentity deviceIdentifier](v6, "deviceIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_14;
  }
  -[ICUserIdentity _resolvedDSIDUsingSpecificIdentityStore:](self, "_resolvedDSIDUsingSpecificIdentityStore:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICUserIdentity _resolvedDSIDUsingSpecificIdentityStore:](v6, "_resolvedDSIDUsingSpecificIdentityStore:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  if (v8 == (void *)v9)
  {
    v11 = 1;
    v10 = v8;
  }
  else
  {
    v10 = (void *)v9;
    v11 = objc_msgSend(v8, "isEqual:", v9);
  }

LABEL_14:
  return v11;
}

- (unint64_t)hashInStore:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  int64_t type;

  v4 = a3;
  if (-[ICUserIdentity _isComparableUsingResolvedDSID](self, "_isComparableUsingResolvedDSID"))
  {
    -[ICUserIdentity _resolvedDSIDUsingSpecificIdentityStore:](self, "_resolvedDSIDUsingSpecificIdentityStore:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");
  }
  else
  {
    type = self->_type;
    -[ICUserIdentity deviceIdentifier](self, "deviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash") ^ type;
  }

  return v6;
}

- (BOOL)_isComparableUsingResolvedDSID
{
  return (self->_type < 7uLL) & (0x43u >> self->_type);
}

- (id)_resolvedDSIDUsingSpecificIdentityStore:(id)a3
{
  id v4;
  NSNumber *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  ICUserIdentity *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_DSID;
  if (self->_type <= 1uLL && !self->_hasResolvedDSID)
  {
    v6 = v4;
    if (!v6)
    {
      if (!self->_isEncodingUsingSpecificIdentityStore)
      {
        v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "warning: ICUserIdentity - Resolving DSID without an externally supplied identity store; if encoding the iden"
            "tity into an NSCoder, make sure to use -[NSCoder ic_encodeUserIdentity:withStore:forKey:]. Falling back to u"
            "sing [ICUserIdentityStore defaultIdentityStore].",
            buf,
            2u);
        }

      }
      +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = 0;
    objc_msgSend(v6, "DSIDForUserIdentity:outError:", self, &v12);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v12;

    if (v9)
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v14 = self;
        v15 = 2114;
        v16 = v9;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "ICUserIdentity - Unable to retrieve DSID for userIdentity=%{public}@ - error=%{public}@", buf, 0x16u);
      }

    }
    v5 = (NSNumber *)v8;
  }

  return v5;
}

- (NSString)deviceIdentifier
{
  if (self->_deviceIdentifier)
    return self->_deviceIdentifier;
  else
    return (NSString *)&stru_1E4391778;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)specificAccountWithDSID:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[5];
  v4[5] = v5;

  v4[3] = 6;
  *((_BYTE *)v4 + 19) = 1;
  return v4;
}

- (id)identityAllowingDelegation:(BOOL)a3
{
  ICUserIdentity *v4;
  uint64_t v6;
  NSString *deviceIdentifier;
  uint64_t v8;
  NSNumber *DSID;

  if (self->_allowsDelegation == a3)
  {
    v4 = self;
  }
  else
  {
    v4 = (ICUserIdentity *)objc_alloc_init((Class)objc_opt_class());
    v4->_allowsDelegation = a3;
    v4->_allowsAccountEstablishment = self->_allowsAccountEstablishment;
    v4->_creationTime = self->_creationTime;
    v6 = -[NSString copy](self->_deviceIdentifier, "copy");
    deviceIdentifier = v4->_deviceIdentifier;
    v4->_deviceIdentifier = (NSString *)v6;

    v8 = -[NSNumber copy](self->_DSID, "copy");
    DSID = v4->_DSID;
    v4->_DSID = (NSNumber *)v8;

    v4->_hasResolvedDSID = self->_hasResolvedDSID;
    v4->_type = self->_type;
  }
  return v4;
}

- (ICUserIdentity)initWithCoder:(id)a3
{
  id v4;
  ICUserIdentity *v5;
  void *v6;
  uint64_t v7;
  NSString *deviceIdentifier;
  uint64_t v9;
  NSNumber *DSID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICUserIdentity;
  v5 = -[ICUserIdentity init](&v12, sel_init);
  if (v5)
  {
    v5->_allowsDelegation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("delegation"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("time")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_creationTime = objc_msgSend(v6, "unsignedLongLongValue");

    }
    else
    {
      v5->_creationTime = mach_absolute_time();
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceID"));
    v7 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
    v9 = objc_claimAutoreleasedReturnValue();
    DSID = v5->_DSID;
    v5->_DSID = (NSNumber *)v9;

    v5->_hasResolvedDSID = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasResolvedDSID"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  }

  return v5;
}

- (id)identityAllowingEstablishment:(BOOL)a3
{
  ICUserIdentity *v4;
  uint64_t v6;
  NSString *deviceIdentifier;
  uint64_t v8;
  NSNumber *DSID;

  if (self->_allowsAccountEstablishment == a3)
  {
    v4 = self;
  }
  else
  {
    v4 = (ICUserIdentity *)objc_alloc_init((Class)objc_opt_class());
    v4->_allowsAccountEstablishment = a3;
    v4->_allowsDelegation = self->_allowsDelegation;
    v4->_creationTime = self->_creationTime;
    v6 = -[NSString copy](self->_deviceIdentifier, "copy");
    deviceIdentifier = v4->_deviceIdentifier;
    v4->_deviceIdentifier = (NSString *)v6;

    v8 = -[NSNumber copy](self->_DSID, "copy");
    DSID = v4->_DSID;
    v4->_DSID = (NSNumber *)v8;

    v4->_hasResolvedDSID = self->_hasResolvedDSID;
    v4->_type = self->_type;
  }
  return v4;
}

- (BOOL)allowsAccountEstablishment
{
  return self->_allowsAccountEstablishment;
}

+ (id)activeLockerAccount
{
  _QWORD *v2;

  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[3] = 1;
  return v2;
}

+ (id)autoupdatingActiveLockerAccount
{
  _QWORD *v2;

  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[3] = 3;
  return v2;
}

+ (id)carrierBundleWithDeviceIdentifier:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[1];
  v4[1] = v5;

  v4[3] = 4;
  return v4;
}

@end
