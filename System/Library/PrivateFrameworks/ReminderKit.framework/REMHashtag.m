@implementation REMHashtag

+ (BOOL)isChangeTrackableModel
{
  return 1;
}

+ (BOOL)isChangeTrackableFetchableModel
{
  return 1;
}

+ (BOOL)rem_DA_supportsFetching
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(a1, "performSelector:", sel_isChangeTrackableFetchableModel) != 0;
}

+ (BOOL)rem_DA_supportsConcealedObjects
{
  return 1;
}

+ (id)rem_DA_fetchByObjectIDBlock
{
  return &__block_literal_global_345;
}

id __85__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, _QWORD *a5)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v30[0] = v8;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v30, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v10, "fetchHashtagsWithObjectIDs:includeConcealedObjects:error:", v11, a3, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v23;
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      __85__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke_cold_1();

  }
  objc_msgSend(v12, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && objc_msgSend(v13, "code") == -3000 || !objc_msgSend(v12, "count"))
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v8;
      v26 = 2114;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      _os_log_error_impl(&dword_1B4A39000, v15, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: LOOKATME Requested REMHashtag not found {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);

    }
  }
  if (v13 && objc_msgSend(v13, "code") != -3000)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v8;
      v26 = 2114;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_error_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: LOOKATME Failed to fetch REMHashtag {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);

    }
  }
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v14;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  return &__block_literal_global_346;
}

id __86__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a2;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a3;
  objc_msgSend(v7, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v8, "fetchHashtagsWithObjectIDs:includeConcealedObjects:error:", v6, 0, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v17;
  if (v11)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __86__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1();

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_347;
  v15[3] = &unk_1E67F9CD0;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v13;
}

