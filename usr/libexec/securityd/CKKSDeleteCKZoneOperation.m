@implementation CKKSDeleteCKZoneOperation

- (CKKSDeleteCKZoneOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  char *v12;
  char *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKKSDeleteCKZoneOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 142), a4);
    objc_storeStrong((id *)(v13 + 134), a5);
    v13[128] = 0;
  }

  return (CKKSDeleteCKZoneOperation *)v13;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _BYTE buf[24];
  _BYTE v44[128];

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_100070BC0;
  v41 = sub_100070BD0;
  v42 = (id)0xAAAAAAAAAAAAAAAALL;
  v42 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "views"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v34;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)v38[5];
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v7), "zoneID"));
        objc_msgSend(v8, "addObject:", v9);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    }
    while (v5);
  }

  v10 = objc_msgSend((id)v38[5], "count");
  v11 = sub_10000BDF4(CFSTR("ckkszone"), 0);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      v14 = v38[5];
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deleting CloudKit zones: %@", buf, 0xCu);
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation deps](self, "deps"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cloudKitClassDependencies"));
    v17 = objc_msgSend(objc_msgSend(v16, "modifyRecordZonesOperationClass"), "alloc");
    v18 = objc_msgSend(v17, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v38[5]);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "configuration"));
    objc_msgSend(v19, "setIsCloudKitSupportOperation:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ckdatabase"));
    objc_msgSend(v18, "setDatabase:", v21);

    objc_msgSend(v18, "setName:", CFSTR("zone-creation-operation"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("zone-creation")));
    objc_msgSend(v18, "setGroup:", v22);

    objc_msgSend(v18, "setQualityOfService:", 25);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100070BD8;
    v31[3] = &unk_1002DC358;
    objc_copyWeak(&v32, (id *)buf);
    v31[4] = &v37;
    objc_msgSend(v18, "setModifyRecordZonesCompletionBlock:", v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation deps](self, "deps"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ckdatabase"));
    objc_msgSend(v24, "addOperation:", v18);

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100070E5C;
    v29[3] = &unk_1002DD8A0;
    objc_copyWeak(&v30, (id *)buf);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", CFSTR("determine-next-state"), v29));
    -[CKKSDeleteCKZoneOperation setSetResultStateOperation:](self, "setSetResultStateOperation:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation setResultStateOperation](self, "setResultStateOperation"));
    objc_msgSend(v26, "addDependency:", v18);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation setResultStateOperation](self, "setResultStateOperation"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v27);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No zones to delete", buf, 2u);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCKZoneOperation intendedState](self, "intendedState"));
    -[CKKSDeleteCKZoneOperation setNextState:](self, "setNextState:", v28);

  }
  _Block_object_dispose(&v37, 8);

}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 134);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (BOOL)networkError
{
  return self->_networkError;
}

- (void)setNetworkError:(BOOL)a3
{
  self->_networkError = a3;
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 158, 1);
}

- (void)setSetResultStateOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)(&self->_networkError + 6), 0);
}

@end
