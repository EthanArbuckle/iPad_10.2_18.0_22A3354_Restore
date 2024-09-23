@implementation SBKStoreClampsController

- (SBKStoreClampsController)init
{
  SBKStoreClampsController *v2;
  NSDictionary *v3;
  NSDictionary *transactionClamps;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBKStoreClampsController;
  v2 = -[SBKStoreClampsController init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    transactionClamps = v2->_transactionClamps;
    v2->_transactionClamps = v3;

    v2->_nextUserCancelBackOffInterval = 300.0;
    v5 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v14.receiver = self;
  v14.super_class = (Class)SBKStoreClampsController;
  -[SBKStoreClampsController description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_accountIdentifierCheckTimestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_authenticationNeededTimestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_userAcceptedSyncTimestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_networkingBlockedUntil);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_backOffUntil);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_userCancelledSignInBackOffUntil);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tCurrent Date = %@,\n\taccountIdentifierCheckTimestamp = %@,\n\tauthenticationNeededTimestamp = %@,\n\tuserAcceptedSyncTimestamp = %@,\n\tnetworkingBlockedUntil = %@,\n\tbackOffUntil= %@,\n\tuserCancelledSignInBackOffUntil = %@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *transactionClamps;
  id v6;

  v4 = a3;
  transactionClamps = self->_transactionClamps;
  v6 = v4;
  if (transactionClamps)
  {
    objc_msgSend(v4, "encodeObject:forKey:", transactionClamps, CFSTR("SBKTransactionClamps"));
    v4 = v6;
  }
  if (fabs(self->_accountIdentifierCheckTimestamp) > 0.00000011920929)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("SBAccountIdentifierCheckTimestamp"));
    v4 = v6;
  }
  if (fabs(self->_authenticationNeededTimestamp) > 0.00000011920929)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("SBKAuthenticationNeededTimestamp"));
    v4 = v6;
  }
  if (fabs(self->_userAcceptedSyncTimestamp) > 0.00000011920929)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("SBKUserAcceptedSyncTimestamp"));
    v4 = v6;
  }
  if (fabs(self->_networkingBlockedUntil) > 0.00000011920929)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("SBKNetworkingBlockedUntil"));
    v4 = v6;
  }
  if (fabs(self->_userCancelledSignInBackOffUntil) > 0.00000011920929)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("SBKUserCancelledSignInBackOffUntil"));
    v4 = v6;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", 2, CFSTR("Version"));

}

- (SBKStoreClampsController)initWithCoder:(id)a3
{
  id v4;
  SBKStoreClampsController *v5;
  SBKStoreClampsController *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = -[SBKStoreClampsController init](self, "init");
  if (!v5)
  {
LABEL_7:
    v6 = v5;
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SBKVersion")))
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("SBKTransactionClamps"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if (v8)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __42__SBKStoreClampsController_initWithCoder___block_invoke;
      v15[3] = &unk_24E2A76A0;
      v16 = v8;
      -[SBKStoreClampsController accessTransactionClampsWithBlock:](v5, "accessTransactionClampsWithBlock:", v15);

    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SBAccountIdentifierCheckTimestamp"));
    v5->_accountIdentifierCheckTimestamp = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SBKAuthenticationNeededTimestamp"));
    v5->_authenticationNeededTimestamp = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SBKUserAcceptedSyncTimestamp"));
    v5->_userAcceptedSyncTimestamp = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SBKNetworkingBlockedUntil"));
    v5->_networkingBlockedUntil = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SBKUserCancelledSignInBackOffUntil"));
    v5->_userCancelledSignInBackOffUntil = v13;

    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (void)saveToUserDefaults
{
  NSObject *queue;
  uint64_t v4;
  dispatch_time_t v5;
  _QWORD v6[5];
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SBKStoreClampsController_saveToUserDefaults__block_invoke;
  block[3] = &unk_24E2A8118;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v9 + 24))
  {
    v5 = dispatch_time(0, 2000000000);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __46__SBKStoreClampsController_saveToUserDefaults__block_invoke_37;
    v6[3] = &unk_24E2A8240;
    v6[4] = self;
    dispatch_after(v5, MEMORY[0x24BDAC9B8], v6);
  }
  _Block_object_dispose(&v8, 8);
}

- (void)accessTransactionClampsWithBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SBKStoreClampsController_accessTransactionClampsWithBlock___block_invoke;
  block[3] = &unk_24E2A8178;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (BOOL)canScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = -[SBKStoreClampsController _canScheduleTransactionBasedOfNetworkingBlocked:error:](self, "_canScheduleTransactionBasedOfNetworkingBlocked:error:", v6, a4)&& -[SBKStoreClampsController _canScheduleTransactionBasedOnBackOff:error:](self, "_canScheduleTransactionBasedOnBackOff:error:", v6, a4)&& -[SBKStoreClampsController _canScheduleTransactionBasedOnUserCancelledSignIn:error:](self, "_canScheduleTransactionBasedOnUserCancelledSignIn:error:", v6, a4)&& -[SBKStoreClampsController _canScheduleTransactionBasedOnAccountIdentifierCheck:error:](self, "_canScheduleTransactionBasedOnAccountIdentifierCheck:error:", v6, a4)
    && -[SBKStoreClampsController _canScheduleTransactionBasedOnType:error:](self, "_canScheduleTransactionBasedOnType:error:", v6, a4);

  return v7;
}

