@implementation PKSharedAccountCloudStore

- (PKSharedAccountCloudStore)initWithArray:(id)a3 lastUpdated:(id)a4
{
  id v6;
  id v7;
  PKSharedAccountCloudStore *v8;
  PKSharedAccountCloudStore *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PKSharedAccountCloudStoreZone *v17;
  PKSharedAccountCloudStoreZone *v18;
  uint64_t v19;
  NSArray *sharedAccountCloudStoreZones;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKSharedAccountCloudStore;
  v8 = -[PKSharedAccountCloudStore init](&v26, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lastUpdated, a4);
    v9->_dirty = 0;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
          v17 = [PKSharedAccountCloudStoreZone alloc];
          v18 = -[PKSharedAccountCloudStoreZone initWithDictionary:](v17, "initWithDictionary:", v16, (_QWORD)v22);
          objc_msgSend(v10, "addObject:", v18);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v13);
    }

    v19 = objc_msgSend(v10, "copy");
    sharedAccountCloudStoreZones = v9->_sharedAccountCloudStoreZones;
    v9->_sharedAccountCloudStoreZones = (NSArray *)v19;

  }
  return v9;
}

- (id)sharedAccountCloudStoreZonesWithAccess:(unint64_t)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_sharedAccountCloudStoreZones;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "access", (_QWORD)v14) == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)sharedAccountCloudStoreZonesWithAccess:(unint64_t)a3 forAccountUser:(id)a4
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_sharedAccountCloudStoreZones;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "access", (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_msgSend(v5, "copy");
  return v11;
}

