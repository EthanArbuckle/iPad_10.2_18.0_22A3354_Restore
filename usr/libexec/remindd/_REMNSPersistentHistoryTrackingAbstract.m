@implementation _REMNSPersistentHistoryTrackingAbstract

- (void)withManagedObjectContext:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (id)currentChangeToken
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10006BE34;
  v9 = sub_10006BE44;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006BE4C;
  v4[3] = &unk_1007D9D10;
  v4[4] = self;
  v4[5] = &v5;
  -[_REMNSPersistentHistoryTrackingAbstract withManagedObjectContext:](self, "withManagedObjectContext:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)currentChangeTokenForAccountTypes:(int64_t)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10006BE34;
  v10 = sub_10006BE44;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006BF90;
  v5[3] = &unk_1007D9D38;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[_REMNSPersistentHistoryTrackingAbstract withManagedObjectContext:](self, "withManagedObjectContext:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)currentChangeTokenForAccountID:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  _REMNSPersistentHistoryTrackingAbstract *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10006BE34;
  v14 = sub_10006BE44;
  v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006C234;
  v6[3] = &unk_1007D9D60;
  v7 = self;
  v3 = a3;
  v8 = v3;
  v9 = &v10;
  -[_REMNSPersistentHistoryTrackingAbstract withManagedObjectContext:](v7, "withManagedObjectContext:", v6);
  v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)earliestChangeTokenForAccountID:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  _REMNSPersistentHistoryTrackingAbstract *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10006BE34;
  v14 = sub_10006BE44;
  v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006C43C;
  v6[3] = &unk_1007D9D60;
  v7 = self;
  v3 = a3;
  v8 = v3;
  v9 = &v10;
  -[_REMNSPersistentHistoryTrackingAbstract withManagedObjectContext:](v7, "withManagedObjectContext:", v6);
  v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)getTrackingStateWithClientID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v9 = objc_opt_class(_REMChangeTrackingClientID, v8);
  v10 = REMCheckedDynamicCast(v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_100681698();

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10006BE34;
  v19 = sub_10006BE44;
  v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006C828;
  v14[3] = &unk_1007D9D88;
  v14[4] = self;
  v14[5] = &v15;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract _fetchCDTrackingStateWithClientID:andPerformBlock:](self, "_fetchCDTrackingStateWithClientID:andPerformBlock:", v11, v14));
  v7[2](v7, v16[5], v13);

  _Block_object_dispose(&v15, 8);
}

- (void)saveTrackingState:(id)a3 withClientID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v12 = objc_opt_class(_REMChangeTrackingClientID, v11);
  v13 = REMCheckedDynamicCast(v12, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_1006817F4();

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastConsumedChangeToken"));
  v28 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, &v28));
  v18 = v28;

  if (v17)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract _persistenceStoreForAccountID:](self, "_persistenceStoreForAccountID:", v19));

    if (v20)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10006CB54;
      v24[3] = &unk_1007D9DB0;
      v25 = v20;
      v26 = v14;
      v27 = v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract _fetchCDTrackingStateWithClientID:andPerformBlock:](self, "_fetchCDTrackingStateWithClientID:andPerformBlock:", v26, v24));

    }
    else
    {
      v23 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_100681790();

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithREMChangeErrorCode:](NSError, "errorWithREMChangeErrorCode:", 7));
    }

  }
  else
  {
    v22 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100681704((uint64_t)v14, v18);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithREMChangeErrorCode:underlyingError:](NSError, "errorWithREMChangeErrorCode:underlyingError:", 9, v18));
  }

  v10[2](v10, v21);
}

- (void)fetchHistoryAfterDate:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t, uint64_t);
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t, uint64_t))a6;
  if (a5 && objc_msgSend(v11, "count"))
  {
    v17 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      sub_1006818F8(v17, v18, v19, v20, v21, v22, v23, v24);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentHistoryChangeRequest fetchHistoryAfterDate:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterDate:", v10));
  v14 = v13;
  if (a5)
    objc_msgSend(v13, "setFetchLimit:", a5);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_10006BE34;
  v40 = sub_10006BE44;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_10006BE34;
  v34 = sub_10006BE44;
  v35 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10006CEE4;
  v25[3] = &unk_1007D9DD8;
  v25[4] = self;
  v15 = v11;
  v26 = v15;
  v28 = &v30;
  v16 = v14;
  v27 = v16;
  v29 = &v36;
  -[_REMNSPersistentHistoryTrackingAbstract withManagedObjectContext:](self, "withManagedObjectContext:", v25);
  v12[2](v12, v37[5], v31[5]);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

}

