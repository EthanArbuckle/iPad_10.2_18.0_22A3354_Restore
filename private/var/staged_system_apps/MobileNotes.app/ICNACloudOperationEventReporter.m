@implementation ICNACloudOperationEventReporter

+ (id)sharedReporter
{
  if (qword_1005DDDB8 != -1)
    dispatch_once(&qword_1005DDDB8, &stru_100551E18);
  return (id)qword_1005DDDB0;
}

- (id)saltedIDforID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager"));
  v5 = objc_msgSend(v4, "saltedID:forClass:", v3, objc_opt_class(ICASCloudOperationEndEvent));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)saltedIDForOperation:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "operationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNACloudOperationEventReporter saltedIDforID:](self, "saltedIDforID:", v4));

  return v5;
}

- (id)saltedAccountIDForOperation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v4 = a3;
  v5 = objc_opt_class(CKDatabaseOperation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "database"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "container"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setupInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountOverrideInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountID"));

  if (v10)
  {
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ICNACloudOperationEventReporter saltedIDforID:](self, "saltedIDforID:", v10));

  }
  else
  {
LABEL_4:
    v11 = CFSTR("icna_account_id_unknown");
  }

  return v11;
}

- (id)subTrackerForOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc((Class)ICNASubTracker);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNACloudOperationEventReporter saltedIDForOperation:](self, "saltedIDForOperation:", v4));

  v7 = objc_msgSend(v5, "initWithName:", v6);
  return v7;
}

- (void)submitCloudOperationEndEventForCKOperation:(id)a3 recordsByRecordID:(id)a4 operationError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  dispatch_semaphore_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  dispatch_time_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  __CFString *v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICNACloudOperationEventReporter subTrackerForOperation:](self, "subTrackerForOperation:", v8));
  v11 = objc_claimAutoreleasedReturnValue(-[ICNACloudOperationEventReporter accountDataForOperation:](self, "accountDataForOperation:", v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNACloudOperationEventReporter operationDataForOperaiton:](self, "operationDataForOperaiton:", v8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNACloudOperationEventReporter cloudSyncableDataForOperation:recordsByRecordID:](self, "cloudSyncableDataForOperation:recordsByRecordID:", v8, v9));
  v14 = objc_alloc_init((Class)NSMutableArray);
  v34 = (void *)v11;
  objc_msgSend(v14, "addObject:", v11);
  objc_msgSend(v14, "addObject:", v12);
  objc_msgSend(v14, "addObject:", v13);
  v36 = v9;
  if (!v10)
  {
    v18 = 1;
    goto LABEL_9;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
  if (!objc_msgSend(v15, "isEqualToString:", CKErrorDomain))
  {

    goto LABEL_7;
  }
  v16 = objc_msgSend(v10, "code");

  if (v16 != (id)2)
  {
LABEL_7:
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%ld"), v19, objc_msgSend(v10, "code")));

    v20 = objc_alloc((Class)ICASFullErrorData);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "code")));
    v22 = objc_msgSend(v20, "initWithFullErrorCode:errorString:", v21, v17);

    objc_msgSend(v14, "addObject:", v22);
    v18 = 3;
    goto LABEL_8;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNACloudOperationEventReporter partialCloudErrorDataForOperation:recordsByRecordID:operationError:](self, "partialCloudErrorDataForOperation:recordsByRecordID:operationError:", v8, v9, v10));
  objc_msgSend(v14, "addObject:", v17);
  v18 = 2;
LABEL_8:

LABEL_9:
  v23 = objc_msgSend(objc_alloc((Class)ICASErrorStatus), "initWithErrorStatus:", v18);
  v24 = objc_msgSend(objc_alloc((Class)ICASCloudErrorData), "initWithErrorStatus:", v23);
  objc_msgSend(v14, "addObject:", v24);
  if (+[ICUtilities isInternalInstall](ICUtilities, "isInternalInstall"))
  {
    v25 = dispatch_semaphore_create(0);
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = sub_100073648;
    v44 = sub_100073658;
    v45 = CFSTR("icna_device_id_unknown");
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "container"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100073660;
    v37[3] = &unk_100551E40;
    v39 = &v40;
    v28 = v25;
    v38 = v28;
    objc_msgSend(v27, "fetchCurrentDeviceIDWithCompletionHandler:", v37);

    v29 = dispatch_time(0, 750000000);
    if (dispatch_semaphore_wait(v28, v29))
    {
      v30 = (void *)v41[5];
      v41[5] = (uint64_t)CFSTR("icna_device_id_failed_to_obtain");

    }
    v31 = objc_alloc((Class)ICASInternalUserData);
    v32 = objc_msgSend(v31, "initWithRawUserDSID:", v41[5]);
    objc_msgSend(v14, "addObject:", v32);

    _Block_object_dispose(&v40, 8);
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  objc_msgSend(v33, "submitEventOfType:pushThenPopDataObjects:subTracker:", objc_opt_class(ICASCloudOperationEndEvent), v14, v35);

}

