@implementation PKSharedAccountCloudStoreZone

- (PKSharedAccountCloudStoreZone)initWithDictionary:(id)a3
{
  id v4;
  PKSharedAccountCloudStoreZone *v5;
  uint64_t v6;
  NSString *zoneName;
  uint64_t v8;
  NSString *accountIdentifier;
  __CFString *v10;
  __CFString *v11;
  int v12;
  _BOOL8 v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  __CFString *v21;
  __CFString *v22;
  int v23;
  __CFString *v24;
  __CFString *v25;
  char v26;
  uint64_t v27;
  __CFString *v28;
  __CFString *v29;
  int v30;
  uint64_t v31;
  NSString *originatorAltDSID;
  void *v33;
  uint64_t v34;
  NSSet *sharedUsersAltDSIDs;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKSharedAccountCloudStoreZone;
  v5 = -[PKSharedAccountCloudStoreZone init](&v37, sel_init);
  if (!v5)
    goto LABEL_29;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("zoneName"));
  v6 = objc_claimAutoreleasedReturnValue();
  zoneName = v5->_zoneName;
  v5->_zoneName = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("accountIdentifier"));
  v8 = objc_claimAutoreleasedReturnValue();
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v8;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("featureIdentifier"));
  v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v13 = 1;
  if (v10 != CFSTR("ccs"))
  {
    if (!v10 || (v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("ccs")), v11, !v12))
      v13 = 0;
  }

  v5->_accountType = v13;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("access"));
  v14 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 == CFSTR("private"))
    goto LABEL_10;
  if (!v14)
    goto LABEL_17;
  v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("private"));

  if ((v16 & 1) != 0)
  {
LABEL_10:
    v17 = 1;
    goto LABEL_18;
  }
  v18 = v15;
  if (v18 == CFSTR("shared")
    || (v19 = v18,
        v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("shared")),
        v19,
        (v20 & 1) != 0))
  {
    v17 = 2;
    goto LABEL_18;
  }
  v21 = v19;
  if (v21 == CFSTR("public")
    || (v22 = v21, v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("public")),
                   v22,
                   v23))
  {
    v17 = 3;
  }
  else
  {
LABEL_17:
    v17 = 0;
  }
LABEL_18:

  v5->_access = v17;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("mode"));
  v24 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24 != CFSTR("readwrite"))
  {
    if (v24)
    {
      v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("readwrite"));

      if ((v26 & 1) != 0)
        goto LABEL_21;
      v28 = v25;
      if (v28 == CFSTR("readonly")
        || (v29 = v28,
            v30 = -[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("readonly")),
            v29,
            v30))
      {
        v27 = 2;
        goto LABEL_26;
      }
    }
    v27 = 0;
    goto LABEL_26;
  }
LABEL_21:
  v27 = 1;
LABEL_26:

  v5->_mode = v27;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("originatorAltDSID"));
  v31 = objc_claimAutoreleasedReturnValue();
  originatorAltDSID = v5->_originatorAltDSID;
  v5->_originatorAltDSID = (NSString *)v31;

  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("sharedUsersAltDSIDs"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    sharedUsersAltDSIDs = v5->_sharedUsersAltDSIDs;
    v5->_sharedUsersAltDSIDs = (NSSet *)v34;

  }
LABEL_29:

  return v5;
}

- (unint64_t)zoneType
{
  unint64_t v3;

  v3 = 0;
  +[PKCloudStoreZone zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:](PKCloudStoreZone, "zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:", self->_zoneName, &v3, 0, 0);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharedAccountCloudStoreZone)initWithCoder:(id)a3
{
  id v4;
  PKSharedAccountCloudStoreZone *v5;
  uint64_t v6;
  NSString *zoneName;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSString *originatorAltDSID;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSSet *sharedUsersAltDSIDs;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKSharedAccountCloudStoreZone;
  v5 = -[PKSharedAccountCloudStoreZone init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneName"));
    v6 = objc_claimAutoreleasedReturnValue();
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    v5->_accountType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accountType"));
    v5->_access = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("access"));
    v5->_mode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatorAltDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    originatorAltDSID = v5->_originatorAltDSID;
    v5->_originatorAltDSID = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("sharedUsersAltDSIDs"));
    v15 = objc_claimAutoreleasedReturnValue();
    sharedUsersAltDSIDs = v5->_sharedUsersAltDSIDs;
    v5->_sharedUsersAltDSIDs = (NSSet *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *zoneName;
  id v5;

  zoneName = self->_zoneName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", zoneName, CFSTR("zoneName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accountType, CFSTR("accountType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_access, CFSTR("access"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatorAltDSID, CFSTR("originatorAltDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedUsersAltDSIDs, CFSTR("sharedUsersAltDSIDs"));

}

