@implementation SOSAccount

- (void)dealloc
{
  __SecKey *accountKey;
  __SecKey *accountPrivateKey;
  __SecKey *previousAccountKey;
  __SecKey *peerPublicKey;
  __SecKey *octagonSigningFullKeyRef;
  __SecKey *octagonEncryptionFullKeyRef;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  if (self)
  {
    accountKey = self->_accountKey;
    if (accountKey)
    {
      self->_accountKey = 0;
      CFRelease(accountKey);
    }
    accountPrivateKey = self->_accountPrivateKey;
    if (accountPrivateKey)
    {
      self->_accountPrivateKey = 0;
      CFRelease(accountPrivateKey);
    }
    previousAccountKey = self->_previousAccountKey;
    if (previousAccountKey)
    {
      self->_previousAccountKey = 0;
      CFRelease(previousAccountKey);
    }
    peerPublicKey = self->_peerPublicKey;
    if (peerPublicKey)
    {
      self->_peerPublicKey = 0;
      CFRelease(peerPublicKey);
    }
    octagonSigningFullKeyRef = self->_octagonSigningFullKeyRef;
    if (octagonSigningFullKeyRef)
    {
      self->_octagonSigningFullKeyRef = 0;
      CFRelease(octagonSigningFullKeyRef);
    }
    octagonEncryptionFullKeyRef = self->_octagonEncryptionFullKeyRef;
    if (octagonEncryptionFullKeyRef)
    {
      self->_octagonEncryptionFullKeyRef = 0;
      CFRelease(octagonEncryptionFullKeyRef);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount performBackups](self, "performBackups"));
    objc_msgSend(v9, "cancel");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount performRingUpdates](self, "performRingUpdates"));
    objc_msgSend(v10, "cancel");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
    objc_msgSend(v11, "haltOperation");

  }
  v12.receiver = self;
  v12.super_class = (Class)SOSAccount;
  -[SOSAccount dealloc](&v12, "dealloc");
}

- (void)setAccountKey:(__SecKey *)a3
{
  __SecKey *accountKey;

  accountKey = self->_accountKey;
  if (accountKey != a3)
  {
    if (!a3 || (CFRetain(a3), (accountKey = self->_accountKey) != 0))
      CFRelease(accountKey);
    self->_accountKey = a3;
  }
}

- (void)setAccountPrivateKey:(__SecKey *)a3
{
  __SecKey *accountPrivateKey;

  accountPrivateKey = self->_accountPrivateKey;
  if (accountPrivateKey != a3)
  {
    if (!a3 || (CFRetain(a3), (accountPrivateKey = self->_accountPrivateKey) != 0))
      CFRelease(accountPrivateKey);
    self->_accountPrivateKey = a3;
  }
}

- (void)setPreviousAccountKey:(__SecKey *)a3
{
  __SecKey *previousAccountKey;

  previousAccountKey = self->_previousAccountKey;
  if (previousAccountKey != a3)
  {
    if (!a3 || (CFRetain(a3), (previousAccountKey = self->_previousAccountKey) != 0))
      CFRelease(previousAccountKey);
    self->_previousAccountKey = a3;
  }
}

- (void)setPeerPublicKey:(__SecKey *)a3
{
  __SecKey *peerPublicKey;

  peerPublicKey = self->_peerPublicKey;
  if (peerPublicKey != a3)
  {
    if (!a3 || (CFRetain(a3), (peerPublicKey = self->_peerPublicKey) != 0))
      CFRelease(peerPublicKey);
    self->_peerPublicKey = a3;
  }
}

- (BOOL)hasPeerInfo
{
  return -[SOSAccount fullPeerInfo](self, "fullPeerInfo") != 0;
}

- (__OpaqueSOSPeerInfo)peerInfo
{
  void *v2;
  __OpaqueSOSPeerInfo *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  v3 = (__OpaqueSOSPeerInfo *)objc_msgSend(v2, "peerInfo");

  return v3;
}

- (__OpaqueSOSFullPeerInfo)fullPeerInfo
{
  void *v2;
  __OpaqueSOSFullPeerInfo *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  v3 = (__OpaqueSOSFullPeerInfo *)objc_msgSend(v2, "fullPeerInfo");

  return v3;
}

- (NSString)peerID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "peerID"));

  return (NSString *)v3;
}

- (BOOL)ensureFactoryCircles
{
  void *v3;
  SOSAccount *v4;
  void *v5;
  id v6;
  const void *v7;
  SOSMessageKVS *v8;
  SOSAccount *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CKKeyParameter *v16;
  SOSKVSCircleStorageTransport *v17;
  void *v18;

  if (-[SOSAccount factory](self, "factory"))
  {
    v3 = (void *)(*(uint64_t (**)(void))-[SOSAccount factory](self, "factory"))();
    if (!v3)
    {
      LOBYTE(v8) = 0;
LABEL_19:

      return (char)v8;
    }
    v4 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](v4, "trust"));
    v6 = objc_msgSend(v5, "trustedCircle");
    if (v6)
    {
      v7 = v6;
      CFRetain(v6);

    }
    else
    {
      v7 = (const void *)SOSCircleCreate(0, v3, 0);
      -[SOSAccount setKey_interests_need_updating:](v4, "setKey_interests_need_updating:", 1);
      objc_msgSend(v5, "setTrustedCircle:", v7);
      -[SOSAccount sosEvaluateIfNeeded](v4, "sosEvaluateIfNeeded");

      if (!v7)
      {
LABEL_9:
        v9 = v4;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount key_transport](v9, "key_transport"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount key_transport](v9, "key_transport"));
          sub_1001F3460(v11);

        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount circle_transport](v9, "circle_transport"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount circle_transport](v9, "circle_transport"));
          sub_1001F33D8(v13);

        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount kvs_message_transport](v9, "kvs_message_transport"));

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount kvs_message_transport](v9, "kvs_message_transport"));
          sub_1001F3320(v15);

        }
        v16 = -[CKKeyParameter initWithAccount:]([CKKeyParameter alloc], "initWithAccount:", v9);
        -[SOSAccount setKey_transport:](v9, "setKey_transport:", v16);

        v17 = -[SOSKVSCircleStorageTransport initWithAccount:andCircleName:]([SOSKVSCircleStorageTransport alloc], "initWithAccount:andCircleName:", v9, v3);
        -[SOSAccount setCircle_transport:](v9, "setCircle_transport:", v17);

        v8 = (SOSMessageKVS *)objc_claimAutoreleasedReturnValue(-[SOSAccount key_transport](v9, "key_transport"));
        if (v8)
        {
          v8 = (SOSMessageKVS *)objc_claimAutoreleasedReturnValue(-[SOSAccount circle_transport](v9, "circle_transport"));

          if (v8)
          {
            v8 = -[SOSMessageKVS initWithAccount:andName:]([SOSMessageKVS alloc], "initWithAccount:andName:", v9, v3);
            -[SOSAccount setKvs_message_transport:](v9, "setKvs_message_transport:", v8);

            v18 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount kvs_message_transport](v9, "kvs_message_transport"));
            LOBYTE(v8) = v18 != 0;

          }
        }

        goto LABEL_19;
      }
    }
    CFRelease(v7);
    goto LABEL_9;
  }
  LOBYTE(v8) = 0;
  return (char)v8;
}

- (void)ensureOctagonPeerKeys
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSLockStateTracker globalTracker](CKKSLockStateTracker, "globalTracker"));
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    v5 = objc_msgSend(v3, "isLocked");
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount circle_transport](self, "circle_transport"));
      objc_msgSend(v6, "ensureOctagonPeerKeys:", v7);

      v4 = v8;
    }
  }

}

- (SOSAccount)initWithGestalt:(__CFDictionary *)a3 factory:(SOSDataSourceFactory *)a4
{
  char *v6;
  dispatch_queue_t v7;
  void *v8;
  id v9;
  void *v10;
  SOSAccountTrustClassic *v11;
  void *v12;
  void *v13;
  SOSAccountTrustClassic *v14;
  void *v15;
  SOSAccountTrustClassic *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  CFStringRef v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)SOSAccount;
  v6 = -[SOSAccount init](&v35, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("Account Queue", 0);
    v8 = (void *)*((_QWORD *)v6 + 12);
    *((_QWORD *)v6 + 12) = v7;

    v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", a3);
    v10 = (void *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 8) = v9;

    v11 = [SOSAccountTrustClassic alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v14 = -[SOSAccountTrustClassic initWithRetirees:fpi:circle:departureCode:peerExpansion:](v11, "initWithRetirees:fpi:circle:departureCode:peerExpansion:", v12, 0, 0, 0, v13);

    v15 = (void *)*((_QWORD *)v6 + 11);
    *((_QWORD *)v6 + 11) = v14;
    v16 = v14;

    v6[8] = 0;
    *((_QWORD *)v6 + 5) = 0;
    v17 = (void *)*((_QWORD *)v6 + 15);
    *((_QWORD *)v6 + 14) = a4;
    *((_QWORD *)v6 + 15) = 0;

    v18 = (void *)*((_QWORD *)v6 + 13);
    *((_QWORD *)v6 + 13) = 0;

    *((_DWORD *)v6 + 6) = -1;
    v19 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v20 = (void *)*((_QWORD *)v6 + 20);
    *((_QWORD *)v6 + 20) = v19;

    v21 = (void *)*((_QWORD *)v6 + 16);
    *((_QWORD *)v6 + 16) = 0;

    v22 = (void *)*((_QWORD *)v6 + 17);
    *((_QWORD *)v6 + 17) = 0;

    v23 = (void *)*((_QWORD *)v6 + 19);
    *((_QWORD *)v6 + 19) = 0;

    v24 = (void *)*((_QWORD *)v6 + 18);
    *((_QWORD *)v6 + 18) = 0;

    *(_DWORD *)(v6 + 9) = 0;
    v25 = (void *)*((_QWORD *)v6 + 9);
    *((_QWORD *)v6 + 9) = 0;

    v26 = (void *)*((_QWORD *)v6 + 10);
    *((_QWORD *)v6 + 10) = 0;

    v27 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v28 = (void *)*((_QWORD *)v6 + 21);
    *((_QWORD *)v6 + 21) = v27;

    v6[13] = 0;
    v29 = (void *)*((_QWORD *)v6 + 22);
    *((_QWORD *)v6 + 22) = 0;

    *((_QWORD *)v6 + 4) = 0;
    *((_QWORD *)v6 + 6) = 0;
    *((_QWORD *)v6 + 7) = 0;
    v30 = (void *)*((_QWORD *)v6 + 23);
    *((_QWORD *)v6 + 23) = 0;

    v31 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.security.sosaccount"));
    v32 = (void *)*((_QWORD *)v6 + 24);
    *((_QWORD *)v6 + 24) = v31;

    objc_msgSend(v6, "SOSMonitorModeSOSIsActive");
    objc_msgSend(v6, "ensureFactoryCircles");
    v33 = sub_1001E6B2C(v6);
    if (v33)
      CFRelease(v33);
    v6[21] = 0;
    *(_DWORD *)(v6 + 17) = 0;
    objc_msgSend(v6, "setupStateMachine");
  }
  return (SOSAccount *)v6;
}

- (void)startStateMachine
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  objc_msgSend(v2, "startOperation");

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = objc_opt_class(SOSAccount);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount gestalt](self, "gestalt"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gestalt"));
    if (!objc_msgSend(v7, "isEqual:", v8))
    {
      v20 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
    v10 = objc_msgSend(v9, "trustedCircle");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trust"));
    v12 = objc_msgSend(v11, "trustedCircle");
    if (v10 && v12)
    {
      if (CFEqual(v10, v12))
      {
LABEL_6:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "expansion"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trust"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "expansion"));
        v24 = v14;
        if (objc_msgSend(v14, "isEqual:", v15))
        {
          v22 = v13;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
          v17 = objc_msgSend(v16, "fullPeerInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trust"));
          v19 = objc_msgSend(v18, "fullPeerInfo");
          if (v17 && v19)
            v20 = CFEqual(v17, v19) != 0;
          else
            v20 = v17 == v19;

          v13 = v22;
        }
        else
        {
          v20 = 0;
        }

        goto LABEL_18;
      }
    }
    else if (v10 == v12)
    {
      goto LABEL_6;
    }
    v20 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v20 = 0;
LABEL_20:

  return v20;
}

