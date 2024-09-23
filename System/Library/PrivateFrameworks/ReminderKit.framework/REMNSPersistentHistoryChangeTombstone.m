@implementation REMNSPersistentHistoryChangeTombstone

- (REMNSPersistentHistoryChangeTombstone)initWithDictionary:(id)a3
{
  id v4;
  REMNSPersistentHistoryChangeTombstone *v5;
  NSDictionary *v6;
  void *v7;
  void *v8;
  NSDictionary *persistentHistoryChangeTombstone;
  REMNSPersistentHistoryChangeTombstone *v10;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)REMNSPersistentHistoryChangeTombstone;
    v5 = -[REMNSPersistentHistoryChangeTombstone init](&v12, sel_init);
    if (v5)
    {
      v6 = (NSDictionary *)objc_msgSend(v4, "mutableCopy");
      -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("externalIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        +[REMExternalSyncMetadataUtils decodeExternalIdentifierForMarkedForDeletionObject:](REMExternalSyncMetadataUtils, "decodeExternalIdentifierForMarkedForDeletionObject:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, CFSTR("externalIdentifier"));

      }
      persistentHistoryChangeTombstone = v5->_persistentHistoryChangeTombstone;
      v5->_persistentHistoryChangeTombstone = v6;

    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)objectIdentifier
{
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone remObjectIdentifier](self, "remObjectIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[REMNSPersistentHistoryChangeTombstone uuidForChangeTracking](self, "uuidForChangeTracking");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)remObjectIdentifier
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)externalIdentifier
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("externalIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)daIsEventOnlyContainer
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("daIsEventOnlyContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)shareeOwningListIdentifier
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("owningListIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)shareeDisplayName
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("displayName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)shareeAddress
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("address"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assignmentOwningReminderIdentifier
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("owningReminderIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hashtagName
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hashtagReminderIdentifier
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("reminderIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)uuidForChangeTracking
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("uuidForChangeTracking"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)dueDateDeltaAlertReminderIdentifier
{
  void *v2;
  void *v3;

  -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("reminderIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  REMNSPersistentHistoryChangeTombstone *v4;
  REMNSPersistentHistoryChangeTombstone *v5;
  REMNSPersistentHistoryChangeTombstone *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (REMNSPersistentHistoryChangeTombstone *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](v6, "persistentHistoryChangeTombstone");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {
        v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](self, "persistentHistoryChangeTombstone");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMNSPersistentHistoryChangeTombstone persistentHistoryChangeTombstone](v6, "persistentHistoryChangeTombstone");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[REMNSPersistentHistoryChangeTombstone remObjectIdentifier](self, "remObjectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("remObjectIdentifier"));

  -[REMNSPersistentHistoryChangeTombstone externalIdentifier](self, "externalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("externalIdentifier"));

  -[REMNSPersistentHistoryChangeTombstone daIsEventOnlyContainer](self, "daIsEventOnlyContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("daIsEventOnlyContainer"));

  -[REMNSPersistentHistoryChangeTombstone shareeOwningListIdentifier](self, "shareeOwningListIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("shareeOwningListIdentifier"));

  -[REMNSPersistentHistoryChangeTombstone shareeDisplayName](self, "shareeDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("shareeDisplayName"));

  -[REMNSPersistentHistoryChangeTombstone shareeAddress](self, "shareeAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("shareeAddress"));

  -[REMNSPersistentHistoryChangeTombstone assignmentOwningReminderIdentifier](self, "assignmentOwningReminderIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("assignmentOwningReminderIdentifier"));

  -[REMNSPersistentHistoryChangeTombstone hashtagName](self, "hashtagName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("hashtagName"));

  -[REMNSPersistentHistoryChangeTombstone hashtagReminderIdentifier](self, "hashtagReminderIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("hashtagReminderIdentifier"));

  -[REMNSPersistentHistoryChangeTombstone uuidForChangeTracking](self, "uuidForChangeTracking");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("uuidForChangeTracking"));

  -[REMNSPersistentHistoryChangeTombstone dueDateDeltaAlertReminderIdentifier](self, "dueDateDeltaAlertReminderIdentifier");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("dueDateDeltaAlertReminderIdentifier"));

}

- (REMNSPersistentHistoryChangeTombstone)initWithCoder:(id)a3
{
  id v4;
  REMNSPersistentHistoryChangeTombstone *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)REMNSPersistentHistoryChangeTombstone;
  v5 = -[REMNSPersistentHistoryChangeTombstone init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remObjectIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("identifier"));
    v23 = (void *)v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("externalIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daIsEventOnlyContainer"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("daIsEventOnlyContainer"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareeOwningListIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("owningListIdentifier"));
    v19 = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareeDisplayName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("displayName"), v19);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareeAddress"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("address"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assignmentOwningReminderIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("owningReminderIdentifier"));
    v22 = (void *)v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashtagName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("name"));
    v21 = (void *)v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashtagReminderIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("reminderIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuidForChangeTracking"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("uuidForChangeTracking"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDateDeltaAlertReminderIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("reminderIdentifier"));
    if (!objc_msgSend(v6, "count", v19))
    {

      v6 = 0;
    }
    v5 = -[REMNSPersistentHistoryChangeTombstone initWithDictionary:](v5, "initWithDictionary:", v6);

  }
  return v5;
}

- (NSDictionary)persistentHistoryChangeTombstone
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPersistentHistoryChangeTombstone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentHistoryChangeTombstone, 0);
}

@end
