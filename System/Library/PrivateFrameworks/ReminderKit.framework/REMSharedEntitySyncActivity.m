@implementation REMSharedEntitySyncActivity

- (REMSharedEntitySyncActivity)initWithAccountIdentifier:(id)a3 activityDate:(id)a4 activityType:(int64_t)a5 authorUserRecordIDString:(id)a6 ckParentCloudObjectEntityName:(id)a7 ckParentCloudObjectIdentifier:(id)a8 ckIdentifier:(id)a9 sharedEntityName:(id)a10 uuidForChangeTracking:(id)a11
{
  id v17;
  REMSharedEntitySyncActivity *v18;
  REMSharedEntitySyncActivity *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a4;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v17 = a11;
  v29.receiver = self;
  v29.super_class = (Class)REMSharedEntitySyncActivity;
  v18 = -[REMSharedEntitySyncActivity init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountIdentifier, a3);
    objc_storeStrong((id *)&v19->_activityDate, a4);
    v19->_activityType = a5;
    objc_storeStrong((id *)&v19->_authorUserRecordIDString, a6);
    objc_storeStrong((id *)&v19->_ckParentCloudObjectEntityName, a7);
    objc_storeStrong((id *)&v19->_ckParentCloudObjectIdentifier, a8);
    objc_storeStrong((id *)&v19->_ckIdentifier, a9);
    objc_storeStrong((id *)&v19->_sharedEntityName, a10);
    objc_storeStrong((id *)&v19->_uuidForChangeTracking, a11);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSharedEntitySyncActivity)initWithCoder:(id)a3
{
  id v4;
  REMSharedEntitySyncActivity *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSDate *activityDate;
  uint64_t v10;
  NSString *authorUserRecordIDString;
  uint64_t v12;
  NSString *ckParentCloudObjectEntityName;
  uint64_t v14;
  NSString *ckParentCloudObjectIdentifier;
  uint64_t v16;
  NSString *ckIdentifier;
  uint64_t v18;
  NSString *sharedEntityName;
  uint64_t v20;
  NSUUID *uuidForChangeTracking;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)REMSharedEntitySyncActivity;
  v5 = -[REMSharedEntitySyncActivity init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    activityDate = v5->_activityDate;
    v5->_activityDate = (NSDate *)v8;

    v5->_activityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activityType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorUserRecordIDString"));
    v10 = objc_claimAutoreleasedReturnValue();
    authorUserRecordIDString = v5->_authorUserRecordIDString;
    v5->_authorUserRecordIDString = (NSString *)v10;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ckParentCloudObjectEntityName")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ckParentCloudObjectEntityName"));
      v12 = objc_claimAutoreleasedReturnValue();
      ckParentCloudObjectEntityName = v5->_ckParentCloudObjectEntityName;
      v5->_ckParentCloudObjectEntityName = (NSString *)v12;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ckParentCloudObjectIdentifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ckParentCloudObjectIdentifier"));
      v14 = objc_claimAutoreleasedReturnValue();
      ckParentCloudObjectIdentifier = v5->_ckParentCloudObjectIdentifier;
      v5->_ckParentCloudObjectIdentifier = (NSString *)v14;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ckIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    ckIdentifier = v5->_ckIdentifier;
    v5->_ckIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedEntityName"));
    v18 = objc_claimAutoreleasedReturnValue();
    sharedEntityName = v5->_sharedEntityName;
    v5->_sharedEntityName = (NSString *)v18;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("uuidForChangeTracking")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuidForChangeTracking"));
      v20 = objc_claimAutoreleasedReturnValue();
      uuidForChangeTracking = v5->_uuidForChangeTracking;
      v5->_uuidForChangeTracking = (NSUUID *)v20;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
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

  v15 = a3;
  -[REMSharedEntitySyncActivity accountIdentifier](self, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v4, CFSTR("accountIdentifier"));

  -[REMSharedEntitySyncActivity activityDate](self, "activityDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("activityDate"));

  objc_msgSend(v15, "encodeInteger:forKey:", -[REMSharedEntitySyncActivity activityType](self, "activityType"), CFSTR("activityType"));
  -[REMSharedEntitySyncActivity authorUserRecordIDString](self, "authorUserRecordIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("authorUserRecordIDString"));

  -[REMSharedEntitySyncActivity ckParentCloudObjectEntityName](self, "ckParentCloudObjectEntityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[REMSharedEntitySyncActivity ckParentCloudObjectEntityName](self, "ckParentCloudObjectEntityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("ckParentCloudObjectEntityName"));

  }
  -[REMSharedEntitySyncActivity ckParentCloudObjectIdentifier](self, "ckParentCloudObjectIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[REMSharedEntitySyncActivity ckParentCloudObjectIdentifier](self, "ckParentCloudObjectIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("ckParentCloudObjectIdentifier"));

  }
  -[REMSharedEntitySyncActivity ckIdentifier](self, "ckIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("ckIdentifier"));

  -[REMSharedEntitySyncActivity sharedEntityName](self, "sharedEntityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("sharedEntityName"));

  -[REMSharedEntitySyncActivity uuidForChangeTracking](self, "uuidForChangeTracking");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[REMSharedEntitySyncActivity uuidForChangeTracking](self, "uuidForChangeTracking");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("uuidForChangeTracking"));

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  -[REMSharedEntitySyncActivity accountIdentifier](self, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSharedEntitySyncActivity activityDate](self, "activityDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSharedEntitySyncActivity activityTypeDescription](self, "activityTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSharedEntitySyncActivity authorUserRecordIDString](self, "authorUserRecordIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSharedEntitySyncActivity ckParentCloudObjectEntityName](self, "ckParentCloudObjectEntityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSharedEntitySyncActivity ckParentCloudObjectIdentifier](self, "ckParentCloudObjectIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSharedEntitySyncActivity ckIdentifier](self, "ckIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSharedEntitySyncActivity sharedEntityName](self, "sharedEntityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSharedEntitySyncActivity uuidForChangeTracking](self, "uuidForChangeTracking");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p accountIdentifier: %@, activityDate: %@, activityType: %@, authorUserRecordIDString: %@, ckParentCloudObjectEntityName: %@, ckParentCloudObjectIdentifier: %@, ckIdentifier: %@, sharedEntityName: %@, uuidForChangeTracking: %@"), v14, self, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)activityTypeDescription
{
  unint64_t v3;
  NSObject *v5;

  v3 = -[REMSharedEntitySyncActivity activityType](self, "activityType");
  if (v3 < 6)
    return off_1E67F9248[v3];
  v5 = os_log_create("com.apple.reminderkit", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[REMSharedEntitySyncActivity activityTypeDescription].cold.1(self, v5);

  return CFSTR("ILL-DEFINED");
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSDate)activityDate
{
  return self->_activityDate;
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (NSString)authorUserRecordIDString
{
  return self->_authorUserRecordIDString;
}

- (NSString)ckParentCloudObjectEntityName
{
  return self->_ckParentCloudObjectEntityName;
}

- (NSString)ckParentCloudObjectIdentifier
{
  return self->_ckParentCloudObjectIdentifier;
}

- (NSString)ckIdentifier
{
  return self->_ckIdentifier;
}

- (NSString)sharedEntityName
{
  return self->_sharedEntityName;
}

- (NSUUID)uuidForChangeTracking
{
  return self->_uuidForChangeTracking;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidForChangeTracking, 0);
  objc_storeStrong((id *)&self->_sharedEntityName, 0);
  objc_storeStrong((id *)&self->_ckIdentifier, 0);
  objc_storeStrong((id *)&self->_ckParentCloudObjectIdentifier, 0);
  objc_storeStrong((id *)&self->_ckParentCloudObjectEntityName, 0);
  objc_storeStrong((id *)&self->_authorUserRecordIDString, 0);
  objc_storeStrong((id *)&self->_activityDate, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (void)activityTypeDescription
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "activityType");
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Attempted to describe invalid REMSharedEntitySyncActivityType with value %ld", (uint8_t *)&v3, 0xCu);
}

@end
