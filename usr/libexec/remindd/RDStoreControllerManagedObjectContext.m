@implementation RDStoreControllerManagedObjectContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier, 0);
  objc_storeStrong(&self->__unitTest_purgeDeletedFileAttachmentsDidComplete, 0);
  objc_storeStrong((id *)&self->__unittest_awakeCounts, 0);
  objc_storeStrong((id *)&self->_fileAttachmentIdentifiersToPurgeByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion, 0);
  objc_storeStrong((id *)&self->_recordIDsToSortChildrenAfterFetching, 0);
  objc_storeStrong((id *)&self->_cloudSchemaCatchUpSyncContextsByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_batchFetchHelper, 0);
  objc_storeStrong((id *)&self->___unsafe_doesNotWorkUniversally_affectedStores, 0);
  objc_storeStrong((id *)&self->_validationPolicy, 0);
  objc_destroyWeak((id *)&self->_storeController);
}

- (void)set__unsafe_doesNotWorkUniversally_affectedStores:(id)a3
{
  objc_storeStrong((id *)&self->___unsafe_doesNotWorkUniversally_affectedStores, a3);
}

- (void)setStoreController:(id)a3
{
  objc_storeWeak((id *)&self->_storeController, a3);
}

- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id *v39;
  objc_super v40;
  id v41;
  uint8_t buf[4];
  double v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "affectedStores"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext __unsafe_doesNotWorkUniversally_affectedStores](self, "__unsafe_doesNotWorkUniversally_affectedStores"));

    if (!v8)
      goto LABEL_5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext __unsafe_doesNotWorkUniversally_affectedStores](self, "__unsafe_doesNotWorkUniversally_affectedStores"));
    objc_msgSend(v6, "setAffectedStores:", v7);
  }

LABEL_5:
  v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore read](REMLogStore, "read"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10068336C(self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v40.receiver = self;
  v40.super_class = (Class)RDStoreControllerManagedObjectContext;
  v41 = 0;
  v11 = -[RDStoreControllerManagedObjectContext countForFetchRequest:error:](&v40, "countForFetchRequest:error:", v6, &v41);
  v12 = v41;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v13, "timeIntervalSinceDate:", v10);
  v15 = v14;

  v16 = objc_claimAutoreleasedReturnValue(+[REMLogStore read](REMLogStore, "read"));
  v17 = v16;
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
      *(_DWORD *)buf = 138543874;
      v43 = v18;
      v44 = 2114;
      v45 = v19;
      v46 = 2114;
      v47 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "FETCH COUNT COREDATA ERROR {author: %{public}@, entityName: %{public}@, error: %{public}@}", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
    v38 = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
    v39 = a4;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "affectedStores"));
    v22 = objc_msgSend(v37, "count");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "persistentStores"));
    v25 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 134219266;
    v43 = v15 * 1000.0;
    v44 = 2114;
    v45 = v20;
    v46 = 2114;
    v47 = v21;
    v48 = 2048;
    v49 = v11;
    v50 = 2048;
    v51 = v22;
    v52 = 2048;
    v53 = v25;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FETCH COUNT COREDATA {elapsedTime: %.9lf ms, author: %{public}@, entityName: %{public}@, count: %ld, affectedStores.count: %ld, persistentStoreCoordinator.persistentStores.count: %ld}", buf, 0x3Eu);

    a4 = v39;
    v12 = v38;

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
    +[RDAsyncAnalytics recordFetchWith:](_TtC7remindd16RDAsyncAnalytics, "recordFetchWith:", v27);

    if (a4)
LABEL_14:
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    v29 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      sub_1006832BC(v29, v30, v31, v32, v33, v34, v35, v36);

    +[RDAsyncAnalytics recordFetchWith:](_TtC7remindd16RDAsyncAnalytics, "recordFetchWith:", CFSTR("nil author"));
    if (a4)
      goto LABEL_14;
  }

  return (unint64_t)v11;
}

- (NSArray)__unsafe_doesNotWorkUniversally_affectedStores
{
  return self->___unsafe_doesNotWorkUniversally_affectedStores;
}

- (id)objectTreeProcessorDelegateFactoryWithTreeNode:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  __objc2_class *v7;
  id v8;
  NSObject *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(REMCDObjectEffectiveVersionValidationNode, v5)))
  {
    v7 = REMCDObjectEffectiveVersionValidationDelegateImpl;
LABEL_5:
    v8 = objc_msgSend([v7 alloc], "initWithManagedObjectContext:", self);
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(_REMCDObjectEffectiveVersionManualValidationNode, v6)))
  {
    v7 = _REMCDObjectEffectiveVersionManualValidationDelegateImpl;
    goto LABEL_5;
  }
  v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    sub_100681E98((uint64_t)v4, v9);

  v8 = 0;
