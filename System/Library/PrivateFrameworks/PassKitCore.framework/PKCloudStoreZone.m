@implementation PKCloudStoreZone

- (PKCloudStoreZone)initWithZoneID:(id)a3 containerDatabase:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PKCloudStoreZone *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "scope");

  v12 = -[PKCloudStoreZone initWithZoneID:containerName:scope:](self, "initWithZoneID:containerName:scope:", v7, v10, v11);
  return v12;
}

- (PKCloudStoreZone)initWithZoneID:(id)a3 containerName:(id)a4 scope:(int64_t)a5
{
  id v8;
  id v9;
  PKCloudStoreZone *v10;
  uint64_t v11;
  NSString *zoneName;
  uint64_t v13;
  NSString *ownerName;
  NSSet *v15;
  NSSet *shareParticipants;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKCloudStoreZone;
  v10 = -[PKCloudStoreZone init](&v18, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "zoneName");
    v11 = objc_claimAutoreleasedReturnValue();
    zoneName = v10->_zoneName;
    v10->_zoneName = (NSString *)v11;

    objc_msgSend(v8, "ownerName");
    v13 = objc_claimAutoreleasedReturnValue();
    ownerName = v10->_ownerName;
    v10->_ownerName = (NSString *)v13;

    objc_storeStrong((id *)&v10->_containerName, a4);
    v10->_scope = a5;
    v15 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    shareParticipants = v10->_shareParticipants;
    v10->_shareParticipants = v15;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZone)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreZone *v5;
  uint64_t v6;
  NSString *zoneName;
  uint64_t v8;
  NSString *ownerName;
  uint64_t v10;
  NSString *containerName;
  uint64_t v12;
  NSString *zoneSubscriptionIdentifier;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSSet *shareParticipants;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCloudStoreZone;
  v5 = -[PKCloudStoreZone init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneName"));
    v6 = objc_claimAutoreleasedReturnValue();
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerName"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerName = v5->_ownerName;
    v5->_ownerName = (NSString *)v8;

    v5->_scope = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scope"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerName"));
    v10 = objc_claimAutoreleasedReturnValue();
    containerName = v5->_containerName;
    v5->_containerName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneSubscriptionIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    zoneSubscriptionIdentifier = v5->_zoneSubscriptionIdentifier;
    v5->_zoneSubscriptionIdentifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("shareParticipants"));
    v17 = objc_claimAutoreleasedReturnValue();
    shareParticipants = v5->_shareParticipants;
    v5->_shareParticipants = (NSSet *)v17;

  }
  return v5;
}