- (void)reset
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21E4FD000, v3, OS_LOG_TYPE_DEFAULT, "Reseting Clamps", v4, 2u);
  }

  -[SBKStoreClampsController accessTransactionClampsWithBlock:](self, "accessTransactionClampsWithBlock:", &__block_literal_global_39);
  -[SBKStoreClampsController clearAccountIdentifierCheckTimestamp](self, "clearAccountIdentifierCheckTimestamp");
  -[SBKStoreClampsController clearAuthenticationRequest](self, "clearAuthenticationRequest");
  -[SBKStoreClampsController clearBackOff](self, "clearBackOff");
  -[SBKStoreClampsController clearNetworkingBlocked](self, "clearNetworkingBlocked");
  -[SBKStoreClampsController clearUserAcceptedSyncTimestamp](self, "clearUserAcceptedSyncTimestamp");
  -[SBKStoreClampsController clearUserCancelledSignIn](self, "clearUserCancelledSignIn");
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)setTimestampForTransaction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__SBKStoreClampsController_setTimestampForTransaction___block_invoke;
  v6[3] = &unk_24E2A7708;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBKStoreClampsController accessTransactionClampsWithBlock:](self, "accessTransactionClampsWithBlock:", v6);

}

- (void)clearTimestampForTransaction:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  SBKStoreClampsController *v10;
  id v11;

  v4 = a3;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __57__SBKStoreClampsController_clearTimestampForTransaction___block_invoke;
  v9 = &unk_24E2A7708;
  v10 = self;
  v11 = v4;
  v5 = v4;
  -[SBKStoreClampsController accessTransactionClampsWithBlock:](self, "accessTransactionClampsWithBlock:", &v6);
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults", v6, v7, v8, v9, v10);

}