- (void)setAccountInBypassMode:(BOOL)a3
{
  -[SOSAccount setAccountInScriptBypassMode:](self, "setAccountInScriptBypassMode:", a3);
}

- (void)userPublicKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001CD88C;
  v7[3] = &unk_1002EB078;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)kvsPerformanceCounters:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  global_queue = dispatch_get_global_queue(-2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001CD880;
  v7[3] = &unk_1002EB0A0;
  v8 = v3;
  v6 = v3;
  SOSCloudKeychainRequestPerfCounters(v5, v7);

}

- (void)setBypass:(BOOL)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CD848;
  block[3] = &unk_1002EBC78;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)rateLimitingPerformanceCounters:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, id);

  v6 = (void (**)(id, id))a3;
  v4 = sub_1001CA91C(self, (uint64_t)CFSTR("RateLimitCounters"));
  if (v4)
  {
    v6[2](v6, v4);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    v6[2](v6, v5);

  }
}

- (void)stashedCredentialPublicKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001CD7B8;
  v7[3] = &unk_1002EB078;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)assertStashedAccountCredential:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001CD760;
  v7[3] = &unk_1002EB078;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)syncWaitAndFlush:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 error:(__CFError *)a7
{
  id v11;
  id v12;
  id v13;
  const void *v14;
  NSObject *v15;
  AAFAnalyticsEventSecurity *v16;
  uint64_t v17;
  AAFAnalyticsEventSecurity *v18;
  dispatch_semaphore_t v19;
  const void *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  AAFAnalyticsEventSecurity *v24;
  uint64_t v25;
  AAFAnalyticsEventSecurity *v26;
  BOOL v27;
  const void *v28;
  NSObject *v29;
  const void *v30;
  NSObject *v31;
  __CFError *v32;
  const void *v33;
  NSObject *v34;
  __CFError *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  __int128 buf;
  void (*v44)(uint64_t);
  void *v45;
  dispatch_semaphore_t v46;
  uint64_t *v47;
  __CFError **v48;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = sub_10000EF14("pairing");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sync and wait starting", (uint8_t *)&buf, 2u);
  }

  v16 = [AAFAnalyticsEventSecurity alloc];
  sub_1001CACE0();
  LOBYTE(v37) = a6;
  v18 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v16, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v11, v12, v13, CFSTR("com.apple.security.kVSSyncAndWait"), v17, v37, &off_10030AF70);
  v19 = dispatch_semaphore_create(0);
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v20 = sub_10000EF14("fresh");
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "EFP calling SOSCloudKeychainSynchronizeAndWait", (uint8_t *)&buf, 2u);
  }

  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 3221225472;
  v44 = sub_1001CD4FC;
  v45 = &unk_1002ED5E8;
  v47 = &v39;
  v48 = a7;
  v46 = v19;
  v22 = v19;
  _os_activity_initiate((void *)&_mh_execute_header, "CloudCircle EFRESH", OS_ACTIVITY_FLAG_DEFAULT, &buf);

  v23 = *((unsigned __int8 *)v40 + 24);
  _Block_object_dispose(&v39, 8);
  if (v23)
  {
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v18, 1, 0);
    v24 = [AAFAnalyticsEventSecurity alloc];
    sub_1001CACE0();
    LOBYTE(v38) = a6;
    v26 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v24, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v11, v12, v13, CFSTR("com.apple.security.flush"), v25, v38, &off_10030AF70);
    v27 = sub_1001CCFE8((uint64_t)a7);
    if (v27)
    {
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v26, 1, 0);
      v28 = sub_10000EF14("pairing");
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "finished sync and wait", (uint8_t *)&buf, 2u);
      }

    }
    else
    {
      v33 = sub_10000EF14("pairing");
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        if (a7)
          v35 = *a7;
        else
          v35 = 0;
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "failed flush: %@", (uint8_t *)&buf, 0xCu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v26, 0, *a7);
    }

  }
  else
  {
    v30 = sub_10000EF14("pairing");
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      if (a7)
        v32 = *a7;
      else
        v32 = 0;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "failed sync and wait: %@", (uint8_t *)&buf, 0xCu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v18, 0, *a7);
    v27 = 0;
  }

  return v27;
}

- (void)validatedStashedAccountCredential:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  SOSAccount *v22;
  id v23;
  BOOL v24;
  const void *v25;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v25 = 0;
  if (-[SOSAccount syncWaitAndFlush:flowID:deviceSessionID:canSendMetrics:error:](self, "syncWaitAndFlush:flowID:deviceSessionID:canSendMetrics:error:", v12, v13, v14, v8, &v25))
  {
    v16 = objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001CD250;
    block[3] = &unk_1002EB0C8;
    v19 = v12;
    v20 = v13;
    v24 = v8;
    v21 = v14;
    v22 = self;
    v23 = v15;
    dispatch_async(v16, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, const void *))v15 + 2))(v15, 0, v25);
    v17 = v25;
    if (v25)
    {
      v25 = 0;
      CFRelease(v17);
    }
  }

}

- (void)stashAccountCredential:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  const void *v24;
  NSObject *v25;
  CFTypeRef v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  cf = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001CCA8C;
  v27[3] = &unk_1002EB118;
  v27[4] = self;
  v19 = v15;
  v28 = v19;
  v20 = v16;
  v29 = v20;
  v21 = v17;
  v30 = v21;
  v33 = a7;
  v22 = v18;
  v32 = v22;
  v23 = v14;
  v31 = v23;
  SOSDoWithCredentialsWhileUnlocked(&cf, v27);
  if (cf)
  {
    v24 = sub_10000EF14("pairing");
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = cf;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to process credentials %@", buf, 0xCu);
    }

    v26 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v26);
    }
  }

}

- (void)myPeerInfo:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t, uint64_t);
  AAFAnalyticsEventSecurity *v16;
  uint64_t v17;
  AAFAnalyticsEventSecurity *v18;
  const void *v19;
  uint64_t v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, uint64_t, uint64_t))a7;
  v16 = [AAFAnalyticsEventSecurity alloc];
  sub_1001CACE0();
  LOBYTE(v20) = a6;
  v18 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v16, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v12, v13, v14, CFSTR("com.apple.security.createSOSApplication"), v17, v20, &off_10030AF70);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1001CB63C;
  v26 = sub_1001CB64C;
  v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001CC940;
  v21[3] = &unk_1002ED048;
  v21[4] = &v28;
  v21[5] = &v22;
  -[SOSAccount performTransaction:](self, "performTransaction:", v21);
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v18, v23[5] != 0, v29[3]);
  v15[2](v15, v23[5], v29[3]);
  v19 = (const void *)v29[3];
  if (v19)
  {
    v29[3] = 0;
    CFRelease(v19);
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

- (void)circleHash:(id)a3
{
  void (**v4)(id, _QWORD, CFTypeRef);
  CFTypeRef v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  CFTypeRef v13;

  v4 = (void (**)(id, _QWORD, CFTypeRef))a3;
  v13 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1001CB63C;
  v11 = sub_1001CB64C;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001CC884;
  v6[3] = &unk_1002EB140;
  v6[4] = self;
  v6[5] = &v7;
  sub_100033998(0, &v13, (uint64_t)v6);
  v4[2](v4, v8[5], v13);
  v5 = v13;
  if (v13)
  {
    v13 = 0;
    CFRelease(v5);
  }
  _Block_object_dispose(&v7, 8);

}

- (id)ghostBustGetDate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));

  if (!v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.security.sosaccount"));
    -[SOSAccount setSettings:](self, "setSettings:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("ghostbustdate")));

  return v6;
}

- (BOOL)ghostBustCheckDate
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount ghostBustGetDate](self, "ghostBustGetDate"));
  v3 = v2;
  v5 = 0;
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    if (v4 <= 0.0)
      v5 = 1;
  }

  return v5;
}

- (void)ghostBustFollowup
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));

  if (!v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.security.sosaccount"));
    -[SOSAccount setSettings:](self, "setSettings:", v4);

  }
  v5 = SOSCreateRandomDateBetweenNowPlus(259200.0, 604800.0);
  v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("ghostbustdate"));

}

- (void)ghostBustSchedule
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount ghostBustGetDate](self, "ghostBustGetDate"));
  if (!v3)
  {
    -[SOSAccount ghostBustFollowup](self, "ghostBustFollowup");
    v3 = 0;
  }

}

- (void)ghostBust:(unsigned int)a3 complete:(id)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  unsigned int v11;
  _QWORD v12[4];
  _QWORD v13[3];
  char v14;

  v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  if (+[SOSAuthKitHelpers accountIsCDPCapable](SOSAuthKitHelpers, "accountIsCDPCapable"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001CC21C;
    v7[3] = &unk_1002EB1B8;
    v9 = v12;
    v7[4] = self;
    v10 = v13;
    v11 = a3;
    v8 = v6;
    +[SOSAuthKitHelpers activeMIDs:](SOSAuthKitHelpers, "activeMIDs:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);

}

- (void)ghostBustPeriodic:(unsigned int)a3 complete:(id)a4
{
  uint64_t v4;
  void *v6;
  double v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount ghostBustGetDate](self, "ghostBustGetDate"));
  objc_msgSend(v6, "timeIntervalSinceNow");
  if (v7 <= 0.0)
  {
    if ((_DWORD)v4)
      -[SOSAccount ghostBust:complete:](self, "ghostBust:complete:", v4, v8);
    else
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

- (void)ghostBustTriggerTimed:(unsigned int)a3 complete:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v8 = v6;
  if (!(_DWORD)v4)
  {
    v7 = +[SOSAccount ghostBustGetRampSettings](SOSAccount, "ghostBustGetRampSettings");
    v6 = v8;
    v4 = v7;
  }
  -[SOSAccount ghostBust:complete:](self, "ghostBust:complete:", v4, v6);

}

- (void)ghostBustInfo:(id)a3
{
  void (**v4)(id, void *, id);
  NSMutableDictionary *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;

  v4 = (void (**)(id, void *, id))a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = +[SOSAccount ghostBustGetRampSettings](SOSAccount, "ghostBustGetRampSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount ghostBustGetDate](self, "ghostBustGetDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));

  if ((v6 & 1) != 0)
    v9 = CFSTR("ON");
  else
    v9 = CFSTR("OFF");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, CFSTR("SOSGhostBustBySerialNumber"));
  if ((v6 & 2) != 0)
    v10 = CFSTR("ON");
  else
    v10 = CFSTR("OFF");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, CFSTR("SOSGhostBustByMID"));
  if ((v6 & 4) != 0)
    v11 = CFSTR("ON");
  else
    v11 = CFSTR("OFF");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, CFSTR("SOSGhostBustSerialByAge"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, CFSTR("SOSAccountGhostBustDate"));
  v17 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 3, &v17));
  v13 = v17;
  if (!v12)
  {
    v14 = sub_10000EF14("ghostbust");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Error during ghostBustInfo JSONification: %@", buf, 0xCu);

    }
  }
  v4[2](v4, v12, v13);

}

