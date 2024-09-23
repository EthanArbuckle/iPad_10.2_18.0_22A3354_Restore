@implementation REMReminder

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
  return &__block_literal_global_261;
}

id __86__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, _QWORD *a5)
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
    objc_msgSend(v9, "fetchReminderIncludingConcealedWithObjectID:error:", v8, &v21);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
    v11 = (id *)&v20;
    objc_msgSend(v9, "fetchReminderWithObjectID:error:", v8, &v20);
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
      _os_log_error_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMReminder {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);

    }
  }
  if (a5)
    *a5 = objc_retainAutorelease(v15);

  return v13;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  return &__block_literal_global_262;
}

id __87__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v6 = a2;
  v11 = 0;
  objc_msgSend(a3, "fetchRemindersWithObjectIDs:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v8)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __87__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1();

  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

+ (id)rem_DA_deletedKeyFromTombstoneBlock
{
  return &__block_literal_global_263;
}

id __94__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "externalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v2, "objectIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  return &__block_literal_global_264;
}

id __105__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke(uint64_t a1, void *a2)
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

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __105__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1(v4);

  }
  if (objc_msgSend(v4, "shouldUseExternalIdentifierAsDeletionKey"))
    objc_msgSend(v4, "externalIdentifierForMarkedForDeletionObject");
  else
    objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchRequestWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4
{
  id v5;
  id v6;
  REMReminderFetchExecutor *v7;
  REMFetchRequest *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[REMReminderFetchExecutor initWithPredicateDescriptor:sortDescriptors:options:]([REMReminderFetchExecutor alloc], "initWithPredicateDescriptor:sortDescriptors:options:", v6, v5, 0);

  v8 = -[REMFetchRequest initWithFetchExecutor:]([REMFetchRequest alloc], "initWithFetchExecutor:", v7);
  return v8;
}

+ (id)fetchRequestForRemindersListID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  +[REMReminderSortDescriptor sortDescriptorSortingByCreationDateAscending:](REMReminderSortDescriptor, "sortDescriptorSortingByCreationDateAscending:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fetchRequestForRemindersListID:withSortDescriptors:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fetchRequestForRemindersListID:(id)a3 withSortDescriptors:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  REMReminderFetchExecutor *v9;
  REMFetchRequest *v10;

  v5 = a4;
  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v5;
  +[REMReminderPredicateDescriptor predicateDescriptorForRemindersWithListID:](REMReminderPredicateDescriptor, "predicateDescriptorForRemindersWithListID:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[REMReminderFetchExecutor initWithPredicateDescriptor:sortDescriptors:options:]([REMReminderFetchExecutor alloc], "initWithPredicateDescriptor:sortDescriptors:options:", v8, v6, 3);
  v10 = -[REMFetchRequest initWithFetchExecutor:]([REMFetchRequest alloc], "initWithFetchExecutor:", v9);

  return v10;
}

+ (id)fetchRequestForScheduledRemindersWithDueDateOnOrAfter:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  REMReminderFetchExecutor *v10;
  REMFetchRequest *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  +[REMReminderPredicateDescriptor predicateDescriptorForRemindersWithDueDateOnOrAfter:](REMReminderPredicateDescriptor, "predicateDescriptorForRemindersWithDueDateOnOrAfter:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  +[REMReminderPredicateDescriptor predicateDescriptorForRemindersWithCompleted:](REMReminderPredicateDescriptor, "predicateDescriptorForRemindersWithCompleted:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMReminderPredicateDescriptor andPredicateDescriptorWithDescriptors:](REMReminderPredicateDescriptor, "andPredicateDescriptorWithDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99D20];
  +[REMReminderSortDescriptor sortDescriptorSortingByDueDateAscending:](REMReminderSortDescriptor, "sortDescriptorSortingByDueDateAscending:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[REMReminderFetchExecutor initWithPredicateDescriptor:sortDescriptors:options:]([REMReminderFetchExecutor alloc], "initWithPredicateDescriptor:sortDescriptors:options:", v6, v9, 4);
  v11 = -[REMFetchRequest initWithFetchExecutor:]([REMFetchRequest alloc], "initWithFetchExecutor:", v10);

  return v11;
}

- (REMReminder)initWithStore:(id)a3 list:(id)a4 storage:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMReminder *v12;
  REMReminder *v13;
  uint64_t v14;
  REMAccount *account;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)REMReminder;
  v12 = -[REMReminder init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_msgSend(v10, "account");
    v14 = objc_claimAutoreleasedReturnValue();
    account = v13->_account;
    v13->_account = (REMAccount *)v14;

    objc_storeStrong((id *)&v13->_list, a4);
    objc_storeStrong((id *)&v13->_storage, a5);
    -[REMReminderStorage setStoreGenerationIfNeeded:](v13->_storage, "setStoreGenerationIfNeeded:", objc_msgSend(v9, "storeGeneration"));
  }

  return v13;
}

