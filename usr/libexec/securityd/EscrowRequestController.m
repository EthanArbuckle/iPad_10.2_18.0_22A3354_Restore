@implementation EscrowRequestController

- (EscrowRequestController)initWithLockStateTracker:(id)a3
{
  id v5;
  EscrowRequestController *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  OctagonStateMachine *v11;
  void *v12;
  void *v13;
  void *v14;
  OctagonStateMachine *v15;
  OctagonStateMachine *stateMachine;
  objc_super v18;
  const __CFString *v19;
  _QWORD v20[4];
  _QWORD v21[4];

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EscrowRequestController;
  v6 = -[EscrowRequestController init](&v18, "init");
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("EscrowRequestControllerQueue", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_lockStateTracker, a3);
    v11 = [OctagonStateMachine alloc];
    v20[0] = CFSTR("nothing_to_do");
    v20[1] = CFSTR("trigger_cloudservices");
    v21[0] = &off_10030A280;
    v21[1] = &off_10030A298;
    v20[2] = CFSTR("trigger_escrow_upload");
    v20[3] = CFSTR("wait_for_unlock");
    v21[2] = &off_10030A2B0;
    v21[3] = &off_10030A2C8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 4));
    v19 = CFSTR("escrowrequest_inform_cloudservices");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
    v15 = -[OctagonStateMachine initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:](v11, "initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:", CFSTR("escrowrequest"), v12, v14, CFSTR("nothing_to_do"), v6->_queue, v6, CFSTR("com.apple.security.escrowrequest.state"), v5, 0);
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = v15;

    v6->_forceIgnoreCloudServicesRateLimiting = 0;
  }

  return v6;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  EscrowRequestInformCloudServicesOperation *v10;
  void *v11;
  EscrowRequestInformCloudServicesOperation *v12;
  EscrowRequestInformCloudServicesOperation *v13;
  EscrowRequestPerformEscrowEnrollOperation *v15;
  const void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  unsigned int v38;
  const void *v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  NSObject *v43;
  const char *v44;
  const void *v45;
  const void *v46;
  NSObject *v47;
  const void *v48;
  NSObject *v49;
  void *v50;
  const __CFString *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  uint8_t v61[128];
  uint8_t buf[4];
  id v63;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[EscrowRequestController queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  if (objc_msgSend(v8, "_onqueueContains:", CFSTR("escrowrequest_inform_cloudservices")))
  {
    objc_msgSend(v8, "_onqueueRemoveFlag:", CFSTR("escrowrequest_inform_cloudservices"));
LABEL_4:
    v10 = [EscrowRequestInformCloudServicesOperation alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController lockStateTracker](self, "lockStateTracker"));
    v12 = -[EscrowRequestInformCloudServicesOperation initWithIntendedState:errorState:lockStateTracker:](v10, "initWithIntendedState:errorState:lockStateTracker:", CFSTR("nothing_to_do"), CFSTR("nothing_to_do"), v11);
LABEL_5:
    v13 = v12;
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("trigger_cloudservices")))
    goto LABEL_4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("trigger_escrow_upload")))
  {
    v15 = [EscrowRequestPerformEscrowEnrollOperation alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController lockStateTracker](self, "lockStateTracker"));
    v12 = -[EscrowRequestPerformEscrowEnrollOperation initWithIntendedState:errorState:enforceRateLimiting:lockStateTracker:](v15, "initWithIntendedState:errorState:enforceRateLimiting:lockStateTracker:", CFSTR("nothing_to_do"), CFSTR("nothing_to_do"), 1, v11);
    goto LABEL_5;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("wait_for_unlock")))
  {
    v16 = sub_10000EF14("escrowrequest");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "waiting for unlock before continuing with state machine", buf, 2u);
    }

    v13 = (EscrowRequestInformCloudServicesOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("wait-for-unlock"), CFSTR("nothing_to_do")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController lockStateTracker](self, "lockStateTracker"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "unlockDependency"));
    -[EscrowRequestInformCloudServicesOperation addNullableDependency:](v13, "addNullableDependency:", v18);

    goto LABEL_6;
  }
  v60 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowPendingRecord loadAllFromKeychain:](SecEscrowPendingRecord, "loadAllFromKeychain:", &v60));
  v20 = v60;
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController lockStateTracker](self, "lockStateTracker"));
    v22 = objc_msgSend(v21, "isLockedError:", v20);

    if (v22)
    {
      v13 = (EscrowRequestInformCloudServicesOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("wait-for-unlock"), CFSTR("wait_for_unlock")));
    }
    else
    {
      v46 = sub_10000EF14("escrowrequest");
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v20;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "failed to fetch records from keychain, nothing to do: %@", buf, 0xCu);
      }

      v13 = 0;
    }
    goto LABEL_50;
  }
  v54 = v19;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v23 = v19;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (!v24)
    goto LABEL_42;
  v25 = v24;
  v26 = *(_QWORD *)v57;
  while (2)
  {
    v27 = 0;
    v55 = v25;
    do
    {
      if (*(_QWORD *)v57 != v26)
        objc_enumerationMutation(v23);
      v28 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v27);
      if (!objc_msgSend(v28, "hasUploadCompleted")
        || (objc_msgSend(v28, "uploadCompleted") & 1) == 0)
      {
        if (!-[EscrowRequestController haveRecordedDate](self, "haveRecordedDate"))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "datePropertyForKey:", CFSTR("ERSPending")));

          if (!v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
            v32 = v26;
            v33 = v23;
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            objc_msgSend(v31, "setDateProperty:forKey:", v34, CFSTR("ERSPending"));

            v23 = v33;
            v26 = v32;
            v25 = v55;

          }
          -[EscrowRequestController setHaveRecordedDate:](self, "setHaveRecordedDate:", 1);

        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v35, "timeIntervalSince1970");
        v37 = v36;

        if ((objc_msgSend(v28, "certCached") & 1) != 0)
        {
          if (!objc_msgSend(v28, "hasSerializedPrerecord"))
            goto LABEL_40;
          v38 = objc_msgSend(v28, "escrowAttemptedWithinLastSeconds:", 300.0);
          v39 = sub_10000EF14("escrowrequest");
          v40 = objc_claimAutoreleasedReturnValue(v39);
          v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
          if (!v38)
          {
            if (v41)
            {
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "uuid"));
              *(_DWORD *)buf = 138412290;
              v63 = v53;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Request %@ needs to be stored!", buf, 0xCu);

            }
            v51 = CFSTR("escrow-request-attempt-escrow-upload");
            v52 = CFSTR("trigger_escrow_upload");
