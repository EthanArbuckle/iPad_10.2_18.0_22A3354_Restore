@implementation KTBackgroundSystemValidationOperation

- (KTBackgroundSystemValidationOperation)initWithDependencies:(id)a3
{
  id v4;
  KTBackgroundSystemValidationOperation *v5;
  KTBackgroundSystemValidationOperation *v6;
  void *v7;
  KTBackgroundSystemValidationOperation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KTBackgroundSystemValidationOperation;
  v5 = -[KTGroupOperation init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[KTBackgroundSystemValidationOperation setDeps:](v5, "setDeps:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    -[KTBackgroundSystemValidationOperation setOpUUID:](v6, "setOpUUID:", v7);

    v8 = v6;
  }

  return v6;
}

- (id)opUUIDData
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));

  if (v3)
  {
    v7[0] = 0;
    v7[1] = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
    objc_msgSend(v4, "getUUIDBytes:", v7);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v7, 16));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)recordBackgroundActivity
{
  void *v3;
  void *v4;
  __objc2_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __objc2_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  char *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *cache;
  void *v53;
  void *v54;
  void *v55;
  __objc2_class_ro *info;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62[2];
  uint8_t buf[4];
  id v64;
  __int16 v65;
  void *v66;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smDataStore"));
  v5 = TransparencyResponse;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getSettingsDate:", off_10029E2F0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "smDataStore"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getSettingsNumber:", off_10029E2F8));

  if (!(v6 | v9))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "smDataStore"));
    v14 = off_10029E300;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v13, "setSettingsDate:date:", v14, v15);
LABEL_6:

    goto LABEL_7;
  }
  if (!v6)
    goto LABEL_8;
  if (objc_msgSend((id)v9, "unsignedIntegerValue") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "smDataStore"));
    objc_msgSend(v11, "setSettingsDate:date:", off_10029E300, v6);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "smDataStore"));
    objc_msgSend(v13, "setSettingsNumber:number:", off_10029E310, &off_10025BE30);
LABEL_7:

    goto LABEL_8;
  }
  if (!objc_msgSend((id)v9, "unsignedIntegerValue"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "smDataStore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "getSettingsNumber:", off_10029E310));

    v34 = (char *)objc_msgSend(v12, "unsignedIntegerValue") + 1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "smDataStore"));
    v35 = off_10029E310;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v34));
    v5 = TransparencyResponse;
    objc_msgSend(v15, "setSettingsNumber:number:", v35, v36);

    goto LABEL_6;
  }