- (BOOL)isEqual:(id)a3
{
  PKSharedAccountCloudStoreZone *v4;
  PKSharedAccountCloudStoreZone *v5;
  BOOL v6;

  v4 = (PKSharedAccountCloudStoreZone *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKSharedAccountCloudStoreZone isEqualToSharedAccountCloudStoreZone:](self, "isEqualToSharedAccountCloudStoreZone:", v5);

  return v6;
}

- (BOOL)isEqualToSharedAccountCloudStoreZone:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  char v17;
  NSSet *sharedUsersAltDSIDs;
  NSSet *v20;

  v4 = a3;
  v5 = (void *)v4[1];
  v6 = self->_zoneName;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_23;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_24;
  }
  v11 = (void *)v4[2];
  v6 = self->_accountIdentifier;
  v12 = v11;
  if (v6 == v12)
  {

  }
  else
  {
    v8 = v12;
    if (!v6 || !v12)
      goto LABEL_23;
    v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_24;
  }
  if (self->_accountType != v4[3] || self->_access != v4[4] || self->_mode != v4[5])
    goto LABEL_24;
  v14 = (void *)v4[6];
  v6 = self->_originatorAltDSID;
  v15 = v14;
  if (v6 != v15)
  {
    v8 = v15;
    if (v6 && v15)
    {
      v16 = -[NSString isEqualToString:](v6, "isEqualToString:", v15);

      if (v16)
        goto LABEL_27;
LABEL_24:
      v17 = 0;
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }

LABEL_27:
  sharedUsersAltDSIDs = self->_sharedUsersAltDSIDs;
  v20 = (NSSet *)v4[7];
  if (sharedUsersAltDSIDs && v20)
    v17 = -[NSSet isEqual:](sharedUsersAltDSIDs, "isEqual:");
  else
    v17 = sharedUsersAltDSIDs == v20;
LABEL_25:

  return v17;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_zoneName);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_originatorAltDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_sharedUsersAltDSIDs);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_accountType - v4 + 32 * v4;
  v6 = self->_access - v5 + 32 * v5;
  v7 = self->_mode - v6 + 32 * v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKSharedAccountCloudStoreZone *v5;
  uint64_t v6;
  NSString *zoneName;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSString *originatorAltDSID;
  uint64_t v12;
  NSSet *sharedUsersAltDSIDs;

  v5 = -[PKSharedAccountCloudStoreZone init](+[PKSharedAccountCloudStoreZone allocWithZone:](PKSharedAccountCloudStoreZone, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_zoneName, "copyWithZone:", a3);
  zoneName = v5->_zoneName;
  v5->_zoneName = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_originatorAltDSID, "copyWithZone:", a3);
  originatorAltDSID = v5->_originatorAltDSID;
  v5->_originatorAltDSID = (NSString *)v10;

  v12 = -[NSSet copyWithZone:](self->_sharedUsersAltDSIDs, "copyWithZone:", a3);
  sharedUsersAltDSIDs = v5->_sharedUsersAltDSIDs;
  v5->_sharedUsersAltDSIDs = (NSSet *)v12;

  v5->_accountType = self->_accountType;
  v5->_access = self->_access;
  v5->_mode = self->_mode;
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  unint64_t access;
  const __CFString *v8;
  unint64_t mode;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("zoneName: %@; "), self->_zoneName);
  objc_msgSend(v5, "appendFormat:", CFSTR("accountIdentifier: %@; "), self->_accountIdentifier);
  if (self->_accountType == 1)
    v6 = CFSTR("ccs");
  else
    v6 = CFSTR("unknown");
  objc_msgSend(v5, "appendFormat:", CFSTR("accountType: %@ "), v6);
  access = self->_access;
  if (access > 3)
    v8 = CFSTR("private");
  else
    v8 = off_1E2ADB958[access];
  objc_msgSend(v5, "appendFormat:", CFSTR("access: %@ "), v8);
  mode = self->_mode;
  v10 = CFSTR("readwrite");
  if (mode == 2)
    v10 = CFSTR("readonly");
  if (mode)
    v11 = v10;
  else
    v11 = CFSTR("unknown");
  objc_msgSend(v5, "appendFormat:", CFSTR("mode: %@ "), v11);
  objc_msgSend(v5, "appendFormat:", CFSTR("originatorAltDSID: %@; "), self->_originatorAltDSID);
  objc_msgSend(v5, "appendFormat:", CFSTR("sharedUsersAltDSIDs: %@; "), self->_sharedUsersAltDSIDs);
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(unint64_t)a3
{
  self->_accountType = a3;
}

- (unint64_t)access
{
  return self->_access;
}

- (void)setAccess:(unint64_t)a3
{
  self->_access = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (NSString)originatorAltDSID
{
  return self->_originatorAltDSID;
}

- (void)setOriginatorAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)sharedUsersAltDSIDs
{
  return self->_sharedUsersAltDSIDs;
}

- (void)setSharedUsersAltDSIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUsersAltDSIDs, 0);
  objc_storeStrong((id *)&self->_originatorAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