- (void)fetchHistoryAfterToken:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  _REMNSPersistentHistoryTrackingAbstract *v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t, uint64_t))a6;
  if (a5 && objc_msgSend(v11, "count"))
  {
    v27 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      sub_1006818F8(v27, v28, v29, v30, v31, v32, v33, v34);

  }
  v13 = v10;
  v15 = objc_opt_class(_REMChangeUniversalToken, v14);
  v16 = REMSpecificCast(v15, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v19 = v13;
  if (v17)
  {

    v19 = 0;
  }
  v20 = objc_opt_class(REMNSPersistentHistoryToken, v18);
  v21 = REMDynamicCast(v20, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = v22;
  if (!v19 || v22)
  {
    if (v19)
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "token"));
    else
      v26 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = sub_10006BE34;
    v52 = sub_10006BE44;
    v53 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = sub_10006BE34;
    v46 = sub_10006BE44;
    v47 = 0;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10006D278;
    v35[3] = &unk_1007D9E00;
    v24 = v26;
    v36 = v24;
    v37 = self;
    v38 = v11;
    v39 = &v42;
    v40 = &v48;
    v41 = a5;
    -[_REMNSPersistentHistoryTrackingAbstract withManagedObjectContext:](self, "withManagedObjectContext:", v35);
    v12[2](v12, v49[5], v43[5]);

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v48, 8);

  }
  else
  {
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithREMChangeErrorCode:](NSError, "errorWithREMChangeErrorCode:", 0));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract _errorChangeSetWithError:](self, "_errorChangeSetWithError:", v24));
    v12[2](v12, (uint64_t)v25, (uint64_t)v24);

  }
}

- (id)_fetchRequestWithPredicateUsingEntityNames:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v7;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    v27 = v9;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v15, v8));
          if (v16)
          {
            objc_msgSend(v9, "addObject:", v16);
          }
          else
          {
            v17 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              v33 = v15;
              _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Failed to find entity name in -fetchHistoryAfterToken:entityName: {name: %{public}@}", buf, 0xCu);
            }

            v18 = (void *)objc_claimAutoreleasedReturnValue(+[REMError invalidParameterErrorWithDescription:](REMError, "invalidParameterErrorWithDescription:", CFSTR("Failed to find entity name in -fetchHistoryAfterToken:entityName.")));
            if (a5)
              *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithREMChangeErrorCode:underlyingError:](NSError, "errorWithREMChangeErrorCode:underlyingError:", 1, v18));

            v9 = v27;
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v9, "count"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentHistoryChange entityDescriptionWithContext:](NSPersistentHistoryChange, "entityDescriptionWithContext:", v8));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "propertiesByName"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKey:", CFSTR("changedEntity")));

      v22 = objc_alloc_init((Class)NSFetchRequest);
      objc_msgSend(v22, "setEntity:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), v23, v27));
      objc_msgSend(v22, "setPredicate:", v24);

      v9 = v27;
    }
    else
    {
      v22 = 0;
    }

    v7 = v26;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)deleteHistoryBeforeDate:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;

  v6 = (void (**)(id, void *))a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeDate:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract _executeDeleteHistoryRequest:](self, "_executeDeleteHistoryRequest:", v8));
  v6[2](v6, v7);

}

- (void)deleteHistoryBeforeToken:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v21 = v6;
  v9 = objc_opt_class(_REMChangeUniversalToken, v8);
  v10 = REMSpecificCast(v9, v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v13 = v21;
  if (v11)
  {

    v13 = 0;
  }
  v14 = objc_opt_class(REMNSPersistentHistoryToken, v12);
  v15 = REMDynamicCast(v14, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (!v13 || v16)
  {
    if (v13)
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "token"));
    else
      v18 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentHistoryChangeRequest deleteHistoryBeforeToken:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeToken:", v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract _executeDeleteHistoryRequest:](self, "_executeDeleteHistoryRequest:", v19));
    v7[2](v7, v20);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithREMChangeErrorCode:](NSError, "errorWithREMChangeErrorCode:", 0));
    v7[2](v7, v18);
  }

}