LABEL_9:

  return v8;
}

- (BOOL)save:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  unsigned int v11;
  BOOL v12;
  id v13;
  NSString *(__cdecl **v14)(SEL);
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  objc_super v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext insertedObjects](self, "insertedObjects"));
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext updatedObjects](self, "updatedObjects"));
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext deletedObjects](self, "deletedObjects"));
  v10 = objc_msgSend(v9, "count");

  v11 = -[RDStoreControllerManagedObjectContext hasPendingListNameRelatedChanges](self, "hasPendingListNameRelatedChanges");
  v32.receiver = self;
  v32.super_class = (Class)RDStoreControllerManagedObjectContext;
  v33 = 0;
  v12 = -[RDStoreControllerManagedObjectContext save:](&v32, "save:", &v33);
  v13 = v33;
  v14 = &NSStringFromSelector_ptr;
  v15 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
      *(_DWORD *)buf = 138544130;
      v35 = v17;
      v36 = 2048;
      v37 = v6;
      v38 = 2048;
      v39 = v8;
      v40 = 2048;
      v41 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SAVE COREDATA {author: %{public}@, insert.count: %ld, update.count: %ld, delete.count: %ld}", buf, 0x2Au);

      v14 = &NSStringFromSelector_ptr;
    }

    if (v11)
      notify_post("com.apple.reminder.list.name.siri_data_changed");
    -[RDStoreControllerManagedObjectContext validateDirtyEffectiveMinimumSupportedVersions](self, "validateDirtyEffectiveMinimumSupportedVersions");
    -[RDStoreControllerManagedObjectContext confirmOrRejectFilePurgeCandidatesThatMightBeDeduplicatedAcrossMultipleAttachments](self, "confirmOrRejectFilePurgeCandidatesThatMightBeDeduplicatedAcrossMultipleAttachments");
    -[RDStoreControllerManagedObjectContext purgeDeletedFileAttachments](self, "purgeDeletedFileAttachments");
    if ((-[RDStoreControllerManagedObjectContext pendingPostSaveActions](self, "pendingPostSaveActions") & 1) != 0)
      -[RDStoreControllerManagedObjectContext notifyDidMarkExtraneousAlarmsPendingToSyncUpDelete](self, "notifyDidMarkExtraneousAlarmsPendingToSyncUpDelete");
    if ((-[RDStoreControllerManagedObjectContext pendingPostSaveActions](self, "pendingPostSaveActions") & 2) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("com.apple.remindd.SharedToMeList.pinnedStateDidBecomeStale"), 0, 0);

    }
    if ((-[RDStoreControllerManagedObjectContext pendingPostSaveActions](self, "pendingPostSaveActions") & 4) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("com.apple.remindd.SharedToMeList.mostRecentTargetTemplateIdentifierByCurrentUserDidBecomeStale"), 0, 0);

    }
    -[RDStoreControllerManagedObjectContext setPendingPostSaveActions:](self, "setPendingPostSaveActions:", 0);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
      *(_DWORD *)buf = 138544386;
      v35 = v31;
      v36 = 2048;
      v37 = v6;
      v38 = 2048;
      v39 = v8;
      v40 = 2048;
      v41 = v10;
      v42 = 2114;
      v43 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "SAVE COREDATA ERROR {author: %{public}@, insert.count: %ld, update.count: %ld, delete.count: %ld, error: %{public}@}", buf, 0x34u);

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
    +[RDAsyncAnalytics recordSaveWith:](_TtC7remindd16RDAsyncAnalytics, "recordSaveWith:", v21);

    if (a3)
LABEL_18:
      *a3 = objc_retainAutorelease(v13);
  }
  else
  {
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14[282], "write"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      sub_10068320C(v23, v24, v25, v26, v27, v28, v29, v30);

    +[RDAsyncAnalytics recordSaveWith:](_TtC7remindd16RDAsyncAnalytics, "recordSaveWith:", CFSTR("nil author"));
    if (a3)
      goto LABEL_18;
  }

  return v12;
}

- (BOOL)hasPendingListNameRelatedChanges
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext updatedObjects](self, "updatedObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class(REMCDList)))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "changedValues"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name")));
          if (v10)
          {

            goto LABEL_29;
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "changedValues"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("markedForDeletion")));

          if (v12)
            goto LABEL_29;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v5)
        continue;
      break;
    }
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext insertedObjects](self, "insertedObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));

  v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
LABEL_13:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v16)
        objc_enumerationMutation(v3);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v17), "isMemberOfClass:", objc_opt_class(REMCDList)) & 1) != 0)goto LABEL_29;
      if (v15 == (id)++v17)
      {
        v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v15)
          goto LABEL_13;
        break;
      }
    }
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext deletedObjects](self, "deletedObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));

  v19 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v25;
LABEL_21:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v20)
        objc_enumerationMutation(v3);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "isMemberOfClass:", objc_opt_class(REMCDList)) & 1) != 0)break;
      if (v19 == (id)++v21)
      {
        v19 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        if (v19)
          goto LABEL_21;
        goto LABEL_30;
      }
    }
