@implementation EscrowRequestServer

- (EscrowRequestServer)initWithLockStateTracker:(id)a3
{
  id v4;
  EscrowRequestServer *v5;
  EscrowRequestController *v6;
  EscrowRequestController *controller;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EscrowRequestServer;
  v5 = -[EscrowRequestServer init](&v9, "init");
  if (v5)
  {
    v6 = -[EscrowRequestController initWithLockStateTracker:]([EscrowRequestController alloc], "initWithLockStateTracker:", v4);
    controller = v5->_controller;
    v5->_controller = v6;

  }
  return v5;
}

- (BOOL)triggerEscrowUpdate:(id)a3 error:(id *)a4
{
  return -[EscrowRequestServer triggerEscrowUpdate:options:error:](self, "triggerEscrowUpdate:options:error:", a3, 0, a4);
}

- (BOOL)triggerEscrowUpdate:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100053CFC;
  v22 = sub_100053D0C;
  v23 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100053DFC;
  v15[3] = &unk_1002ED298;
  v17 = &v18;
  v10 = dispatch_semaphore_create(0);
  v16 = v10;
  -[EscrowRequestServer triggerEscrowUpdate:options:reply:](self, "triggerEscrowUpdate:options:reply:", v8, v9, v15);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = v19;
  if (a5)
  {
    v12 = (void *)v19[5];
    if (v12)
    {
      *a5 = objc_retainAutorelease(v12);
      v11 = v19;
    }
  }
  v13 = v11[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)fetchStatuses:(id *)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100053CFC;
  v18 = sub_100053D0C;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100053CFC;
  v12 = sub_100053D0C;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100053D88;
  v7[3] = &unk_1002DDCB8;
  v7[4] = &v14;
  v7[5] = &v8;
  -[EscrowRequestServer fetchRequestStatuses:](self, "fetchRequestStatuses:", v7);
  if (a3)
  {
    v4 = (void *)v9[5];
    if (v4)
      *a3 = objc_retainAutorelease(v4);
  }
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (BOOL)pendingEscrowUpload:(id *)a3
{
  const void *v4;
  NSObject *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_100053CFC;
  v33 = sub_100053D0C;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_100053CFC;
  v27 = sub_100053D0C;
  v28 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100053D14;
  v22[3] = &unk_1002DDCB8;
  v22[4] = &v29;
  v22[5] = &v23;
  -[EscrowRequestServer fetchRequestStatuses:](self, "fetchRequestStatuses:", v22);
  if (v24[5])
  {
    v4 = sub_10000EF14("escrow");
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v24[5];
      *(_DWORD *)buf = 138412290;
      v37 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "failed to fetch escrow statuses: %@", buf, 0xCu);
    }

    if (a3)
    {
      v7 = 0;
      *a3 = objc_retainAutorelease((id)v24[5]);
      goto LABEL_21;
    }
LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
  v8 = (void *)v30[5];
  if (!v8 || !objc_msgSend(v8, "count"))
    goto LABEL_20;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v30[5], "allValues", 0));
  v7 = 0;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v35, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    v12 = SecEscrowRequestHavePrecord;
    v13 = SecEscrowRequestPendingPasscode;
    v14 = SecEscrowRequestPendingCertificate;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v16, "isEqualToString:", v12) & 1) != 0
          || (objc_msgSend(v16, "isEqualToString:", v13) & 1) != 0
          || objc_msgSend(v16, "isEqualToString:", v14))
        {
          v7 = 1;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v35, 16);
    }
    while (v10);
  }

LABEL_21:
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v7 & 1;
}