- (void)iCloudIdentityStatus_internal:(id)a3
{
  void (**v4)(id, NSMutableDictionary *, _QWORD);
  NSMutableDictionary *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  CFDictionaryRef v17;
  const void *v18;
  NSObject *v19;
  CFTypeRef v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFArray *v27;
  CFTypeID v28;
  const void *v29;
  NSObject *v30;
  CFIndex Count;
  CFTypeRef v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  CFTypeRef result;
  __int128 buf;
  void (*v40)(uint64_t, CFDictionaryRef);
  void *v41;
  _QWORD *v42;
  CFRange v43;

  v4 = (void (**)(id, NSMutableDictionary *, _QWORD))a3;
  v37 = 0;
  v5 = objc_opt_new(NSMutableDictionary);
  if (-[SOSAccount isInCircle:](self, "isInCircle:", &v37))
  {
    v6 = objc_alloc_init((Class)NSMutableSet);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
    v8 = objc_msgSend(v7, "trustedCircle");
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1001CC0D4;
    v35[3] = &unk_1002EC140;
    v9 = v6;
    v36 = v9;
    SOSCircleForEachiCloudIdentityPeer(v8, v35);

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1001CC134;
    v33[3] = &unk_1002EB1E0;
    v10 = objc_alloc_init((Class)NSMutableSet);
    v34 = v10;
    v11 = v33;
    result = 0;
    v17 = sub_10012E96C(kCFAllocatorDefault, (int)kSecReturnAttributes, (int)kCFBooleanTrue, v12, v13, v14, v15, v16, (uint64_t)kSecMatchLimit, (uint64_t)kSecMatchLimitAll);
    if (!SecItemCopyMatching(v17, &result)
      && (v27 = (const __CFArray *)result) != 0
      && (v28 = CFGetTypeID(result), v28 == CFArrayGetTypeID()))
    {
      v29 = sub_10000EF14("iCloudIdentity");
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        Count = CFArrayGetCount(v27);
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = Count;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Screening %ld icloud private key candidates", (uint8_t *)&buf, 0xCu);
      }

      if (v17)
        CFRelease(v17);
      *(_QWORD *)&buf = _NSConcreteStackBlock;
      *((_QWORD *)&buf + 1) = 3221225472;
      v40 = sub_1001D8F88;
      v41 = &unk_1002EB9C8;
      v42 = v11;
      v43.length = CFArrayGetCount(v27);
      v43.location = 0;
      CFArrayApplyFunction(v27, v43, (CFArrayApplierFunction)sub_1001D91DC, &buf);
      v32 = result;
      if (result)
      {
        result = 0;
        CFRelease(v32);
      }

    }
    else
    {
      v18 = sub_10000EF14("iCloudIdentity");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Can't get iCloud Identity private key candidates", (uint8_t *)&buf, 2u);
      }

      if (v17)
        CFRelease(v17);
      v20 = result;
      if (result)
      {
        result = 0;
        CFRelease(v20);
      }
    }

    v21 = objc_msgSend(v9, "mutableCopy");
    if (objc_msgSend(v9, "count") && objc_msgSend(v10, "count"))
    {
      objc_msgSend(v21, "intersectSet:", v10);
    }
    else
    {

      v21 = 0;
    }
    v22 = objc_msgSend(v10, "mutableCopy");
    if (objc_msgSend(v9, "count") && objc_msgSend(v22, "count"))
      objc_msgSend(v22, "minusSet:", v9);
    v23 = objc_msgSend(v9, "mutableCopy");
    if (objc_msgSend(v23, "count") && objc_msgSend(v10, "count"))
      objc_msgSend(v23, "minusSet:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allObjects"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v24, CFSTR("completeIdentity"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allObjects"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v25, CFSTR("keyOnly"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allObjects"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v26, CFSTR("peerOnly"));

    v4[2](v4, v5, 0);
  }
  else
  {
    v4[2](v4, v5, v37);
  }

}

- (void)iCloudIdentityStatus:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001CBFB8;
  v5[3] = &unk_1002EB208;
  v6 = a3;
  v4 = v6;
  -[SOSAccount iCloudIdentityStatus_internal:](self, "iCloudIdentityStatus_internal:", v5);

}

- (id)accountStatusInternal
{
  id v3;
  __CFString *v4;
  void *v5;
  id v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15;
  _QWORD v16[4];
  id v17;
  SOSAccount *v18;
  NSString *v19;
  _QWORD v20[4];
  id v21;
  SOSAccount *v22;
  NSString *v23;
  _QWORD v24[4];
  id v25;
  SOSAccount *v26;
  id v27;
  NSString *v28;
  _QWORD v29[4];
  id v30;
  SOSAccount *v31;
  id v32;
  NSString *v33;
  _QWORD v34[4];
  id v35;
  SOSAccount *v36;
  id v37;
  NSString *v38;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (__CFString *)sub_1001CBC24(self);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("AccountHeader"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  v6 = objc_msgSend(v5, "trustedCircle");

  v7 = -[SOSAccount peerID](self, "peerID");
  if (v6)
  {
    v8 = v7;
    v9 = (void *)SOSCircleCopyStateString(v6, -[SOSAccount accountKey](self, "accountKey"), v7);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("CircleHeader"));

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1001CBDCC;
    v34[3] = &unk_1002EB230;
    v35 = objc_alloc_init((Class)NSMutableArray);
    v36 = self;
    v37 = v6;
    v38 = v8;
    v15 = v35;
    SOSCircleForEachPeer(v6, v34);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("CirclePeers"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1001CBE30;
    v29[3] = &unk_1002EB230;
    v30 = objc_alloc_init((Class)NSMutableArray);
    v31 = self;
    v32 = v6;
    v33 = v8;
    v10 = v30;
    SOSCircleForEachRetiredPeer(v6, v29);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("CircleRetiredPeers"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001CBE94;
    v24[3] = &unk_1002EB230;
    v25 = objc_alloc_init((Class)NSMutableArray);
    v26 = self;
    v27 = v6;
    v28 = v8;
    v11 = v25;
    SOSCircleForEachiCloudIdentityPeer(v6, v24);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("iCloudIdentityPeers"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001CBEF8;
    v20[3] = &unk_1002EB258;
    v21 = objc_alloc_init((Class)NSMutableArray);
    v22 = self;
    v23 = v8;
    v12 = v21;
    SOSCircleForEachApplicant(v6, v20);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("CircleApplicants"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001CBF58;
    v16[3] = &unk_1002EB258;
    v17 = objc_alloc_init((Class)NSMutableArray);
    v18 = self;
    v19 = v8;
    v13 = v17;
    SOSCircleForEachRejectedApplicant(v6, v16);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("CircleRejections"));

  }
  return v3;
}

- (void)accountStatus:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;

  v4 = (void (**)(id, void *, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount accountStatusInternal](self, "accountStatusInternal"));
  v11 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 3, &v11));
  v7 = v11;
  if (!v6)
  {
    v8 = sub_10000EF14("accountLogState");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error during accountStatus JSONification: %@", buf, 0xCu);

    }
  }
  v4[2](v4, v6, v7);

}

- (void)circleJoiningBlob:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 applicant:(id)a7 complete:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, uint64_t, uint64_t);
  AAFAnalyticsEventSecurity *v19;
  uint64_t v20;
  AAFAnalyticsEventSecurity *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  const void *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = (void (**)(id, uint64_t, uint64_t))a8;
  v19 = [AAFAnalyticsEventSecurity alloc];
  sub_1001CACE0();
  LOBYTE(v25) = a6;
  v21 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v19, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v14, v15, v16, CFSTR("com.apple.security.createSOSCircleBlob"), v20, v25, &off_10030AF70);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1001CB63C;
  v38 = sub_1001CB64C;
  v39 = 0;
  v22 = (const void *)SOSPeerInfoCreateFromData(0, &v43, v17);
  if (v22)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001CB654;
    v26[3] = &unk_1002EB2A8;
    v26[4] = self;
    v30 = &v34;
    v27 = v14;
    v28 = v15;
    v33 = a6;
    v29 = v16;
    v31 = &v40;
    v32 = v22;
    sub_1000339F0(0, (uint64_t)v26);
    CFRelease(v22);
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v21, v35[5] != 0, v41[3]);
    v18[2](v18, v35[5], v41[3]);
    v23 = (const void *)v41[3];
    if (v23)
    {
      v41[3] = 0;
      CFRelease(v23);
    }

  }
  else
  {
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v21, 0, v41[3]);
    v18[2](v18, 0, v41[3]);
    v24 = (const void *)v41[3];
    if (v24)
    {
      v41[3] = 0;
      CFRelease(v24);
    }
  }
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
}

- (void)joinCircleWithBlob:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 version:(int)a8 complete:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD, uint64_t);
  id v20;
  id v21;
  id v22;
  void *v23;
  unsigned int v24;
  id v25;
  void *v26;
  uint64_t v27;
  _BOOL4 v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  int IsLegacy;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  int v38;
  const __CFString *v39;
  id v40;
  const void *v41;
  id v42;
  void **v43;
  uint64_t v44;
  void (*v45)(uint64_t, void *);
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  int v53;
  BOOL v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[4];
  _QWORD v64[4];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = (void (**)(id, _QWORD, uint64_t))a9;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v43 = _NSConcreteStackBlock;
  v44 = 3221225472;
  v45 = sub_1001CAF30;
  v46 = &unk_1002EB2D0;
  v42 = v16;
  v47 = v42;
  v20 = v17;
  v48 = v20;
  v21 = v18;
  v54 = a7;
  v49 = v21;
  v51 = &v55;
  v22 = v15;
  v53 = a8;
  v50 = v22;
  v52 = &v59;
  -[SOSAccount performTransaction:](self, "performTransaction:", &v43);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  v24 = objc_msgSend(v23, "isInCircleOnly:", 0);

  if (v60[3])
  {
    v25 = objc_msgSend((id)objc_opt_class(CKKSAnalytics), "logger");
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = v60[3];
    v63[0] = CFSTR("SOSEnabled");
    v28 = -[OTSOSActualAdapter sosEnabled]_0();
    v29 = CFSTR("compat_disabled");
    if (v28)
      v29 = CFSTR("compat_enabled");
    v64[0] = v29;
    v64[1] = CFSTR("Pairing");
    v63[1] = CFSTR("SOSJoinMethod");
    v63[2] = CFSTR("JoiningSOSResult");
    v30 = CFSTR("not_in_circle");
    if (v24)
      v30 = CFSTR("in_circle");
    v64[2] = v30;
    v63[3] = CFSTR("CircleContainsLegacy");
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
    IsLegacy = SOSCircleIsLegacy(objc_msgSend(v31, "trustedCircle"), -[SOSAccount accountKey](self, "accountKey"));
    v33 = CFSTR("does_not_contain_legacy");
    if (IsLegacy)
      v33 = CFSTR("contains_legacy");
    v64[3] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 4));
    objc_msgSend(v26, "logResultForEvent:hardFailure:result:withAttributes:", CFSTR("SOSDeferralEventPairing"), 0, v27, v34);

  }
  else
  {
    if (-[OTSOSActualAdapter sosEnabled]_0())
      v35 = CFSTR("compat_enabled");
    else
      v35 = CFSTR("compat_disabled");
    if (v24)
      v36 = CFSTR("in_circle");
    else
      v36 = CFSTR("not_in_circle");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
    v38 = SOSCircleIsLegacy(objc_msgSend(v37, "trustedCircle"), -[SOSAccount accountKey](self, "accountKey"));
    v39 = CFSTR("does_not_contain_legacy");
    if (v38)
      v39 = CFSTR("contains_legacy");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%@-%@"), v35, CFSTR("Pairing"), v36, v39, v42, v43, v44, v45, v46, v47, v48, v49));

    v40 = objc_msgSend((id)objc_opt_class(CKKSAnalytics), "logger");
    v31 = (void *)objc_claimAutoreleasedReturnValue(v40);
    objc_msgSend(v31, "logSuccessForEventNamed:", v26);
  }

  v19[2](v19, *((unsigned __int8 *)v56 + 24), v60[3]);
  v41 = (const void *)v60[3];
  if (v41)
  {
    v60[3] = 0;
    CFRelease(v41);
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

}