- (void)setAccountIdentifierCheckTimestamp
{
  -[SBKStoreClampsController _rightNow](self, "_rightNow");
  -[SBKStoreClampsController setAccountIdentifierCheckTimestamp:](self, "setAccountIdentifierCheckTimestamp:");
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)clearAccountIdentifierCheckTimestamp
{
  -[SBKStoreClampsController setAccountIdentifierCheckTimestamp:](self, "setAccountIdentifierCheckTimestamp:", 0.0);
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)setAuthenticationRequest
{
  -[SBKStoreClampsController _rightNow](self, "_rightNow");
  -[SBKStoreClampsController setAuthenticationNeededTimestamp:](self, "setAuthenticationNeededTimestamp:");
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)clearAuthenticationRequest
{
  -[SBKStoreClampsController setAuthenticationNeededTimestamp:](self, "setAuthenticationNeededTimestamp:", 0.0);
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (BOOL)hasAuthenticatedTooRecentlyForTransaction:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SBKStoreClampsController _rightNow](self, "_rightNow");
  v8 = v7;
  -[SBKStoreClampsController authenticationNeededTimestamp](self, "authenticationNeededTimestamp");
  v10 = v8 - v9;
  if (v8 - v9 < 1.0)
  {
    v11 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412802;
      v14 = v6;
      v15 = 2048;
      v16 = v10;
      v17 = 2048;
      v18 = 1.0 - v10;
      _os_log_impl(&dword_21E4FD000, v11, OS_LOG_TYPE_DEFAULT, "Drop transaction: %@ -- Too soon since last authentication: %f [%fs]", (uint8_t *)&v13, 0x20u);
    }

    if (a4)
    {
      +[SBKStoreError userClampErrorWithTransaction:retrySeconds:underlyingError:](SBKStoreError, "userClampErrorWithTransaction:retrySeconds:underlyingError:", v6, 0, 1.0 - v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10 < 1.0;
}

- (void)setUserAcceptedSyncTimestamp
{
  -[SBKStoreClampsController _rightNow](self, "_rightNow");
  -[SBKStoreClampsController setUserAcceptedSyncTimestamp:](self, "setUserAcceptedSyncTimestamp:");
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)clearUserAcceptedSyncTimestamp
{
  -[SBKStoreClampsController setUserAcceptedSyncTimestamp:](self, "setUserAcceptedSyncTimestamp:", 0.0);
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (BOOL)hasUserRecentlyAcceptedSync
{
  double v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;

  -[SBKStoreClampsController userAcceptedSyncTimestamp](self, "userAcceptedSyncTimestamp");
  if (fabs(v3) > 0.00000011920929
    && (-[SBKStoreClampsController _rightNow](self, "_rightNow"),
        v5 = v4,
        -[SBKStoreClampsController userAcceptedSyncTimestamp](self, "userAcceptedSyncTimestamp"),
        v5 - v6 <= 60.0))
  {
    v7 = 1;
  }
  else
  {
    -[SBKStoreClampsController setUserAcceptedSyncTimestamp:](self, "setUserAcceptedSyncTimestamp:", 0.0);
    v7 = 0;
  }
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
  return v7;
}

- (void)setUserCancelledSignIn
{
  double v3;
  double userCancelledSignInBackOffUntil;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  double v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SBKStoreClampsController _rightNow](self, "_rightNow");
  -[SBKStoreClampsController setUserCancelledSignInBackOffUntil:](self, "setUserCancelledSignInBackOffUntil:", v3 + self->_nextUserCancelBackOffInterval);
  userCancelledSignInBackOffUntil = self->_userCancelledSignInBackOffUntil;
  self->_nextUserCancelBackOffInterval = fmin(self->_nextUserCancelBackOffInterval * 12.0, 18000.0);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  v8 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = userCancelledSignInBackOffUntil
       - v7
       - (double)(3600 * (unint64_t)((userCancelledSignInBackOffUntil - v7) / 3600.0));
    v10 = 134218496;
    v11 = (unint64_t)((userCancelledSignInBackOffUntil - v7) / 3600.0);
    v12 = 2048;
    v13 = (unint64_t)(v9 / 60.0);
    v14 = 2048;
    v15 = v9 - (double)(60 * v13);
    _os_log_impl(&dword_21E4FD000, v8, OS_LOG_TYPE_ERROR, "[StoreBookkeeper] SBKStoreClampsController - will avoid presenting authentication for %02llu:%02llu:%2f", (uint8_t *)&v10, 0x20u);
  }

  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)clearUserCancelledSignIn
{
  self->_nextUserCancelBackOffInterval = 300.0;
  -[SBKStoreClampsController setUserCancelledSignInBackOffUntil:](self, "setUserCancelledSignInBackOffUntil:", 0.0);
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)backOffForTimeInterval:(double)a3
{
  double v5;

  -[SBKStoreClampsController _rightNow](self, "_rightNow");
  -[SBKStoreClampsController setBackOffUntil:](self, "setBackOffUntil:", v5 + a3);
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)clearBackOff
{
  -[SBKStoreClampsController setBackOffUntil:](self, "setBackOffUntil:", 0.0);
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)setNetworkingBlocked
{
  double v3;

  -[SBKStoreClampsController _rightNow](self, "_rightNow");
  -[SBKStoreClampsController setNetworkingBlockedUntil:](self, "setNetworkingBlockedUntil:", v3 + 31536000.0);
  -[SBKStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)clearNetworkingBlocked
{
  -[SBKStoreClampsController setNetworkingBlockedUntil:](self, "setNetworkingBlockedUntil:", 0.0);
}

- (BOOL)isNetworkingBlocked
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[SBKStoreClampsController networkingBlockedUntil](self, "networkingBlockedUntil");
  if (v3 != 0.0)
  {
    -[SBKStoreClampsController networkingBlockedUntil](self, "networkingBlockedUntil");
    v5 = v4;
    -[SBKStoreClampsController _rightNow](self, "_rightNow");
    if (v5 > v6)
      return 1;
  }
  -[SBKStoreClampsController clearNetworkingBlocked](self, "clearNetworkingBlocked");
  return 0;
}