- (BOOL)escrowCompletedWithinLastSeconds:(double)a3
{
  NSObject *v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100053CE8;
  v7[3] = &unk_1002ED520;
  v9 = &v10;
  v5 = dispatch_semaphore_create(0);
  v8 = v5;
  -[EscrowRequestServer escrowCompletedWithinLastSeconds:reply:](self, "escrowCompletedWithinLastSeconds:reply:", v7, a3);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)cachePrerecord:(id)a3 serializedPrerecord:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  const char *v16;
  id v17;
  const void *v18;
  const void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v24 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowPendingRecord loadFromKeychain:error:](SecEscrowPendingRecord, "loadFromKeychain:error:", v8, &v24));
  v12 = v24;
  if (v12)
  {
    v13 = v12;
    v14 = sub_10000EF14("SecError");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v8;
      v27 = 2112;
      v28 = v13;
      v16 = "escrowrequest: unable to load uuid %@: %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  objc_msgSend(v11, "setSerializedPrerecord:", v9);
  v23 = 0;
  objc_msgSend(v11, "saveToKeychain:", &v23);
  v17 = v23;
  if (v17)
  {
    v13 = v17;
    v18 = sub_10000EF14("SecError");
    v15 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v8;
      v27 = 2112;
      v28 = v13;
      v16 = "escrowrequest: unable to save new prerecord for uuid %@: %@";
      goto LABEL_7;
    }
LABEL_8:

    v10[2](v10, v13);
    goto LABEL_9;
  }
  v19 = sub_10000EF14("escrowrequest");
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "saved new prerecord for uuid %@", buf, 0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestServer controller](self, "controller"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stateMachine"));
  objc_msgSend(v22, "pokeStateMachine");

  v10[2](v10, 0);
LABEL_9:

}

- (void)fetchPrerecord:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, id);
  void *v7;
  id v8;
  const void *v9;
  NSObject *v10;
  const void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  const void *v16;
  NSObject *v17;
  void *v18;
  const void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v5 = a3;
  v6 = (void (**)(id, _QWORD, id))a4;
  v20 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowPendingRecord loadFromKeychain:error:](SecEscrowPendingRecord, "loadFromKeychain:error:", v5, &v20));
  v8 = v20;
  if (v8)
  {
    v9 = sub_10000EF14("SecError");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v5;
      v23 = 2112;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "escrowrequest: unable to load prerecord with uuid %@: %@", buf, 0x16u);
    }

    v6[2](v6, 0, v8);
    goto LABEL_16;
  }
  if (objc_msgSend(v7, "uploadCompleted"))
  {
    v11 = sub_10000EF14("SecError");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      v13 = "escrowrequest: prerecord for uuid %@ already uploaded";
      v14 = v12;
      v15 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (!objc_msgSend(v7, "hasSerializedPrerecord"))
  {
    v19 = sub_10000EF14("SecError");
    v12 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v5;
      v23 = 2112;
      v24 = 0;
      v13 = "escrowrequest: no prerecord for uuid %@: %@";
      v14 = v12;
      v15 = 22;
      goto LABEL_14;
    }
LABEL_15:

    v6[2](v6, 0, 0);
    goto LABEL_16;
  }
  v16 = sub_10000EF14("escrowrequest");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "fetched prerecord for uuid %@", buf, 0xCu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serializedPrerecord"));
  ((void (**)(id, void *, id))v6)[2](v6, v18, 0);

LABEL_16:
}

- (void)fetchRequestWaitingOnPasscode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  const void *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  const void *v23;
  const void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];

  v3 = a3;
  v34 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowPendingRecord loadAllFromKeychain:](SecEscrowPendingRecord, "loadAllFromKeychain:", &v34));
  v5 = v34;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if ((objc_msgSend(v7, "isEqualToString:", NSOSStatusErrorDomain) & 1) != 0)
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == (id)-25300)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
        objc_msgSend(v9, "setDateProperty:forKey:", 0, CFSTR("ERSPending"));

        (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
        goto LABEL_30;
      }
    }
    else
    {

    }
LABEL_24:
    (*((void (**)(id, _QWORD, void *))v3 + 2))(v3, 0, v6);
    goto LABEL_30;
  }
  if (!v4)
    goto LABEL_24;
  v28 = v4;
  v29 = v3;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
LABEL_8:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
      if ((objc_msgSend(v15, "certCached", v28) & 1) != 0)
        break;
      v23 = sub_10000EF14("escrowrequest");
      v18 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));
        *(_DWORD *)buf = 138412290;
        v36 = v20;
        v21 = v18;
        v22 = "Escrow request %@ doesn't yet have a certificate cached";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);

      }