- (void)initialSyncCredentials:(unsigned int)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8
{
  char v12;
  void (**v13)(id, const __CFArray *, CFTypeRef);
  id v14;
  id v15;
  id v16;
  AAFAnalyticsEventSecurity *v17;
  uint64_t v18;
  AAFAnalyticsEventSecurity *v19;
  const __CFArray *Mutable;
  CFIndex Count;
  uint64_t v22;
  CFIndex v23;
  uint64_t v24;
  uint64_t v25;
  CFIndex v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CFTypeRef v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  CFTypeRef cf;
  _QWORD v39[3];
  _QWORD v40[3];
  uint8_t buf[4];
  CFTypeRef v42;

  v12 = a3;
  cf = 0;
  v13 = (void (**)(id, const __CFArray *, CFTypeRef))a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = [AAFAnalyticsEventSecurity alloc];
  sub_1001CACE0();
  LOBYTE(v37) = a7;
  v19 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v17, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v16, v15, v14, CFSTR("com.apple.security.acceptorFetchesInitialSyncData"), v18, v37, &off_10030AF70);

  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  Count = 0;
  if ((v12 & 1) != 0)
  {
    v22 = sub_1000119B8((uint64_t)CFSTR("inet"), &qword_100341250, (uint64_t)&unk_100341248);
    if ((sub_10013E02C((uint64_t)Mutable, 0, (const __CFBoolean *)CFSTR("com.apple.security.ckks"), 0, v22, (__CFString **)&cf) & 1) == 0)
    {
      v35 = sub_10000EF14("SecError");
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      *(_DWORD *)buf = 138412290;
      v42 = cf;
      v36 = "failed to collect CKKS-inet keys: %@";
      goto LABEL_30;
    }
    Count = CFArrayGetCount(Mutable);
  }
  if ((v12 & 2) != 0)
  {
    v24 = sub_1000119B8((uint64_t)CFSTR("genp"), &qword_100341240, (uint64_t)&unk_100341238);
    if ((sub_10013E02C((uint64_t)Mutable, 0, (const __CFBoolean *)CFSTR("com.apple.ProtectedCloudStorage"), 0, v24, (__CFString **)&cf) & 1) != 0)
    {
      v25 = sub_1000119B8((uint64_t)CFSTR("inet"), &qword_100341250, (uint64_t)&unk_100341248);
      if ((sub_10013E02C((uint64_t)Mutable, (v12 & 4) == 0, (const __CFBoolean *)CFSTR("com.apple.ProtectedCloudStorage"), 0, v25, (__CFString **)&cf) & 1) != 0)
      {
        v23 = CFArrayGetCount(Mutable) - Count;
        if ((v12 & 8) != 0)
          goto LABEL_11;
LABEL_10:
        v26 = 0;
        goto LABEL_15;
      }
      v35 = sub_10000EF14("SecError");
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      *(_DWORD *)buf = 138412290;
      v42 = cf;
      v36 = "failed to collect PCS-inet keys: %@";
    }
    else
    {
      v35 = sub_10000EF14("SecError");
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      *(_DWORD *)buf = 138412290;
      v42 = cf;
      v36 = "failed to collect PCS-genp keys: %@";
    }
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
    goto LABEL_31;
  }
  v23 = 0;
  if ((v12 & 8) == 0)
    goto LABEL_10;
LABEL_11:
  v27 = sub_1000119B8((uint64_t)CFSTR("genp"), &qword_100341240, (uint64_t)&unk_100341238);
  if ((sub_10013E02C((uint64_t)Mutable, 0, (const __CFBoolean *)CFSTR("com.apple.nanoregistry.migration"), 0, v27, (__CFString **)&cf) & 1) == 0)
  {
    v35 = sub_10000EF14("SecError");
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 138412290;
    v42 = cf;
    v36 = "failed to collect com.apple.nanoregistry.migration-genp item: %@";
    goto LABEL_30;
  }
  v28 = sub_1000119B8((uint64_t)CFSTR("genp"), &qword_100341240, (uint64_t)&unk_100341238);
  if ((sub_10013E02C((uint64_t)Mutable, 0, (const __CFBoolean *)CFSTR("com.apple.nanoregistry.migration2"), 0, v28, (__CFString **)&cf) & 1) == 0)
  {
    v35 = sub_10000EF14("SecError");
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 138412290;
    v42 = cf;
    v36 = "failed to collect com.apple.nanoregistry.migration2-genp item: %@";
    goto LABEL_30;
  }
  v29 = sub_1000119B8((uint64_t)CFSTR("genp"), &qword_100341240, (uint64_t)&unk_100341238);
  if ((sub_10013E02C((uint64_t)Mutable, 0, (const __CFBoolean *)CFSTR("com.apple.bluetooth"), (const __CFBoolean *)CFSTR("BluetoothLESync"), v29, (__CFString **)&cf) & 1) == 0)
  {
    v35 = sub_10000EF14("SecError");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = cf;
      v36 = "failed to collect com.apple.bluetooth-genp item: %@";
      goto LABEL_30;
    }
LABEL_31:
    Count = 0;
    v23 = 0;
    goto LABEL_10;
  }
  v26 = CFArrayGetCount(Mutable) - (v23 + Count);
LABEL_15:
  v39[0] = CFSTR("numberOfTLKsFetched");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", Count));
  v40[0] = v30;
  v39[1] = CFSTR("numberOfPCSItemsFetched");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v23));
  v40[1] = v31;
  v39[2] = CFSTR("numberOfBluetoothMigrationItemsFetched");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v26));
  v40[2] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 3));

  -[AAFAnalyticsEventSecurity addMetrics:](v19, "addMetrics:", v33);
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v19, cf == 0);
  v13[2](v13, Mutable, cf);

  v34 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v34);
  }

}

- (void)importInitialSyncCredentials:(id)a3 complete:(id)a4
{
  void (**v5)(id, uint64_t, CFTypeRef);
  uint64_t v6;
  CFTypeRef v7;
  CFTypeRef cf;
  _QWORD v9[6];

  cf = 0;
  v5 = (void (**)(id, uint64_t, CFTypeRef))a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000;
  v9[2] = sub_10013E45C;
  v9[3] = &unk_1002E81A0;
  v9[4] = &cf;
  v9[5] = a3;
  v6 = sub_100011A30(1, 1, 0, (uint64_t)&cf, (uint64_t)v9);
  v5[2](v5, v6, cf);

  v7 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v7);
  }
}

- (void)rpcTriggerSync:(id)a3 complete:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  const void *v8;
  NSObject *v9;
  CFTypeRef *v10;
  id v11;
  const void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v8 = sub_10000EF14("sync");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "trigger a forced sync for %@", buf, 0xCu);
  }

  v10 = (CFTypeRef *)(v22 + 3);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001CAB94;
  v13[3] = &unk_1002EB320;
  v13[4] = self;
  v11 = v6;
  v14 = v11;
  v15 = &v21;
  v16 = &v17;
  sub_100033998(0, v10, (uint64_t)v13);
  v7[2](v7, *((unsigned __int8 *)v18 + 24), v22[3]);
  v12 = (const void *)v22[3];
  if (v12)
  {
    v22[3] = 0;
    CFRelease(v12);
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

}

- (void)rpcTriggerBackup:(id)a3 complete:(id)a4
{
  id v6;
  void (**v7)(id, CFTypeRef);
  void *v8;
  id v9;
  uint64_t v10;
  CFTypeRef v11;
  CFTypeRef cf;

  v6 = a3;
  cf = 0;
  v7 = (void (**)(id, CFTypeRef))a4;
  if (!objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount kvs_message_transport](self, "kvs_message_transport"));
    v9 = objc_msgSend(v8, "SOSTransportMessageGetEngine");

    v10 = sub_1001047F4((uint64_t)v9, (uint64_t)&cf);
    v6 = (id)v10;
  }
  -[SOSAccount triggerBackupForPeers:](self, "triggerBackupForPeers:", v6);
  v7[2](v7, cf);

  v11 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v11);
  }

}

- (void)rpcTriggerRingUpdate:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[SOSAccount triggerRingUpdate](self, "triggerRingUpdate");
  v4[2](v4, 0);

}

- (void)getWatchdogParameters:(id)a3
{
  void (**v3)(id, id, _QWORD);
  Class v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  v3 = (void (**)(id, id, _QWORD))a3;
  v4 = NSClassFromString(CFSTR("SecdWatchdog"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class watchdog](v4, "watchdog"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "watchdogParameters"));

    v3[2](v3, v8, 0);
  }
  else
  {
    v9 = NSLocalizedDescriptionKey;
    v10 = CFSTR("failed to lookup SecdWatchdog class from ObjC runtime");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.securityd.watchdog"), 1, v6));
    ((void (**)(id, id, void *))v3)[2](v3, 0, v7);

  }
}

- (void)setWatchdogParmeters:(id)a3 complete:(id)a4
{
  id v5;
  void (**v6)(id, id);
  Class v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  v5 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = NSClassFromString(CFSTR("SecdWatchdog"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class watchdog](v7, "watchdog"));
    v11 = 0;
    objc_msgSend(v8, "setWatchdogParameters:error:", v5, &v11);
    v9 = v11;

    v6[2](v6, v9);
  }
  else
  {
    v12 = NSLocalizedDescriptionKey;
    v13 = CFSTR("failed to lookup SecdWatchdog class from ObjC runtime");
    v10 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.securityd.watchdog"), 1, v10));
    v6[2](v6, v9);

    v6 = (void (**)(id, id))v10;
  }

}

- (void)removeV0Peers:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001CAA7C;
  v5[3] = &unk_1002ED598;
  v6 = a3;
  v4 = v6;
  -[SOSAccount performTransaction:](self, "performTransaction:", v5);

}

- (void)sosEnableValidityCheck
{
  void *v3;
  void *v4;
  void *v5;
  const void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("SOSEnabled")));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](SOSAnalytics, "logger"));
    objc_msgSend(v5, "logSuccessForEventNamed:", CFSTR("SOSInitialized"));

    v6 = sub_10000EF14("SOSMonitorMode");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No value found for SOSMonitorMode initializing to Active", v8, 2u);
    }

    -[SOSAccount SOSMonitorModeEnableSOS](self, "SOSMonitorModeEnableSOS");
  }

}

- (void)SOSMonitorModeDisableSOS
{
  const void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_10000EF14("SOSMonitorMode");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disabling SOS from monitor mode", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));
  objc_msgSend(v5, "setBool:forKey:", 0, CFSTR("SOSEnabled"));

}

- (void)SOSMonitorModeEnableSOS
{
  const void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_10000EF14("SOSMonitorMode");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting SOS to active", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));
  objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("SOSEnabled"));

}

- (void)SOSMonitorModeSOSIsActiveWithCallback:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v5, -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive"));

}

- (BOOL)SOSMonitorModeSOSIsActive
{
  void *v3;
  unsigned __int8 v4;

  -[SOSAccount sosEnableValidityCheck](self, "sosEnableValidityCheck");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SOSEnabled"));

  return v4;
}

- (id)SOSMonitorModeSOSIsActiveDescription
{
  if (-[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive"))
    return CFSTR("[SOS is active]");
  else
    return CFSTR("[SOS is monitoring]");
}

- (BOOL)sosEvaluateIfNeeded
{
  int v3;
  const void *v4;
  NSObject *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  const void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  int IsLegacy;
  unsigned int v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const void *v20;
  NSObject *v21;
  const char *v22;
  uint8_t *v23;
  const void *v24;
  uint64_t v25;
  uint8_t v26[16];
  __int16 v27;
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t buf[16];

  if (qword_1003412D8 != -1)
    dispatch_once(&qword_1003412D8, &stru_1002E7880);
  v3 = byte_1003412D0;
  v4 = sub_10000EF14("SOSMonitorMode");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sosEvaluateIfNeeded - SOS Compatibility Mode enabled, checking mode", buf, 2u);
    }

    v7 = -[OTSOSActualAdapter sosEnabled]_0();
    v8 = sub_10000EF14("SOSMonitorMode");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        *(_WORD *)v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sosEvaluateIfNeeded - Turning on SOS for Compatibility mode", v30, 2u);
      }

      -[SOSAccount SOSMonitorModeEnableSOS](self, "SOSMonitorModeEnableSOS");
    }
    else
    {
      if (v10)
      {
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sosEvaluateIfNeeded - Turning off SOS for Compatibility mode", v29, 2u);
      }

      -[SOSAccount SOSMonitorModeDisableSOS](self, "SOSMonitorModeDisableSOS");
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](SOSAnalytics, "logger"));
    v17 = v16;
    v18 = CFSTR("SOSCompatMode");
    goto LABEL_22;
  }
  if (v6)
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sosEvaluateIfNeeded - checking circle", v28, 2u);
  }

  if (!-[SOSAccount accountKeyIsTrusted](self, "accountKeyIsTrusted"))
  {
    if (!-[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive"))
      return -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive");
    v20 = sub_10000EF14("SOSMonitorMode");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v27 = 0;
    v22 = "SOS is in monitor mode since the account key isn't trusted";
    v23 = (uint8_t *)&v27;
    goto LABEL_30;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  IsLegacy = SOSCircleIsLegacy(objc_msgSend(v11, "trustedCircle"), -[SOSAccount accountKey](self, "accountKey"));

  v13 = -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive");
  if (!IsLegacy)
  {
    if (!v13)
      return -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive");
    v24 = sub_10000EF14("SOSMonitorMode");
    v21 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    LOWORD(v25) = 0;
    v22 = "Putting SOS into monitor mode due to circle change";
    v23 = (uint8_t *)&v25;
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, v23, 2u);
LABEL_31:

    -[SOSAccount SOSMonitorModeDisableSOS](self, "SOSMonitorModeDisableSOS");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](SOSAnalytics, "logger"));
    v17 = v16;
    v18 = CFSTR("SOSMonitorMode");
LABEL_22:
    objc_msgSend(v16, "logSuccessForEventNamed:", v18, v25);

    return -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive");
  }
  if ((v13 & 1) == 0)
  {
    v14 = sub_10000EF14("SOSMonitorMode");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Putting SOS into active mode for circle change", v26, 2u);
    }

    -[SOSAccount SOSMonitorModeEnableSOS](self, "SOSMonitorModeEnableSOS");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](SOSAnalytics, "logger"));
    v17 = v16;
    v18 = CFSTR("SOSLegacyMode");
    goto LABEL_22;
  }
  return -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive");
}

