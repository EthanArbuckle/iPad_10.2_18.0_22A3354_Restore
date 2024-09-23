@implementation TPSpecificUser

- (TPSpecificUser)initWithCloudkitContainerName:(id)a3 octagonContextID:(id)a4 appleAccountID:(id)a5 altDSID:(id)a6 isPrimaryPersona:(BOOL)a7 personaUniqueString:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  TPSpecificUser *v19;
  TPSpecificUser *v20;
  NSString *v21;
  NSString *octagonContextID;
  id v24;
  objc_super v25;

  v24 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)TPSpecificUser;
  v19 = -[TPSpecificUser init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_cloudkitContainerName, a3);
    if (a7 || objc_msgSend(v15, "hasSuffix:", v17))
      v21 = (NSString *)v15;
    else
      v21 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v15, v17));
    octagonContextID = v20->_octagonContextID;
    v20->_octagonContextID = v21;

    objc_storeStrong((id *)&v20->_appleAccountID, a5);
    objc_storeStrong((id *)&v20->_altDSID, a6);
    v20->_isPrimaryAccount = a7;
    objc_storeStrong((id *)&v20->_personaUniqueString, a8);
  }

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
  if (-[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount"))
    v7 = CFSTR("primary");
  else
    v7 = CFSTR("secondary");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<TPSpecificUser: altDSID:%@ o:%@ ck:%@ p:%@/%@ aaID:%@>"), v3, v4, v5, v6, v7, v8));

  return v9;
}

- (TPSpecificUser)initWithCoder:(id)a3
{
  id v4;
  TPSpecificUser *v5;
  id v6;
  uint64_t v7;
  NSString *cloudkitContainerName;
  id v9;
  uint64_t v10;
  NSString *octagonContextID;
  id v12;
  uint64_t v13;
  NSString *appleAccountID;
  id v15;
  uint64_t v16;
  NSString *altDSID;
  id v18;
  uint64_t v19;
  NSString *personaUniqueString;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TPSpecificUser;
  v5 = -[TPSpecificUser init](&v22, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("cloudkit"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    cloudkitContainerName = v5->_cloudkitContainerName;
    v5->_cloudkitContainerName = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("octagon"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    octagonContextID = v5->_octagonContextID;
    v5->_octagonContextID = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("aaID"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    appleAccountID = v5->_appleAccountID;
    v5->_appleAccountID = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("altDSID"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v16;

    v5->_isPrimaryAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrimary"));
    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("persona"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cloudkit"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("octagon"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("aaID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("altDSID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount"), CFSTR("isPrimary"));
  v9 = (id)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("persona"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = objc_opt_class(TPSpecificUser);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudkitContainerName"));
    if (!objc_msgSend(v7, "isEqualToString:", v8))
    {
      v15 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "octagonContextID"));
    if (!objc_msgSend(v9, "isEqualToString:", v10))
    {
      v15 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appleAccountID"));
    if (!objc_msgSend(v11, "isEqualToString:", v12))
    {
      v15 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "altDSID"));
    if (!objc_msgSend(v13, "isEqualToString:"))
    {
      v15 = 0;
      goto LABEL_20;
    }
    v23 = v13;
    v14 = -[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount");
    if (v14 != objc_msgSend(v6, "isPrimaryAccount"))
    {
      v15 = 0;
      v13 = v23;
LABEL_20:

      goto LABEL_21;
    }
    v16 = objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
    if (v16 || (v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personaUniqueString"))) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
      v22 = (void *)v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personaUniqueString"));
      v15 = objc_msgSend(v21, "isEqualToString:", v17);

      v18 = v22;
      v13 = v23;
      if (v22)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      v20 = 0;
      v15 = 1;
      v13 = v23;
    }
    v18 = (void *)v20;
    goto LABEL_19;
  }
  v15 = 0;
LABEL_24:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TPSpecificUser *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  TPSpecificUser *v11;

  v4 = +[TPSpecificUser allocWithZone:](TPSpecificUser, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
  v9 = -[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
  v11 = -[TPSpecificUser initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:](v4, "initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
  v8 = (unint64_t)objc_msgSend(v7, "hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
  v10 = v6 ^ v8 ^ (unint64_t)objc_msgSend(v9, "hash");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
  v12 = v10 ^ (unint64_t)objc_msgSend(v11, "hash");

  return v12;
}

- (id)makeCKContainer
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerIDForContainerIdentifier:](CKContainer, "containerIDForContainerIdentifier:", v3));

  v5 = objc_alloc_init((Class)CKContainerOptions);
  objc_msgSend(v5, "setBypassPCSEncryption:", 1);
  if (!-[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount"))
  {
    v6 = objc_alloc((Class)CKAccountOverrideInfo);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
    v8 = objc_msgSend(v6, "initWithAltDSID:", v7);
    objc_msgSend(v5, "setAccountOverrideInfo:", v8);

  }
  v9 = objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:options:", v4, v5);

  return v9;
}

- (NSString)cloudkitContainerName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)appleAccountID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)octagonContextID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)personaUniqueString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isPrimaryAccount
{
  return self->_isPrimaryAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_octagonContextID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_appleAccountID, 0);
  objc_storeStrong((id *)&self->_cloudkitContainerName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
