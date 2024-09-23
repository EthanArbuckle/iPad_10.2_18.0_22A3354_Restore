@implementation REMList

- (REMList)parentList
{
  return self->_parentList;
}

- (REMStore)store
{
  return self->_store;
}

- (void)setParentList:(id)a3
{
  objc_storeStrong((id *)&self->_parentList, a3);
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMListStorage objectIDWithUUID:](REMListStorage, "objectIDWithUUID:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentList, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (BOOL)canBeShared
{
  void *v2;
  char v3;

  -[REMList account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSharingLists");

  return v3;
}

- (REMList)initWithStore:(id)a3 account:(id)a4 storage:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMList *v12;
  REMList *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMList;
  v12 = -[REMList init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_account, a4);
    objc_storeStrong((id *)&v13->_storage, a5);
    -[REMListStorage setStoreGenerationIfNeeded:](v13->_storage, "setStoreGenerationIfNeeded:", objc_msgSend(v9, "storeGeneration"));
  }

  return v13;
}

- (BOOL)isPinned
{
  void *v2;
  BOOL v3;

  -[REMList pinnedDate](self, "pinnedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)sharingStatusText
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  int v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  -[REMList shareeContext](self, "shareeContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[REMList sharingStatus](self, "sharingStatus");
  v5 = -[REMList isShared](self, "isShared");
  v6 = v4 == 3 || v5;
  if (v6 == 1 && v3 != 0)
  {
    if (v4 == 3)
    {
      -[REMList formattedSharedOwnerName](self, "formattedSharedOwnerName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = 5;
    }
    else
    {
      if (-[REMList isOwnedByMe](self, "isOwnedByMe"))
      {
        objc_msgSend(v3, "shareesExcludingOwner");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v9, "count");
        if (v13 == 1)
        {
          objc_msgSend(v12, "formattedName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v18 = v16;
          }
          else
          {
            _REMGetLocalizedString(50);
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          v22 = v18;

          v23 = (void *)MEMORY[0x1E0CB3940];
          _REMGetLocalizedString(2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!v13)
          {
            _REMGetLocalizedString(1);
            v14 = objc_claimAutoreleasedReturnValue();
LABEL_18:
            v8 = (void *)v14;
LABEL_19:

            goto LABEL_20;
          }
          objc_msgSend(v12, "formattedName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            v21 = v19;
          }
          else
          {
            _REMGetLocalizedString(50);
            v21 = (id)objc_claimAutoreleasedReturnValue();
          }
          v22 = v21;

          v25 = objc_msgSend(v9, "count") - 1;
          v23 = (void *)MEMORY[0x1E0CB3940];
          _REMGetLocalizedString(3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
        }
        objc_msgSend(v23, "stringWithFormat:", v24, v22, v26);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
      -[REMList formattedSharedOwnerName](self, "formattedSharedOwnerName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = 4;
    }
    _REMGetLocalizedString(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v8 = 0;
LABEL_20:

  return v8;
}

- (BOOL)isShared
{
  REMList *v2;
  void *v3;

  v2 = self;
  -[REMList sharees](self, "sharees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = +[REMList isSharedWithShareeCount:sharingStatus:](REMList, "isSharedWithShareeCount:sharingStatus:", objc_msgSend(v3, "count"), -[REMList sharingStatus](v2, "sharingStatus"));

  return (char)v2;
}

+ (BOOL)isSharedWithShareeCount:(unint64_t)a3 sharingStatus:(int64_t)a4
{
  return a3 || a4 == 2;
}

- (REMListShareeContext)shareeContext
{
  void *v3;
  void *v4;
  int v5;
  REMListShareeContext *v6;

  -[REMList account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsListSharees");

  if (v5)
    v6 = -[REMListShareeContext initWithList:]([REMListShareeContext alloc], "initWithList:", self);
  else
    v6 = 0;
  return v6;
}

- (REMListGroceryContext)groceryContext
{
  void *v3;
  void *v4;
  int v5;
  REMListGroceryContext *v6;

  -[REMList account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsSections");

  if (v5)
    v6 = -[REMListGroceryContext initWithList:]([REMListGroceryContext alloc], "initWithList:", self);
  else
    v6 = 0;
  return v6;
}

- (REMListAppearanceContext)appearanceContext
{
  void *v3;
  void *v4;
  int v5;
  REMListAppearanceContext *v6;

  -[REMList account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsSubtasks");

  if (v5)
    v6 = -[REMListAppearanceContext initWithList:]([REMListAppearanceContext alloc], "initWithList:", self);
  else
    v6 = 0;
  return v6;
}

- (REMAccount)account
{
  return self->_account;
}

- (id)optionalObjectID
{
  void *v2;
  void *v3;

  -[REMList storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionalObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (REMListStorage)storage
{
  return self->_storage;
}

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
  return &__block_literal_global_217;
}

id __82__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, _QWORD *a5)
{
  id v8;
  id v9;
  void *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  v10 = v9;
  if ((_DWORD)a3)
  {
    v21 = 0;
    v11 = (id *)&v21;
    objc_msgSend(v9, "fetchListIncludingConcealedWithObjectID:error:", v8, &v21);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
    v11 = (id *)&v20;
    objc_msgSend(v9, "fetchListWithObjectID:error:", v8, &v20);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  v14 = *v11;
  v15 = v14;
  if (v14 && objc_msgSend(v14, "code") != -3000)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v8;
      v24 = 2114;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      _os_log_error_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMList {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);

    }
  }
  if (a5)
    *a5 = objc_retainAutorelease(v15);

  return v13;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  return &__block_literal_global_219;
}

id __83__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v6 = a2;
  v11 = 0;
  objc_msgSend(a3, "fetchListsWithObjectIDs:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v8)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __83__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1();

  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

+ (id)rem_DA_deletedKeyFromTombstoneBlock
{
  return &__block_literal_global_221;
}

id __90__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "daIsEventOnlyContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "externalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v2, "objectIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  return &__block_literal_global_223;
}

id __101__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v7;

  v2 = a2;
  v3 = objc_opt_class();
  REMCheckedDynamicCast(v3, (uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "daIsEventOnlyContainer") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __101__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1(v4);

    }
    if (objc_msgSend(v4, "shouldUseExternalIdentifierAsDeletionKey"))
      objc_msgSend(v4, "externalIdentifierForMarkedForDeletionObject");
    else
      objc_msgSend(v4, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)fetchRequestWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4
{
  id v5;
  id v6;
  REMListFetchExecutor *v7;
  REMFetchRequest *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[REMListFetchExecutor initWithPredicateDescriptor:sortDescriptors:options:]([REMListFetchExecutor alloc], "initWithPredicateDescriptor:sortDescriptors:options:", v6, v5, 0);

  v8 = -[REMFetchRequest initWithFetchExecutor:]([REMFetchRequest alloc], "initWithFetchExecutor:", v7);
  return v8;
}

+ (REMObjectID)siriFoundInAppsListID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("405e3bdb-9308-4ad5-85b5-d3c5943d17c5"));
  +[REMList objectIDWithUUID:](REMList, "objectIDWithUUID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMObjectID *)v3;
}

+ (REMObjectID)localAccountDefaultListID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("3C8C2A71-84BF-4C87-8EFD-BB4827650D15"));
  +[REMList objectIDWithUUID:](REMList, "objectIDWithUUID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMObjectID *)v3;
}

- (REMListSublistContext)sublistContext
{
  REMListSublistContext *v3;

  if (-[REMList isGroup](self, "isGroup"))
    v3 = -[REMListSublistContext initWithList:]([REMListSublistContext alloc], "initWithList:", self);
  else
    v3 = 0;
  return v3;
}

- (REMListCalDAVNotificationContext)calDAVNotificationContext
{
  void *v3;
  void *v4;
  int v5;
  REMListCalDAVNotificationContext *v6;

  -[REMList account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsCalDAVNotifications");

  if (v5)
    v6 = -[REMListCalDAVNotificationContext initWithList:]([REMListCalDAVNotificationContext alloc], "initWithList:", self);
  else
    v6 = 0;
  return v6;
}

- (REMListSectionContext)sectionContext
{
  void *v3;
  void *v4;
  int v5;
  REMListSectionContext *v6;

  -[REMList account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsSections");

  if (v5)
    v6 = -[REMListSectionContext initWithList:]([REMListSectionContext alloc], "initWithList:", self);
  else
    v6 = 0;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  REMList *v4;
  REMList *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;

  v4 = (REMList *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[REMList store](v5, "store");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMList store](self, "store");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8)
      {
        -[REMList account](v5, "account");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMList account](self, "account");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v9 == (void *)v10)
        {

        }
        else
        {
          v11 = (void *)v10;
          -[REMList account](v5, "account");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMList account](self, "account");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if (!v14)
            goto LABEL_12;
        }
        -[REMList parentList](v5, "parentList");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMList parentList](self, "parentList");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v16 == (void *)v17)
        {

        }
        else
        {
          v18 = (void *)v17;
          -[REMList parentList](v5, "parentList");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMList parentList](self, "parentList");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqual:", v20);

          if (!v21)
            goto LABEL_12;
        }
        -[REMList storage](v5, "storage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMList storage](self, "storage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v22, "isEqual:", v23);

        goto LABEL_15;
      }
LABEL_12:
      v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v15 = 0;
  }
LABEL_16:

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMList storage](self, "storage");
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMList storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMList storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSOrderedSet)reminderIDsOrdering
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;

  -[REMList storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reminderIDsMergeableOrdering");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[REMLogStore read](REMLogStore, "read");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMList reminderIDsOrdering].cold.1(self);

  }
  -[REMList storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reminderIDsMergeableOrdering");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v6;
}

- (id)ekColor
{
  void *v2;
  void *v3;

  -[REMList storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ekColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canBeIncludedInGroup
{
  return !-[REMList isSharedToMe](self, "isSharedToMe");
}

- (BOOL)isOwnedByMe
{
  return +[REMList isOwnedByMeWithSharingStatus:](REMList, "isOwnedByMeWithSharingStatus:", -[REMList sharingStatus](self, "sharingStatus"));
}

+ (BOOL)isOwnedByMeWithSharingStatus:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (BOOL)isSharedToMe
{
  return -[REMList sharingStatus](self, "sharingStatus") == 2;
}

- (BOOL)isOriginOfExistingTemplate
{
  void *v2;
  BOOL v3;

  -[REMList mostRecentTargetTemplateIdentifier](self, "mostRecentTargetTemplateIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMList storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMList;
  if (-[REMList respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMList storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[REMList storage](self, "storage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (id)fetchRemindersWithError:(id *)a3
{
  REMRemindersDataView *v5;
  void *v6;
  REMRemindersDataView *v7;
  void *v8;
  void *v9;

  v5 = [REMRemindersDataView alloc];
  -[REMList store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REMRemindersDataView initWithStore:](v5, "initWithStore:", v6);

  -[REMList objectID](self, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchRemindersWithListID:includingSubtasks:error:](v7, "fetchRemindersWithListID:includingSubtasks:error:", v8, 0, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fetchRemindersAndSubtasksWithError:(id *)a3
{
  REMRemindersDataView *v5;
  void *v6;
  REMRemindersDataView *v7;
  void *v8;
  void *v9;

  v5 = [REMRemindersDataView alloc];
  -[REMList store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REMRemindersDataView initWithStore:](v5, "initWithStore:", v6);

  -[REMList objectID](self, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchRemindersWithListID:includingSubtasks:error:](v7, "fetchRemindersWithListID:includingSubtasks:error:", v8, 1, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fetchRemindersCountWithError:(id *)a3
{
  REMRemindersDataView *v5;
  void *v6;
  REMRemindersDataView *v7;
  void *v8;
  void *v9;

  v5 = [REMRemindersDataView alloc];
  -[REMList store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REMRemindersDataView initWithStore:](v5, "initWithStore:", v6);

  -[REMList objectID](self, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchRemindersCountWithListID:error:](v7, "fetchRemindersCountWithListID:error:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)formattedSharedOwnerName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[REMList sharedOwnerName](self, "sharedOwnerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[REMList shareeContext](self, "shareeContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharedOwner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "formattedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      _REMGetLocalizedString(50);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v10;

  }
  return v5;
}

- (id)fetchReminderWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  REMRemindersDataView *v7;
  void *v8;
  REMRemindersDataView *v9;
  void *v10;

  v6 = a3;
  v7 = [REMRemindersDataView alloc];
  -[REMList store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[REMRemindersDataView initWithStore:](v7, "initWithStore:", v8);

  -[REMRemindersDataView fetchReminderWithExternalIdentifier:inList:error:](v9, "fetchReminderWithExternalIdentifier:inList:error:", v6, self, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fetchRemindersWithExternalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  REMRemindersDataView *v7;
  void *v8;
  REMRemindersDataView *v9;
  void *v10;

  v6 = a3;
  v7 = [REMRemindersDataView alloc];
  -[REMList store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[REMRemindersDataView initWithStore:](v7, "initWithStore:", v8);

  -[REMRemindersDataView fetchRemindersWithExternalIdentifiers:inList:error:](v9, "fetchRemindersWithExternalIdentifiers:inList:error:", v6, self, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)newObjectID
{
  return +[REMListStorage newObjectID](REMListStorage, "newObjectID");
}

+ (NSString)cdEntityName
{
  return +[REMListStorage cdEntityName](REMListStorage, "cdEntityName");
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMList storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (NSString)externalIdentifierForMarkedForDeletionObject
{
  void *v2;
  void *v3;

  -[REMList externalIdentifier](self, "externalIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMExternalSyncMetadataUtils decodeExternalIdentifierForMarkedForDeletionObject:](REMExternalSyncMetadataUtils, "decodeExternalIdentifierForMarkedForDeletionObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)shouldUseExternalIdentifierAsDeletionKey
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v7;

  -[REMList account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[REMLogStore read](REMLogStore, "read");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[REMList shouldUseExternalIdentifierAsDeletionKey].cold.1(self);

  }
  -[REMList account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[REMExternalSyncMetadataUtils shouldUseExternalIdentifierAsDeletionKeyWithAccountType:](REMExternalSyncMetadataUtils, "shouldUseExternalIdentifierAsDeletionKeyWithAccountType:", objc_msgSend(v4, "type"));

  return v5;
}

- (void)hack_overrideReminderIDsOrderingWithOrderedObjectIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "hack_overrideReminderIDsOrderingWithOrderedObjectIDs: reminderIDsMergeableOrdering set {ids.count: %@}", (uint8_t *)&v8, 0xCu);

  }
  -[REMList storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReminderIDsMergeableOrdering:", v4);

}

- (void)setStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

void __83__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMList {objectIDs: %{public}@, error: %@}.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __101__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "rem_log_fault_if (![list respondsToSelector:@selector(shouldUseExternalIdentifierAsDeletionKey)]) -- REMList should conform to REMExternalSyncMetadataProviding {list: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)reminderIDsOrdering
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "rem_log_fault_if (self.storage.reminderIDsMergeableOrdering == nil) -- list.store.reminderIDsMergeableOrdering should not be nil {objectID: %{public}@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)shouldUseExternalIdentifierAsDeletionKey
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "rem_log_fault_if (self.account == nil) -- REMList.account is nil for -shouldUseExternalIdentifierAsDeletionKey {listID: %{public}@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