- (void)flattenToSaveBlock
{
  void *v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount saveBlock](self, "saveBlock"));

  if (v3)
  {
    v7 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount encodedData:](self, "encodedData:", &v7));
    v5 = v7;
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SOSAccount saveBlock](self, "saveBlock"));
    ((void (**)(_QWORD, void *, id))v6)[2](v6, v4, v5);

  }
}

- (int)getCircleStatus:(__CFError *)a3
{
  void *v5;
  int v6;
  int result;
  __CFError *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  v6 = objc_msgSend(v5, "getCircleStatusOnly:", a3);

  if (sub_1001D7408(self, (uint64_t)a3))
    return v6;
  result = -1;
  if (a3 && !v6)
  {
    v8 = *a3;
    if (*a3)
    {
      *a3 = 0;
      CFRelease(v8);
    }
    SOSCreateError(2, CFSTR("Public Key isn't available, this peer is in the circle, but invalid. The iCloud Password must be provided to keychain syncing subsystem to repair this."), 0, a3);
    return -1;
  }
  return result;
}

- (BOOL)isInCircle:(__CFError *)a3
{
  unsigned int v4;

  v4 = -[SOSAccount getCircleStatus:](self, "getCircleStatus:");
  if (v4)
    SOSErrorCreate(1037, a3, 0, CFSTR("Not in circle"));
  return v4 == 0;
}

- (BOOL)_onQueueEnsureInBackupRings:(__CFString *)a3
{
  NSObject *v5;
  SOSAccount *v6;
  CFStringRef v7;
  CFStringRef v8;
  _QWORD *v9;
  _QWORD *v10;
  const __CFData *v11;
  const void *v12;
  CFMutableSetRef Mutable;
  const void *MutableForSOSPeerInfosByID;
  void *v15;
  CFMutableSetRef v16;
  int v17;
  int v18;
  int v19;
  _QWORD v21[6];
  _QWORD v22[6];

  v5 = objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = self;
  if (!v6 || !a3)
  {
    sub_100019F20(-50, 0, CFSTR("NULL account or viewName parameter"));
    goto LABEL_27;
  }
  v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@-tomb"), a3);
  if (!v7)
  {
LABEL_27:

    return 0;
  }
  v8 = v7;
  v9 = sub_1001DAE38(v6, v7);
  if (!v9)
  {
    CFRelease(v8);
    goto LABEL_27;
  }
  v10 = v9;
  v11 = sub_1001E97E4(kCFAllocatorDefault, v6, 0);
  v12 = (const void *)sub_1001E9620(v10);
  Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  MutableForSOSPeerInfosByID = (const void *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](v6, "trust"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001D2F74;
  v22[3] = &unk_1002ECBC8;
  v22[4] = Mutable;
  v22[5] = MutableForSOSPeerInfosByID;
  SOSCircleForEachBackupCapablePeerForView(objc_msgSend(v15, "trustedCircle"), -[SOSAccount accountKey](v6, "accountKey"), a3, v22);

  v16 = sub_1002149E4((uint64_t)v10);
  v17 = CFEqual(Mutable, v16);
  if (v12 && SOSBSKBAllPeersBackupKeysAreInKeyBag(v12, MutableForSOSPeerInfosByID))
    v18 = SOSBSKBHasThisRecoveryKey(v12, v11) ^ 1;
  else
    v18 = 1;
  if (v17)
    v19 = 0;
  else
    v19 = v18;
  CFRelease(v8);
  CFRelease(v10);
  if (v16)
    CFRelease(v16);
  if (v11)
    CFRelease(v11);
  if (v12)
    CFRelease(v12);
  if (Mutable)
    CFRelease(Mutable);
  if (MutableForSOSPeerInfosByID)
  {
    CFRelease(MutableForSOSPeerInfosByID);

    if ((v19 & 1) == 0)
      return 0;
LABEL_24:
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001CA990;
    v21[3] = &unk_1002EB840;
    v21[4] = v6;
    v21[5] = a3;
    return sub_1001D22C8(v6, (uint64_t)a3, 0, v21);
  }

  if (v19)
    goto LABEL_24;
  return 0;
}

- (void)setPublicKeyStatus:(int)a3 forKey:(int)a4
{
  CFNumberRef v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t valuePtr;

  valuePtr = a3;
  v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
  v7 = CFSTR("kSOSBackupKeyStatus");
  if (a4 != 1)
    v7 = 0;
  if (a4 == 2)
    v8 = CFSTR("kSOSRecoveryKeyStatus");
  else
    v8 = v7;
  if (v8)
    sub_1001E6A88(self, (uint64_t)v8, (uint64_t)v6, 0);
  if (v6)
    CFRelease(v6);
}

- (int)getPublicKeyStatusForKey:(int)a3 error:(id *)a4
{
  const __CFString *v5;
  const __CFString *v6;
  const __CFNumber *v9;
  const __CFData *v10;
  SOSAccount *v12;
  const __CFData *v13;
  const __CFData *v14;
  CFStringRef v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  int v21;
  const void *v22;
  NSObject *v23;
  CFTypeRef v24;
  SOSAccount *v25;
  SOSAccount *v26;
  uint64_t v27;
  __OpaqueSOSPeerInfo *v28;
  BOOL v29;
  CFStringRef v30;
  _QWORD *v31;
  const void *v32;
  const void *v33;
  int v34;
  uint64_t valuePtr;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  CFTypeRef v43;

  valuePtr = -1;
  v5 = CFSTR("kSOSBackupKeyStatus");
  if (a3 != 1)
    v5 = 0;
  if (a3 == 2)
    v6 = CFSTR("kSOSRecoveryKeyStatus");
  else
    v6 = v5;
  if (v6)
  {
    v9 = (const __CFNumber *)sub_1001CA91C(self, (uint64_t)v6);
    if (v9)
    {
      CFNumberGetValue(v9, kCFNumberCFIndexType, &valuePtr);
      if (a3 == 1)
      {
        if ((SOSPeerInfoHasBackupKey(-[SOSAccount peerInfo](self, "peerInfo")) & 1) == 0)
          return 0;
      }
      else if (a3 == 2)
      {
        v10 = sub_1001E97E4(kCFAllocatorDefault, self, 0);
        if (!v10)
          return 0;
LABEL_51:
        CFRelease(v10);
      }
      return valuePtr;
    }
    valuePtr = 0;
    if (a3 != 1)
    {
      if (a3 != 2)
      {
        valuePtr = -1;
        if (a4)
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kSOSErrorDomain, 9, 0));
        return valuePtr;
      }
      v12 = self;
      cf = 0;
      v13 = sub_1001E97E4(kCFAllocatorDefault, v12, 0);
      if (!v13)
      {

        goto LABEL_49;
      }
      v14 = v13;
      v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@-tomb"), kSOSViewiCloudIdentity);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](v12, "trust"));
      v17 = objc_msgSend(v16, "copyRing:err:", v15, &cf);

      if (v15)
        CFRelease(v15);
      if (v17)
      {
        v18 = sub_1001E93A8(v17, (uint64_t)&cf);
        if (v18 && (v19 = SOSBackupSliceKeyBagCreateFromData(kCFAllocatorDefault, v18, &cf)) != 0)
        {
          v20 = (const void *)v19;
          v21 = SOSBKSBPrefixedKeyIsInKeyBag(v19, bskbRkbgPrefix, v14);
          CFRelease(v20);
        }
        else
        {
          v21 = 0;
        }
        CFRelease(v17);
      }
      else
      {
        v21 = 0;
        v18 = 0;
      }
      CFRelease(v14);
      if (cf)
      {
        v22 = sub_10000EF14("backup");
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v39 = v18;
          v40 = 2112;
          v41 = 0;
          v42 = 2112;
          v43 = cf;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to find BKSB: %@, %@ (%@)", buf, 0x20u);
        }

        v24 = cf;
        if (cf)
        {
          cf = 0;
          CFRelease(v24);

          if ((v21 & 1) != 0)
            return 2;
LABEL_49:
          v10 = sub_1001E97E4(kCFAllocatorDefault, v12, 0);
          if (!v10)
            return valuePtr;
          valuePtr = 1;
          goto LABEL_51;
        }
      }

      if (!v21)
        goto LABEL_49;
      return 2;
    }
    v25 = self;
    v26 = v25;
    if (!v25
      || ((v27 = kSOSViewiCloudIdentity, v28 = -[SOSAccount peerInfo](v25, "peerInfo"), v27)
        ? (v29 = v28 == 0)
        : (v29 = 1),
          v29))
    {
      sub_100019F20(-50, 0, CFSTR("NULL account/peerInfo or viewName parameter"));

      goto LABEL_56;
    }
    v30 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@-tomb"), v27);
    v31 = sub_1001DAE38(v26, v30);
    v32 = v31;
    if (v31)
    {
      v33 = (const void *)sub_1001E9620(v31);
      v34 = SOSBKSBPeerBackupKeyIsInKeyBag(v33, -[SOSAccount peerInfo](v26, "peerInfo"));
      if (!v30)
        goto LABEL_41;
    }
    else
    {
      v33 = 0;
      v34 = 0;
      if (!v30)
      {
LABEL_41:
        if (v32)
          CFRelease(v32);
        if (v33)
        {
          CFRelease(v33);

          if ((v34 & 1) != 0)
            return 2;
        }
        else
        {

          if (v34)
            return 2;
        }
LABEL_56:
        if (!SOSPeerInfoHasBackupKey(-[SOSAccount peerInfo](v26, "peerInfo")))
          return valuePtr;
        return 1;
      }
    }
    CFRelease(v30);
    goto LABEL_41;
  }
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kSOSErrorDomain, 9, 0));
  return -1;
}

- (void)keyStatusFor:(int)a3 complete:(id)a4
{
  uint64_t v4;
  void (**v6)(id, _QWORD, id);
  uint64_t v7;
  id v8;
  id v9;

  v4 = *(_QWORD *)&a3;
  v9 = 0;
  v6 = (void (**)(id, _QWORD, id))a4;
  v7 = -[SOSAccount getPublicKeyStatusForKey:error:](self, "getPublicKeyStatusForKey:error:", v4, &v9);
  v8 = v9;
  v6[2](v6, v7, v8);

}

- (void)_onQueueRecordRetiredPeersInCircle
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SOSAccount *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[SOSAccount isInCircle:](self, "isInCircle:", 0))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount circle_transport](self, "circle_transport"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001CA650;
    v7[3] = &unk_1002EB450;
    v6 = v4;
    v8 = v6;
    v9 = self;
    v10 = &v11;
    objc_msgSend(v6, "modifyCircle:err:action:", v5, 0, v7);

    if (*((_BYTE *)v12 + 24))
      sub_1001D2D74(self);

    _Block_object_dispose(&v11, 8);
  }
}