- (double)_rightNow
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (id)_keyForTransaction:(id)a3
{
  return (id)objc_msgSend(a3, "clampsKey");
}

- (BOOL)_canScheduleTransactionBasedOnType:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__SBKStoreClampsController__canScheduleTransactionBasedOnType_error___block_invoke;
  v14[3] = &unk_24E2A7730;
  v16 = &v17;
  v14[4] = self;
  v7 = v6;
  v15 = v7;
  -[SBKStoreClampsController accessTransactionClampsWithBlock:](self, "accessTransactionClampsWithBlock:", v14);
  v8 = (void *)v18[5];
  if (!v8)
    goto LABEL_7;
  objc_msgSend(v8, "timeIntervalSinceNow");
  if (v9 >= 0.0)
    v10 = v9;
  else
    v10 = -v9;
  if (v10 > 5.0)
  {
    -[SBKStoreClampsController clearTimestampForTransaction:](self, "clearTimestampForTransaction:", v7);
LABEL_7:
    v11 = 1;
    goto LABEL_13;
  }
  v12 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v24 = v7;
    v25 = 2048;
    v26 = v10;
    v27 = 2048;
    v28 = 5.0 - v10;
    _os_log_impl(&dword_21E4FD000, v12, OS_LOG_TYPE_DEFAULT, "Drop transaction: %@ -- Interval since last request: %f [%fs]", buf, 0x20u);
  }

  if (a4)
  {
    +[SBKStoreError serverClampErrorWithTransaction:retrySeconds:underlyingError:](SBKStoreError, "serverClampErrorWithTransaction:retrySeconds:underlyingError:", v7, 0, 5.0 - v10);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_13:

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (BOOL)_canScheduleTransactionBasedOfNetworkingBlocked:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[SBKStoreClampsController isNetworkingBlocked](self, "isNetworkingBlocked");
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x24BDBCE60];
      -[SBKStoreClampsController networkingBlockedUntil](self, "networkingBlockedUntil");
      objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218242;
      v13 = v6;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_21E4FD000, v8, OS_LOG_TYPE_DEFAULT, "Drop transaction: <%p> -- Networking BlockedUntil: %@", (uint8_t *)&v12, 0x16u);

    }
    +[SBKStoreError networkingBlockedErrorWithTransaction:underlyingError:](SBKStoreError, "networkingBlockedErrorWithTransaction:underlyingError:", v6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return !v7;
}

