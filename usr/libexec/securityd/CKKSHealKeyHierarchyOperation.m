@implementation CKKSHealKeyHierarchyOperation

- (CKKSHealKeyHierarchyOperation)init
{

  return 0;
}

- (CKKSHealKeyHierarchyOperation)initWithDependencies:(id)a3 allowFullRefetchResult:(BOOL)a4 intending:(id)a5 errorState:(id)a6
{
  id v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKKSHealKeyHierarchyOperation;
  v14 = -[CKKSGroupOperation init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 142), a3);
    v15[128] = a4;
    objc_storeStrong((id *)(v15 + 134), a5);
    objc_storeStrong((id *)(v15 + 150), a6);
    v15[129] = 0;
    v16 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v17 = *(void **)(v15 + 166);
    *(_QWORD *)(v15 + 166) = v16;

  }
  return (CKKSHealKeyHierarchyOperation *)v15;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id location;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100098658;
  v23[3] = &unk_1002DD8A0;
  objc_copyWeak(&v24, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", CFSTR("determine-next-state"), v23));
  -[CKKSHealKeyHierarchyOperation setSetResultStateOperation:](self, "setSetResultStateOperation:", v3);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeManagedViews"));

  v5 = 0;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewKeyHierarchyState"));
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("unhealthy"));

        if ((v11 & 1) != 0)
        {
          if (!v5)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
            v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentTrustStates"));

          }
          -[CKKSHealKeyHierarchyOperation attemptToHealView:currentTrustStates:](self, "attemptToHealView:currentTrustStates:", v9, v5);
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneName"));
          v15 = sub_10000BDF4(CFSTR("ckksheal"), v14);
          v16 = objc_claimAutoreleasedReturnValue(v15);

          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v9;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "View %@ is in okay state; ignoring",
              buf,
              0xCu);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v6);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation setResultStateOperation](self, "setResultStateOperation"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v17);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)attemptToHealView:(id)a3 currentTrustStates:(id)a4
{
  id v6;
  id v7;
  AAFAnalyticsEventSecurity *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AAFAnalyticsEventSecurity *v14;
  void *v15;
  void *v16;
  AAFAnalyticsEventSecurity *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  CKKSHealKeyHierarchyOperation *v33;
  AAFAnalyticsEventSecurity *v34;
  id v35;
  _QWORD *v36;
  uint64_t *v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[3];
  char v46;
  id location;
  _BYTE v48[128];
  _QWORD v49[2];
  _QWORD v50[2];

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = [AAFAnalyticsEventSecurity alloc];
  v49[0] = CFSTR("fullRefetchNeeded");
  v49[1] = CFSTR("isPrioritized");
  v50[0] = &__kCFBooleanFalse;
  v50[1] = &__kCFBooleanFalse;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeAccount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "altDSID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
  v14 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v8, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v9, v12, CFSTR("com.apple.security.ckks.healKeyHierarchy"), 0, &off_10030AF70, objc_msgSend(v13, "sendMetric"));

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v46 = 1;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_100094F38;
  v43 = sub_100094F48;
  v44 = (id)0xAAAAAAAAAAAAAAAALL;
  v44 = objc_alloc_init((Class)NSMutableArray);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "databaseProvider"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100094F50;
  v31[3] = &unk_1002DC820;
  v25 = v6;
  v32 = v25;
  v33 = self;
  v17 = v14;
  v34 = v17;
  v26 = v7;
  v35 = v26;
  v36 = v45;
  objc_copyWeak(&v38, &location);
  v37 = &v39;
  objc_msgSend(v16, "dispatchSyncWithSQLTransaction:", v31);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = (id)v40[5];
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v48, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps", v25, v26, (_QWORD)v27));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ckdatabase"));
        objc_msgSend(v24, "addOperation:", v22);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v48, 16);
    }
    while (v19);
  }

  objc_destroyWeak(&v38);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(v45, 8);
  objc_destroyWeak(&location);

}

