@implementation LDLoginUIXPCConnection

+ (id)sharedConnection
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002C4C;
  block[3] = &unk_100008458;
  block[4] = a1;
  if (qword_10000DD28 != -1)
    dispatch_once(&qword_10000DD28, block);
  return (id)qword_10000DD20;
}

- (LDLoginUIXPCConnection)init
{
  LDLoginUIXPCConnection *v2;
  LDLoginUIXPCConnection *v3;
  NSString *userIdentifier;
  NSString *password;
  NSNumber *classID;
  NSString *appleID;
  LKClassConfiguration *classConfiguration;
  id completionHandler;
  LKHangDetectionQueue *v10;
  LKHangDetectionQueue *queue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)LDLoginUIXPCConnection;
  v2 = -[LDLoginUIXPCConnection init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    userIdentifier = v2->_userIdentifier;
    v2->_userIdentifier = 0;

    password = v3->_password;
    v3->_password = 0;

    classID = v3->_classID;
    v3->_classID = 0;

    appleID = v3->_appleID;
    v3->_appleID = 0;

    classConfiguration = v3->_classConfiguration;
    v3->_classConfiguration = 0;

    v3->_isLoginUICheckedIn = 0;
    completionHandler = v3->_completionHandler;
    v3->_completionHandler = 0;

    v10 = (LKHangDetectionQueue *)objc_msgSend(objc_alloc((Class)LKHangDetectionQueue), "initWithQoS:hangThreshold:", 21, 5.0);
    queue = v3->_queue;
    v3->_queue = v10;

  }
  return v3;
}

- (void)chooseUserWithIdentifier:(id)a3 inClassWithID:(id)a4 password:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v10 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100002E3C;
  v14[3] = &unk_1000084A8;
  v14[4] = self;
  v15 = a4;
  v16 = v10;
  v17 = a5;
  v11 = v17;
  v12 = v10;
  v13 = v15;
  -[LDLoginUIXPCConnection _handlePossibleErrorsOrStoreCompletionHandler:inQueuedBlock:](self, "_handlePossibleErrorsOrStoreCompletionHandler:inQueuedBlock:", a6, v14);

}

- (void)loginAppleID:(id)a3 password:(id)a4 localLoginOnly:(BOOL)a5 isTemporarySession:(BOOL)a6 withCompletionHandler:(id)a7
{
  id v11;
  id v12;
  _QWORD v13[4];
  LDLoginUIXPCConnection *v14;
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100002FA4;
  v13[3] = &unk_1000084D0;
  v14 = self;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v11 = v16;
  v12 = v15;
  -[LDLoginUIXPCConnection _handlePossibleErrorsOrStoreCompletionHandler:inQueuedBlock:](v14, "_handlePossibleErrorsOrStoreCompletionHandler:inQueuedBlock:", a7, v13);

}

- (void)saveClassConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  _QWORD v6[4];
  LDLoginUIXPCConnection *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000030CC;
  v6[3] = &unk_1000084F8;
  v7 = self;
  v8 = a3;
  v5 = v8;
  -[LDLoginUIXPCConnection _handlePossibleErrorsOrStoreCompletionHandler:inQueuedBlock:](v7, "_handlePossibleErrorsOrStoreCompletionHandler:inQueuedBlock:", a4, v6);

}

- (void)isReadyToLoginWithCompletionHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  LDLoginUIXPCConnection *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000031CC;
  v4[3] = &unk_1000082F0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[LDLoginUIXPCConnection _queueBlock:](v5, "_queueBlock:", v4);

}

- (void)isReadyToLogoutWithCompletionHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  LDLoginUIXPCConnection *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000032EC;
  v4[3] = &unk_1000082F0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[LDLoginUIXPCConnection _queueBlock:](v5, "_queueBlock:", v4);

}

- (void)checkInWithCurrentEnvironment:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  unint64_t v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003418;
  v7[3] = &unk_100008560;
  v8 = a4;
  v9 = a3;
  v7[4] = self;
  v6 = v8;
  -[LDLoginUIXPCConnection _queueBlock:](self, "_queueBlock:", v7);

}

- (void)loginUICheckedIn
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003738;
  v2[3] = &unk_1000083F8;
  v2[4] = self;
  -[LDLoginUIXPCConnection _queueBlock:](self, "_queueBlock:", v2);
}