- (BOOL)_canScheduleTransactionBasedOnAccountIdentifierCheck:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SBKStoreClampsController accountIdentifierCheckTimestamp](self, "accountIdentifierCheckTimestamp");
  v8 = v7;
  if (v7 != 0.0)
  {
    v9 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = v6;
      _os_log_impl(&dword_21E4FD000, v9, OS_LOG_TYPE_DEFAULT, "Drop transaction: <%p> -- AccountIdentifierCheck != 0", (uint8_t *)&v11, 0xCu);
    }

    if (a4)
    {
      +[SBKStoreError userClampErrorWithTransaction:retrySeconds:underlyingError:](SBKStoreError, "userClampErrorWithTransaction:retrySeconds:underlyingError:", v6, 0, 0.0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8 == 0.0;
}

- (BOOL)_canScheduleTransactionBasedOnBackOff:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SBKStoreClampsController backOffUntil](self, "backOffUntil");
  if (fabs(v7) <= 0.00000011920929)
    goto LABEL_4;
  -[SBKStoreClampsController _rightNow](self, "_rightNow");
  v9 = v8;
  -[SBKStoreClampsController backOffUntil](self, "backOffUntil");
  if (v9 > v10)
  {
    -[SBKStoreClampsController clearBackOff](self, "clearBackOff");
LABEL_4:
    v11 = 1;
    goto LABEL_5;
  }
  -[SBKStoreClampsController backOffUntil](self, "backOffUntil");
  v14 = v13 - v9;
  v15 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)MEMORY[0x24BDBCE60];
    -[SBKStoreClampsController backOffUntil](self, "backOffUntil");
    objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218498;
    v19 = v6;
    v20 = 2112;
    v21 = v17;
    v22 = 2048;
    v23 = v14;
    _os_log_impl(&dword_21E4FD000, v15, OS_LOG_TYPE_DEFAULT, "Drop transaction: <%p> -- BackOff until: %@ [%fs]", (uint8_t *)&v18, 0x20u);

  }
  if (a4)
  {
    +[SBKStoreError serverClampErrorWithTransaction:retrySeconds:underlyingError:](SBKStoreError, "serverClampErrorWithTransaction:retrySeconds:underlyingError:", v6, 0, v14);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_5:

  return v11;
}

- (BOOL)_canScheduleTransactionBasedOnUserCancelledSignIn:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SBKStoreClampsController userCancelledSignInBackOffUntil](self, "userCancelledSignInBackOffUntil");
  if (fabs(v7) <= 0.00000011920929)
    goto LABEL_4;
  -[SBKStoreClampsController _rightNow](self, "_rightNow");
  v9 = v8;
  -[SBKStoreClampsController userCancelledSignInBackOffUntil](self, "userCancelledSignInBackOffUntil");
  if (v9 > v10)
  {
    -[SBKStoreClampsController clearUserCancelledSignIn](self, "clearUserCancelledSignIn");
LABEL_4:
    v11 = 1;
    goto LABEL_5;
  }
  -[SBKStoreClampsController userAcceptedSyncTimestamp](self, "userAcceptedSyncTimestamp");
  v14 = v13 - v9;
  v15 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)MEMORY[0x24BDBCE60];
    -[SBKStoreClampsController userCancelledSignInBackOffUntil](self, "userCancelledSignInBackOffUntil");
    objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218498;
    v19 = v6;
    v20 = 2112;
    v21 = v17;
    v22 = 2048;
    v23 = v14;
    _os_log_impl(&dword_21E4FD000, v15, OS_LOG_TYPE_DEFAULT, "Drop transaction: <%p> -- userCancelledBackOff until: %@ [%fs]", (uint8_t *)&v18, 0x20u);

  }
  if (a4)
  {
    +[SBKStoreError userClampErrorWithTransaction:retrySeconds:underlyingError:](SBKStoreError, "userClampErrorWithTransaction:retrySeconds:underlyingError:", v6, 0, v14);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_5:

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDictionary)transactionClamps
{
  return self->_transactionClamps;
}

- (void)setTransactionClamps:(id)a3
{
  objc_storeStrong((id *)&self->_transactionClamps, a3);
}

- (double)accountIdentifierCheckTimestamp
{
  return self->_accountIdentifierCheckTimestamp;
}

- (void)setAccountIdentifierCheckTimestamp:(double)a3
{
  self->_accountIdentifierCheckTimestamp = a3;
}

- (double)authenticationNeededTimestamp
{
  return self->_authenticationNeededTimestamp;
}

- (void)setAuthenticationNeededTimestamp:(double)a3
{
  self->_authenticationNeededTimestamp = a3;
}

- (double)userAcceptedSyncTimestamp
{
  return self->_userAcceptedSyncTimestamp;
}

- (void)setUserAcceptedSyncTimestamp:(double)a3
{
  self->_userAcceptedSyncTimestamp = a3;
}

- (double)networkingBlockedUntil
{
  return self->_networkingBlockedUntil;
}

- (void)setNetworkingBlockedUntil:(double)a3
{
  self->_networkingBlockedUntil = a3;
}

- (double)backOffUntil
{
  return self->_backOffUntil;
}