LABEL_29:
    LOBYTE(v19) = 1;
  }
LABEL_30:

  return (char)v19;
}

- (id)executeRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v15;
  objc_super v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "affectedStores"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext __unsafe_doesNotWorkUniversally_affectedStores](self, "__unsafe_doesNotWorkUniversally_affectedStores"));

    if (!v8)
      goto LABEL_5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext __unsafe_doesNotWorkUniversally_affectedStores](self, "__unsafe_doesNotWorkUniversally_affectedStores"));
    objc_msgSend(v6, "setAffectedStores:", v7);
  }

LABEL_5:
  v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore read](REMLogStore, "read"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10068323C(self);

  v16.receiver = self;
  v16.super_class = (Class)RDStoreControllerManagedObjectContext;
  v17 = 0;
  v10 = -[RDStoreControllerManagedObjectContext executeRequest:error:](&v16, "executeRequest:error:", v6, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v17;
  if (!v11)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[REMLogStore read](REMLogStore, "read"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
      *(_DWORD *)buf = 138543874;
      v19 = v15;
      v20 = 2114;
      v21 = v6;
      v22 = 2114;
      v23 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "COREDATA REQUEST ERROR {author: %{public}@, request: %{public}@, error: %{public}@}", buf, 0x20u);

    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSString *(__cdecl **v9)(SEL);
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  void *v23;
  id *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  objc_super v60;
  id v61;
  uint8_t buf[4];
  double v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "affectedStores"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext __unsafe_doesNotWorkUniversally_affectedStores](self, "__unsafe_doesNotWorkUniversally_affectedStores"));

    if (!v8)
      goto LABEL_5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext __unsafe_doesNotWorkUniversally_affectedStores](self, "__unsafe_doesNotWorkUniversally_affectedStores"));
    objc_msgSend(v6, "setAffectedStores:", v7);
  }

LABEL_5:
  v9 = &NSStringFromSelector_ptr;
  v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore read](REMLogStore, "read"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1006832EC(self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v60.receiver = self;
  v60.super_class = (Class)RDStoreControllerManagedObjectContext;
  v61 = 0;
  v12 = -[RDStoreControllerManagedObjectContext executeFetchRequest:error:](&v60, "executeFetchRequest:error:", v6, &v61);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v61;
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v15, "timeIntervalSinceDate:", v11);
    v17 = v16 * 1000.0;

    v18 = objc_msgSend(v6, "fetchBatchSize");
    v19 = objc_claimAutoreleasedReturnValue(+[REMLogStore read](REMLogStore, "read"));
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (!v20)
        goto LABEL_16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
      v48 = objc_msgSend(v13, "count");
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "affectedStores"));
      v47 = objc_msgSend(v55, "count");
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "persistentStores"));
      v22 = objc_msgSend(v51, "count");
      v23 = v11;
      v24 = a4;
      v25 = objc_msgSend(v6, "fetchBatchSize");
      v58 = v14;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "propertiesToFetch"));
      v27 = objc_msgSend(v26, "count");
      *(_DWORD *)buf = 134219778;
      v63 = v17;
      v64 = 2114;
      v65 = v21;
      v66 = 2114;
      v67 = v49;
      v68 = 2048;
      v69 = v48;
      v70 = 2048;
      v71 = v47;
      v72 = 2048;
      v73 = v22;
      v9 = &NSStringFromSelector_ptr;
      v74 = 2048;
      v75 = v25;
      a4 = v24;
      v11 = v23;
      v76 = 2048;
      v77 = v27;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "BATCH FETCH COREDATA {elapsedTime: %.4lf ms, author: %{public}@, entityName: %{public}@, result.count: %ld, affectedStores.count: %ld, persistentStoreCoordinator.persistentStores.count: %ld, propsToFetch.count: %ld, fetchBatchSize: %ld}", buf, 0x52u);

      v14 = v58;
      goto LABEL_11;
    }
    if (v20)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
      v52 = objc_msgSend(v13, "count");
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "affectedStores"));
      v50 = objc_msgSend(v57, "count");
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "persistentStores"));
      v59 = v14;
      v31 = v11;
      v32 = a4;
      v33 = objc_msgSend(v54, "count");
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "propertiesToFetch"));
      v35 = objc_msgSend(v34, "count");
      *(_DWORD *)buf = 134219522;
      v63 = v17;
      v64 = 2114;
      v65 = v29;
      v66 = 2114;
      v67 = v30;
      v68 = 2048;
      v69 = v52;
      v70 = 2048;
      v71 = v50;
      v72 = 2048;
      v73 = v33;
      a4 = v32;
      v11 = v31;
      v14 = v59;
      v74 = 2048;
      v75 = v35;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "FETCH COREDATA {elapsedTime: %.4lf ms, author: %{public}@, entityName: %{public}@, result.count: %ld, affectedStores.count: %ld, persistentStoreCoordinator.persistentStores.count: %ld, propsToFetch.count: %ld}", buf, 0x48u);

      v9 = &NSStringFromSelector_ptr;
    }
  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(+[REMLogStore read](REMLogStore, "read"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
      *(_DWORD *)buf = 138543874;
      v63 = *(double *)&v21;
      v64 = 2114;
      v65 = v28;
      v66 = 2114;
      v67 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "FETCH COREDATA ERROR {author: %{public}@, entityName: %{public}@, error: %{public}@}", buf, 0x20u);

LABEL_11:
    }
  }