- (void)fetchAuxiliaryChangeInfos:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _REMNSPersistentHistoryTrackingAbstract *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10006BE34;
  v20 = sub_10006BE44;
  v21 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006D9F8;
  v11[3] = &unk_1007D9E28;
  v9 = v6;
  v12 = v9;
  v13 = self;
  v15 = &v16;
  v10 = v8;
  v14 = v10;
  -[_REMNSPersistentHistoryTrackingAbstract withManagedObjectContext:](self, "withManagedObjectContext:", v11);
  v7[2](v7, v10, v17[5]);

  _Block_object_dispose(&v16, 8);
}

- (id)_persistenceStoreForAccountID:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (id)_persistenceStoresForAccountTypes:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (id)_accountIdentifierForPersistenceStoreID:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (id)_persistenceStoreIDForAccountID:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract _persistenceStoreForAccountID:](self, "_persistenceStoreForAccountID:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  return v4;
}

- (id)_persistenceStoreIDsForAccountTypes:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[REMAccount _accountTypeMaskWithBitMask:](REMAccount, "_accountTypeMaskWithBitMask:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract _persistenceStoresForAccountTypes:](self, "_persistenceStoresForAccountTypes:", v4));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "identifier"));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_accountIDForPersistenceStoreID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract cachedAccountIDsByStoreIDsMap](self, "cachedAccountIDsByStoreIDsMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract _accountIdentifierForPersistenceStoreID:](self, "_accountIdentifierForPersistenceStoreID:", v4));
    v8 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v7);
    v9 = v8;
    if (v7 && v8)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[REMAccount objectIDWithUUID:](REMAccount, "objectIDWithUUID:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract cachedAccountIDsByStoreIDsMap](self, "cachedAccountIDsByStoreIDsMap"));
      objc_msgSend(v10, "setObject:forKey:", v6, v4);

    }
  }

  return v6;
}

- (id)_currentREMChangeTokenFromNSPersistentStores:(id)a3 persistentStoreCoordinator:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentPersistentHistoryTokenFromStores:", v5));
    v8 = objc_msgSend(objc_alloc((Class)REMNSPersistentHistoryToken), "initWithPersistentHistoryToken:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_errorChangeSetWithError:(id)a3
{
  void *v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[REMChangeSet errorChangeSetWithError:](REMChangeSet, "errorChangeSetWithError:"));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_100681928(v5, v6, v7, v8, v9, v10, v11, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Attempting to get errorChangeSet with nil error.")));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[REMChangeSet errorChangeSetWithError:](REMChangeSet, "errorChangeSetWithError:", v13));

  }
  return v3;
}

- (id)_resultChangeSetByExecutingRequest:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v42;
  void *v43;
  void *v44;
  id *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  _REMNSPersistentHistoryTrackingAbstract *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  _BYTE v57[16];
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;

  v8 = a3;
  v9 = a4;
  v10 = objc_autoreleasePoolPush();
  v56 = 0;
  v49 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeRequest:error:", v8, &v56));
  v12 = v56;
  if (v12)
  {
    v14 = v12;
    v15 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100681A58();

    if (objc_msgSend(v14, "code") == (id)134301)
      v16 = 4;
    else
      v16 = 1;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithREMChangeErrorCode:underlyingError:](NSError, "errorWithREMChangeErrorCode:underlyingError:", v16, v14));

    objc_autoreleasePoolPop(v10);