LABEL_8:
  v16 = TransparencyResponse;
  if (_os_feature_enabled_impl("Transparency", "KTBackgroundVerificationUI"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "smDataStore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "getSettingsDate:", off_10029E300));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "smDataStore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getSettingsNumber:", off_10029E310));

    +[TransparencySettings backgroundFollowupDelayPeriod](TransparencySettings, "backgroundFollowupDelayPeriod");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v23));
    if (objc_msgSend(v19, "compare:", v24) == (id)-1)
    {
      v25 = objc_msgSend(v22, "unsignedIntegerValue");
      v26 = +[TransparencySettings backgroundFollowupFailureCount](TransparencySettings, "backgroundFollowupFailureCount");

      v16 = TransparencyResponse;
      if (v25 >= v26)
      {
        if (qword_1002A4500 != -1)
          dispatch_once(&qword_1002A4500, &stru_10023B978);
        v27 = qword_1002A4508;
        if (os_log_type_enabled((os_log_t)qword_1002A4508, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v64 = v22;
          v65 = 2112;
          v66 = v19;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "BackgroundSystemValidation: posting followup for %@ consistent background validation failures since %@", buf, 0x16u);
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "smDataStore"));
        v16 = TransparencyResponse;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getSettingsData:", off_10029E308));

        if (v30)
          v31 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v30), "bytes"));
        else
          v31 = 0;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "cloudRecords"));

        if (v38)
        {
          v61 = v31;
          v62[1] = 0;
          v60 = v38;
          v39 = kKTApplicationIdentifierIDS;
          v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "getAggregateOptInStateForApplication:error:"));
          v41 = 0;
          if (!v40)
          {
            if (qword_1002A4500 != -1)
              dispatch_once(&qword_1002A4500, &stru_10023B998);
            v42 = qword_1002A4508;
            if (os_log_type_enabled((os_log_t)qword_1002A4508, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v64 = v41;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "BackgroundSystemValidation: failed getting optin state for followup: %@", buf, 0xCu);
            }
          }
          v58 = v41;
          v59 = v30;
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "followup"));
          v62[0] = 0;
          v45 = (void *)v40;
          objc_msgSend(v44, "postFollowup:type:eventId:errorCode:optInState:infoLink:additionalInfo:error:", v39, 1, v61, -388, v40, 0, 0, v62);
          v46 = v62[0];

          v16 = TransparencyResponse;
          if (v46)
          {
            if (qword_1002A4500 != -1)
              dispatch_once(&qword_1002A4500, &stru_10023B9B8);
            v47 = qword_1002A4508;
            if (os_log_type_enabled((os_log_t)qword_1002A4508, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v64 = v46;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "BackgroundSystemValidation: failed to post followup: %@", buf, 0xCu);
            }
          }

          v30 = v59;
          v38 = v60;
          v31 = v61;
        }

      }
    }
    else
    {

      v16 = TransparencyResponse;
    }

    v5 = TransparencyResponse;
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "smDataStore"));
  objc_msgSend(v49, "setSettingsNumber:number:", off_10029E2F8, &off_10025BE48);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "smDataStore"));
  cache = v16[19].cache;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUIDData](self, "opUUIDData"));
  objc_msgSend(v51, "setSettingsData:data:", cache, v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "smDataStore"));
  info = v5[18].info;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v55, "setSettingsDate:date:", info, v57);

}