LABEL_16:

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
    +[RDAsyncAnalytics recordFetchWith:](_TtC7remindd16RDAsyncAnalytics, "recordFetchWith:", v37);

    if (a4)
LABEL_18:
      *a4 = objc_retainAutorelease(v14);
  }
  else
  {
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9[282], "write"));
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      sub_1006832BC(v39, v40, v41, v42, v43, v44, v45, v46);

    +[RDAsyncAnalytics recordFetchWith:](_TtC7remindd16RDAsyncAnalytics, "recordFetchWith:", CFSTR("nil author"));
    if (a4)
      goto LABEL_18;
  }

  return v13;
}

- (BOOL)__unsafe_doesNotWorkUniversally_setAffectedStoresWithAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext storeController](self, "storeController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeForAccountIdentifier:", v4));

    v7 = v6 != 0;
    if (v6)
    {
      v10 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
      -[RDStoreControllerManagedObjectContext set__unsafe_doesNotWorkUniversally_affectedStores:](self, "set__unsafe_doesNotWorkUniversally_affectedStores:", v8);

    }
    else
    {
      -[RDStoreControllerManagedObjectContext set__unsafe_doesNotWorkUniversally_affectedStores:](self, "set__unsafe_doesNotWorkUniversally_affectedStores:", 0);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)persistentStoreOfAccountWithAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext storeController](self, "storeController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeForAccountIdentifier:", v7));

  return v8;
}

- (BOOL)containerShouldSortChildrenAfterFetchingWithRecordID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  if (-[RDStoreControllerManagedObjectContext shouldSortChildrenAfterFetching](self, "shouldSortChildrenAfterFetching"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext recordIDsToSortChildrenAfterFetching](self, "recordIDsToSortChildrenAfterFetching"));

    v6 = 0;
    if (v4 && v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext recordIDsToSortChildrenAfterFetching](self, "recordIDsToSortChildrenAfterFetching"));
      objc_msgSend(v7, "addObject:", v4);

      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSMutableSet)managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion
{
  NSMutableSet *managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion;
  NSMutableSet *v4;
  NSMutableSet *v5;

  managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion = self->_managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion;
  if (!managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion)
  {
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v5 = self->_managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion;
    self->_managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion = v4;

    managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion = self->_managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion;
  }
  return managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion;
}

+ (unint64_t)_heightOfEntityNodeInMOMTreeForEffectiveMinimumSupportedVersionPropagation:(id)a3 heightMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v35;
  NSObject *v36;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  NSObject *v45;
  __int16 v46;
  void *v47;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

  if (!v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore utility](REMLogStore, "utility"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_1006833EC(v6, v9);
    goto LABEL_9;
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superentity"));
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDObject subclassNamesOfREMCDObjectRepresentingRootCoreDataEntities](REMCDObject, "subclassNamesOfREMCDObjectRepresentingRootCoreDataEntities"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectClassName"));
    v13 = objc_msgSend(v11, "containsObject:", v12);

    if (v13)
      goto LABEL_7;
LABEL_9:
    v17 = 0;
    goto LABEL_29;
  }