LABEL_49:
            v13 = (EscrowRequestInformCloudServicesOperation *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", v51, v52));
            v20 = 0;
            v19 = v54;

            goto LABEL_50;
          }
          if (!v41)
            goto LABEL_39;
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "uuid"));
          *(_DWORD *)buf = 138412290;
          v63 = v42;
          v43 = v40;
          v44 = "Request %@ needs to be stored, but has been attempted recently. Holding off...";
        }
        else
        {
          if (-[EscrowRequestController forceIgnoreCloudServicesRateLimiting](self, "forceIgnoreCloudServicesRateLimiting")|| !objc_msgSend(v28, "hasLastCloudServicesTriggerTime")|| (unint64_t)objc_msgSend(v28, "lastCloudServicesTriggerTime") < 1000 * (unint64_t)v37- 300000)
          {
            v48 = sub_10000EF14("escrowrequest");
            v49 = objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "uuid"));
              *(_DWORD *)buf = 138412290;
              v63 = v50;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Request %@ needs a cached certififcate", buf, 0xCu);

            }
            v51 = CFSTR("escrow-request-cache-cert");
            v52 = CFSTR("trigger_cloudservices");
            goto LABEL_49;
          }
          v45 = sub_10000EF14("escrowrequest");
          v40 = objc_claimAutoreleasedReturnValue(v45);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            goto LABEL_39;
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "uuid"));
          *(_DWORD *)buf = 138412290;
          v63 = v42;
          v43 = v40;
          v44 = "Request %@ needs to cache a certificate, but that has been attempted recently. Holding off...";
        }
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, v44, buf, 0xCu);