- (id)accountDataForOperation:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNACloudOperationEventReporter saltedAccountIDForOperation:](self, "saltedAccountIDForOperation:", a3));
  v4 = objc_msgSend(objc_alloc((Class)ICASAccountType), "initWithAccountType:", 1);
  v5 = objc_msgSend(objc_alloc((Class)ICASAccountData), "initWithAccountType:accountID:", v4, v3);

  return v5;
}

- (id)operationDataForOperaiton:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  v5 = objc_opt_class(CKFetchDatabaseChangesOperation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = 3;
  }
  else
  {
    v7 = objc_opt_class(CKFetchRecordsOperation);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    {
      v6 = 5;
    }
    else
    {
      v8 = objc_opt_class(CKFetchRecordZoneChangesOperation);
      if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
      {
        v6 = 6;
      }
      else
      {
        v9 = objc_opt_class(CKFetchRecordZonesOperation);
        if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
        {
          v6 = 7;
        }
        else
        {
          v10 = objc_opt_class(CKFetchSubscriptionsOperation);
          if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
          {
            v6 = 8;
          }
          else
          {
            v11 = objc_opt_class(CKModifyRecordsOperation);
            if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
            {
              v6 = 9;
            }
            else
            {
              v12 = objc_opt_class(CKModifyRecordZonesOperation);
              if ((objc_opt_isKindOfClass(v4, v12) & 1) != 0)
              {
                v6 = 10;
              }
              else
              {
                v13 = objc_opt_class(CKModifySubscriptionsOperation);
                if ((objc_opt_isKindOfClass(v4, v13) & 1) != 0)
                {
                  v6 = 11;
                }
                else
                {
                  v14 = objc_opt_class(CKAcceptSharesOperation);
                  if ((objc_opt_isKindOfClass(v4, v14) & 1) != 0)
                  {
                    v6 = 1;
                  }
                  else
                  {
                    v15 = objc_opt_class(CKDatabaseOperation);
                    if ((objc_opt_isKindOfClass(v4, v15) & 1) != 0)
                      v6 = 2;
                    else
                      v6 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v16 = objc_alloc((Class)ICASCloudOperationData);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNACloudOperationEventReporter saltedIDForOperation:](self, "saltedIDForOperation:", v4));
  v18 = objc_msgSend(objc_alloc((Class)ICASOperationType), "initWithOperationType:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "group"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
  v21 = objc_msgSend(v16, "initWithOperationID:operationType:operationGroupName:", v17, v18, v20);

  return v21;
}

- (id)cloudSyncableDataForOperation:(id)a3 recordsByRecordID:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSNumber *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  NSNumber *v32;
  void *v33;
  id v34;
  id v35;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _BYTE v52[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(CKFetchRecordsOperation);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordIDs"));
    v9 = 0;
LABEL_6:
    v11 = CFSTR("icna_record_type_unknown");
    goto LABEL_7;
  }
  v10 = objc_opt_class(CKModifyRecordsOperation);
  if ((objc_opt_isKindOfClass(v5, v10) & 1) == 0)
  {
    v9 = 0;
    v8 = 0;
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordIDsToDelete"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordsToSave"));
  v11 = CFSTR("icna_record_type_deleted");
LABEL_7:
  v37 = v11;
  v44 = objc_alloc_init((Class)NSMutableArray);
  v12 = objc_alloc_init((Class)NSMutableSet);
  if (objc_msgSend(v6, "count") || objc_msgSend(v9, "count"))
  {
    v13 = objc_alloc_init((Class)NSMutableDictionary);
    v14 = objc_alloc_init((Class)NSMutableSet);
    if (objc_msgSend(v6, "count"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
      objc_msgSend(v14, "addObjectsFromArray:", v15);

    }
    v41 = v8;
    v42 = v6;
    v43 = v5;
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v14, "addObjectsFromArray:", v9);
    v40 = v9;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100073D5C;
    v49[3] = &unk_100551E68;
    v16 = v13;
    v50 = v16;
    v51 = v12;
    v39 = v14;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v49);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v38 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allValues"));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v23 = objc_alloc((Class)ICASCloudSyncableItemData);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "syncableDataType"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "count"));
          v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt((int)objc_msgSend(v25, "intValue")));
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          v28 = objc_msgSend(v23, "initWithSyncableDataType:count:", v24, v27);

          objc_msgSend(v44, "addObject:", v28);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v19);
    }

    v6 = v42;
    v5 = v43;
    v9 = v40;
    v8 = v41;
  }
  if (objc_msgSend(v8, "count"))
  {
    v29 = objc_msgSend(v8, "mutableCopy");
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
    objc_msgSend(v29, "removeObjectsInArray:", v30);

    if (objc_msgSend(v29, "count"))
    {
      v31 = objc_alloc((Class)ICASCloudSyncableItemData);
      v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v29, "count")));
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v34 = objc_msgSend(v31, "initWithSyncableDataType:count:", v37, v33);

      objc_msgSend(v44, "addObject:", v34);
    }

  }
  v35 = objc_msgSend(objc_alloc((Class)ICASCloudSyncableData), "initWithSyncableDataSummary:", v44);

  return v35;
}