LABEL_7:
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v9));
  v15 = v14;
  if (v14)
  {
    v16 = (uint64_t)objc_msgSend(v14, "unsignedIntegerValue");
    v17 = 0;
  }
  else
  {
    objc_msgSend(v7, "setObject:forKey:", &off_100804800, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDObject relationshipsEligibleForEffectiveMinimumSupportedVersionPropagationWithEntity:](REMCDObject, "relationshipsEligibleForEffectiveMinimumSupportedVersionPropagationWithEntity:", v6));
    v19 = objc_claimAutoreleasedReturnValue(+[REMLogStore utility](REMLogStore, "utility"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKeyPath:", CFSTR("destinationEntity.name")));
      *(_DWORD *)buf = 138543618;
      v45 = v9;
      v46 = 2114;
      v47 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[entity-height-in-MoM-tree] node.entity=%{public}@, node.entity.relationships=%{public}@", buf, 0x16u);

    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = v18;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v22)
    {
      v23 = v22;
      v35 = 0;
      v36 = v9;
      v37 = v6;
      obj = v21;
      v24 = 0;
      v25 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(obj);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), "destinationEntity", v35, v36, v37));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "subentities"));
          v29 = objc_msgSend(v28, "mutableCopy");
          while (1)
          {

            if (!objc_msgSend(v29, "count"))
              break;
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastObject"));
            v30 = objc_msgSend(a1, "_heightOfEntityNodeInMOMTreeForEffectiveMinimumSupportedVersionPropagation:heightMap:", v28, v7);
            if (v24 <= v30)
              v24 = v30;
            objc_msgSend(v29, "removeLastObject");
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "subentities"));
            objc_msgSend(v29, "addObjectsFromArray:", v31);

          }
          v32 = objc_msgSend(a1, "_heightOfEntityNodeInMOMTreeForEffectiveMinimumSupportedVersionPropagation:heightMap:", v27, v7);
          if (v24 <= v32)
            v24 = v32;

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v23);

      v17 = (unint64_t)v24 + 1;
      v16 = (uint64_t)v24 + 1;
      v9 = v36;
      v6 = v37;
      v15 = v35;
    }
    else
    {

      v17 = 1;
      v16 = 1;
    }
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16));
  objc_msgSend(v7, "setObject:forKey:", v33, v9);

LABEL_29:
  return v17;
}

+ (id)topologicallyWeightedEntitiesForEffectiveMinimumSupportedVersionPropagation
{
  NSObject *v2;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000794CC;
  block[3] = &unk_1007D9EE0;
  block[4] = a1;
  if (qword_100852880 != -1)
    dispatch_once(&qword_100852880, block);
  v2 = objc_claimAutoreleasedReturnValue(+[REMLogStore utility](REMLogStore, "utility"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_100683478(v2);

  return (id)qword_100852878;
}

+ (id)managedObjectIDsSortedByTopologicalWeightsForEffectiveMinimumSupportedVersionPropagation:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(a1), "topologicallyWeightedEntitiesForEffectiveMinimumSupportedVersionPropagation");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000795E0;
  v9[3] = &unk_1007DA4B8;
  v10 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingComparator:", v9));

  return v7;
}

- (void)validateDirtyEffectiveMinimumSupportedVersions
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  -[RDStoreControllerManagedObjectContext _validateDirtyEffectiveMinimumSupportedVersionsWithBatchSize:isManualValidation:](self, "_validateDirtyEffectiveMinimumSupportedVersionsWithBatchSize:isManualValidation:", objc_msgSend(v3, "objectEffectiveVersionValidationFlushBatchSize"), 0);

}

- (unint64_t)_validateDirtyEffectiveMinimumSupportedVersionsWithBatchSize:(unint64_t)a3 isManualValidation:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  unint64_t v22;
  _QWORD v24[4];
  id v25;
  RDStoreControllerManagedObjectContext *v26;
  _BYTE *v27;
  unint64_t v28;
  BOOL v29;
  uint8_t v30[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  _BYTE buf[24];
  uint64_t v37;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion](self, "managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v10 = objc_msgSend((id)objc_opt_class(self), "managedObjectIDsSortedByTopologicalWeightsForEffectiveMinimumSupportedVersionPropagation:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "REMSupportedVersionUpdating: VALIDATING dirty MOIDs for effectiveMinimumSupportedVersion {author: %{public}@, dirtyObjectIDs.count: %ld}", buf, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v11, "count")));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v37 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100079A40;
    v24[3] = &unk_1007DA4E0;
    v15 = v14;
    v25 = v15;
    v26 = self;
    v29 = a4;
    v27 = buf;
    v28 = a3;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion](self, "managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion"));
    objc_msgSend(v16, "removeAllObjects");

    v17 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
      v19 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v20, "timeIntervalSinceDate:", v9);
      *(_DWORD *)v30 = 138543874;
      v31 = v18;
      v32 = 2048;
      v33 = v19;
      v34 = 2048;
      v35 = v21 * 1000.0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "REMSupportedVersionUpdating: VALIDATION COMPLETED for effectiveMinimumSupportedVersion {author: %{public}@, subtrees.count: %ld, elapsed: %.4f ms}", v30, 0x20u);

    }
    v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)coreDataSave:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RDStoreControllerManagedObjectContext;
  return -[RDStoreControllerManagedObjectContext save:](&v4, "save:", a3);
}