- (void)setupStateMachine
{
  CKKSPBFileStorage *v4;
  id v5;
  void *v6;
  CKKSPBFileStorage *v7;
  void *v8;
  dispatch_queue_t v9;
  OctagonStateMachine *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  OctagonStateMachine *v15;
  CKKSNearFutureScheduler *v16;
  CKKSNearFutureScheduler *v17;
  CKKSNearFutureScheduler *v18;
  CKKSNearFutureScheduler *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = [CKKSPBFileStorage alloc];
  v5 = objc_msgSend((id)objc_opt_class(self), "urlForSOSAccountSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[CKKSPBFileStorage initWithStoragePath:storageClass:](v4, "initWithStoragePath:storageClass:", v6, objc_opt_class(SOSAccountConfiguration));
  -[SOSAccount setAccountConfiguration:](self, "setAccountConfiguration:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  if (v8)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SOSAccount.m"), 3372, CFSTR("can't bootstrap more than once"));

  }
  v9 = dispatch_queue_create("SOS-statemachine", 0);
  -[SOSAccount setStateMachineQueue:](self, "setStateMachineQueue:", v9);

  v10 = [OctagonStateMachine alloc];
  if (qword_100341548 != -1)
    dispatch_once(&qword_100341548, &stru_1002EB780);
  v11 = (id)qword_100341540;
  if (qword_100341558 != -1)
    dispatch_once(&qword_100341558, &stru_1002EB7A0);
  v12 = (id)qword_100341550;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachineQueue](self, "stateMachineQueue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSLockStateTracker globalTracker](CKKSLockStateTracker, "globalTracker"));
  v15 = -[OctagonStateMachine initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:](v10, "initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:", CFSTR("sosaccount"), v11, v12, CFSTR("ready"), v13, self, CFSTR("com.apple.security.sosaccount.state"), v14, 0);
  -[SOSAccount setStateMachine:](self, "setStateMachine:", v15);

  v16 = [CKKSNearFutureScheduler alloc];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001CA490;
  v27[3] = &unk_1002EB598;
  objc_copyWeak(&v28, &location);
  v17 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v16, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("performBackups"), 5000000000, 120000000000, 1, 0, v27, 2.0);
  -[SOSAccount setPerformBackups:](self, "setPerformBackups:", v17);

  v18 = [CKKSNearFutureScheduler alloc];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001CA4BC;
  v25[3] = &unk_1002EB598;
  objc_copyWeak(&v26, &location);
  v19 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v18, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("performRingUpdates"), 1000000000, 10000000000, 1, 0, v25, 2.0);
  -[SOSAccount setPerformRingUpdates:](self, "setPerformRingUpdates:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount accountConfiguration](self, "accountConfiguration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "storage"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pendingBackupPeers"));
  v23 = objc_msgSend(v22, "count");

  if (v23)
    -[SOSAccount addBackupFlag](self, "addBackupFlag");
  if (objc_msgSend(v21, "ringUpdateFlag"))
    -[SOSAccount addRingUpdateFlag](self, "addRingUpdateFlag");

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)addBackupFlag
{
  void *v3;
  OctagonPendingFlag *v4;

  v4 = -[OctagonPendingFlag initWithFlag:conditions:]([OctagonPendingFlag alloc], "initWithFlag:conditions:", CFSTR("trigger_backup"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  objc_msgSend(v3, "handlePendingFlag:", v4);

}

- (void)addRingUpdateFlag
{
  void *v3;
  OctagonPendingFlag *v4;

  v4 = -[OctagonPendingFlag initWithFlag:conditions:]([OctagonPendingFlag alloc], "initWithFlag:conditions:", CFSTR("trigger_ring_update"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  objc_msgSend(v3, "handlePendingFlag:", v4);

}

- (void)triggerBackupForPeers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addObjectsFromArray:", v4);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachineQueue](self, "stateMachineQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001CA2D8;
  v10[3] = &unk_1002EB5C0;
  objc_copyWeak(&v13, &location);
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)triggerRingUpdateNow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;

  v4 = a3;
  -[SOSAccount setForceSyncForRecoveryRing:](self, "setForceSyncForRecoveryRing:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  if ((objc_msgSend(v5, "isPaused") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentState"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ready"));

    if ((v8 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  v10 = objc_msgSend(v9, "waitForState:wait:", CFSTR("ready"), 10000000000);

LABEL_6:
  v22 = CFSTR("perform_ring_update");
  v20 = CFSTR("ready");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](OctagonStateTransitionPathStep, "success"));
  v21 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v23 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPath pathFromDictionary:](OctagonStateTransitionPath, "pathFromDictionary:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  v19 = CFSTR("ready");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
  v18 = objc_msgSend(v15, "doWatchedStateMachineRPC:sourceStates:path:reply:", CFSTR("rpc-perform-rings"), v17, v14, v4);

}

- (void)triggerRingUpdate
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!-[SOSAccount consolidateKeyInterest](self, "consolidateKeyInterest"))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v3 = objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachineQueue](self, "stateMachineQueue"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1001CA190;
    v4[3] = &unk_1002EB598;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (id)performBackup
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001C9FD4;
  v4[3] = &unk_1002EB5E8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("perform-backup-state"), CFSTR("ready"), CFSTR("error"), v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)performRingUpdate
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001C96B0;
  v4[3] = &unk_1002EB5E8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](OctagonStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", CFSTR("perform-ring-update"), CFSTR("ready"), CFSTR("error"), v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  const void *v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachineQueue](self, "stateMachineQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = sub_10000EF14("sos-sm");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Entering state: %@ [flags: %@]", (uint8_t *)&v17, 0x16u);
  }

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ready")))
  {
    if (objc_msgSend(v8, "_onqueueContains:", CFSTR("trigger_backup")))
    {
      objc_msgSend(v8, "_onqueueRemoveFlag:", CFSTR("trigger_backup"));
      v12 = CFSTR("perform-backup-flag");
      v13 = CFSTR("perform_backup");
LABEL_11:
      v14 = objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", v12, v13));
      goto LABEL_12;
    }
    if (objc_msgSend(v8, "_onqueueContains:", CFSTR("trigger_ring_update")))
    {
      objc_msgSend(v8, "_onqueueRemoveFlag:", CFSTR("trigger_ring_update"));
      v12 = CFSTR("perform-ring-update-flag");
      v13 = CFSTR("perform_ring_update");
      goto LABEL_11;
    }
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("error")) & 1) != 0)
    goto LABEL_15;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("perform_ring_update")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("perform_backup")))
    {
      v14 = objc_claimAutoreleasedReturnValue(-[SOSAccount performBackup](self, "performBackup"));
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  v14 = objc_claimAutoreleasedReturnValue(-[SOSAccount performRingUpdate](self, "performRingUpdate"));
LABEL_12:
  v15 = (void *)v14;
LABEL_16:

  return v15;
}

- (__SecKey)accountKey
{
  return self->_accountKey;
}

- (__SecKey)accountPrivateKey
{
  return self->_accountPrivateKey;
}

- (__SecKey)previousAccountKey
{
  return self->_previousAccountKey;
}

- (__SecKey)peerPublicKey
{
  return self->_peerPublicKey;
}

- (NSDictionary)gestalt
{
  return self->_gestalt;
}

- (void)setGestalt:(id)a3
{
  objc_storeStrong((id *)&self->_gestalt, a3);
}

- (NSData)backup_key
{
  return self->_backup_key;
}

- (void)setBackup_key:(id)a3
{
  objc_storeStrong((id *)&self->_backup_key, a3);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (SOSAccountTrustClassic)trust
{
  return self->_trust;
}

- (void)setTrust:(id)a3
{
  objc_storeStrong((id *)&self->_trust, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)user_private_timer
{
  return self->_user_private_timer;
}

- (void)setUser_private_timer:(id)a3
{
  objc_storeStrong((id *)&self->_user_private_timer, a3);
}

- (SOSDataSourceFactory)factory
{
  return self->_factory;
}

- (void)setFactory:(SOSDataSourceFactory *)a3
{
  self->_factory = a3;
}

- (NSData)_password_tmp
{
  return self->__password_tmp;
}

- (void)set_password_tmp:(id)a3
{
  objc_storeStrong((id *)&self->__password_tmp, a3);
}

- (BOOL)isListeningForSync
{
  return self->_isListeningForSync;
}

- (void)setIsListeningForSync:(BOOL)a3
{
  self->_isListeningForSync = a3;
}

- (int)lock_notification_token
{
  return self->_lock_notification_token;
}

- (void)setLock_notification_token:(int)a3
{
  self->_lock_notification_token = a3;
}

- (CKKeyParameter)key_transport
{
  return self->_key_transport;
}

- (void)setKey_transport:(id)a3
{
  objc_storeStrong((id *)&self->_key_transport, a3);
}

- (SOSKVSCircleStorageTransport)circle_transport
{
  return self->_circle_transport;
}

- (void)setCircle_transport:(id)a3
{
  objc_storeStrong((id *)&self->_circle_transport, a3);
}

- (SOSMessageKVS)kvs_message_transport
{
  return self->_kvs_message_transport;
}

- (void)setKvs_message_transport:(id)a3
{
  objc_storeStrong((id *)&self->_kvs_message_transport, a3);
}

- (SOSCKCircleStorage)ck_storage
{
  return self->_ck_storage;
}

- (void)setCk_storage:(id)a3
{
  objc_storeStrong((id *)&self->_ck_storage, a3);
}

- (BOOL)circle_rings_retirements_need_attention
{
  return self->_circle_rings_retirements_need_attention;
}

- (void)setCircle_rings_retirements_need_attention:(BOOL)a3
{
  self->_circle_rings_retirements_need_attention = a3;
}

- (BOOL)engine_peer_state_needs_repair
{
  return self->_engine_peer_state_needs_repair;
}

- (void)setEngine_peer_state_needs_repair:(BOOL)a3
{
  self->_engine_peer_state_needs_repair = a3;
}

- (BOOL)key_interests_need_updating
{
  return self->_key_interests_need_updating;
}

- (void)setKey_interests_need_updating:(BOOL)a3
{
  self->_key_interests_need_updating = a3;
}

- (BOOL)need_backup_peers_created_after_backup_key_set
{
  return self->_need_backup_peers_created_after_backup_key_set;
}

- (void)setNeed_backup_peers_created_after_backup_key_set:(BOOL)a3
{
  self->_need_backup_peers_created_after_backup_key_set = a3;
}

- (NSMutableArray)change_blocks
{
  return self->_change_blocks;
}

- (void)setChange_blocks:(id)a3
{
  objc_storeStrong((id *)&self->_change_blocks, a3);
}

- (NSMutableDictionary)waitForInitialSync_blocks
{
  return self->_waitForInitialSync_blocks;
}

- (void)setWaitForInitialSync_blocks:(id)a3
{
  objc_storeStrong((id *)&self->_waitForInitialSync_blocks, a3);
}

- (NSData)accountKeyDerivationParameters
{
  return self->_accountKeyDerivationParameters;
}

- (void)setAccountKeyDerivationParameters:(id)a3
{
  objc_storeStrong((id *)&self->_accountKeyDerivationParameters, a3);
}

- (BOOL)accountKeyIsTrusted
{
  return self->_accountKeyIsTrusted;
}

- (void)setAccountKeyIsTrusted:(BOOL)a3
{
  self->_accountKeyIsTrusted = a3;
}

- (id)saveBlock
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setSaveBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (BOOL)notifyCircleChangeOnExit
{
  return self->_notifyCircleChangeOnExit;
}

- (void)setNotifyCircleChangeOnExit:(BOOL)a3
{
  self->_notifyCircleChangeOnExit = a3;
}

- (BOOL)notifyViewChangeOnExit
{
  return self->_notifyViewChangeOnExit;
}

- (void)setNotifyViewChangeOnExit:(BOOL)a3
{
  self->_notifyViewChangeOnExit = a3;
}

- (BOOL)notifyBackupOnExit
{
  return self->_notifyBackupOnExit;
}

- (void)setNotifyBackupOnExit:(BOOL)a3
{
  self->_notifyBackupOnExit = a3;
}

- (NSUserDefaults)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (__SecKey)octagonSigningFullKeyRef
{
  return self->_octagonSigningFullKeyRef;
}

- (void)setOctagonSigningFullKeyRef:(__SecKey *)a3
{
  self->_octagonSigningFullKeyRef = a3;
}

- (__SecKey)octagonEncryptionFullKeyRef
{
  return self->_octagonEncryptionFullKeyRef;
}

- (void)setOctagonEncryptionFullKeyRef:(__SecKey *)a3
{
  self->_octagonEncryptionFullKeyRef = a3;
}

- (BOOL)accountIsChanging
{
  return self->_accountIsChanging;
}

- (void)setAccountIsChanging:(BOOL)a3
{
  self->_accountIsChanging = a3;
}

- (BOOL)sosTestmode
{
  return self->_sosTestmode;
}

- (void)setSosTestmode:(BOOL)a3
{
  self->_sosTestmode = a3;
}

- (BOOL)consolidateKeyInterest
{
  return self->_consolidateKeyInterest;
}

- (void)setConsolidateKeyInterest:(BOOL)a3
{
  self->_consolidateKeyInterest = a3;
}

- (BOOL)accountInScriptBypassMode
{
  return self->_accountInScriptBypassMode;
}

- (void)setAccountInScriptBypassMode:(BOOL)a3
{
  self->_accountInScriptBypassMode = a3;
}

- (BOOL)sosCompatibilityMode
{
  return self->_sosCompatibilityMode;
}

- (void)setSosCompatibilityMode:(BOOL)a3
{
  self->_sosCompatibilityMode = a3;
}

- (OS_dispatch_queue)stateMachineQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 216, 1);
}