- (void)updateGlobalDefaultsValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  void *v7;
  id v8;

  v8 = a5;
  +[NSUserDefaults globalDefaultsUpdateValue:forKey:](NSUserDefaults, "globalDefaultsUpdateValue:forKey:", a3, a4);
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    v7 = v8;
  }

}

- (void)triggerLocalUserSwitchTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8 completionHandler:(id)a9
{
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  LDLoginUIXPCConnection *v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003B78;
  v15[3] = &unk_1000085B0;
  v20 = a3;
  v21 = a4;
  v16 = self;
  v17 = a5;
  v22 = a7;
  v23 = a8;
  v18 = a6;
  v19 = a9;
  v12 = v19;
  v13 = v18;
  v14 = v17;
  -[LDLoginUIXPCConnection _queueBlock:](v16, "_queueBlock:", v15);

}

- (void)interruptLocalUserSwitchTest
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003CC4;
  v2[3] = &unk_1000083F8;
  v2[4] = self;
  -[LDLoginUIXPCConnection _queueBlock:](self, "_queueBlock:", v2);
}

- (void)checkedInWithLoginD
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003D90;
  v2[3] = &unk_1000083F8;
  v2[4] = self;
  -[LDLoginUIXPCConnection _queueBlock:](self, "_queueBlock:", v2);
}

- (void)presentUserSwitchTestDonePopup
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003E10;
  v2[3] = &unk_1000083F8;
  v2[4] = self;
  -[LDLoginUIXPCConnection _queueBlock:](self, "_queueBlock:", v2);
}

- (void)presentPerfTestOngoingIndicator
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003E90;
  v2[3] = &unk_1000083F8;
  v2[4] = self;
  -[LDLoginUIXPCConnection _queueBlock:](self, "_queueBlock:", v2);
}

- (void)connectionDidInvalidate
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003F84;
  v2[3] = &unk_1000083F8;
  v2[4] = self;
  -[LDLoginUIXPCConnection _queueBlock:](self, "_queueBlock:", v2);
}

- (void)_postLoggedInNotification
{
  -[LDLoginUIXPCConnection _postNotification:](self, "_postNotification:", LKLoggedInNotificationName);
}

- (void)_postReadyToLoginNotification
{
  -[LDLoginUIXPCConnection _postNotification:](self, "_postNotification:", LKReadyToLoginNotificationName);
}

- (void)_postNotification:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;

  v3 = objc_retainAutorelease(a3);
  notify_register_check((const char *)objc_msgSend(v3, "UTF8String"), &dword_10000DB98);
  if (dword_10000DB98 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100005174((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000040A4;
    block[3] = &unk_1000083F8;
    v14 = v3;
    dispatch_async(v5, block);

  }
}

- (void)_handlePossibleErrorsOrStoreCompletionHandler:(id)a3 inQueuedBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v9 = objc_msgSend(v8, "isLoginSession");

  if ((v9 & 1) != 0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004268;
    v11[3] = &unk_1000085D8;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    -[LDLoginUIXPCConnection _queueBlock:](self, "_queueBlock:", v11);

  }
  else if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 1));
    (*((void (**)(id, void *))v6 + 2))(v6, v10);

  }
}

- (void)_queueBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LDLoginUIXPCConnection queue](self, "queue"));
  objc_msgSend(v5, "queueBlock:", v4);

}

- (id)_proxy
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LDXPCConnection connection](self, "connection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004358;
  v6[3] = &unk_100008480;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6));

  return v4;
}

- (void)_proxyCallDidFinishWithError:(id)a3
{
  -[LDLoginUIXPCConnection _ifStoredCompletionHandlerCallWithErrorAndThenNilOut:](self, "_ifStoredCompletionHandlerCallWithErrorAndThenNilOut:", a3);
  -[LDLoginUIXPCConnection _nilOutStoredProperties](self, "_nilOutStoredProperties");
}

- (void)_ifStoredCompletionHandlerCallWithErrorAndThenNilOut:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LDLoginUIXPCConnection completionHandler](self, "completionHandler"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[LDLoginUIXPCConnection completionHandler](self, "completionHandler"));
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

    -[LDLoginUIXPCConnection setCompletionHandler:](self, "setCompletionHandler:", 0);
  }

}