- (id)latestFetchResultTokenWithError:(id *)a3
{
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  void *v35;
  _BYTE v36[128];

  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v8, v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext storeController](self, "storeController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "validPersistentStores"));

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v35 = v19;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentPersistentHistoryTokenFromStores:", v20));

          if (v21)
          {
            v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, v22);
          }
          else
          {
            v22 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v32 = v26;
              v33 = 2112;
              v34 = v19;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%{public}@] store has no transactions. Not getting tokens {store: %@}", buf, 0x16u);
            }
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v16);
    }

    v23 = objc_msgSend(objc_alloc((Class)REMFetchResultToken), "initWithPersistentHistoryTokens:", v12);
  }
  else
  {
    v24 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1006835DC((uint64_t)v26, (uint64_t)self, v24);

    if (!a3)
    {
      v23 = 0;
      goto LABEL_19;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@] missing persistentStoreCoordinator -- Can't get REMFetchResultToken {managedObjectContext: %@}"), v26, self));
    v23 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", v12));
  }

LABEL_19:
  return v23;
}

- (BOOL)canAccessAllPersistentStoresReferencedByFetchResultToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext storeController](self, "storeController", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "validPersistentStores"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11), "identifier"));
        objc_msgSend(v5, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentHistoryTokens"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));

  v16 = objc_msgSend(v15, "isSubsetOfSet:", v5);
  return v16;
}

- (void)proposePurgingFileAttachmentWithSha512Sum:(id)a3 fileExtension:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v15 = v11;
  if (v9)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathExtension:", v9));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier](self, "candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v10));

  if (v13)
  {
    objc_msgSend(v13, "addObject:", v11);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier](self, "candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v10);

  }
}

- (void)rejectPurgingFileAttachmentWithSha512Sum:(id)a3 fileExtension:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  v9 = a5;
  v13 = v8;
  v10 = v13;
  if (a4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathExtension:", a4));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier](self, "candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));

  objc_msgSend(v12, "removeObject:", v10);
}

- (NSMutableDictionary)fileAttachmentIdentifiersToPurgeByAccountIdentifier
{
  NSMutableDictionary *fileAttachmentIdentifiersToPurgeByAccountIdentifier;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  fileAttachmentIdentifiersToPurgeByAccountIdentifier = self->_fileAttachmentIdentifiersToPurgeByAccountIdentifier;
  if (!fileAttachmentIdentifiersToPurgeByAccountIdentifier)
  {
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v5 = self->_fileAttachmentIdentifiersToPurgeByAccountIdentifier;
    self->_fileAttachmentIdentifiersToPurgeByAccountIdentifier = v4;

    fileAttachmentIdentifiersToPurgeByAccountIdentifier = self->_fileAttachmentIdentifiersToPurgeByAccountIdentifier;
  }
  return fileAttachmentIdentifiersToPurgeByAccountIdentifier;
}

- (NSMutableDictionary)candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier
{
  NSMutableDictionary *candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = self->_candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
  if (!candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier)
  {
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v5 = self->_candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
    self->_candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = v4;

    candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = self->_candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
  }
  return candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
}

- (NSMutableDictionary)confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier
{
  NSMutableDictionary *confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = self->_confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
  if (!confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier)
  {
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v5 = self->_confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
    self->_confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = v4;

    confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier = self->_confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
  }
  return confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier;
}

- (id)existingFileAttachmentsMatchingSHA512Sums:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext storeController](self, "storeController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "storeForAccountIdentifier:", v11));

  if (v12)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDFileAttachment fetchRequest](REMCDFileAttachment, "fetchRequest"));
    v34 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
    objc_msgSend(v13, "setAffectedStores:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("sha512Sum"), v8));
    objc_msgSend(v13, "setPredicate:", v15);
    objc_msgSend(v13, "setPropertiesToFetch:", &off_100804E70);
    objc_msgSend(v13, "setReturnsDistinctResults:", 1);
    v32 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v13, &v32));
    v17 = v32;
    if (v17)
    {
      v18 = objc_retainAutorelease(v17);
      *a5 = v18;

    }
    else
    {
      objc_msgSend(v30, "addObjectsFromArray:", v16);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDObject fetchRequest](REMCDSavedAttachment, "fetchRequest"));
      v33 = v12;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
      objc_msgSend(v22, "setAffectedStores:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("sha512Sum"), v8));
      objc_msgSend(v22, "setPredicate:", v24);
      objc_msgSend(v22, "setPropertiesToFetch:", &off_100804E88);
      objc_msgSend(v22, "setReturnsDistinctResults:", 1);
      v31 = 0;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v22, &v31));
      v26 = v31;
      if (!v26)
      {
        v28 = v30;
        objc_msgSend(v30, "addObjectsFromArray:", v25);

        v21 = v30;
        goto LABEL_8;
      }
      v27 = objc_retainAutorelease(v26);
      *a5 = v27;

    }
    v21 = 0;
    v28 = v30;