LABEL_39:
      }
LABEL_40:
      v27 = (char *)v27 + 1;
    }
    while (v25 != v27);
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v25)
      continue;
    break;
  }
LABEL_42:

  v13 = 0;
  v20 = 0;
  v19 = v54;
LABEL_50:

LABEL_7:
  return v13;
}

- (void)triggerEscrowUpdateRPC:(id)a3 options:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  NSObject *v20;
  id v21;
  const void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  char v27;
  uint64_t v28;
  void *i;
  void *v30;
  const void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  const void *v35;
  NSObject *v36;
  const void *v37;
  NSObject *v38;
  const void *v39;
  NSObject *v40;
  SecEscrowPendingRecord *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  const void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  const void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  EscrowRequestController *v56;
  void (**v57)(id, void *);
  id v58;
  void *v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  uint8_t v67[128];
  uint8_t buf[4];
  uint64_t v69;

  v7 = a4;
  v8 = (void (**)(id, void *))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController stateMachine](self, "stateMachine"));
  objc_msgSend(v9, "startOperation");

  v66 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowPendingRecord loadAllFromKeychain:](SecEscrowPendingRecord, "loadAllFromKeychain:", &v66));
  v11 = v66;
  v12 = v11;
  if (!v11)
  {
LABEL_4:

    v15 = sub_10000EF14("escrowrequest");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Investigating a new escrow request", buf, 2u);
    }

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", SecEscrowRequestOptionFederationMove));
    v59 = (void *)v17;
    v56 = self;
    if (v17)
    {
      v18 = v17;
      v19 = sub_10000EF14("escrowrequest");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Move requested to federation %@", buf, 0xCu);
      }

      v21 = objc_alloc_init((Class)SecureBackupEscrowReason);
      objc_msgSend(v21, "setReason:", 1);
      objc_msgSend(v21, "setExpectedFederationID:", v18);
    }
    else
    {
      v21 = 0;
    }
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v24 = v10;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v25)
    {
      v26 = v25;
      v57 = v8;
      v58 = v7;
      v27 = 0;
      v28 = *(_QWORD *)v63;
      while (2)
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v28)
            objc_enumerationMutation(v24);
          v30 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v30, "uploadCompleted") & 1) == 0
            && (objc_msgSend(v30, "hasAltDSID") & 1) == 0)
          {
            v31 = sub_10000EF14("escrowrequest");
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v69 = (uint64_t)v30;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Retriggering an existing escrow request: %@", buf, 0xCu);
            }

            objc_msgSend(v30, "setHasCertCached:", 0);
            objc_msgSend(v30, "setSerializedPrerecord:", 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "data"));
            objc_msgSend(v30, "setSerializedReason:", v33);

            v61 = 0;
            objc_msgSend(v30, "saveToKeychain:", &v61);
            v34 = v61;
            if (v34)
            {
              v12 = v34;
              v37 = sub_10000EF14("SecError");
              v38 = objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v69 = (uint64_t)v12;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "escrowrequest: Unable to save modified request to keychain: %@", buf, 0xCu);
              }

              v8 = v57;
              v57[2](v57, v12);

              v7 = v58;
              goto LABEL_46;
            }
            v35 = sub_10000EF14("escrowrequest");
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Retriggering an existing escrow request complete", buf, 2u);
            }

            v27 = 1;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        if (v26)
          continue;
        break;
      }

      v8 = v57;
      v7 = v58;
      if ((v27 & 1) != 0)
        goto LABEL_45;
    }
    else
    {

    }
    v39 = sub_10000EF14("escrowrequest");
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Creating a new escrow request", buf, 2u);
    }

    v41 = objc_alloc_init(SecEscrowPendingRecord);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "UUIDString"));
    -[SecEscrowPendingRecord setUuid:](v41, "setUuid:", v43);

    -[SecEscrowPendingRecord setAltDSID:](v41, "setAltDSID:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v44, "timeIntervalSince1970");
    -[SecEscrowPendingRecord setTriggerRequestTime:](v41, "setTriggerRequestTime:", 1000 * (unint64_t)v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "data"));
    -[SecEscrowPendingRecord setSerializedReason:](v41, "setSerializedReason:", v46);

    v47 = sub_10000EF14("escrowrequest");
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord uuid](v41, "uuid"));
      *(_DWORD *)buf = 138412290;
      v69 = (uint64_t)v49;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "beginning a new escrow request (%@)", buf, 0xCu);

    }
    v60 = 0;
    -[SecEscrowPendingRecord saveToKeychain:](v41, "saveToKeychain:", &v60);
    v50 = v60;
    if (v50)
    {
      v12 = v50;
      v51 = sub_10000EF14("SecError");
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = (uint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "escrowrequest: unable to save escrow update request: %@", buf, 0xCu);
      }

      v8[2](v8, v12);
      goto LABEL_46;
    }