- (void)_nilOutStoredProperties
{
  -[LDLoginUIXPCConnection setUserIdentifier:](self, "setUserIdentifier:", 0);
  -[LDLoginUIXPCConnection setPassword:](self, "setPassword:", 0);
  -[LDLoginUIXPCConnection setClassID:](self, "setClassID:", 0);
  -[LDLoginUIXPCConnection setAppleID:](self, "setAppleID:", 0);
  -[LDLoginUIXPCConnection setClassConfiguration:](self, "setClassConfiguration:", 0);
  -[LDLoginUIXPCConnection setCompletionHandler:](self, "setCompletionHandler:", 0);
}

- (void)_deleteCredentials
{
  OM_uint32 min_stat;
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deleting Kerberos credentials...", buf, 2u);
  }
  kdebug_trace(728825876, 0, 0, 0, 0);
  min_stat = 0;
  gss_iter_creds(&min_stat, 0, &__gss_krb5_mechanism_oid_desc, &stru_100008618);
  kdebug_trace(728825880, 0, 0, 0, 0);
}

- (LPKUserSwitchCycleController)userSwitchCycleController
{
  LPKUserSwitchCycleController *userSwitchCycleController;
  LPKUserSwitchCycleController *v4;
  LPKUserSwitchCycleController *v5;

  userSwitchCycleController = self->_userSwitchCycleController;
  if (!userSwitchCycleController)
  {
    v4 = (LPKUserSwitchCycleController *)objc_msgSend(objc_alloc((Class)LPKUserSwitchCycleController), "initWithDelegate:", self);
    v5 = self->_userSwitchCycleController;
    self->_userSwitchCycleController = v4;

    userSwitchCycleController = self->_userSwitchCycleController;
  }
  return userSwitchCycleController;
}

- (void)performanceTestWillTerminate
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100004614;
  v2[3] = &unk_1000083F8;
  v2[4] = self;
  -[LDLoginUIXPCConnection _queueBlock:](self, "_queueBlock:", v2);
}

- (void)forceLoggingInAppleID:(id)a3 password:(id)a4 localLoginOnly:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  LDLoginUIXPCConnection *v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004720;
  v12[3] = &unk_100008640;
  v13 = self;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a5;
  v9 = v15;
  v10 = v14;
  v11 = v16;
  -[LDLoginUIXPCConnection _queueBlock:](v13, "_queueBlock:", v12);

}

- (void)idleTimerFiredForTimeout:(double)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_opt_new(LKLogoutSupport);
  objc_msgSend(v5, "logoutToLoginUserWithCompletionHandler:", &stru_100008660);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[LKAttentionAwareIdleTimer sharedInstance](LKAttentionAwareIdleTimer, "sharedInstance"));
  objc_msgSend(v6, "stopMonitoringAttentionAwareIdleWithDelegate:timeout:", self, a3);

}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)classID
{
  return self->_classID;
}

- (void)setClassID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isTemporarySession
{
  return self->_isTemporarySession;
}

- (void)setIsTemporarySession:(BOOL)a3
{
  self->_isTemporarySession = a3;
}

- (LKClassConfiguration)classConfiguration
{
  return self->_classConfiguration;
}

- (void)setClassConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_classConfiguration, a3);
}

- (BOOL)isLoginUICheckedIn
{
  return self->_isLoginUICheckedIn;
}

- (void)setIsLoginUICheckedIn:(BOOL)a3
{
  self->_isLoginUICheckedIn = a3;
}

- (unint64_t)currentEnvironment
{
  return self->_currentEnvironment;
}

- (void)setCurrentEnvironment:(unint64_t)a3
{
  self->_currentEnvironment = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (LKHangDetectionQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setUserSwitchCycleController:(id)a3
{
  objc_storeStrong((id *)&self->_userSwitchCycleController, a3);
}

- (AWAttentionAwarenessConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (AWAttentionAwarenessClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (OS_dispatch_queue)attentionAwarenessClientQueue
{
  return self->_attentionAwarenessClientQueue;
}

- (void)setAttentionAwarenessClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_attentionAwarenessClientQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionAwarenessClientQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_userSwitchCycleController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_classConfiguration, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_classID, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end