- (void)groupStart
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  KTVerifyPendingSignaturesOperation *v9;
  void *v10;
  void *v11;
  KTVerifyPendingSignaturesOperation *v12;
  KTVerifyMapHeadMMDOperation *v13;
  void *v14;
  void *v15;
  KTVerifyMapHeadMMDOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  KTValidatePendingURIsOperation *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  KTValidatePendingURIsOperation *v25;
  KTValidatePendingRequestsOperation *v26;
  void *v27;
  void *v28;
  KTValidatePendingRequestsOperation *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  KTVerifyConsistencyOperation *v34;
  void *v35;
  void *v36;
  KTVerifyConsistencyOperation *v37;
  KTVerifyRevisionInclusionOperation *v38;
  void *v39;
  void *v40;
  KTVerifyRevisionInclusionOperation *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  KTGarbageCollectDBOperation *v46;
  void *v47;
  KTGarbageCollectDBOperation *v48;
  KTReportDBMetricsOperation *v49;
  void *v50;
  KTReportDBMetricsOperation *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  _BYTE buf[24];

  v3 = (void *)os_transaction_create("com.apple.transparencyd.BackgroundSystemValidationOp");
  -[KTBackgroundSystemValidationOperation setTransaction:](self, "setTransaction:", v3);

  if (qword_1002A4500 != -1)
    dispatch_once(&qword_1002A4500, &stru_10023B9D8);
  v4 = (void *)qword_1002A4508;
  if (os_log_type_enabled((os_log_t)qword_1002A4508, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "BackgroundSystemValidation: start %{public}@", buf, 0xCu);

  }
  -[KTBackgroundSystemValidationOperation recordBackgroundActivity](self, "recordBackgroundActivity");
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v58[1] = 3221225472;
  v58[2] = sub_10001C790;
  v58[3] = &unk_10023BA00;
  v58[0] = _NSConcreteStackBlock;
  objc_copyWeak(&v59, (id *)buf);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlockTakingSelf:](KTResultOperation, "named:withBlockTakingSelf:", CFSTR("background-finished"), v58));
  -[KTBackgroundSystemValidationOperation setFinishedOp:](self, "setFinishedOp:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v8);

  v9 = [KTVerifyPendingSignaturesOperation alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  v12 = -[KTVerifyPendingSignaturesOperation initWithDependencies:opId:](v9, "initWithDependencies:opId:", v10, v11);

  v13 = [KTVerifyMapHeadMMDOperation alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  v16 = -[KTVerifyMapHeadMMDOperation initWithDependencies:opId:](v13, "initWithDependencies:opId:", v14, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v17, "addSuccessDependency:", v12);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v18, "addSuccessDependency:", v16);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v19, "addOperation:", v12);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v20, "addOperation:", v16);

  v21 = [KTValidatePendingURIsOperation alloc];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v24 = kKTApplicationIdentifierIDS;
  v25 = -[KTValidatePendingURIsOperation initWithApplication:opId:dependencies:](v21, "initWithApplication:opId:dependencies:", kKTApplicationIdentifierIDS, v22, v23);

  v26 = [KTValidatePendingRequestsOperation alloc];
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  v29 = -[KTValidatePendingRequestsOperation initWithApplication:dependencies:opId:](v26, "initWithApplication:dependencies:opId:", v24, v27, v28);

  -[KTValidatePendingURIsOperation addNullableDependency:](v25, "addNullableDependency:", v12);
  -[KTValidatePendingRequestsOperation addNullableDependency:](v29, "addNullableDependency:", v12);
  -[KTValidatePendingURIsOperation addNullableDependency:](v25, "addNullableDependency:", v16);
  -[KTValidatePendingRequestsOperation addNullableDependency:](v29, "addNullableDependency:", v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v30, "addSuccessDependency:", v25);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v31, "addSuccessDependency:", v29);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v32, "addOperation:", v25);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v33, "addOperation:", v29);

  v34 = [KTVerifyConsistencyOperation alloc];
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  v37 = -[KTVerifyConsistencyOperation initWithDependencies:opId:](v34, "initWithDependencies:opId:", v35, v36);

  v38 = [KTVerifyRevisionInclusionOperation alloc];
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  v41 = -[KTVerifyRevisionInclusionOperation initWithDependencies:opId:](v38, "initWithDependencies:opId:", v39, v40);

  -[KTVerifyConsistencyOperation addNullableDependency:](v37, "addNullableDependency:", v25);
  -[KTVerifyConsistencyOperation addNullableDependency:](v37, "addNullableDependency:", v29);
  -[KTVerifyRevisionInclusionOperation addNullableDependency:](v41, "addNullableDependency:", v25);
  -[KTVerifyRevisionInclusionOperation addNullableDependency:](v41, "addNullableDependency:", v29);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v42, "addSuccessDependency:", v37);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v43, "addSuccessDependency:", v41);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v44, "addOperation:", v37);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v45, "addOperation:", v41);

  v46 = [KTGarbageCollectDBOperation alloc];
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v48 = -[KTGarbageCollectDBOperation initWithDependencies:](v46, "initWithDependencies:", v47);

  v49 = [KTReportDBMetricsOperation alloc];
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v51 = -[KTReportDBMetricsOperation initWithDependencies:](v49, "initWithDependencies:", v50);

  -[KTGarbageCollectDBOperation addNullableDependency:](v48, "addNullableDependency:", v37);
  -[KTGarbageCollectDBOperation addNullableDependency:](v48, "addNullableDependency:", v41);
  -[KTReportDBMetricsOperation addNullableDependency:](v51, "addNullableDependency:", v48);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v52, "addNullableDependency:", v48);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v53, "addNullableDependency:", v51);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v54, "addOperation:", v48);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v55, "addOperation:", v51);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  objc_msgSend(v56, "addOperation:", v57);

  objc_destroyWeak(&v59);
  objc_destroyWeak((id *)buf);
}

+ (id)lastDutyCycle:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "smDataStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSettingsDate:", off_10029E2F0));

  return v4;
}

+ (id)lastDutyCycleSuccess:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "smDataStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSettingsDate:", off_10029E300));

  return v4;
}