- (BOOL)ensureKeyPresent:(id)a3 viewState:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  __CFString **v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  _BOOL4 v36;
  __CFString **v37;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;

  v6 = a3;
  v7 = a4;
  v41 = 0;
  v8 = objc_msgSend(v6, "loadKeyMaterialFromKeychain:", &v41);
  v9 = v41;
  if ((v8 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneName"));
    v13 = sub_10000BDF4(CFSTR("ckksheal"), v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v6;
      v44 = 2112;
      v45 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Couldn't load key(%@) from keychain. Attempting recovery: %@", buf, 0x16u);
    }

    v40 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unwrapViaKeyHierarchy:", &v40));
    v16 = v40;

    if (v15)
    {
      v39 = 0;
      v17 = objc_msgSend(v6, "saveKeyMaterialToKeychain:", &v39);
      v18 = v39;
      v19 = v18;
      if ((v17 & 1) != 0)
      {

        v10 = 1;
LABEL_25:

        goto LABEL_26;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lockStateTracker"));
      v31 = objc_msgSend(v30, "isLockedError:", v19);

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneName"));
      v34 = sub_10000BDF4(CFSTR("ckksheal"), v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);

      v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
      if (v31)
      {
        if (v36)
        {
          *(_DWORD *)buf = 138412546;
          v43 = v6;
          v44 = 2112;
          v45 = v19;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Couldn't save key(%@) to keychain due to the lock state: %@", buf, 0x16u);
        }
        v37 = off_1002E9DE0;
      }
      else
      {
        if (v36)
        {
          *(_DWORD *)buf = 138412546;
          v43 = v6;
          v44 = 2112;
          v45 = v19;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Couldn't save key(%@) to keychain: %@", buf, 0x16u);
        }
        v37 = &off_1002EA780;
      }

      objc_msgSend(v7, "setViewKeyHierarchyState:", *v37);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSHealKeyHierarchyOperation deps](self, "deps"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lockStateTracker"));
      v22 = objc_msgSend(v21, "isLockedError:", v16);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "zoneName"));
      v25 = sub_10000BDF4(CFSTR("ckksheal"), v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);

      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      if (v22)
      {
        if (v27)
        {
          *(_DWORD *)buf = 138412546;
          v43 = v6;
          v44 = 2112;
          v45 = v16;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Couldn't unwrap key(%@) using key hierarchy due to the lock state: %@", buf, 0x16u);
        }
        v28 = off_1002E9DE0;
      }
      else
      {
        if (v27)
        {
          *(_DWORD *)buf = 138412546;
          v43 = v6;
          v44 = 2112;
          v45 = v16;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Couldn't unwrap key(%@) using key hierarchy. Keys are broken, quitting: %@", buf, 0x16u);
        }
        v28 = &off_1002EA780;
      }

      objc_msgSend(v7, "setViewKeyHierarchyState:", *v28);
    }
    v10 = 0;
    goto LABEL_25;
  }
  v10 = 1;
LABEL_26:

  return v10;
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 142, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 150, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (BOOL)allowFullRefetchResult
{
  return self->_allowFullRefetchResult;
}

- (void)setAllowFullRefetchResult:(BOOL)a3
{
  self->_allowFullRefetchResult = a3;
}

- (BOOL)newCloudKitRecordsWritten
{
  return self->_newCloudKitRecordsWritten;
}

- (void)setNewCloudKitRecordsWritten:(BOOL)a3
{
  self->_newCloudKitRecordsWritten = a3;
}

- (BOOL)cloudkitWriteFailures
{
  return self->_cloudkitWriteFailures;
}

- (void)setCloudkitWriteFailures:(BOOL)a3
{
  self->_cloudkitWriteFailures = a3;
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 158, 1);
}

- (void)setSetResultStateOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (NSHashTable)ckOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 166, 1);
}

- (void)setCkOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_setResultStateOperation + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_cloudkitWriteFailures + 4), 0);
}

@end