- (void)setBackOffUntil:(double)a3
{
  self->_backOffUntil = a3;
}

- (double)userCancelledSignInBackOffUntil
{
  return self->_userCancelledSignInBackOffUntil;
}

- (void)setUserCancelledSignInBackOffUntil:(double)a3
{
  self->_userCancelledSignInBackOffUntil = a3;
}

- (double)nextUserCancelBackOffInterval
{
  return self->_nextUserCancelBackOffInterval;
}

- (void)setNextUserCancelBackOffInterval:(double)a3
{
  self->_nextUserCancelBackOffInterval = a3;
}

- (NSData)pendingUserDefaultArchivedData
{
  return self->_pendingUserDefaultArchivedData;
}

- (void)setPendingUserDefaultArchivedData:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUserDefaultArchivedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUserDefaultArchivedData, 0);
  objc_storeStrong((id *)&self->_transactionClamps, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __69__SBKStoreClampsController__canScheduleTransactionBasedOnType_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "_keyForTransaction:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v9);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __57__SBKStoreClampsController_clearTimestampForTransaction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_keyForTransaction:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", 0, v5);

}

void __55__SBKStoreClampsController_setTimestampForTransaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a2;
  objc_msgSend(v3, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_keyForTransaction:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, v5);

}

uint64_t __33__SBKStoreClampsController_reset__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

void __61__SBKStoreClampsController_accessTransactionClampsWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "transactionClamps");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (obj)
    {
      v2 = (void *)objc_msgSend(obj, "mutableCopy");

      obj = v2;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v2);
    }
    else
    {
      obj = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), obj);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __46__SBKStoreClampsController_saveToUserDefaults__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pendingUserDefaultArchivedData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == 0;

  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  objc_msgSend(*(id *)(a1 + 32), "setPendingUserDefaultArchivedData:", v4);

  if (v5)
  {
    if (os_variant_has_internal_content())
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SBKStoreClampsController saveToUserDefaults]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBKStoreClampsController.m"), 149, CFSTR("Archiving SBKStoreClampsController resulted in error:%@"), v5);

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_21E4FD000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Archiving SBKStoreClampsController resulted in error:%@", buf, 0xCu);
    }
  }

}

void __46__SBKStoreClampsController_saveToUserDefaults__block_invoke_37(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
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
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__SBKStoreClampsController_saveToUserDefaults__block_invoke_38;
  v4[3] = &unk_24E2A8118;
  v4[4] = v1;
  v4[5] = &v5;
  dispatch_sync(v2, v4);
  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6[5], CFSTR("SBKSyncClamps"));

  _Block_object_dispose(&v5, 8);
}

uint64_t __46__SBKStoreClampsController_saveToUserDefaults__block_invoke_38(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "pendingUserDefaultArchivedData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setPendingUserDefaultArchivedData:", 0);
}

void __42__SBKStoreClampsController_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setValuesForKeysWithDictionary:", *(_QWORD *)(a1 + 32));

}

+ (id)sharedClampsController
{
  if (sharedClampsController_onceToken != -1)
    dispatch_once(&sharedClampsController_onceToken, &__block_literal_global);
  return (id)sharedClampsController_sharedInstance;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __50__SBKStoreClampsController_sharedClampsController__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  SBKStoreClampsController *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:withDefaultValue:", CFSTR("SBKSyncClamps"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v1, &v9);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v9;
    v4 = (void *)sharedClampsController_sharedInstance;
    sharedClampsController_sharedInstance = v2;

    if (v3)
    {
      if (os_variant_has_internal_content())
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[SBKStoreClampsController sharedClampsController]_block_invoke");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBKStoreClampsController.m"), 65, CFSTR("Unarchiving SBKStoreClampsController resulted in error:%@"), v3);

      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v3;
        _os_log_error_impl(&dword_21E4FD000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unarchiving SBKStoreClampsController resulted in error:%@", buf, 0xCu);
      }
    }

  }
  if (!sharedClampsController_sharedInstance)
  {
    v7 = objc_alloc_init(SBKStoreClampsController);
    v8 = (void *)sharedClampsController_sharedInstance;
    sharedClampsController_sharedInstance = (uint64_t)v7;

  }
}

@end