- (id)partialCloudErrorDataForOperation:(id)a3 recordsByRecordID:(id)a4 operationError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSNumber *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  id v49;
  __CFString *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _BYTE v54[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

  v11 = objc_opt_class(CKFetchRecordsOperation);
  v41 = v7;
  if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordIDs"));
    v13 = 0;
  }
  else
  {
    v14 = objc_opt_class(CKModifyRecordsOperation);
    if ((objc_opt_isKindOfClass(v7, v14) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordIDsToDelete"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordsToSave"));
      v15 = CFSTR("icna_record_type_deleted");
      goto LABEL_7;
    }
    v13 = 0;
    v12 = 0;
  }
  v15 = CFSTR("icna_record_type_unknown");
LABEL_7:
  v16 = objc_alloc_init((Class)NSMutableDictionary);
  v40 = v8;
  objc_msgSend(v16, "addEntriesFromDictionary:", v8);
  if (objc_msgSend(v13, "count"))
  {
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100074280;
    v52[3] = &unk_100551E90;
    v53 = v16;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v52);

  }
  v38 = v13;
  v17 = objc_alloc_init((Class)NSMutableDictionary);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000742D0;
  v47[3] = &unk_100551EB8;
  v36 = v16;
  v48 = v36;
  v37 = v12;
  v49 = v37;
  v50 = (__CFString *)v15;
  v18 = v17;
  v51 = v18;
  v39 = v10;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v47);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v35 = v18;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allValues"));
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v44;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v44 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v23);
        v25 = objc_alloc((Class)ICASPartialCloudErrorItemData);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "syncableDataType"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "errorCode"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "count"));
        v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt((int)objc_msgSend(v28, "intValue")));
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "errorString"));
        v32 = objc_msgSend(v25, "initWithSyncableDataType:errorCode:count:errorString:", v26, v27, v30, v31);

        objc_msgSend(v19, "addObject:", v32);
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v21);
  }

  v33 = objc_msgSend(objc_alloc((Class)ICASPartialCloudErrorData), "initWithPartialErrorSummary:", v19);
  return v33;
}

- (void)cloudContext:(id)a3 reportOperationEnd:(id)a4 recordsByRecordID:(id)a5 operationError:(id)a6
{
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  id v15;

  v15 = a4;
  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = objc_msgSend(v11, "BOOLForKey:", kICInternalSettingsMuteSyncHealthTracking);

  if ((v12 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICNASamplingController sharedController](ICNASamplingController, "sharedController"));
    v14 = objc_msgSend(v13, "shouldTrackSyncHealth");

    if (v14)
      -[ICNACloudOperationEventReporter submitCloudOperationEndEventForCKOperation:recordsByRecordID:operationError:](self, "submitCloudOperationEndEventForCKOperation:recordsByRecordID:operationError:", v15, v9, v10);
  }

}

@end