void __86__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_347(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "objectID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

+ (id)rem_DA_deletedKeyFromTombstoneBlock
{
  return &__block_literal_global_349;
}

REMDAHashtagTombstone *__93__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  REMDAHashtagTombstone *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = objc_alloc_init(REMDAHashtagTombstone);
  objc_msgSend(v2, "objectIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDAHashtagTombstone setObjectIdentifier:](v3, "setObjectIdentifier:", v4);

  objc_msgSend(v2, "hashtagName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDAHashtagTombstone setName:](v3, "setName:", v5);

  objc_msgSend(v2, "hashtagReminderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMDAHashtagTombstone setReminderIdentifier:](v3, "setReminderIdentifier:", v6);
  return v3;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  return &__block_literal_global_351;
}

REMDAHashtagTombstone *__104__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  REMDAHashtagTombstone *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v2 = a2;
  v3 = objc_opt_class();
  REMCheckedDynamicCast(v3, (uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(REMDAHashtagTombstone);
    objc_msgSend(v4, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDAHashtagTombstone setObjectIdentifier:](v5, "setObjectIdentifier:", v7);

    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDAHashtagTombstone setName:](v5, "setName:", v8);

    objc_msgSend(v4, "reminderID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDAHashtagTombstone setReminderIdentifier:](v5, "setReminderIdentifier:", v10);

  }
  else
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __104__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1();

    v5 = 0;
  }

  return v5;
}

- (REMHashtag)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 type:(int64_t)a6 name:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  REMHashtag *v18;

  v12 = (void *)MEMORY[0x1E0C99D68];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[REMHashtag initWithObjectID:accountID:reminderID:type:name:creationDate:](self, "initWithObjectID:accountID:reminderID:type:name:creationDate:", v16, v15, v14, a6, v13, v17);

  return v18;
}

- (REMHashtag)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 type:(int64_t)a6 name:(id)a7 creationDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  REMHashtag *v18;
  REMHashtag *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)REMHashtag;
  v18 = -[REMHashtag init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_objectID, a3);
    objc_storeStrong((id *)&v19->_accountID, a4);
    objc_storeStrong((id *)&v19->_reminderID, a5);
    v19->_type = a6;
    objc_storeStrong((id *)&v19->_name, a7);
    objc_storeStrong((id *)&v19->_creationDate, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMHashtag)initWithCoder:(id)a3
{
  id v4;
  REMHashtag *v5;
  uint64_t v6;
  REMObjectID *objectID;
  uint64_t v8;
  REMObjectID *accountID;
  uint64_t v10;
  REMObjectID *reminderID;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSDate *creationDate;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)REMHashtag;
  v5 = -[REMHashtag init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
    v6 = objc_claimAutoreleasedReturnValue();
    objectID = v5->_objectID;
    v5->_objectID = (REMObjectID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (REMObjectID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reminderID"));
    v10 = objc_claimAutoreleasedReturnValue();
    reminderID = v5->_reminderID;
    v5->_reminderID = (REMObjectID *)v10;

    v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    if (v12 >= 2)
    {
      v13 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[REMHashtag initWithCoder:].cold.1(v12, v13);

      v12 = 0;
    }
    v5->_type = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v14 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v16;

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
  -[REMHashtag objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectID"));

  -[REMHashtag accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountID"));

  -[REMHashtag reminderID](self, "reminderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("reminderID"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMHashtag type](self, "type"), CFSTR("type"));
  -[REMHashtag name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("name"));

  -[REMHashtag creationDate](self, "creationDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("creationDate"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class();
  REMDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[REMHashtag isEqualToHashtag:](self, "isEqualToHashtag:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isEqualToHashtag:(id)a3
{
  REMHashtag *v4;
  REMHashtag *v5;
  REMHashtag *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = (REMHashtag *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    v7 = -[REMHashtag type](self, "type");
    if (v7 != -[REMHashtag type](v6, "type"))
      goto LABEL_19;
    -[REMHashtag objectID](self, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMHashtag objectID](v6, "objectID");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {

    }
    else
    {
      v10 = (void *)v9;
      -[REMHashtag objectID](self, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMHashtag objectID](v6, "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_19;
    }
    -[REMHashtag accountID](self, "accountID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMHashtag accountID](v6, "accountID");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

    }
    else
    {
      v17 = (void *)v16;
      -[REMHashtag accountID](self, "accountID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMHashtag accountID](v6, "accountID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_19;
    }
    -[REMHashtag reminderID](self, "reminderID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMHashtag reminderID](v6, "reminderID");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v21 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[REMHashtag reminderID](self, "reminderID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMHashtag reminderID](v6, "reminderID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_19;
    }
    -[REMHashtag name](self, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMHashtag name](v6, "name");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[REMHashtag name](self, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMHashtag name](v6, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
      {
LABEL_19:
        v14 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    -[REMHashtag creationDate](self, "creationDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMHashtag creationDate](v6, "creationDate");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v34 == (void *)v35)
    {
      v14 = 1;
      v36 = v34;
    }
    else
    {
      v36 = (void *)v35;
      -[REMHashtag creationDate](self, "creationDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMHashtag creationDate](v6, "creationDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v37, "isEqual:", v38);

    }
    goto LABEL_20;
  }
  v14 = 1;
LABEL_21:

  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMHashtag objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMHashtag objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMHashtag reminderID](self, "reminderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[REMHashtag type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMHashtag name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMHashtag creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, reminderID: %@, type: %@, name: %@, creation date: %@>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)objectIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[REMHashtag objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDHashtag");
}

- (int64_t)type
{
  return self->_type;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMObjectID)reminderID
{
  return self->_reminderID;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_reminderID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

void __85__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "rem_log_fault_if (hashtags.count > 1) -- REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: FAULT: Fetch returned more than 1 hashtag with 1 object ID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __86__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, v1), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMHashtag {objectIDs: %{public}@, error: %@}.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __104__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, v0, v1, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: LOOKATME: Can't cast concealed object to REMHashtag {concealedObject: %@}.", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMHashtagType %ld", (uint8_t *)&v2, 0xCu);
}

@end