LABEL_8:
    v18 = (id)objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract _errorChangeSetWithError:](self, "_errorChangeSetWithError:", v17));
    goto LABEL_33;
  }
  if (!v11)
  {
    v42 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      sub_1006819F8();

  }
  v19 = objc_opt_class(NSArray, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "result"));
  v21 = REMDynamicCast(v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v23 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "transactionAuthor"));
    v25 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 138543618;
    v60 = v24;
    v61 = 2048;
    v62 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "COREDATA NSPersistentHistoryChangeRequest EXECUTED {author: %{public}@, txn.count: %llu}", buf, 0x16u);

  }
  if (v22)
  {
    v43 = v11;
    v44 = v10;
    v50 = self;
    v45 = a5;
    v46 = v8;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v22, "count")));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "reverseObjectEnumerator"));
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v53;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v53 != v28)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v29);
          v31 = objc_autoreleasePoolPush();
          v32 = objc_msgSend(objc_alloc((Class)REMNSPersistentHistoryTransaction), "initWithPersistentHistoryTransaction:", v30);
          v33 = v32;
          if (v32)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "storeID"));
            if (v34)
            {
              v35 = objc_claimAutoreleasedReturnValue(-[_REMNSPersistentHistoryTrackingAbstract _accountIDForPersistenceStoreID:](v50, "_accountIDForPersistenceStoreID:", v34));
              if (v35)
              {
                objc_msgSend(v33, "_resolveAccountID:", v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "changes"));
                -[_REMNSPersistentHistoryTrackingAbstract _resolveObjectIDsInChanges:deletedObjectsIDMap:inManagedObjectContext:](v50, "_resolveObjectIDsInChanges:deletedObjectsIDMap:inManagedObjectContext:", v36, v47, v49);

                objc_msgSend(v48, "addObject:", v33);
              }
              else
              {
                v37 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  sub_1006819A8((uint64_t)v57, (uint64_t)v33);

              }
            }
            else
            {
              v35 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                sub_100681958((uint64_t)buf, (uint64_t)v33);
            }

          }
          objc_autoreleasePoolPop(v31);
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v27);
    }

    v38 = objc_alloc((Class)REMChangeSet);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "reverseObjectEnumerator"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "allObjects"));
    v18 = objc_msgSend(v38, "initWithChangeTransactions:", v40);

    v17 = 0;
    a5 = v45;
    v8 = v46;
    self = v50;
    v11 = v43;
    v10 = v44;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithREMChangeErrorCode:](NSError, "errorWithREMChangeErrorCode:", 2));
    v18 = 0;
  }

  objc_autoreleasePoolPop(v10);
  if (!v18)
    goto LABEL_8;
LABEL_33:
  if (a5)
    *a5 = objc_retainAutorelease(v17);

  return v18;
}

- (void)_resolveObjectIDsInChanges:(id)a3 deletedObjectsIDMap:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, const char *);
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  id obj;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  NSObject *v55;
  _BYTE v56[128];

  v7 = a3;
  v8 = a4;
  v43 = a5;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v38 = v7;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseObjectEnumerator"));
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v44)
  {
    v42 = *(_QWORD *)v47;
    v39 = v8;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v42)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v9);
        v11 = objc_autoreleasePoolPush();
        v13 = objc_opt_class(REMNSPersistentHistoryChange, v12);
        v14 = REMCheckedDynamicCast(v13, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "changedManagedObjectID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entity"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));

        if (v18)
        {
          v45 = 0;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "existingObjectWithID:error:", v16, &v45));
          v21 = v45;
          if (v19)
          {
            v22 = objc_opt_class(v19, v20);
            if ((objc_opt_respondsToSelector(v22, "conformsToREMChangeTrackingIdentifiable") & 1) != 0
              && (v24 = (uint64_t (*)(uint64_t, const char *))objc_msgSend((id)objc_opt_class(v19, v23), "methodForSelector:", "conformsToREMChangeTrackingIdentifiable"), v26 = objc_opt_class(v19, v25), (v24(v26, "conformsToREMChangeTrackingIdentifiable") & 1) != 0))
            {
              v40 = v11;
              v27 = v19;
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject remChangedObjectID](v27, "remChangedObjectID"));
              if (v28)
              {
                v29 = v28;
                v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "uuid"));
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "entityName"));
                objc_msgSend(v15, "resolveObjectIDWithUUID:entityName:", v30, v31);

                v8 = v39;
              }
              else
              {
                v29 = 0;
                v30 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v51 = v16;
                  v52 = 2112;
                  v53 = v15;
                  v54 = 2112;
                  v55 = v27;
                  _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Changed object has nil remChangedObjectID {mID: %{public}@, change: %@, managedObject: %@}", buf, 0x20u);
                }
              }

              v11 = v40;
            }
            else
            {
              v27 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
              if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543618;
                v51 = v16;
                v52 = 2112;
                v53 = v15;
                _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Changed object does not conform to REMChangeTrackingIdentifiable, skip resolving objectID {mID: %{public}@, change: %@}", buf, 0x16u);
              }
            }

            objc_msgSend(v43, "refreshObject:mergeChanges:", v19, 0);
            goto LABEL_32;
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tombstone"));
          v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectIdentifier"));

          if (v33)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject UUIDString](v33, "UUIDString"));
            objc_msgSend(v8, "setObject:forKey:", v34, v16);

            goto LABEL_18;
          }
          v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v16));
          if (v35)
          {
            v36 = (void *)v35;
            v33 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v35);

            if (!v33)
              goto LABEL_29;