+ (void)zoneValueForZoneName:(id)a3 outZoneType:(unint64_t *)a4 outAccountIdentifier:(id *)a5 altDSID:(id *)a6
{
  __CFString *v9;
  char v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  char v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  char v27;
  __CFString *v28;

  v28 = (__CFString *)a3;
  v9 = CFSTR("transactions");
  if (v9 == v28)
  {

    goto LABEL_7;
  }
  if (!v28 || !v9)
  {

    goto LABEL_9;
  }
  v10 = -[__CFString isEqualToString:](v28, "isEqualToString:", v9);

  if ((v10 & 1) != 0)
  {
LABEL_7:
    v11 = 0;
    v12 = 0;
    v13 = 1;
    goto LABEL_32;
  }
LABEL_9:
  if (-[__CFString hasPrefix:](v28, "hasPrefix:", CFSTR("cash-")))
  {
    -[__CFString stringByReplacingOccurrencesOfString:withString:](v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("cash-"), &stru_1E2ADF4C0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v13 = 3;
    goto LABEL_32;
  }
  if (-[__CFString hasPrefix:](v28, "hasPrefix:", CFSTR("card-joint-")))
  {
    -[__CFString stringByReplacingOccurrencesOfString:withString:](v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("card-joint-"), &stru_1E2ADF4C0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v13 = 4;
    goto LABEL_32;
  }
  if (!-[__CFString hasPrefix:](v28, "hasPrefix:", CFSTR("card-participant-")))
  {
    if (-[__CFString hasPrefix:](v28, "hasPrefix:", CFSTR("card-")))
    {
      -[__CFString stringByReplacingOccurrencesOfString:withString:options:range:](v28, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("card-"), &stru_1E2ADF4C0, 0, 0, objc_msgSend(CFSTR("card-"), "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v13 = 2;
      goto LABEL_32;
    }
    if (-[__CFString hasPrefix:](v28, "hasPrefix:", CFSTR("savings-")))
    {
      -[__CFString stringByReplacingOccurrencesOfString:withString:options:range:](v28, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("savings-"), &stru_1E2ADF4C0, 0, 0, objc_msgSend(CFSTR("savings-"), "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v13 = 8;
      goto LABEL_32;
    }
    v20 = v28;
    v21 = CFSTR("apple-account");
    if (v21 == v20)
      goto LABEL_50;
    v22 = v21;
    if (v28 && v21)
    {
      v23 = -[__CFString isEqualToString:](v20, "isEqualToString:", v21);

      if ((v23 & 1) != 0)
        goto LABEL_51;
    }
    else
    {

    }
    v24 = v20;
    v25 = CFSTR("apple-account-transactions");
    if (v25 == v24)
    {
LABEL_50:

    }
    else
    {
      v26 = v25;
      if (!v28 || !v25)
      {

LABEL_53:
        v13 = 0;
        v11 = 0;
        v12 = 0;
        goto LABEL_32;
      }
      v27 = -[__CFString isEqualToString:](v24, "isEqualToString:", v25);

      if ((v27 & 1) == 0)
        goto LABEL_53;
    }
LABEL_51:
    v11 = 0;
    v12 = 0;
    v13 = 7;
    goto LABEL_32;
  }
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("card-participant-"), &stru_1E2ADF4C0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("individual-");
  if ((objc_msgSend(v14, "hasPrefix:", CFSTR("individual-")) & 1) != 0)
  {
    v13 = 5;
LABEL_20:
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", v15, &stru_1E2ADF4C0);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
    goto LABEL_24;
  }
  v15 = CFSTR("joint-");
  if (objc_msgSend(v14, "hasPrefix:", CFSTR("joint-")))
  {
    v13 = 6;
    goto LABEL_20;
  }
  v13 = 0;
LABEL_24:
  v18 = objc_msgSend(v14, "rangeOfString:", CFSTR("-altDSID-"));
  if (v18 == 0x7FFFFFFFFFFFFFFFLL || v17 >= objc_msgSend(v14, "length"))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v14, "substringToIndex:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = objc_msgSend(CFSTR("-altDSID-"), "length") + v18;
  if (v19 >= objc_msgSend(v14, "length"))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v14, "substringFromIndex:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_32:
  if (a5)
    *a5 = objc_retainAutorelease(v12);
  if (a6)
    *a6 = objc_retainAutorelease(v11);
  if (a4)
    *a4 = v13;

}

- (unint64_t)zoneType
{
  unint64_t v3;

  v3 = 0;
  objc_msgSend((id)objc_opt_class(), "zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:", self->_zoneName, &v3, 0, 0);
  return v3;
}

- (id)shareParticipantWithHandle:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_shareParticipants;
  v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "participantHandle", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v4;
        v12 = v10;
        if (v12 == v11)
        {

LABEL_16:
          v6 = v9;
          goto LABEL_17;
        }
        v13 = v12;
        if (v4 && v12)
        {
          v14 = objc_msgSend(v11, "isEqualToString:", v12);

          if (v14)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_17:

  return v6;
}

- (id)shareParticipantWithLookupInfo:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_shareParticipants;
  v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "lookupInfo", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v4 && v10)
        {
          v12 = objc_msgSend(v4, "isEqual:", v10);

          if ((v12 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

          if (v11 == v4)
          {
LABEL_14:
            v6 = v9;
            goto LABEL_15;
          }
        }
      }
      v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_15:

  return v6;
}

- (id)recordZone
{
  id v3;
  void *v4;
  void *v5;

  if (self->_zoneName && self->_ownerName)
  {
    v3 = objc_alloc(MEMORY[0x1E0C95088]);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", self->_zoneName, self->_ownerName);
    v5 = (void *)objc_msgSend(v3, "initWithZoneID:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)zoneSubscription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_zoneSubscriptionIdentifier)
  {
    v3 = objc_alloc(MEMORY[0x1E0C950B0]);
    -[PKCloudStoreZone recordZone](self, "recordZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithZoneID:subscriptionID:", v5, self->_zoneSubscriptionIdentifier);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *zoneName;
  id v5;

  zoneName = self->_zoneName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", zoneName, CFSTR("zoneName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zoneSubscriptionIdentifier, CFSTR("zoneSubscriptionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerName, CFSTR("ownerName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_scope, CFSTR("scope"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shareParticipants, CFSTR("shareParticipants"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCloudStoreZone *v5;
  uint64_t v6;
  NSString *zoneName;
  uint64_t v8;
  NSString *containerName;
  uint64_t v10;
  NSString *zoneSubscriptionIdentifier;
  uint64_t v12;
  NSString *ownerName;
  uint64_t v14;
  NSSet *shareParticipants;

  v5 = -[PKCloudStoreZone init](+[PKCloudStoreZone allocWithZone:](PKCloudStoreZone, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_zoneName, "copyWithZone:", a3);
  zoneName = v5->_zoneName;
  v5->_zoneName = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_containerName, "copyWithZone:", a3);
  containerName = v5->_containerName;
  v5->_containerName = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_zoneSubscriptionIdentifier, "copyWithZone:", a3);
  zoneSubscriptionIdentifier = v5->_zoneSubscriptionIdentifier;
  v5->_zoneSubscriptionIdentifier = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_ownerName, "copyWithZone:", a3);
  ownerName = v5->_ownerName;
  v5->_ownerName = (NSString *)v12;

  v5->_scope = self->_scope;
  v14 = -[NSSet copyWithZone:](self->_shareParticipants, "copyWithZone:", a3);
  shareParticipants = v5->_shareParticipants;
  v5->_shareParticipants = (NSSet *)v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  NSString *zoneName;
  NSString *v8;
  NSString *ownerName;
  NSString *v10;
  NSString *containerName;
  NSString *v12;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_17;
  zoneName = self->_zoneName;
  v8 = (NSString *)v6[2];
  if (zoneName && v8)
  {
    if ((-[NSString isEqual:](zoneName, "isEqual:") & 1) == 0)
      goto LABEL_17;
  }
  else if (zoneName != v8)
  {
    goto LABEL_17;
  }
  ownerName = self->_ownerName;
  v10 = (NSString *)v6[3];
  if (!ownerName || !v10)
  {
    if (ownerName == v10)
      goto LABEL_13;
LABEL_17:
    v13 = 0;
    goto LABEL_18;
  }
  if ((-[NSString isEqual:](ownerName, "isEqual:") & 1) == 0)
    goto LABEL_17;
LABEL_13:
  containerName = self->_containerName;
  v12 = (NSString *)v6[1];
  if (containerName && v12)
    v13 = -[NSString isEqual:](containerName, "isEqual:");
  else
    v13 = containerName == v12;
LABEL_18:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_zoneName);
  objc_msgSend(v3, "safelyAddObject:", self->_zoneSubscriptionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_containerName);
  objc_msgSend(v3, "safelyAddObject:", self->_ownerName);
  objc_msgSend(v3, "safelyAddObject:", self->_shareParticipants);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_scope - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("zoneName: '%@'; "), self->_zoneName);
  objc_msgSend(v3, "appendFormat:", CFSTR("containerName: '%@'; "), self->_containerName);
  objc_msgSend(v3, "appendFormat:", CFSTR("ownerName: '%@'; "), self->_ownerName);
  CKDatabaseScopeString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("scope: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("zoneSubscriptionIdentifier: '%@'; "), self->_zoneSubscriptionIdentifier);
  if (-[NSSet count](self->_shareParticipants, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("shareParticipants: '%@'; "), self->_shareParticipants);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (NSString)zoneSubscriptionIdentifier
{
  return self->_zoneSubscriptionIdentifier;
}

- (void)setZoneSubscriptionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zoneSubscriptionIdentifier, a3);
}

- (NSSet)shareParticipants
{
  return self->_shareParticipants;
}

- (void)setShareParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_zoneSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
}

@end