- (id)sharedAccountZoneWithName:(id)a3 access:(unint64_t)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_sharedAccountCloudStoreZones;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v12, "zoneName", (_QWORD)v21);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v6;
          v15 = v13;
          v16 = v15;
          if (v15 == v14)
          {

          }
          else
          {
            if (!v15)
            {

LABEL_15:
              continue;
            }
            v17 = objc_msgSend(v14, "isEqualToString:", v15);

            if (!v17)
              goto LABEL_15;
          }
          v18 = objc_msgSend(v12, "access");

          if (v18 == a4)
          {
            v19 = v12;
            goto LABEL_20;
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
    v19 = 0;
LABEL_20:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)primaryZoneForAccountUser:(id)a3 inAccountUserCollection:(id)a4 access:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "accountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_accountIdentifier;
  v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {

    goto LABEL_7;
  }
  if (!v12 || !v11)
  {

    goto LABEL_12;
  }
  v14 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

  if (v14)
  {
LABEL_7:
    objc_msgSend(v8, "altDSID");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "accessLevel");
    if (v16 == 2)
    {
      PKSharedAccountParticpantCloudStoreZoneName((uint64_t)v13, (uint64_t)v11, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharedAccountCloudStore sharedAccountZoneWithName:access:](self, "sharedAccountZoneWithName:access:", v21, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        PKSharedAccountParticpantCloudStoreZoneName((uint64_t)v13, (uint64_t)v11, 0);
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
LABEL_18:

      goto LABEL_19;
    }
    if (v16 == 1)
    {
      objc_msgSend(v9, "accountUsers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectsPassingTest:", &__block_literal_global_211);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19 >= 2)
      {
        PKSharedAccountMergedCloudStoreZoneName((uint64_t)v13);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v22 = (void *)v20;
        -[PKSharedAccountCloudStore sharedAccountZoneWithName:access:](self, "sharedAccountZoneWithName:access:", v20, a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      if (objc_msgSend(v8, "isCurrentUser"))
      {
        -[PKSharedAccountCloudStore sharedAccountZoneWithName:access:](self, "sharedAccountZoneWithName:access:", CFSTR("transactions"), a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
LABEL_12:
    v15 = 0;
    goto LABEL_18;
  }
  v15 = 0;
LABEL_19:

  return v15;
}

BOOL __86__PKSharedAccountCloudStore_primaryZoneForAccountUser_inAccountUserCollection_access___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessLevel") == 1;
}

- (id)allPossibleZonesForAccountUser:(id)a3 access:(unint64_t)a4
{
  id v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  id v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  objc_msgSend(v6, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_accountIdentifier;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  v11 = 0;
  if (!v9 || !v8)
  {
    v18 = v9;
    goto LABEL_16;
  }
  v12 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

  if (v12)
  {
LABEL_7:
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "altDSID");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "accessLevel");
    if (v13 == 2)
    {
      if (a4 - 1 > 1)
      {
LABEL_17:

        goto LABEL_18;
      }
      PKSharedAccountParticpantCloudStoreZoneName((uint64_t)v10, (uint64_t)v8, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharedAccountCloudStore sharedAccountZoneWithName:access:](self, "sharedAccountZoneWithName:access:", v19, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safelyAddObject:", v20);

      PKSharedAccountParticpantCloudStoreZoneName((uint64_t)v10, (uint64_t)v8, 0);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v13 != 1)
        goto LABEL_17;
      if (a4 - 1 > 1)
        goto LABEL_17;
      PKSharedAccountMergedCloudStoreZoneName((uint64_t)v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharedAccountCloudStore sharedAccountZoneWithName:access:](self, "sharedAccountZoneWithName:access:", v14, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safelyAddObject:", v15);

      if (!objc_msgSend(v6, "isCurrentUser"))
        goto LABEL_17;
      -[PKSharedAccountCloudStore sharedAccountZoneWithName:access:](self, "sharedAccountZoneWithName:access:", CFSTR("transactions"), a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safelyAddObject:", v16);

      PKSharedAccountCardCloudStoreZoneName((uint64_t)v10);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;
    -[PKSharedAccountCloudStore sharedAccountZoneWithName:access:](self, "sharedAccountZoneWithName:access:", v17, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safelyAddObject:", v21);

LABEL_16:
    goto LABEL_17;
  }
  v11 = 0;
LABEL_18:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharedAccountCloudStore)initWithCoder:(id)a3
{
  id v4;
  PKSharedAccountCloudStore *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *sharedAccountCloudStoreZones;
  uint64_t v11;
  NSDate *lastUpdated;
  uint64_t v13;
  NSString *accountIdentifier;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKSharedAccountCloudStore;
  v5 = -[PKSharedAccountCloudStore init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sharedAccountCloudStoreZones"));
    v9 = objc_claimAutoreleasedReturnValue();
    sharedAccountCloudStoreZones = v5->_sharedAccountCloudStoreZones;
    v5->_sharedAccountCloudStoreZones = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v11 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v11;

    v5->_dirty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dirty"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *sharedAccountCloudStoreZones;
  id v5;

  sharedAccountCloudStoreZones = self->_sharedAccountCloudStoreZones;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sharedAccountCloudStoreZones, CFSTR("sharedAccountCloudStoreZones"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdated"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dirty, CFSTR("dirty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));

}

- (BOOL)isEqual:(id)a3
{
  PKSharedAccountCloudStore *v4;
  PKSharedAccountCloudStore *v5;
  BOOL v6;

  v4 = (PKSharedAccountCloudStore *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKSharedAccountCloudStore isEqualToSharedAccountCloudStore:](self, "isEqualToSharedAccountCloudStore:", v5);

  return v6;
}

- (BOOL)isEqualToSharedAccountCloudStore:(id)a3
{
  NSArray *sharedAccountCloudStoreZones;
  NSArray *v4;
  BOOL v5;

  sharedAccountCloudStoreZones = self->_sharedAccountCloudStoreZones;
  v4 = (NSArray *)*((_QWORD *)a3 + 2);
  if (sharedAccountCloudStoreZones)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
    return sharedAccountCloudStoreZones == v4;
  else
    return -[NSArray isEqual:](sharedAccountCloudStoreZones, "isEqual:");
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_sharedAccountCloudStoreZones);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKSharedAccountCloudStore *v5;
  uint64_t v6;
  NSArray *sharedAccountCloudStoreZones;
  uint64_t v8;
  NSDate *lastUpdated;

  v5 = -[PKSharedAccountCloudStore init](+[PKSharedAccountCloudStore allocWithZone:](PKSharedAccountCloudStore, "allocWithZone:"), "init");
  v6 = -[NSArray copyWithZone:](self->_sharedAccountCloudStoreZones, "copyWithZone:", a3);
  sharedAccountCloudStoreZones = v5->_sharedAccountCloudStoreZones;
  v5->_sharedAccountCloudStoreZones = (NSArray *)v6;

  v8 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v8;

  v5->_dirty = self->_dirty;
  objc_storeStrong((id *)&v5->_accountIdentifier, self->_accountIdentifier);
  return v5;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("sharedAccountCloudStoreZones: %@; "), self->_sharedAccountCloudStoreZones);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: %@; "), self->_lastUpdated);
  if (self->_dirty)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("dirty: %@; "), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: %@; "), self->_accountIdentifier);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (NSArray)sharedAccountCloudStoreZones
{
  return self->_sharedAccountCloudStoreZones;
}

- (void)setSharedAccountCloudStoreZones:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_sharedAccountCloudStoreZones, 0);
}

@end