LABEL_18:

      if (v12 == (id)++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        if (v12)
          goto LABEL_8;
        goto LABEL_20;
      }
    }
    v16 = objc_msgSend(v15, "hasSerializedPrerecord");
    v17 = sub_10000EF14("escrowrequest");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (v19)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));
        *(_DWORD *)buf = 138412290;
        v36 = v26;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Escrow request %@ is pending a passcode", buf, 0xCu);

      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));
      v3 = v29;
      (*((void (**)(id, void *, _QWORD))v29 + 2))(v29, v27, 0);

      goto LABEL_29;
    }
    if (!v19)
      goto LABEL_18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));
    *(_DWORD *)buf = 138412290;
    v36 = v20;
    v21 = v18;
    v22 = "Escrow request %@ already has a prerecord; no passcode needed";
    goto LABEL_17;
  }
LABEL_20:

  v24 = sub_10000EF14("escrowrequest");
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No escrow requests need a passcode", buf, 2u);
  }

  v3 = v29;
  (*((void (**)(id, _QWORD, _QWORD))v29 + 2))(v29, 0, 0);
LABEL_29:
  v4 = v28;
LABEL_30:

}

- (void)triggerEscrowUpdate:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  const void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = sub_10000EF14("escrowrequest");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Triggering an escrow update request due to '%@'", (uint8_t *)&v14, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestServer controller](self, "controller"));
  objc_msgSend(v13, "triggerEscrowUpdateRPC:options:reply:", v8, v10, v9);

}

- (void)fetchRequestStatuses:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  const void *v9;
  NSObject *v10;
  const void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  unsigned int v25;
  const void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void (**v30)(id, void *, _QWORD);
  const __CFString *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v36 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowPendingRecord loadAllFromKeychain:](SecEscrowPendingRecord, "loadAllFromKeychain:", &v36));
  v5 = v36;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if ((objc_msgSend(v7, "isEqualToString:", NSOSStatusErrorDomain) & 1) != 0)
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == (id)-25300)
      {
        v9 = sub_10000EF14("escrowrequest");
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "no extant requests", buf, 2u);
        }

        v3[2](v3, &__NSDictionary0__struct, 0);
        goto LABEL_28;
      }
    }
    else
    {

    }
    v26 = sub_10000EF14("SecError");
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v6;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "escrowrequest: failed to load requests: %@", buf, 0xCu);
    }

    ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
  }
  else
  {
    v28 = 0;
    v30 = v3;
    v11 = sub_10000EF14("escrowrequest");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "found requests: %@", buf, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = v4;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      v31 = (const __CFString *)SecEscrowRequestPendingCertificate;
      v18 = (const __CFString *)SecEscrowRequestPendingPasscode;
      v19 = (const __CFString *)SecEscrowRequestHavePrecord;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v21, "uploadCompleted", v28))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uuid"));
            v23 = v13;
            v24 = CFSTR("complete");
          }
          else if (objc_msgSend(v21, "hasSerializedPrerecord"))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uuid"));
            v23 = v13;
            v24 = v19;
          }
          else
          {
            v25 = objc_msgSend(v21, "certCached");
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uuid"));
            v23 = v13;
            if (v25)
              v24 = v18;
            else
              v24 = v31;
          }
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, v22);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v16);
    }

    v3 = v30;
    v30[2](v30, v13, 0);

    v6 = v28;
    v4 = v29;
  }
LABEL_28:

}