- (void)setStateMachineQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 224, 1);
}

- (void)setStateMachine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (CKKSPBFileStorage)accountConfiguration
{
  return (CKKSPBFileStorage *)objc_getProperty(self, a2, 232, 1);
}

- (void)setAccountConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (CKKSNearFutureScheduler)performBackups
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPerformBackups:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (CKKSNearFutureScheduler)performRingUpdates
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPerformRingUpdates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (BOOL)forceSyncForRecoveryRing
{
  return self->_forceSyncForRecoveryRing;
}

- (void)setForceSyncForRecoveryRing:(BOOL)a3
{
  self->_forceSyncForRecoveryRing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performRingUpdates, 0);
  objc_storeStrong((id *)&self->_performBackups, 0);
  objc_storeStrong((id *)&self->_accountConfiguration, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_stateMachineQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong(&self->_saveBlock, 0);
  objc_storeStrong((id *)&self->_accountKeyDerivationParameters, 0);
  objc_storeStrong((id *)&self->_waitForInitialSync_blocks, 0);
  objc_storeStrong((id *)&self->_change_blocks, 0);
  objc_storeStrong((id *)&self->_ck_storage, 0);
  objc_storeStrong((id *)&self->_kvs_message_transport, 0);
  objc_storeStrong((id *)&self->_circle_transport, 0);
  objc_storeStrong((id *)&self->_key_transport, 0);
  objc_storeStrong((id *)&self->__password_tmp, 0);
  objc_storeStrong((id *)&self->_user_private_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trust, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_backup_key, 0);
  objc_storeStrong((id *)&self->_gestalt, 0);
}

+ (unsigned)ghostBustGetRampSettings
{
  void *v2;
  int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  if (objc_msgSend(v2, "ghostbustByMidEnabled"))
    v3 = 2;
  else
    v3 = 0;
  v4 = v3 | objc_msgSend(v2, "ghostbustBySerialEnabled");
  if (objc_msgSend(v2, "ghostbustByAgeEnabled"))
    v5 = 4;
  else
    v5 = 0;
  v6 = v4 | v5;

  return v6;
}

+ (id)urlForSOSAccountSettings
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  return sub_1000340F0(1, (uint64_t)CFSTR("SOSAccountSettings.pb"));
}

- (id)encodedData:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[6];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  v6 = objc_msgSend(v5, "getDEREncodedSize:err:", self, a3);

  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001D9E5C;
    v9[3] = &unk_1002EBBA0;
    v9[4] = self;
    v9[5] = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithSpace:DEREncode:](NSMutableData, "dataWithSpace:DEREncode:", v6, v9));
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)accountFromDER:(const char *)a3 end:(const char *)a4 factory:(SOSDataSourceFactory *)a5 error:(id *)a6
{
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  CFTypeRef v13;
  SOSAccount *v14;
  void *v15;
  void *v16;
  const void *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  void *v21;
  const void *v22;
  const char *v23;
  const UInt8 *v24;
  const char *v25;
  const char *v26;
  const __CFArray *v27;
  CFTypeRef v28;
  const void *v29;
  NSObject *v30;
  _BOOL4 v31;
  id v32;
  const __CFArray *v33;
  CFTypeRef v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  CFMutableDictionaryRef v38;
  SOSAccount *v39;
  void *v40;
  void *v41;
  const char *v42;
  const void *v43;
  const void *v44;
  void *v45;
  const char *v46;
  const __CFArray *v47;
  const char *v48;
  const char *v49;
  CFTypeRef v50;
  SOSAccount *v51;
  void *v52;
  const void *v53;
  CFTypeRef v54;
  const char *v55;
  CFTypeRef v56;
  CFTypeRef v57;
  void *v58;
  const char *v59;
  const UInt8 *v60;
  const char *v61;
  void *v62;
  id v63;
  CFMutableSetRef Mutable;
  id v65;
  const void *v66;
  NSObject *v67;
  CFTypeRef v68;
  CFTypeRef v69;
  const __CFString *v70;
  id v72;
  id v73;
  const void *v74;
  id v75;
  const void *v76;
  const __CFArray *v77;
  CFStringRef v78;
  const __CFArray *v79;
  void *v80;
  void *v81;
  void *v82;
  const void *v83;
  NSObject *v84;
  CFTypeRef v85;
  _QWORD v86[4];
  const __CFArray *v87;
  const char *v88;
  uint64_t v89;
  CFTypeRef cf[4];
  id v91;
  CFTypeRef *v92;
  uint64_t v93;
  CFTypeRef context[5];
  void *v95;
  const void *v96;
  const void *v97;
  char v98;
  uint64_t v99;
  uint8_t v100[8];
  uint8_t buf[8];
  CFRange v102;

  v85 = 0;
  v88 = (const char *)0xAAAAAAAAAAAAAAAALL;
  v89 = 0;
  v9 = (const char *)ccder_decode_constructed_tl(0x2000000000000010, &v88, *a3, a4);
  *a3 = v9;
  v10 = (const char *)ccder_decode_uint64(&v89, v9, v88);
  *a3 = v10;
  if (!v10)
  {
    SOSCreateError(1035, CFSTR("Version parsing failed"), 0, &v85);
    if (!a6)
      goto LABEL_30;
    goto LABEL_96;
  }
  if (v89 == 6)
  {
    v35 = v88;
    *(_QWORD *)buf = 0;
    *(_QWORD *)v100 = 0;
    v36 = ((uint64_t (*)(SOSDataSourceFactory *))a5->var0)(a5);
    v99 = 0;
    v37 = (const char *)sub_10002074C(kCFAllocatorDefault, (CFMutableDictionaryRef *)&v99, &v85, (uint64_t)*a3, (uint64_t)v35);
    *a3 = v37;
    if (!v37)
      goto LABEL_95;
    v38 = (CFMutableDictionaryRef)v99;
    v39 = sub_1001CE300(v99, (uint64_t)a5);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if (v38)
      CFRelease(v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trust"));
    v42 = (const char *)sub_100006690(kCFAllocatorDefault, (CFMutableArrayRef *)buf, &v85, (uint64_t)*a3, (uint64_t)v35);
    *a3 = v42;
    v99 = 5;
    *a3 = (const char *)ccder_decode_uint64(&v99, v42, v35);
    objc_msgSend(v41, "setDepartureCode:", v99);
    v98 = -86;
    *a3 = (const char *)sub_1000324A4((BOOL *)&v98, (uint64_t)*a3, (uint64_t)v35);
    objc_msgSend(v40, "setAccountKeyIsTrusted:", v98);
    v96 = 0;
    v97 = 0;
    *a3 = (const char *)sub_1001D5EF4((uint64_t)kCFAllocatorDefault, &v97);
    *a3 = (const char *)sub_1001D5EF4((uint64_t)kCFAllocatorDefault, &v96);
    objc_msgSend(v40, "setAccountKey:", v97);
    objc_msgSend(v40, "setPreviousAccountKey:", v96);
    v43 = v97;
    if (v97)
    {
      v97 = 0;
      CFRelease(v43);
    }
    v44 = v96;
    if (v96)
    {
      v96 = 0;
      CFRelease(v44);
    }
    v95 = 0;
    *a3 = (const char *)der_decode_data_or_null(kCFAllocatorDefault, &v95);
    v45 = v95;
    objc_msgSend(v40, "setAccountKeyDerivationParameters:", v95);

    v46 = (const char *)sub_10002074C(kCFAllocatorDefault, (CFMutableDictionaryRef *)v100, &v85, (uint64_t)*a3, (uint64_t)v35);
    *a3 = v46;
    if (v46 == v35)
    {
      Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
      context[0] = _NSConcreteStackBlock;
      context[1] = (CFTypeRef)3221225472;
      context[2] = sub_1001DAB88;
      context[3] = &unk_1002ECD08;
      context[4] = Mutable;
      CFDictionaryApplyFunction(*(CFDictionaryRef *)v100, (CFDictionaryApplierFunction)sub_1001DAC0C, context);
      objc_msgSend(v41, "setRetirees:", Mutable);
      if (Mutable)
        CFRelease(Mutable);
      v47 = *(const __CFArray **)buf;
      if (*(_QWORD *)buf)
      {
        if (*a3)
        {
          cf[0] = _NSConcreteStackBlock;
          cf[1] = (CFTypeRef)3221225472;
          cf[2] = sub_1001DAC24;
          cf[3] = &unk_1002EDAA0;
          v92 = &v85;
          v93 = v36;
          v91 = v41;
          v102.length = CFArrayGetCount(v47);
          v102.location = 0;
          CFArrayApplyFunction(v47, v102, (CFArrayApplierFunction)sub_1001DADA0, cf);
          *(_QWORD *)buf = 0;
          CFRelease(v47);
          if ((objc_msgSend(v40, "ensureFactoryCircles") & 1) != 0)
          {
            v65 = v40;
          }
          else
          {
            SOSCreateError(1035, CFSTR("Cannot EnsureFactoryCircles"), v85, &v85);
            v65 = 0;
          }
          v47 = (const __CFArray *)v65;

        }
        else
        {
          v47 = 0;
        }
      }
    }
    else
    {
      v47 = 0;
      *a3 = 0;
    }

    if (!v47)
    {
LABEL_95:
      if (a6)
        goto LABEL_96;
      goto LABEL_30;
    }
    goto LABEL_92;
  }
  if (v89 != 7)
  {
    if (v89 == 8)
    {
      v11 = v88;
      cf[0] = 0;
      v12 = (const char *)sub_10002074C(kCFAllocatorDefault, (CFMutableDictionaryRef *)cf, &v85, (uint64_t)v10, (uint64_t)v88);
      *a3 = v12;
      v13 = cf[0];
      if (v12)
      {
        v14 = sub_1001CE300((uint64_t)cf[0], (uint64_t)a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v13)
          CFRelease(v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trust"));
        v17 = (const void *)SOSCircleCreateFromDER(kCFAllocatorDefault, &v85, a3, v11);
        objc_msgSend(v16, "setTrustedCircle:", v17);
        if (v17)
          CFRelease(v17);
        cf[0] = 0;
        *a3 = (const char *)sub_1001D5D64(cf, (uint64_t)&v85, (uint64_t)*a3, (uint64_t)v11);
        objc_msgSend(v16, "setFullPeerInfo:", cf[0]);
        v18 = cf[0];
        if (cf[0])
        {
          cf[0] = 0;
          CFRelease(v18);
        }
        cf[0] = (CFTypeRef)5;
        *a3 = (const char *)ccder_decode_uint64(cf, *a3, v11);
        objc_msgSend(v16, "setDepartureCode:", LODWORD(cf[0]));
        LOBYTE(v99) = -86;
        *a3 = (const char *)sub_1000324A4((BOOL *)&v99, (uint64_t)*a3, (uint64_t)v11);
        objc_msgSend(v15, "setAccountKeyIsTrusted:", v99);
        context[0] = 0;
        *a3 = (const char *)sub_1001D5EF4((uint64_t)kCFAllocatorDefault, context);
        objc_msgSend(v15, "setAccountKey:", context[0]);
        v19 = context[0];
        if (context[0])
        {
          context[0] = 0;
          CFRelease(v19);
        }
        context[0] = 0;
        *a3 = (const char *)sub_1001D5EF4((uint64_t)kCFAllocatorDefault, context);
        objc_msgSend(v15, "setPreviousAccountKey:", context[0]);
        v20 = context[0];
        if (context[0])
        {
          context[0] = 0;
          CFRelease(v20);
        }
        context[0] = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
        *a3 = (const char *)der_decode_data_or_null(kCFAllocatorDefault, context);
        v21 = (void *)context[0];
        objc_msgSend(v15, "setAccountKeyDerivationParameters:", context[0]);

        v22 = (const void *)SOSPeerInfoSetCreateFromArrayDER(kCFAllocatorDefault, &kSOSPeerSetCallbacks, &v85, a3, v11);
        objc_msgSend(v16, "setRetirees:", v22);
        if (v22)
          CFRelease(v22);
        context[0] = 0;
        v23 = *a3;
        v24 = sub_100021480(kCFAllocatorDefault, (CFDataRef *)context, 0, (uint64_t)*a3, (uint64_t)v11);
        if (v24)
          v25 = (const char *)v24;
        else
          v25 = v23;
        *a3 = v25;
        if (v25 != v11)
        {
          *(_QWORD *)buf = 0;
          v26 = (const char *)sub_10002074C(kCFAllocatorDefault, (CFMutableDictionaryRef *)buf, &v85, (uint64_t)v25, (uint64_t)v11);
          *a3 = v26;
          if (!v26)
          {
            v66 = sub_10000EF14("persistence");
            v67 = objc_claimAutoreleasedReturnValue(v66);
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v100 = 0;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Error Processing expansion dictionary der - dropping account object", v100, 2u);
            }

            v68 = context[0];
            if (context[0])
            {
              context[0] = 0;
              CFRelease(v68);
            }
            if (*(_QWORD *)buf)
              CFRelease(*(CFTypeRef *)buf);
            goto LABEL_89;
          }
          v27 = *(const __CFArray **)buf;
          if (*(_QWORD *)buf)
          {
            objc_msgSend(v16, "setExpansion:", *(_QWORD *)buf);
            CFRelease(v27);
          }
        }
        v28 = context[0];
        v29 = sub_10000EF14("backupKey");
        v30 = objc_claimAutoreleasedReturnValue(v29);
        v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          if (v31)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Setting backup key from metadata", buf, 2u);
          }

          v32 = objc_msgSend(objc_alloc((Class)NSData), "initWithData:", v28);
          objc_msgSend(v15, "setBackup_key:", v32);

          CFRelease(v28);
        }
        else
        {
          if (v31)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Failed to set backup key from metadata - no key found", buf, 2u);
          }

        }
        if (*a3 && *a3 == v11)
        {
          v47 = v15;
LABEL_90:

          goto LABEL_91;
        }
        SOSCreateError(1035, CFSTR("Didn't consume all bytes v7"), v85, &v85);
LABEL_89:
        v47 = 0;
        goto LABEL_90;
      }
      if (!cf[0])
        goto LABEL_95;
      CFRelease(cf[0]);
      if (!a6)
        goto LABEL_30;
    }
    else
    {
      SOSCreateErrorWithFormat(1035, 0, &v85, 0, CFSTR("Unsupported version (%llu)"));
      if (!a6)
        goto LABEL_30;
    }