LABEL_18:
            objc_msgSend(v15, "resolveObjectIDWithUUID:entityName:", v33, v18);
          }
          else
          {
            v37 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v16;
              _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "We may have found a race condition where object got deleted in context before we could fetch a deletion change history! {mID: %@}", buf, 0xCu);
            }

LABEL_29:
            v33 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v51 = v16;
              v52 = 2112;
              v53 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Could not find the REMChangedObjectIdentifying ID of the managed object previously deleted in the same change set {mID: %@, change: %@}", buf, 0x16u);
            }
          }

LABEL_32:
          goto LABEL_33;
        }
        v21 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v15;
          _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Failed to get entity name from persistent history change {change: %@}", buf, 0xCu);
        }
LABEL_33:

        objc_autoreleasePoolPop(v11);
        v9 = (char *)v9 + 1;
      }
      while (v44 != v9);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v44);
  }

}

- (id)_executeDeleteHistoryRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10006BE34;
  v14 = sub_10006BE44;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006EF00;
  v7[3] = &unk_1007D9E50;
  v4 = a3;
  v8 = v4;
  v9 = &v10;
  -[_REMNSPersistentHistoryTrackingAbstract withManagedObjectContext:](self, "withManagedObjectContext:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)_fetchCDTrackingStateWithClientID:(id)a3 andPerformBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10006BE34;
  v20 = sub_10006BE44;
  v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006F1A4;
  v12[3] = &unk_1007D9E78;
  v8 = v6;
  v13 = v8;
  v15 = &v16;
  v9 = v7;
  v14 = v9;
  -[_REMNSPersistentHistoryTrackingAbstract withManagedObjectContext:](self, "withManagedObjectContext:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)_changeTokenFromCDTrackingState:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v14;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastConsumedChangeTokenData"));
  if (v7)
  {
    v14 = 0;
    v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(REMChangeToken, v6), v7, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v14;
    if (!v9)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100681CCC();

      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithREMChangeErrorCode:underlyingError:](NSError, "errorWithREMChangeErrorCode:underlyingError:", 9, v10));
    }

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100681C30(v5);

    v9 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithREMChangeErrorCode:](NSError, "errorWithREMChangeErrorCode:", 9));
  }

  return v9;
}

- (id)_fetchCDAuxiliaryChangeInfosWithObjectID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v16;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAuxiliaryChangeInfo fetchRequest](REMCDAuxiliaryChangeInfo, "fetchRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("identifier == %@"), v7));
  objc_msgSend(v8, "setPredicate:", v9);

  v16 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v8, &v16));

  v11 = v16;
  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100681E0C((uint64_t)v7, v11);
LABEL_8:

    goto LABEL_9;
  }
  if (!v10 || !objc_msgSend(v10, "count"))
  {
    v12 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100681DA8();
    goto LABEL_8;
  }
LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  if (!v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[REMLog changeTracking](REMLog, "changeTracking"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100681DA8();

  }
  return v13;
}

- (NSCache)cachedAccountIDsByStoreIDsMap
{
  return self->_cachedAccountIDsByStoreIDsMap;
}

- (void)setCachedAccountIDsByStoreIDsMap:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAccountIDsByStoreIDsMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAccountIDsByStoreIDsMap, 0);
}

@end