LABEL_8:

    goto LABEL_9;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to acquire persistentStore for account identifier %@"), v19));
  *a5 = (id)objc_claimAutoreleasedReturnValue(+[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", v20));

  v21 = 0;
LABEL_9:

  return v21;
}

- (void)confirmOrRejectFilePurgeCandidatesThatMightBeDeduplicatedAcrossMultipleAttachments
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  NSString *(__cdecl **v10)(SEL);
  id i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  char *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id obj;
  void *v45;
  id v46;
  id v47;
  void *v48;
  char *v49;
  RDStoreControllerManagedObjectContext *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];

  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v6, v8));

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v50 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier](self, "candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier"));
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
  if (v46)
  {
    v9 = *(_QWORD *)v61;
    v10 = &NSStringFromSelector_ptr;
    v43 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v46; i = v27 + 1)
      {
        if (*(_QWORD *)v61 != v9)
          objc_enumerationMutation(obj);
        v49 = (char *)i;
        v12 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
        v48 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier](v50, "candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[140], "setWithCapacity:", objc_msgSend(v14, "count")));
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v16 = v14;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v57;
          do
          {
            for (j = 0; j != v18; j = (char *)j + 1)
            {
              if (*(_QWORD *)v57 != v19)
                objc_enumerationMutation(v16);
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)j), "stringByDeletingPathExtension"));
              objc_msgSend(v15, "addObject:", v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
          }
          while (v18);
        }

        v55 = 0;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext existingFileAttachmentsMatchingSHA512Sums:accountID:error:](v50, "existingFileAttachmentsMatchingSHA512Sums:accountID:error:", v15, v12, &v55));
        v47 = v55;
        if (v47)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", ")));

          v25 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v39 = v22;
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
            *(_DWORD *)buf = 138543874;
            v66 = v42;
            v67 = 2114;
            v68 = v40;
            v69 = 2114;
            v70 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch existing attachments in account [%{public}@] with sha512Sums [%{public}@]. Not purging any attachments for this account.", buf, 0x20u);

            v22 = v39;
          }

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier](v50, "confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier"));
          objc_msgSend(v26, "removeObjectForKey:", v12);
          v28 = v48;
          v27 = v49;
        }
        else
        {
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v45 = v22;
          v29 = v22;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v52;
            do
            {
              for (k = 0; k != v31; k = (char *)k + 1)
              {
                if (*(_QWORD *)v52 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)k);
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "sha512Sum"));
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fileName"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "pathExtension"));

                -[RDStoreControllerManagedObjectContext rejectPurgingFileAttachmentWithSha512Sum:fileExtension:account:](v50, "rejectPurgingFileAttachmentWithSha512Sum:fileExtension:account:", v35, v37, v12);
              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
            }
            while (v31);
          }

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier](v50, "candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v12));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier](v50, "confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier"));
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v26, v12);

          v9 = v43;
          v10 = &NSStringFromSelector_ptr;
          v28 = v48;
          v27 = v49;
          v22 = v45;
        }

        objc_autoreleasePoolPop(v28);
      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    }
    while (v46);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier](v50, "candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier"));
  objc_msgSend(v41, "removeAllObjects");

}

- (void)purgeDeletedFileAttachments
{
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD block[4];
  id v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_10007AF98;
  v49 = sub_10007AFA8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext fileAttachmentIdentifiersToPurgeByAccountIdentifier](self, "fileAttachmentIdentifiersToPurgeByAccountIdentifier"));
  v50 = objc_msgSend(v4, "copy");

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_10007AF98;
  v43 = sub_10007AFA8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier](self, "confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier"));
  v44 = objc_msgSend(v5, "copy");

  if (objc_msgSend((id)v46[5], "count") || objc_msgSend((id)v40[5], "count"))
  {
    v36 = 0;
    v37[0] = &v36;
    v37[1] = 0x3032000000;
    v37[2] = sub_10007AF98;
    v37[3] = sub_10007AFA8;
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v38 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v8, v10));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext storeController](self, "storeController"));
    v12 = v11;
    if (v11)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fileIOWorkerQueue"));
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext _unitTest_purgeDeletedFileAttachmentsDidComplete](self, "_unitTest_purgeDeletedFileAttachmentsDidComplete"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10007AFB0;
        block[3] = &unk_1007DA508;
        v33 = &v36;
        v34 = &v45;
        v31 = v12;
        v35 = &v39;
        v15 = v14;
        v32 = v15;
        dispatch_async(v13, block);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext fileAttachmentIdentifiersToPurgeByAccountIdentifier](self, "fileAttachmentIdentifiersToPurgeByAccountIdentifier"));
        objc_msgSend(v16, "removeAllObjects");

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier](self, "confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier"));
        objc_msgSend(v17, "removeAllObjects");

      }
      else
      {
        v15 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_1006836C8((uint64_t)v37, v15, v24, v25, v26, v27, v28, v29);
      }

    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10068365C((uint64_t)v37, v13, v18, v19, v20, v21, v22, v23);
    }

    _Block_object_dispose(&v36, 8);
  }
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