LABEL_96:
    v33 = 0;
    *a6 = (id)(id)v85;
    return v33;
  }
  v48 = v88;
  cf[0] = 0;
  v49 = (const char *)sub_10002074C(kCFAllocatorDefault, (CFMutableDictionaryRef *)cf, &v85, (uint64_t)v10, (uint64_t)v88);
  *a3 = v49;
  if (!v49)
    goto LABEL_95;
  v50 = cf[0];
  v51 = sub_1001CE300((uint64_t)cf[0], (uint64_t)a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v51);
  if (v50)
    CFRelease(v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trust"));
  v53 = (const void *)SOSCircleCreateFromDER(kCFAllocatorDefault, &v85, a3, v48);
  objc_msgSend(v52, "setTrustedCircle:", v53);
  if (v53)
    CFRelease(v53);
  cf[0] = 0;
  *a3 = (const char *)sub_1001D5D64(cf, (uint64_t)&v85, (uint64_t)*a3, (uint64_t)v48);
  objc_msgSend(v52, "setFullPeerInfo:", cf[0]);
  v54 = cf[0];
  if (cf[0])
  {
    cf[0] = 0;
    CFRelease(v54);
  }
  cf[0] = (CFTypeRef)5;
  v55 = (const char *)ccder_decode_uint64(cf, *a3, v48);
  *a3 = v55;
  buf[0] = -86;
  *a3 = (const char *)sub_1000324A4((BOOL *)buf, (uint64_t)v55, (uint64_t)v48);
  objc_msgSend(v15, "setAccountKeyIsTrusted:", buf[0]);
  context[0] = 0;
  *a3 = (const char *)sub_1001D5EF4((uint64_t)kCFAllocatorDefault, context);
  objc_msgSend(v15, "setAccountKey:", context[0]);
  v56 = context[0];
  if (context[0])
  {
    context[0] = 0;
    CFRelease(v56);
  }
  context[0] = 0;
  *a3 = (const char *)sub_1001D5EF4((uint64_t)kCFAllocatorDefault, context);
  objc_msgSend(v15, "setPreviousAccountKey:", context[0]);
  v57 = context[0];
  if (context[0])
  {
    context[0] = 0;
    CFRelease(v57);
  }
  context[0] = 0;
  *a3 = (const char *)der_decode_data_or_null(kCFAllocatorDefault, context);
  v58 = (void *)context[0];
  objc_msgSend(v15, "setAccountKeyDerivationParameters:", context[0]);

  objc_msgSend(v52, "setRetirees:", SOSPeerInfoSetCreateFromArrayDER(kCFAllocatorDefault, &kSOSPeerSetCallbacks, &v85, a3, v48));
  context[0] = 0;
  v59 = *a3;
  v60 = sub_100021480(kCFAllocatorDefault, (CFDataRef *)context, 0, (uint64_t)*a3, (uint64_t)v48);
  if (v60)
    v61 = (const char *)v60;
  else
    v61 = v59;
  *a3 = v61;
  v62 = (void *)context[0];
  if (context[0])
  {
    objc_msgSend(v15, "setBackup_key:", context[0]);

  }
  objc_msgSend(v52, "setDepartureCode:", LODWORD(cf[0]));
  if (*a3 && *a3 == v48)
  {
    v63 = v15;
  }
  else
  {
    SOSCreateError(1035, CFSTR("Didn't consume all bytes v7"), v85, &v85);
    v63 = 0;
  }
  v47 = (const __CFArray *)v63;

LABEL_91:
  if (!v47)
    goto LABEL_95;
LABEL_92:
  if (*a3 != v88)
  {
    v69 = v85;
    v70 = CFSTR("Extra data at the end of saved acount");
LABEL_94:
    SOSCreateError(1035, v70, v69, &v85);

    goto LABEL_95;
  }
  v72 = -[__CFArray fullPeerInfo](v47, "fullPeerInfo");
  if (!v72)
  {
LABEL_102:
    if ((-[__CFArray ensureFactoryCircles](v47, "ensureFactoryCircles") & 1) != 0)
    {
      v75 = -[__CFArray peerInfo](v47, "peerInfo");
      if (v75)
      {
        v76 = v75;
        CFRetain(v75);
        if ((-[__CFArray isInCircle:](v47, "isInCircle:", 0) & 1) == 0)
          sub_1001DFE54(v47);
        CFRelease(v76);
      }
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472;
      v86[2] = sub_1001DADB4;
      v86[3] = &unk_1002ED920;
      v77 = v47;
      v87 = v77;
      -[__CFArray performTransaction:](v77, "performTransaction:", v86);
      v78 = sub_1001E6B2C(v77);
      if (v78)
        CFRelease(v78);
      -[__CFArray sosEvaluateIfNeeded](v77, "sosEvaluateIfNeeded");
      v79 = v87;
      v33 = v77;

      goto LABEL_31;
    }
    v69 = v85;
    v70 = CFSTR("Cannot EnsureFactoryCircles");
    goto LABEL_94;
  }
  v73 = v72;
  if ((SOSFullPeerInfoPrivKeyExists() & 1) != 0)
  {
    v74 = (const void *)SOSFullPeerInfoCopyPubKey(v73, 0);
    -[__CFArray setPeerPublicKey:](v47, "setPeerPublicKey:", v74);
    if (v74)
      CFRelease(v74);
    goto LABEL_102;
  }
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[__CFArray key_transport](v47, "key_transport"));
  sub_1001F3460(v80);

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[__CFArray circle_transport](v47, "circle_transport"));
  sub_1001F33D8(v81);

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[__CFArray kvs_message_transport](v47, "kvs_message_transport"));
  sub_1001F3320(v82);

  v83 = sub_10000EF14("account");
  v84 = objc_claimAutoreleasedReturnValue(v83);
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(cf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "No private key associated with my_identity, resetting", (uint8_t *)cf, 2u);
  }

  if (a6)
    goto LABEL_96;
LABEL_30:
  v33 = 0;
LABEL_31:
  v34 = v85;
  if (v85)
  {
    v85 = 0;
    CFRelease(v34);
  }
  return v33;
}

+ (id)accountFromData:(id)a3 factory:(SOSDataSourceFactory *)a4 error:(id *)a5
{
  id v8;
  char *v9;
  id v10;
  id v11;
  id v13;

  v8 = a3;
  v9 = (char *)objc_msgSend(v8, "length");
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "bytes");

  v13 = v11;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "accountFromDER:end:factory:error:", &v13, &v9[(_QWORD)v11], a4, a5));
}

- (void)performTransaction_Locked:(id)a3
{
  -[SOSAccount performTransaction_Locked:action:](self, "performTransaction_Locked:action:", 0, a3);
}

- (void)performTransaction_Locked:(BOOL)a3 action:(id)a4
{
  _BOOL8 v4;
  void *v6;
  SOSAccountTransaction *v7;
  void (**v8)(id, SOSAccountTransaction *);

  v4 = a3;
  v8 = (void (**)(id, SOSAccountTransaction *))a4;
  v6 = objc_autoreleasePoolPush();
  v7 = -[SOSAccountTransaction initWithAccount:quiet:]([SOSAccountTransaction alloc], "initWithAccount:quiet:", self, v4);
  v8[2](v8, v7);
  -[SOSAccountTransaction finish](v7, "finish");

  objc_autoreleasePoolPop(v6);
}

- (void)performTransaction:(id)a3
{
  -[SOSAccount performTransaction:action:](self, "performTransaction:action:", 0, a3);
}

- (void)performTransaction:(BOOL)a3 action:(id)a4
{
  id v6;
  void *v7;
  _BYTE *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;

  v6 = a4;
  off_100340C60();
  v10 = v7;
  if (*v8)
  {
    -[SOSAccount performTransaction_Locked:action:](self, "performTransaction_Locked:action:", 1, v7, v7);
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001DD4D8;
    block[3] = &unk_1002EBC78;
    block[4] = self;
    v13 = a3;
    v12 = v10;
    dispatch_sync(v9, block);

  }
}

+ (void)performOnQuietAccountQueue:(id)a3
{
  void (**v3)(_QWORD);
  id v4;
  void *v5;
  const void *v6;
  NSObject *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  uint8_t buf[4];
  uid_t v11;

  v3 = (void (**)(_QWORD))a3;
  v4 = sub_10020053C(1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001DD650;
    v8[3] = &unk_1002ED598;
    v9 = v3;
    objc_msgSend(v5, "performTransaction:action:", 1, v8);

  }
  else
  {
    v6 = sub_10000EF14("acct-txn");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v11 = getuid();
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "UID: %d - No account; running block on local thread",
        buf,
        8u);
    }

    v3[2](v3);
  }

}

@end
