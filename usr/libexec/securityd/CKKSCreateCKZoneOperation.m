@implementation CKKSCreateCKZoneOperation

- (CKKSCreateCKZoneOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
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
  v15.super_class = (Class)CKKSCreateCKZoneOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 142), a4);
    objc_storeStrong((id *)(v13 + 134), a5);
    v13[128] = 1;
    v13[129] = 1;
    v13[130] = 0;
  }

  return (CKKSCreateCKZoneOperation *)v13;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  AAFAnalyticsEventSecurity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AAFAnalyticsEventSecurity *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  AAFAnalyticsEventSecurity *v31;
  void *v32;
  void *v33;
  void *v34;
  void **v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  AAFAnalyticsEventSecurity *v39;
  id v40;
  _QWORD v41[7];
  id v42;
  id location;
  _QWORD v44[7];
  _QWORD v45[5];
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  __int128 buf;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  const __CFString *v58;
  void *v59;

  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_10008ECC0;
  v51 = sub_10008ECD0;
  v52 = (id)0xAAAAAAAAAAAAAAAALL;
  v52 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = sub_10008ECC0;
  v45[4] = sub_10008ECD0;
  v46 = (id)0xAAAAAAAAAAAAAAAALL;
  v46 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseProvider"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10008ECD8;
  v44[3] = &unk_1002EAEE8;
  v44[4] = self;
  v44[5] = &v47;
  v44[6] = v45;
  objc_msgSend(v4, "dispatchSyncWithReadOnlySQLTransaction:", v44);

  if (objc_msgSend((id)v48[5], "count"))
  {
    v5 = [AAFAnalyticsEventSecurity alloc];
    v58 = CFSTR("numViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v48[5], "count")));
    v59 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeAccount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "altDSID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    v12 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v5, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v7, v10, CFSTR("com.apple.security.ckks.zoneCreation"), 0, &off_10030AF70, objc_msgSend(v11, "sendMetric"));

    v13 = sub_10000BDF4(CFSTR("ckkszone"), 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v48[5];
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Asking to create and subscribe to CloudKit zones: %@", (uint8_t *)&buf, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "overallLaunch"));
    objc_msgSend(v17, "addEvent:", CFSTR("zone-create"));

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18 = sub_10000BDF4(CFSTR("ckkszonemodifier"), 0);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v48[5];
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Attempting to create zones %@", (uint8_t *)&buf, 0xCu);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "cloudKitClassDependencies"));
    v23 = objc_msgSend(objc_msgSend(v22, "modifyRecordZonesOperationClass"), "alloc");
    v24 = objc_msgSend(v23, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v48[5], 0);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v54 = 0x3032000000;
    v55 = sub_10008ECC0;
    v56 = sub_10008ECD0;
    v57 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "configuration"));
    objc_msgSend(v25, "setIsCloudKitSupportOperation:", 1);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ckdatabase"));
    objc_msgSend(v24, "setDatabase:", v27);

    objc_msgSend(v24, "setName:", CFSTR("zone-creation-operation"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", CFSTR("zone-creation")));
    objc_msgSend(v24, "setGroup:", v28);

    objc_msgSend(v24, "setQualityOfService:", 25);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10008F020;
    v41[3] = &unk_1002DC698;
    objc_copyWeak(&v42, &location);
    v41[4] = v45;
    v41[5] = &buf;
    v41[6] = &v47;
    objc_msgSend(v24, "setModifyRecordZonesCompletionBlock:", v41);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation deps](self, "deps"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ckdatabase"));
    objc_msgSend(v30, "addOperation:", v24);

    v35 = _NSConcreteStackBlock;
    v36 = 3221225472;
    v37 = sub_10008F4A4;
    v38 = &unk_1002EA758;
    objc_copyWeak(&v40, &location);
    v31 = v12;
    v39 = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", CFSTR("determine-next-state"), &v35));
    -[CKKSCreateCKZoneOperation setSetResultStateOperation:](self, "setSetResultStateOperation:", v32, v35, v36, v37, v38);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation setResultStateOperation](self, "setResultStateOperation"));
    objc_msgSend(v33, "addNullableDependency:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation setResultStateOperation](self, "setResultStateOperation"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v34);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&location);
  }
  else
  {
    v31 = (AAFAnalyticsEventSecurity *)objc_claimAutoreleasedReturnValue(-[CKKSCreateCKZoneOperation intendedState](self, "intendedState"));
    -[CKKSCreateCKZoneOperation setNextState:](self, "setNextState:", v31);
  }

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v47, 8);

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

- (BOOL)allZoneCreationsSucceeded
{
  return self->_allZoneCreationsSucceeded;
}

- (void)setAllZoneCreationsSucceeded:(BOOL)a3
{
  self->_allZoneCreationsSucceeded = a3;
}

- (BOOL)allZoneSubscriptionsSucceeded
{
  return self->_allZoneSubscriptionsSucceeded;
}

- (void)setAllZoneSubscriptionsSucceeded:(BOOL)a3
{
  self->_allZoneSubscriptionsSucceeded = a3;
}

- (BOOL)networkError
{
  return self->_networkError;
}

- (void)setNetworkError:(BOOL)a3
{
  self->_networkError = a3;
}

- (NSError)zoneModificationError
{
  return (NSError *)objc_getProperty(self, a2, 158, 1);
}

- (void)setZoneModificationError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (NSError)zoneSubscriptionError
{
  return (NSError *)objc_getProperty(self, a2, 166, 1);
}

- (void)setZoneSubscriptionError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 174, 1);
}

- (void)setSetResultStateOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 174);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_zoneSubscriptionError + 6), 0);
  objc_storeStrong((id *)((char *)&self->_zoneModificationError + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)(&self->_networkError + 4), 0);
}

@end