+ (id)sysdiagnoseInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smDataStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getSettingsDate:", off_10029E2F0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smDataStore"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getSettingsDate:", off_10029E300));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smDataStore"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getSettingsNumber:", off_10029E2F8));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smDataStore"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getSettingsNumber:", off_10029E310));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smDataStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getSettingsData:", off_10029E308));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smDataStore"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getSettingsData:", off_10029E330));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smDataStore"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getSettingsData:", off_10029E328));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smDataStore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getSettingsData:", off_10029E320));

  v33 = v10;
  if (v10)
    v34 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v10), "bytes"));
  else
    v34 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smDataStore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getSettingsData:", off_10029E318));

  if (v18)
  {
    v19 = objc_alloc_init((Class)KTNSErrorValueTransformer);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "transformedValue:", v18));

  }
  else
  {
    v20 = 0;
  }
  if (v12)
    v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v12, 4);
  else
    v21 = 0;
  v32 = (void *)v12;
  if (v14)
    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v14, 4);
  else
    v22 = 0;
  v31 = (void *)v14;
  if (v16)
    v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v16, 4);
  else
    v23 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v25 = v5;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_toISO_8601_UTCString"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("lastDutyCycle"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "kt_toISO_8601_UTCString"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("lastSuccess"));

  objc_msgSend(v24, "setObject:forKeyedSubscript:", v36, CFSTR("lastResult"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v35, CFSTR("numSuccessiveFails"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "UUIDString"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("lastUUID"));

  if (v20)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError diagnosticError:depth:](TransparencyError, "diagnosticError:depth:", v20, 0));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("lastError"));

  }
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v21, CFSTR("failureServerHints"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v22, CFSTR("failureType"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("failureData"));

  return v24;
}

+ (void)saveErrorToDB:(id)a3 smDataStore:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  if (a3)
  {
    v9 = v5;
    v6 = a3;
    v7 = objc_alloc_init((Class)KTNSErrorValueTransformer);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseTransformedValue:", v6));

    if (v8)
      objc_msgSend(v9, "setSettingsData:data:", off_10029E318, v8);

    v5 = v9;
  }

}

- (void)saveErrorToDB
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smDataStore"));
  +[KTBackgroundSystemValidationOperation saveErrorToDB:smDataStore:](KTBackgroundSystemValidationOperation, "saveErrorToDB:smDataStore:", v5, v4);

}

+ (void)addErrorToBackgroundOp:(id)a3 smDataStore:(id)a4 failureDataString:(id)a5 type:(id)a6 serverHint:(id)a7 failure:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  id v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v13)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getSettingsData:", off_10029E308));
    if (v19)
    {
      v20 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v19), "bytes"));
      if (objc_msgSend(v13, "isEqual:", v20))
      {
        objc_msgSend(v14, "setSettingsNumber:number:", off_10029E2F8, &off_10025BE60);
        +[KTBackgroundSystemValidationOperation saveErrorToDB:smDataStore:](KTBackgroundSystemValidationOperation, "saveErrorToDB:smDataStore:", v18, v14);
        v21 = off_10029E320;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataUsingEncoding:", 4));
        objc_msgSend(v14, "setSettingsData:data:", v21, v22);

        v23 = off_10029E328;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataUsingEncoding:", 4));
        objc_msgSend(v14, "setSettingsData:data:", v23, v24);

        v25 = off_10029E330;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataUsingEncoding:", 4));
        objc_msgSend(v14, "setSettingsData:data:", v25, v26);

        if (qword_1002A4500 != -1)
          dispatch_once(&qword_1002A4500, &stru_10023BA40);
        v27 = qword_1002A4508;
        if (os_log_type_enabled((os_log_t)qword_1002A4508, OS_LOG_TYPE_ERROR))
        {
          v29 = 138543362;
          v30 = v13;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "BackgroundSystemValidation: failed %{public}@", (uint8_t *)&v29, 0xCu);
        }
      }

    }
    else
    {
      if (qword_1002A4500 != -1)
        dispatch_once(&qword_1002A4500, &stru_10023BA20);
      v28 = qword_1002A4508;
      if (os_log_type_enabled((os_log_t)qword_1002A4508, OS_LOG_TYPE_ERROR))
      {
        v29 = 138543362;
        v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "No saved background op UUID, but serverRPC has %{public}@", (uint8_t *)&v29, 0xCu);
      }
    }

  }
}

- (NSUUID)opUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 120, 1);
}

- (void)setOpUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (KTResultOperation)finishedOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_opUUID, 0);
}

@end
