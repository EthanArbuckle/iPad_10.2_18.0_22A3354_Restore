@implementation EscrowRequestInformCloudServicesOperation

- (EscrowRequestInformCloudServicesOperation)initWithIntendedState:(id)a3 errorState:(id)a4 lockStateTracker:(id)a5
{
  id v9;
  id v10;
  id v11;
  EscrowRequestInformCloudServicesOperation *v12;
  EscrowRequestInformCloudServicesOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EscrowRequestInformCloudServicesOperation;
  v12 = -[CKKSResultOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_intendedState, a3);
    objc_storeStrong((id *)&v13->_nextState, a4);
    objc_storeStrong((id *)&v13->_lockStateTracker, a5);
  }

  return v13;
}

- (void)main
{
  const void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  id v22;
  const void *v23;
  NSObject *v24;
  void *v25;
  unsigned int v26;
  const void *v27;
  NSObject *v28;
  const __CFString *v29;
  const void *v30;
  NSObject *v31;
  const void *v32;
  NSObject *v33;
  void *v34;
  unsigned int v35;
  const void *v36;
  NSObject *v37;
  __CFString **v38;
  const void *v39;
  NSObject *v40;
  id v41;
  const void *v42;
  NSObject *v43;
  const void *v44;
  NSObject *v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;

  v3 = sub_10000EF14("escrowrequest");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Telling CloudServices about any pending requests", buf, 2u);
  }

  v53 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowPendingRecord loadAllFromKeychain:](SecEscrowPendingRecord, "loadAllFromKeychain:", &v53));
  v6 = v53;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    if ((objc_msgSend(v8, "isEqualToString:", NSOSStatusErrorDomain) & 1) != 0)
    {
      v9 = objc_msgSend(v7, "code");

      if (v9 == (id)-25300)
        goto LABEL_6;
    }
    else
    {

    }
    v32 = sub_10000EF14("escrowrequest");
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v7;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "failed to fetch records from keychain: %@", buf, 0xCu);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestInformCloudServicesOperation lockStateTracker](self, "lockStateTracker"));
    v35 = objc_msgSend(v34, "isLockedError:", v7);

    if (v35)
    {
      v36 = sub_10000EF14("escrowrequest");
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Trying again after unlock", buf, 2u);
      }

      v38 = &off_1002EAFF8;
    }
    else
    {
      v38 = &off_1002EB000;
    }
    -[EscrowRequestInformCloudServicesOperation setNextState:](self, "setNextState:", *v38);
    -[CKKSResultOperation setError:](self, "setError:", v7);
    goto LABEL_50;
  }
LABEL_6:

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v50;
LABEL_8:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v14);
      if (!objc_msgSend(v15, "hasCertCached"))
        break;
      if (v12 == (id)++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        if (v12)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
    v16 = v15;

    if (!v16)
      goto LABEL_25;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serializedReason"));
    v48 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[EscrowRequestInformCloudServicesOperation triggerCloudServicesPasscodeRequest:serializedReason:error:](EscrowRequestInformCloudServicesOperation, "triggerCloudServicesPasscodeRequest:serializedReason:error:", v17, v18, &v48));
    v7 = v48;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v20, "timeIntervalSince1970");
    objc_msgSend(v16, "setLastCloudServicesTriggerTime:", (unint64_t)(v21 * 1000.0));

    if (!v19 || v7)
    {
      v39 = sub_10000EF14("SecError");
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v7;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "escrowrequest: cloudservices reports an issue caching the certificate, so we'll have to try again later: %@", buf, 0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v7);
      -[EscrowRequestInformCloudServicesOperation setNextState:](self, "setNextState:", CFSTR("nothing_to_do"));
      v47 = 0;
      objc_msgSend(v16, "saveToKeychain:", &v47);
      v41 = v47;
      if (v41)
      {
        v42 = sub_10000EF14("SecError");
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v41;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "escrowrequest: unable to save the last attempt time: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      objc_msgSend(v16, "setCertCached:", 1);
      v46 = 0;
      objc_msgSend(v16, "saveToKeychain:", &v46);
      v22 = v46;
      if (v22)
      {
        v7 = v22;
        v23 = sub_10000EF14("SecError");
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v7;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "escrowrequest: unable to save escrow update request certificate status, so we'll have to try again later: %@", buf, 0xCu);
        }

        -[CKKSResultOperation setError:](self, "setError:", v7);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestInformCloudServicesOperation lockStateTracker](self, "lockStateTracker"));
        v26 = objc_msgSend(v25, "isLockedError:", v7);

        if (v26)
        {
          v27 = sub_10000EF14("escrowrequest");
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Trying again after unlock", buf, 2u);
          }

          v29 = CFSTR("wait_for_unlock");
        }
        else
        {
          v29 = CFSTR("nothing_to_do");
        }
        -[EscrowRequestInformCloudServicesOperation setNextState:](self, "setNextState:", v29);
      }
      else
      {
        v44 = sub_10000EF14("escrowrequest");
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "CloudService successfully cached a certificate; request is ready for passcode",
            buf,
            2u);
        }

        -[EscrowRequestInformCloudServicesOperation setNextState:](self, "setNextState:", CFSTR("nothing_to_do"));
        v7 = 0;
      }
    }

  }
  else
  {
LABEL_14:

LABEL_25:
    v30 = sub_10000EF14("escrowrequest");
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "No pending escrow request needs a certificate", buf, 2u);
    }

    -[EscrowRequestInformCloudServicesOperation setNextState:](self, "setNextState:", CFSTR("nothing_to_do"));
    v7 = 0;
  }
LABEL_50:

}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88, 1);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLockStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

+ (id)triggerCloudServicesPasscodeRequest:(id)a3 serializedReason:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  const void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  void *v24;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)SecureBackup), "initWithUserActivityLabel:", CFSTR("passcodeRequest"));
  v10 = objc_msgSend(objc_alloc((Class)SecureBackupEscrowReason), "initWithData:", v7);

  v22 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "beginHSA2PasscodeRequest:uuid:reason:error:", 1, v8, v10, &v22));

  v12 = v22;
  v13 = v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 0;
  if (v14)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cert"));

    if (v18)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cert"));
      goto LABEL_15;
    }
    v19 = sub_10000EF14("SecError");
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "escrowrequest: sbd failed to cache a certificate", buf, 2u);
    }

LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  v15 = sub_10000EF14("SecError");
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "escrowrequest: unable to begin passcode request: %@", buf, 0xCu);
  }

  if (!a5)
    goto LABEL_14;
  v17 = 0;
  *a5 = objc_retainAutorelease(v13);
LABEL_15:

  return v17;
}

@end