- (REMReminder)initWithStore:(id)a3 storage:(id)a4
{
  return -[REMReminder initWithStore:account:storage:](self, "initWithStore:account:storage:", a3, 0, a4);
}

- (REMReminder)initWithStore:(id)a3 account:(id)a4 storage:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMReminder *v12;
  REMReminder *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMReminder;
  v12 = -[REMReminder init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    if (v10)
      objc_storeStrong((id *)&v13->_account, a4);
    objc_storeStrong((id *)&v13->_storage, a5);
    -[REMReminderStorage setStoreGenerationIfNeeded:](v13->_storage, "setStoreGenerationIfNeeded:", objc_msgSend(v9, "storeGeneration"));
  }

  return v13;
}

- (id)optionalObjectID
{
  void *v2;
  void *v3;

  -[REMReminder storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionalObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isSubtask
{
  void *v2;
  BOOL v3;

  -[REMReminder parentReminder](self, "parentReminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (REMReminderSubtaskContext)subtaskContext
{
  void *v3;
  void *v4;
  BOOL v5;
  REMReminderSubtaskContext *v6;

  -[REMReminder account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "supportsSubtasks"))
  {

    goto LABEL_5;
  }
  v5 = -[REMReminder isSubtask](self, "isSubtask");

  if (v5)
  {
LABEL_5:
    v6 = 0;
    return v6;
  }
  v6 = -[REMReminderSubtaskContext initWithReminder:]([REMReminderSubtaskContext alloc], "initWithReminder:", self);
  return v6;
}

- (REMReminderAttachmentContext)attachmentContext
{
  void *v3;
  void *v4;
  int v5;
  REMReminderAttachmentContext *v6;

  -[REMReminder account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsAttachments");

  if (v5)
    v6 = -[REMReminderAttachmentContext initWithReminder:]([REMReminderAttachmentContext alloc], "initWithReminder:", self);
  else
    v6 = 0;
  return v6;
}

- (REMReminderFlaggedContext)flaggedContext
{
  void *v3;
  void *v4;
  int v5;
  REMReminderFlaggedContext *v6;

  -[REMReminder account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsFlagged");

  if (v5)
    v6 = -[REMReminderFlaggedContext initWithReminder:]([REMReminderFlaggedContext alloc], "initWithReminder:", self);
  else
    v6 = 0;
  return v6;
}

- (REMReminderAssignmentContext)assignmentContext
{
  void *v3;
  void *v4;
  int v5;
  REMReminderAssignmentContext *v6;

  -[REMReminder account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsAssignments");

  if (v5)
    v6 = -[REMReminderAssignmentContext initWithReminder:]([REMReminderAssignmentContext alloc], "initWithReminder:", self);
  else
    v6 = 0;
  return v6;
}

- (REMReminderHashtagContext)hashtagContext
{
  void *v3;
  void *v4;
  int v5;
  REMReminderHashtagContext *v6;

  -[REMReminder account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsHashtags");

  if (v5)
    v6 = -[REMReminderHashtagContext initWithReminder:]([REMReminderHashtagContext alloc], "initWithReminder:", self);
  else
    v6 = 0;
  return v6;
}

- (REMReminderDueDateDeltaAlertContext)dueDateDeltaAlertContext
{
  void *v3;
  void *v4;
  int v5;
  REMReminderDueDateDeltaAlertContext *v6;

  -[REMReminder account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsDueDateDeltaAlerts");

  if (v5)
    v6 = -[REMReminderDueDateDeltaAlertContext initWithReminder:]([REMReminderDueDateDeltaAlertContext alloc], "initWithReminder:", self);
  else
    v6 = 0;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  REMReminder *v4;
  REMReminder *v5;
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
  void *v17;

  v4 = (REMReminder *)a3;
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
      -[REMReminder store](v5, "store");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminder store](self, "store");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8)
      {
        -[REMReminder list](v5, "list");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminder list](self, "list");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v9 == (void *)v10)
        {

        }
        else
        {
          v11 = (void *)v10;
          -[REMReminder list](v5, "list");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminder list](self, "list");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if (!v14)
            goto LABEL_6;
        }
        -[REMReminder storage](v5, "storage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminder storage](self, "storage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v16, "isEqual:", v17);

        goto LABEL_11;
      }
LABEL_6:
      v15 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v15 = 0;
  }
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMReminder storage](self, "storage");
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
  -[REMReminder storage](self, "storage");
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
  -[REMReminder storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)datesDebugDescriptionInTimeZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMReminder storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "datesDebugDescriptionInTimeZone:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSAttributedString)title
{
  void *v2;
  void *v3;
  void *v4;

  -[REMReminder storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v4;
}

- (NSString)titleAsString
{
  void *v2;
  void *v3;

  -[REMReminder storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSAttributedString)notes
{
  void *v2;
  void *v3;
  void *v4;

  -[REMReminder storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notesDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v4;
}

- (NSString)notesAsString
{
  void *v2;
  void *v3;

  -[REMReminder storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notesAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)timeZone
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  -[REMReminder dueDateComponents](self, "dueDateComponents");
  v3 = objc_claimAutoreleasedReturnValue();
  -[NSObject timeZone](v3, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[REMReminder storage](self, "storage");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject timeZone](v3, "timeZone");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_10:

      return (NSString *)v5;
    }
    v4 = (void *)v6;
  }
  -[REMReminder storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if (v5)
  {
    if ((v9 & 1) != 0)
      return (NSString *)v5;
    goto LABEL_8;
  }

  if ((v9 & 1) == 0)
  {
LABEL_8:
    +[REMLogStore read](REMLogStore, "read");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[REMReminder timeZone].cold.1(self, v3);
    goto LABEL_10;
  }
  return (NSString *)v5;
}

- (BOOL)allDay
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;

  -[REMReminder dueDateComponents](self, "dueDateComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rem_isAllDayDateComponents");

  -[REMReminder storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allDay");

  if (v4 != v6)
  {
    +[REMLogStore read](REMLogStore, "read");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[REMReminder allDay].cold.1(self);

  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMReminder storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[REMReminder storage](self, "storage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMReminder;
  if (-[REMReminder respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMReminder storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

+ (id)newObjectID
{
  return +[REMReminderStorage newObjectID](REMReminderStorage, "newObjectID");
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMReminderStorage objectIDWithUUID:](REMReminderStorage, "objectIDWithUUID:", a3);
}

+ (NSString)cdEntityName
{
  return +[REMReminderStorage cdEntityName](REMReminderStorage, "cdEntityName");
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMReminder storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (NSString)externalIdentifierForMarkedForDeletionObject
{
  void *v2;
  void *v3;

  -[REMReminder externalIdentifier](self, "externalIdentifier");
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

  -[REMReminder account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[REMLogStore read](REMLogStore, "read");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[REMReminder shouldUseExternalIdentifierAsDeletionKey].cold.1(self);

  }
  -[REMReminder account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[REMExternalSyncMetadataUtils shouldUseExternalIdentifierAsDeletionKeyWithAccountType:](REMExternalSyncMetadataUtils, "shouldUseExternalIdentifierAsDeletionKeyWithAccountType:", objc_msgSend(v4, "type"));

  return v5;
}

- (REMStore)store
{
  return self->_store;
}

- (REMAccount)account
{
  return self->_account;
}

- (REMList)list
{
  return self->_list;
}

- (REMReminderStorage)storage
{
  return self->_storage;
}

- (REMReminder)parentReminder
{
  return self->_parentReminder;
}

- (void)setParentReminder:(id)a3
{
  objc_storeStrong((id *)&self->_parentReminder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentReminder, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_list, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __87__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMReminder {objectIDs: %{public}@, error: %@}.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __105__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "rem_log_fault_if (![reminder respondsToSelector:@selector(shouldUseExternalIdentifierAsDeletionKey)]) -- REMReminder should conform to REMExternalSyncMetadataProviding {reminder: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)timeZone
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dueDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Found internal inconsistency between reminder.storage.timeZone vs reminder.storage.dueDateComponents.timeZone {dueDateComponents.timeZone: %@, storage.timeZone: %@}.", (uint8_t *)&v8, 0x16u);

}

- (void)allDay
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "dueDateComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "Found internal inconsistency between reminder.storage.allDay vs reminder.storage.dueDateComponents {dueDateComponents: %@}.", v4, v5, v6, v7, 2u);

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
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "rem_log_fault_if (self.account == nil) -- REMReminder.account is nil for -shouldUseExternalIdentifierAsDeletionKey {reminderID: %{public}@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