- (void)notifyDidMarkExtraneousAlarmsPendingToSyncUpDelete
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RDStoreControllerManagedObjectContext transactionAuthor](self, "transactionAuthor"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("RDStoreControllerManagedObjectContextNotificationTransactionAuthorKey"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("RDStoreControllerManagedObjectContextDidMarkExtraneousAlarmsPendingToSyncUpDeleteNotification"), 0, v6);

}

- (void)_rem_setAllowsExpandedUserInfoKeys:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector(self, "_setAllowsExpandedUserInfoKeys:") & 1) != 0)
    -[RDStoreControllerManagedObjectContext _setAllowsExpandedUserInfoKeys:](self, "_setAllowsExpandedUserInfoKeys:", v3);
}

- (id)_debug_managedObjectIDsSortedByTopologicalWeightsForEffectiveMinimumSupportedVersionPropagation:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "managedObjectIDsSortedByTopologicalWeightsForEffectiveMinimumSupportedVersionPropagation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (unint64_t)_unittest_validateDirtyEffectiveMinimumSupportedVersionsManually
{
  return -[RDStoreControllerManagedObjectContext _validateDirtyEffectiveMinimumSupportedVersionsWithBatchSize:isManualValidation:](self, "_validateDirtyEffectiveMinimumSupportedVersionsWithBatchSize:isManualValidation:", 1, 1);
}

- (RDStoreController)storeController
{
  return (RDStoreController *)objc_loadWeakRetained((id *)&self->_storeController);
}

- (RDStoreControllerValidationPolicy)validationPolicy
{
  return self->_validationPolicy;
}

- (void)setValidationPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_validationPolicy, a3);
}

- (ICBatchFetchHelper)batchFetchHelper
{
  return self->_batchFetchHelper;
}

- (void)setBatchFetchHelper:(id)a3
{
  objc_storeStrong((id *)&self->_batchFetchHelper, a3);
}

- (NSDictionary)cloudSchemaCatchUpSyncContextsByAccountIdentifier
{
  return self->_cloudSchemaCatchUpSyncContextsByAccountIdentifier;
}

- (void)setCloudSchemaCatchUpSyncContextsByAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSchemaCatchUpSyncContextsByAccountIdentifier, a3);
}

- (BOOL)shouldSortChildrenAfterFetching
{
  return self->_shouldSortChildrenAfterFetching;
}

- (void)setShouldSortChildrenAfterFetching:(BOOL)a3
{
  self->_shouldSortChildrenAfterFetching = a3;
}

- (NSMutableSet)recordIDsToSortChildrenAfterFetching
{
  return self->_recordIDsToSortChildrenAfterFetching;
}

- (void)setRecordIDsToSortChildrenAfterFetching:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToSortChildrenAfterFetching, a3);
}

- (void)setManagedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion, a3);
}

- (void)setFileAttachmentIdentifiersToPurgeByAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fileAttachmentIdentifiersToPurgeByAccountIdentifier, a3);
}

- (unint64_t)pendingPostSaveActions
{
  return self->_pendingPostSaveActions;
}

- (void)setPendingPostSaveActions:(unint64_t)a3
{
  self->_pendingPostSaveActions = a3;
}

- (NSDictionary)_unittest_awakeCounts
{
  return self->__unittest_awakeCounts;
}

- (void)set_unittest_awakeCounts:(id)a3
{
  objc_storeStrong((id *)&self->__unittest_awakeCounts, a3);
}

- (id)_unitTest_purgeDeletedFileAttachmentsDidComplete
{
  return self->__unitTest_purgeDeletedFileAttachmentsDidComplete;
}

- (void)set_unitTest_purgeDeletedFileAttachmentsDidComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setCandidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_candidateFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier, a3);
}

- (void)setConfirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_confirmedFileAttachmentSha512SumsAndExtensionsToPurgeByAccountIdentifier, a3);
}

@end