LABEL_45:
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v53, "setDateProperty:forKey:", v54, CFSTR("ERSPending"));

    -[EscrowRequestController setHaveRecordedDate:](v56, "setHaveRecordedDate:", 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController stateMachine](v56, "stateMachine"));
    objc_msgSend(v55, "handleFlag:", CFSTR("escrowrequest_inform_cloudservices"));

    v8[2](v8, 0);
    v12 = 0;
LABEL_46:

    goto LABEL_47;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
  if ((objc_msgSend(v13, "isEqualToString:", NSOSStatusErrorDomain) & 1) != 0)
  {
    v14 = objc_msgSend(v12, "code");

    if (v14 == (id)-25300)
      goto LABEL_4;
  }
  else
  {

  }
  v22 = sub_10000EF14("escrowrequest");
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v69 = (uint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "failed to fetch records from keychain: %@", buf, 0xCu);
  }

  v8[2](v8, v12);
LABEL_47:

}

- (void)storePrerecordsInEscrowRPC:(id)a3
{
  id v4;
  EscrowRequestPerformEscrowEnrollOperation *v5;
  void *v6;
  EscrowRequestPerformEscrowEnrollOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  EscrowRequestPerformEscrowEnrollOperation *v12;
  _QWORD v13[4];
  EscrowRequestPerformEscrowEnrollOperation *v14;
  id v15;

  v4 = a3;
  v5 = [EscrowRequestPerformEscrowEnrollOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController lockStateTracker](self, "lockStateTracker"));
  v7 = -[EscrowRequestPerformEscrowEnrollOperation initWithIntendedState:errorState:enforceRateLimiting:lockStateTracker:](v5, "initWithIntendedState:errorState:enforceRateLimiting:lockStateTracker:", CFSTR("nothing_to_do"), CFSTR("nothing_to_do"), 0, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController stateMachine](self, "stateMachine"));
  objc_msgSend(v8, "startOperation");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController stateMachine](self, "stateMachine"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("nothing_to_do")));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004E8D8;
  v13[3] = &unk_1002DE4E0;
  v14 = v7;
  v15 = v4;
  v11 = v4;
  v12 = v7;
  objc_msgSend(v9, "doSimpleStateMachineRPC:op:sourceStates:reply:", CFSTR("trigger-escrow-store"), v12, v10, v13);

}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStateMachine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)forceIgnoreCloudServicesRateLimiting
{
  return self->_forceIgnoreCloudServicesRateLimiting;
}

- (void)setForceIgnoreCloudServicesRateLimiting:(BOOL)a3
{
  self->_forceIgnoreCloudServicesRateLimiting = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLockStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)haveRecordedDate
{
  return self->_haveRecordedDate;
}

- (void)setHaveRecordedDate:(BOOL)a3
{
  self->_haveRecordedDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

@end
