@implementation REMAssignment

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

+ (NSArray)rem_DA_propertiesAffectingIsConcealed
{
  void *v2;
  void *v3;

  _defaultPropertiesAffectingIsConcealed();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", CFSTR("assignee"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)rem_DA_fetchByObjectIDBlock
{
  return &__block_literal_global_322;
}

id __88__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, _QWORD *a5)
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
  objc_msgSend(v10, "fetchAssignmentsWithObjectIDs:includeConcealedObjects:error:", v11, a3, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v23;
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      __88__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke_cold_1();

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
      _os_log_error_impl(&dword_1B4A39000, v15, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: LOOKATME Requested REMAssignment not found {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);

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
      _os_log_error_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: LOOKATME Failed to fetch REMAssignment {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);

    }
  }
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v14;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  return &__block_literal_global_324;
}

id __89__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4)
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
  objc_msgSend(v8, "fetchAssignmentsWithObjectIDs:includeConcealedObjects:error:", v6, 0, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v17;
  if (v11)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __89__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1();

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_325;
  v15[3] = &unk_1E67F9C48;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v13;
}

void __89__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_325(uint64_t a1, void *a2)
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
  return &__block_literal_global_327;
}

REMDAAssignmentTombstone *__96__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  REMDAAssignmentTombstone *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_alloc_init(REMDAAssignmentTombstone);
  objc_msgSend(v2, "objectIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDAAssignmentTombstone setObjectIdentifier:](v3, "setObjectIdentifier:", v4);

  objc_msgSend(v2, "assignmentOwningReminderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMDAAssignmentTombstone setOwningReminderIdentifier:](v3, "setOwningReminderIdentifier:", v5);
  return v3;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  return &__block_literal_global_329;
}

REMDAAssignmentTombstone *__107__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  REMDAAssignmentTombstone *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v2 = a2;
  v3 = objc_opt_class();
  REMCheckedDynamicCast(v3, (uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(REMDAAssignmentTombstone);
    objc_msgSend(v4, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDAAssignmentTombstone setObjectIdentifier:](v5, "setObjectIdentifier:", v7);

    objc_msgSend(v4, "reminderID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDAAssignmentTombstone setOwningReminderIdentifier:](v5, "setOwningReminderIdentifier:", v9);

  }
  else
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __107__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1();

    v5 = 0;
  }

  return v5;
}

- (REMAssignment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 assigneeID:(id)a6 originatorID:(id)a7 status:(int64_t)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  REMAssignment *v21;

  v14 = (void *)MEMORY[0x1E0C99D68];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v14, "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[REMAssignment initWithObjectID:accountID:reminderID:assigneeID:originatorID:status:assignedDate:](self, "initWithObjectID:accountID:reminderID:assigneeID:originatorID:status:assignedDate:", v19, v18, v17, v16, v15, a8, v20);

  return v21;
}

- (REMAssignment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 assigneeID:(id)a6 originatorID:(id)a7 status:(int64_t)a8 assignedDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  REMAssignment *v18;
  REMAssignment *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)REMAssignment;
  v18 = -[REMAssignment init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_objectID, a3);
    objc_storeStrong((id *)&v19->_accountID, a4);
    objc_storeStrong((id *)&v19->_reminderID, a5);
    objc_storeStrong((id *)&v19->_assigneeID, a6);
    objc_storeStrong((id *)&v19->_originatorID, a7);
    v19->_status = a8;
    objc_storeStrong((id *)&v19->_assignedDate, a9);
    *(_WORD *)&v19->__debug_cdAssigneeLinked = 257;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAssignment)initWithCoder:(id)a3
{
  id v4;
  REMAssignment *v5;
  uint64_t v6;
  REMObjectID *objectID;
  uint64_t v8;
  REMObjectID *accountID;
  uint64_t v10;
  REMObjectID *reminderID;
  uint64_t v12;
  REMObjectID *assigneeID;
  uint64_t v14;
  REMObjectID *originatorID;
  unint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSDate *assignedDate;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)REMAssignment;
  v5 = -[REMAssignment init](&v21, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assigneeID"));
    v12 = objc_claimAutoreleasedReturnValue();
    assigneeID = v5->_assigneeID;
    v5->_assigneeID = (REMObjectID *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatorID"));
    v14 = objc_claimAutoreleasedReturnValue();
    originatorID = v5->_originatorID;
    v5->_originatorID = (REMObjectID *)v14;

    v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    if (v16 >= 2)
    {
      v17 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[REMAssignment initWithCoder:].cold.1(v16, v17);

      v16 = 0;
    }
    v5->_status = v16;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assignedDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    assignedDate = v5->_assignedDate;
    v5->_assignedDate = (NSDate *)v18;

    v5->__debug_cdAssigneeLinked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_debug_cdAssigneeLinked"));
    v5->__debug_cdOriginatorLinked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_debug_cdOriginatorLinked"));
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
  id v10;

  v10 = a3;
  -[REMAssignment objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("objectID"));

  -[REMAssignment accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("accountID"));

  -[REMAssignment reminderID](self, "reminderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("reminderID"));

  -[REMAssignment assigneeID](self, "assigneeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("assigneeID"));

  -[REMAssignment originatorID](self, "originatorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("originatorID"));

  objc_msgSend(v10, "encodeInteger:forKey:", -[REMAssignment status](self, "status"), CFSTR("status"));
  -[REMAssignment assignedDate](self, "assignedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("assignedDate"));

  objc_msgSend(v10, "encodeBool:forKey:", -[REMAssignment _debug_cdAssigneeLinked](self, "_debug_cdAssigneeLinked"), CFSTR("_debug_cdAssigneeLinked"));
  objc_msgSend(v10, "encodeBool:forKey:", -[REMAssignment _debug_cdOriginatorLinked](self, "_debug_cdOriginatorLinked"), CFSTR("_debug_cdOriginatorLinked"));

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
    v7 = -[REMAssignment isEqualToAssignment:](self, "isEqualToAssignment:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isEqualToAssignment:(id)a3
{
  REMAssignment *v4;
  REMAssignment *v5;
  REMAssignment *v6;
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
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;

  v4 = (REMAssignment *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_23;
    v7 = -[REMAssignment status](self, "status");
    if (v7 != -[REMAssignment status](v6, "status"))
      goto LABEL_23;
    -[REMAssignment objectID](self, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAssignment objectID](v6, "objectID");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {

    }
    else
    {
      v10 = (void *)v9;
      -[REMAssignment objectID](self, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAssignment objectID](v6, "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_23;
    }
    -[REMAssignment accountID](self, "accountID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAssignment accountID](v6, "accountID");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

    }
    else
    {
      v17 = (void *)v16;
      -[REMAssignment accountID](self, "accountID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAssignment accountID](v6, "accountID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_23;
    }
    -[REMAssignment reminderID](self, "reminderID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAssignment reminderID](v6, "reminderID");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v21 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[REMAssignment reminderID](self, "reminderID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAssignment reminderID](v6, "reminderID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_23;
    }
    -[REMAssignment assigneeID](self, "assigneeID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAssignment assigneeID](v6, "assigneeID");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[REMAssignment assigneeID](self, "assigneeID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAssignment assigneeID](v6, "assigneeID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_23;
    }
    -[REMAssignment originatorID](self, "originatorID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAssignment originatorID](v6, "originatorID");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v33 == (void *)v34)
    {

    }
    else
    {
      v35 = (void *)v34;
      -[REMAssignment originatorID](self, "originatorID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAssignment originatorID](v6, "originatorID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
      {
LABEL_23:
        v14 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    -[REMAssignment assignedDate](self, "assignedDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAssignment assignedDate](v6, "assignedDate");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v40 == (void *)v41)
    {
      v14 = 1;
      v42 = v40;
    }
    else
    {
      v42 = (void *)v41;
      -[REMAssignment assignedDate](self, "assignedDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAssignment assignedDate](v6, "assignedDate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v43, "isEqual:", v44);

    }
    goto LABEL_24;
  }
  v14 = 1;
LABEL_25:

  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMAssignment objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[REMAssignment objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAssignment reminderID](self, "reminderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[REMAssignment status](self, "status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAssignment assignedDate](self, "assignedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAssignment originatorID](self, "originatorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAssignment assigneeID](self, "assigneeID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMAssignment _debug_cdOriginatorLinked](self, "_debug_cdOriginatorLinked"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMAssignment _debug_cdAssigneeLinked](self, "_debug_cdAssigneeLinked"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, reminderID: %@, status: %@, date: %@, originatorID: %@, assigneeID: %@, originatorLinked: %@, assigneeLinked: %@>"), v3, self, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (BOOL)isOriginatorNullified
{
  void *v2;
  void *v3;
  char v4;

  -[REMAssignment originatorID](self, "originatorID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMSharee nullifiedAssignmentOriginatorID](REMSharee, "nullifiedAssignmentOriginatorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (double)orderValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[REMAssignment assignedDate](self, "assignedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAssignment objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMAssignment orderValueWithAssignedDate:objectIdentifier:](REMAssignment, "orderValueWithAssignedDate:objectIdentifier:", v3, v6);
  v8 = v7;

  return v8;
}

+ (double)orderValueWithAssignedDate:(id)a3 objectIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  double result;

  if (!a3)
    return (double)(unint64_t)objc_msgSend(a4, "hash", v4, v5);
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return result;
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
  return (NSString *)CFSTR("REMCDAssignment");
}

- (int64_t)status
{
  return self->_status;
}

- (REMObjectID)assigneeID
{
  return self->_assigneeID;
}

- (REMObjectID)originatorID
{
  return self->_originatorID;
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

- (NSDate)assignedDate
{
  return self->_assignedDate;
}

- (void)setAssignedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)_debug_cdAssigneeLinked
{
  return self->__debug_cdAssigneeLinked;
}

- (void)set_debug_cdAssigneeLinked:(BOOL)a3
{
  self->__debug_cdAssigneeLinked = a3;
}

- (BOOL)_debug_cdOriginatorLinked
{
  return self->__debug_cdOriginatorLinked;
}

- (void)set_debug_cdOriginatorLinked:(BOOL)a3
{
  self->__debug_cdOriginatorLinked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assignedDate, 0);
  objc_storeStrong((id *)&self->_reminderID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_originatorID, 0);
  objc_storeStrong((id *)&self->_assigneeID, 0);
}

+ (id)nullifiedOriginatorAssignmentWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 assigneeID:(id)a6 status:(int64_t)a7 assignedDate:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  REMAssignment *v18;
  void *v19;
  REMAssignment *v20;

  v13 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = [REMAssignment alloc];
  +[REMSharee nullifiedAssignmentOriginatorID](REMSharee, "nullifiedAssignmentOriginatorID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[REMAssignment initWithObjectID:accountID:reminderID:assigneeID:originatorID:status:assignedDate:](v18, "initWithObjectID:accountID:reminderID:assigneeID:originatorID:status:assignedDate:", v17, v16, v15, v14, v19, a7, v13);

  return v20;
}

void __88__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "rem_log_fault_if (assignments.count > 1) -- REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: FAULT: Fetch returned more than 1 assignment with 1 object ID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __89__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMAssignment {objectIDs: %{public}@, error: %@}.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __107__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, v0, v1, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: LOOKATME: Can't cast concealed object to REMAssignment {concealedObject: %@}.", v2);
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
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMAssignmentStatus %ld", (uint8_t *)&v2, 0xCu);
}

@end
