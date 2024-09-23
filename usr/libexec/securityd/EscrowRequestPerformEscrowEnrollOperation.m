@implementation EscrowRequestPerformEscrowEnrollOperation

- (EscrowRequestPerformEscrowEnrollOperation)initWithIntendedState:(id)a3 errorState:(id)a4 enforceRateLimiting:(BOOL)a5 lockStateTracker:(id)a6
{
  id v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)EscrowRequestPerformEscrowEnrollOperation;
  v14 = -[CKKSGroupOperation init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 142), a3);
    objc_storeStrong((id *)(v15 + 134), a4);
    v15[128] = a5;
    objc_storeStrong((id *)(v15 + 158), a6);
  }

  return (EscrowRequestPerformEscrowEnrollOperation *)v15;
}

- (BOOL)checkFatalError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_14;
  if (objc_msgSend(v3, "code") == (id)24)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v6 = kSecureBackupErrorDomain;
    v7 = objc_msgSend(v5, "isEqualToString:", kSecureBackupErrorDomain);

    if ((v7 & 1) != 0)
      goto LABEL_12;
  }
  else
  {
    v6 = kSecureBackupErrorDomain;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (objc_msgSend(v8, "isEqualToString:", v6))
  {
    v9 = objc_msgSend(v4, "code");

    if (v9 == (id)17)
      goto LABEL_12;
  }
  else
  {

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  if (!objc_msgSend(v10, "isEqualToString:", CDPStateErrorDomain))
  {

    goto LABEL_14;
  }
  v11 = objc_msgSend(v4, "code");

  if (v11 != (id)-5309)
  {
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_12:
  v12 = 1;
LABEL_15:

  return v12;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  const void *v18;
  const void *v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  const void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  _BOOL4 v27;
  const void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  id v34;
  const void *v35;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  const void *v40;
  NSObject *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t v54[128];
  _BYTE buf[24];

  v3 = sub_10000EF14("escrowrequest");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to escrow any pending prerecords", buf, 2u);
  }

  v53 = 0;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowPendingRecord loadAllFromKeychain:](SecEscrowPendingRecord, "loadAllFromKeychain:", &v53));
  v5 = v53;
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if ((objc_msgSend(v7, "isEqualToString:", NSOSStatusErrorDomain) & 1) == 0)
  {

    goto LABEL_25;
  }
  v8 = objc_msgSend(v6, "code") == (id)-25300;

  if (!v8)
  {
LABEL_25:
    v19 = sub_10000EF14("escrowrequest");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch records from keychain: %@", buf, 0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestPerformEscrowEnrollOperation lockStateTracker](self, "lockStateTracker"));
    v22 = objc_msgSend(v21, "isLockedError:", v6);

    if (v22)
    {
      v23 = sub_10000EF14("escrowrequest");
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Will retry after unlock", buf, 2u);
      }

      -[EscrowRequestPerformEscrowEnrollOperation setNextState:](self, "setNextState:", CFSTR("wait_for_unlock"));
    }
    else
    {
      -[EscrowRequestPerformEscrowEnrollOperation setNextState:](self, "setNextState:", CFSTR("nothing_to_do"));

    }
    goto LABEL_45;
  }
LABEL_6:

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v9 = v42;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v50;
LABEL_8:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v11)
        objc_enumerationMutation(v9);
      v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v12);
      if (objc_msgSend(v13, "uploadCompleted"))
        break;
      if (-[EscrowRequestPerformEscrowEnrollOperation enforceRateLimiting](self, "enforceRateLimiting")
        && objc_msgSend(v13, "escrowAttemptedWithinLastSeconds:", 300.0))
      {
        v18 = sub_10000EF14("escrowrequest");
        v15 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          v16 = v15;
          v17 = "Skipping pending escrow request (%@); it's rate limited";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
        }
LABEL_15:

        goto LABEL_21;
      }
      if ((objc_msgSend(v13, "hasSerializedPrerecord") & 1) != 0)
      {
        v25 = v13;

        if (v25)
          goto LABEL_34;
        goto LABEL_32;
      }
LABEL_21:
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        if (v10)
          goto LABEL_8;
        goto LABEL_23;
      }
    }
    v14 = sub_10000EF14("escrowrequest");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      v16 = v15;
      v17 = "Skipping completed escrow request (%@)";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
LABEL_23:

LABEL_32:
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "uuid"));
  v27 = v26 == 0;

  if (v27)
  {
    v40 = sub_10000EF14("escrowrequest");
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "No pending escrow request has a prerecord", buf, 2u);
    }

    -[EscrowRequestPerformEscrowEnrollOperation setNextState:](self, "setNextState:", CFSTR("nothing_to_do"));
  }
  else
  {
    v25 = 0;
LABEL_34:
    v28 = sub_10000EF14("escrowrequest");
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "uuid"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "escrow request have pre-record uploading: %@", buf, 0xCu);

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("cdp-finish"), &stru_1002DCDD8));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v32, "timeIntervalSince1970");
    objc_msgSend(v25, "setLastEscrowAttemptTime:", (unint64_t)(v33 * 1000.0));

    objc_msgSend(v25, "setUploadRetries:", (char *)objc_msgSend(v25, "uploadRetries") + 1);
    v48 = 0;
    objc_msgSend(v25, "saveToKeychain:", &v48);
    v34 = v48;
    if (v34)
    {
      v35 = sub_10000EF14("SecError");
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "escrowrequest: unable to save last escrow time: %@", buf, 0xCu);
      }

    }
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000B6840;
    v43[3] = &unk_1002DCE00;
    objc_copyWeak(&v47, (id *)buf);
    v37 = v25;
    v44 = v37;
    v38 = v34;
    v45 = v38;
    v39 = v31;
    v46 = v39;
    +[EscrowRequestPerformEscrowEnrollOperation cdpUploadPrerecord:secretType:reply:](EscrowRequestPerformEscrowEnrollOperation, "cdpUploadPrerecord:secretType:reply:", v37, 3, v43);

    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)buf);

  }
LABEL_45:

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

- (unint64_t)numberOfRecordsUploaded
{
  return *(unint64_t *)((char *)&self->_intendedState + 6);
}

- (void)setNumberOfRecordsUploaded:(unint64_t)a3
{
  *(OctagonStateString **)((char *)&self->_intendedState + 6) = (OctagonStateString *)a3;
}

- (BOOL)enforceRateLimiting
{
  return self->_enforceRateLimiting;
}

- (void)setEnforceRateLimiting:(BOOL)a3
{
  self->_enforceRateLimiting = a3;
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 158, 1);
}

- (void)setLockStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_numberOfRecordsUploaded + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)(&self->_enforceRateLimiting + 6), 0);
}

+ (void)cdpUploadPrerecord:(id)a3 secretType:(unint64_t)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a5;
  v8 = a3;
  v9 = objc_alloc((Class)CDPStateController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CDPContext contextForPrimaryAccount](CDPContext, "contextForPrimaryAccount"));
  v11 = objc_msgSend(v9, "initWithContext:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B6D14;
  v14[3] = &unk_1002DF000;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v11, "attemptToEscrowPreRecord:preRecordUUID:secretType:completion:", CFSTR("unknown-local-passcode"), v12, a4, v14);

}

@end