- (void)resetAllRequests:(id)a3
{
  void (**v3)(id, _QWORD);
  const void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  const void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const void *v20;
  NSObject *v21;
  const void *v22;
  NSObject *v23;
  void *v24;
  void (**v25)(_QWORD, id);
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];

  v3 = (void (**)(id, _QWORD))a3;
  v4 = sub_10000EF14("escrowrequest");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deleting all requests", buf, 2u);
  }

  v31 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowPendingRecord loadAllFromKeychain:](SecEscrowPendingRecord, "loadAllFromKeychain:", &v31));
  v7 = v31;
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    if ((objc_msgSend(v9, "isEqualToString:", NSOSStatusErrorDomain) & 1) != 0)
    {
      v10 = objc_msgSend(v8, "code");

      if (v10 == (id)-25300)
      {
        v11 = sub_10000EF14("escrowrequest");
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "no extant requests; nothing to delete",
            buf,
            2u);
        }

        v3[2](v3, 0);
        goto LABEL_27;
      }
    }
    else
    {

    }
    v22 = sub_10000EF14("escrowrequest");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "error fetching records: %@", buf, 0xCu);
    }

    ((void (**)(id, id))v3)[2](v3, v8);
  }
  else
  {
    v24 = v6;
    v25 = (void (**)(_QWORD, id))v3;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v14)
    {
      v15 = v14;
      v8 = 0;
      v16 = *(_QWORD *)v28;
      do
      {
        v17 = 0;
        v18 = v8;
        do
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v17);
          v26 = v18;
          objc_msgSend(v19, "deleteFromKeychain:", &v26, v24);
          v8 = v26;

          if (v8)
          {
            v20 = sub_10000EF14("escrowrequest");
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v33 = v19;
              v34 = 2112;
              v35 = v8;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Unable to delete %@: %@", buf, 0x16u);
            }

          }
          v17 = (char *)v17 + 1;
          v18 = v8;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v15);
    }
    else
    {
      v8 = 0;
    }

    v3 = (void (**)(id, _QWORD))v25;
    v25[2](v25, v8);
    v6 = v24;
  }
LABEL_27:

}

- (void)storePrerecordsInEscrow:(id)a3
{
  id v4;
  const void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = sub_10000EF14("escrowrequest");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "attempting to store a prerecord in escrow", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestServer controller](self, "controller"));
  objc_msgSend(v7, "storePrerecordsInEscrowRPC:", v4);

}

- (void)escrowCompletedWithinLastSeconds:(double)a3 reply:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;

  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  v21 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowPendingRecord loadAllFromKeychain:](SecEscrowPendingRecord, "loadAllFromKeychain:", &v21));
  v7 = v21;
  v8 = v7;
  if (!v7)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = v6;
    v11 = (uint64_t)-[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (!v11)
    {
LABEL_19:

      goto LABEL_20;
    }
    v13 = *(_QWORD *)v18;
LABEL_7:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(v12);
      v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
      if (objc_msgSend(v15, "uploadCompleted", (_QWORD)v17))
      {
        if ((objc_msgSend(v15, "escrowAttemptedWithinLastSeconds:", a3) & 1) != 0)
          break;
      }
      if (v11 == ++v14)
      {
        v11 = (uint64_t)-[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v11)
          goto LABEL_7;
        goto LABEL_19;
      }
    }
LABEL_18:
    v11 = 1;
    goto LABEL_19;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  if ((objc_msgSend(v9, "isEqualToString:", NSOSStatusErrorDomain) & 1) == 0)
  {

LABEL_16:
    v16 = sub_10000EF14("SecError");
    v12 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "escrowrequest: failed to load requests: %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  v10 = objc_msgSend(v8, "code");

  if (v10 != (id)-25300)
    goto LABEL_16;
  v11 = 0;
LABEL_20:
  v5[2](v5, v11, 0);

}

- (void)setupAnalytics
{
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
  v2 = objc_msgSend(v3, "AddMultiSamplerForName:withTimeInterval:block:", CFSTR("escorwrequest-healthSummary"), &stru_1002DBFD0, SFAnalyticsSamplerIntervalOncePerReport);

}

- (EscrowRequestController)controller
{
  return (EscrowRequestController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

+ (id)server
{
  if (qword_100340EC8 != -1)
    dispatch_once(&qword_100340EC8, &stru_1002DBF90);
  return (id)qword_100340EC0;
}

+ (id)request:(id *)a3
{
  return +[EscrowRequestServer server](EscrowRequestServer, "server", a3);
}

@end
