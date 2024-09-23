@implementation ICManager

- (void)registerHandler:(id)a3 forIncomingRequestsWithAction:(id)a4 scheme:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[ICURLRequestRegistry sharedRegistry](ICURLRequestRegistry, "sharedRegistry");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerHandler:forIncomingRequestsWithAction:scheme:", v9, v8, v7);

}

void __26__ICManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager_52413;
  sharedManager_sharedManager_52413 = (uint64_t)v1;

}

- (ICManager)init
{
  ICManager *v2;
  uint64_t v3;
  NSDistributedNotificationCenter *notificationCenter;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *queuedRequests;
  uint64_t v10;
  NSLock *queueLock;
  void *v12;
  objc_class *v13;
  void *v14;
  ICManager *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ICManager;
  v2 = -[ICManager init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSDistributedNotificationCenter *)v3;

    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addApplicationStateObserver:forEvent:", v2, 1);

    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addApplicationStateObserver:forEvent:", v2, 0);

    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addApplicationStateObserver:forEvent:", v2, 3);

    v8 = objc_opt_new();
    queuedRequests = v2->_queuedRequests;
    v2->_queuedRequests = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    queueLock = v2->_queueLock;
    v2->_queueLock = (NSLock *)v10;

    -[ICManager registerHandler:forIncomingRequestsWithAction:scheme:](v2, "registerHandler:forIncomingRequestsWithAction:scheme:", &__block_literal_global_52405, CFSTR("ic-success"), 0);
    -[ICManager registerHandler:forIncomingRequestsWithAction:scheme:](v2, "registerHandler:forIncomingRequestsWithAction:scheme:", &__block_literal_global_124, CFSTR("ic-cancel"), 0);
    -[ICManager registerHandler:forIncomingRequestsWithAction:scheme:](v2, "registerHandler:forIncomingRequestsWithAction:scheme:", &__block_literal_global_125, CFSTR("ic-error"), 0);
    -[ICManager notificationCenter](v2, "notificationCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_handleOpenURLRequestNotification_, CFSTR("ICManagerHandleOpenURLNotification"), v14);

    v15 = v2;
  }

  return v2;
}

- (NSDistributedNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  id v26;

  v6 = a3;
  if (a4)
  {
    if (a4 == 3)
    {
      self->_enteringForeground = 1;
    }
    else if (a4 == 1)
    {
      self->_resignedActiveWhileOpeningURL = 1;
    }
  }
  else
  {
    v26 = v6;
    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "idiom");

    if (v8 != 1)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationOrNil");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_12;
    objc_msgSend(v10, "keyWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;

    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "screenBounds");
    v18 = v17;
    v20 = v19;

    v6 = v26;
    v21 = v13 == v18 && v15 == v20;
    if (v21 || self->_enteringForeground)
    {
LABEL_12:
      self->_enteringForeground = 0;
      +[ICURLRequestRegistry sharedRegistry](ICURLRequestRegistry, "sharedRegistry");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "popActiveRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "successHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v23, "successHandler");
        v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v25[2](v25, 0, 0);

      }
      -[ICManager performQueuedRequestIfApplicable](self, "performQueuedRequestIfApplicable");

      v6 = v26;
    }
  }

}

- (void)performQueuedRequestIfApplicable
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[ICManager popQueuedRequest](self, "popQueuedRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__ICManager_performQueuedRequestIfApplicable__block_invoke;
    v5[3] = &unk_1E7AF92C0;
    v5[4] = self;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

- (id)popQueuedRequest
{
  void *v3;
  void *v4;
  void *v5;

  -[ICManager queueLock](self, "queueLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICManager queuedRequests](self, "queuedRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeLastObject");
  objc_msgSend(v3, "unlock");

  return v5;
}

- (NSMutableArray)queuedRequests
{
  return self->_queuedRequests;
}

- (NSLock)queueLock
{
  return self->_queueLock;
}

- (void)registerHandler:(id)a3 forIncomingRequestsWithAction:(id)a4 legacyAction:(id)a5 scheme:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[ICURLRequestRegistry sharedRegistry](ICURLRequestRegistry, "sharedRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerHandler:forIncomingRequestsWithAction:scheme:", v12, v11, v9);

  +[ICURLRequestRegistry sharedRegistry](ICURLRequestRegistry, "sharedRegistry");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerHandler:forIncomingRequestsWithAction:scheme:", v12, v10, v9);

}

+ (ICManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__ICManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_52412 != -1)
    dispatch_once(&sharedManager_onceToken_52412, block);
  return (ICManager *)(id)sharedManager_sharedManager_52413;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeApplicationStateObserver:forEvent:", self, 1);

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeApplicationStateObserver:forEvent:", self, 0);

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeApplicationStateObserver:forEvent:", self, 3);

  v6.receiver = self;
  v6.super_class = (Class)ICManager;
  -[ICManager dealloc](&v6, sel_dealloc);
}

- (void)handleOpenURLRequestNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HandleURLNotificationProcessIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v16, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HandleURLNotificationURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v15 = 0;
    v10 = 0;
LABEL_18:

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    v15 = v9;
    v9 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(v7, "integerValue");
    if (v11 != getpid())
    {
      objc_msgSend(v16, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("HandleURLNotificationSourceApplication"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v15 = v14;

      -[ICManager handleOpenURL:fromSourceApplication:errorHandler:postNotification:](self, "handleOpenURL:fromSourceApplication:errorHandler:postNotification:", v10, v15, 0, 0);
      goto LABEL_18;
    }
  }
LABEL_19:

}

- (BOOL)handleOpenURL:(id)a3 fromSourceApplication:(id)a4 errorHandler:(id)a5
{
  return -[ICManager handleOpenURL:fromSourceApplication:errorHandler:postNotification:](self, "handleOpenURL:fromSourceApplication:errorHandler:postNotification:", a3, a4, a5, 1);
}

- (BOOL)handleOpenURL:(id)a3 fromSourceApplication:(id)a4 errorHandler:(id)a5 postNotification:(BOOL)a6
{
  id v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  _BOOL4 v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  ICManager *v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v30 = a6;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (unint64_t)a5;
  getWFInterchangeLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "-[ICManager handleOpenURL:fromSourceApplication:errorHandler:postNotification:]";
    v46 = 2112;
    v47 = v8;
    _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_INFO, "%s Handling opening URL: %@", buf, 0x16u);
  }

  v33 = v9;
  +[_ICURLRequest requestWithURL:fromSourceApplication:](_ICURLRequest, "requestWithURL:fromSourceApplication:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "parameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v13, "objectForKey:", CFSTR("x-error"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLWithString:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  if (v10 | v16)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke;
    v38[3] = &unk_1E7AF6358;
    v39 = (id)v16;
    v40 = self;
    v41 = (id)v10;
    objc_msgSend(v12, "setFailureHandler:", v38);

  }
  v32 = (void *)v10;
  objc_msgSend(v13, "objectForKey:", CFSTR("x-cancel"));
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("x-success"));
  v19 = objc_claimAutoreleasedReturnValue();
  if (v18 | v19)
  {
    v35[0] = v17;
    v35[1] = 3221225472;
    v35[2] = __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_3;
    v35[3] = &unk_1E7AF6390;
    v36 = (id)v18;
    v37 = (id)v19;
    objc_msgSend(v12, "setSuccessHandler:", v35);

  }
  v20 = -[ICManager handleIncomingRequest:](self, "handleIncomingRequest:", v12);
  if (v30)
  {
    v21 = (void *)MEMORY[0x1E0C99E08];
    v42[0] = CFSTR("HandleURLNotificationURL");
    v31 = v8;
    objc_msgSend(v8, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v22;
    v42[1] = CFSTR("HandleURLNotificationProcessIdentifier");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryWithDictionary:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v33, CFSTR("HandleURLNotificationSourceApplication"));
    -[ICManager notificationCenter](self, "notificationCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("ICManagerHandleOpenURLNotification"), v28, v25, 1);

    v8 = v31;
  }

  return v20;
}

- (BOOL)handleIncomingRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  BOOL v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFInterchangeLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[ICManager handleIncomingRequest:]";
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEBUG, "%s Handling incoming request: %@", buf, 0x16u);
  }

  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICURLRequestRegistry sharedRegistry](ICURLRequestRegistry, "sharedRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handlerForIncomingRequestWithAction:scheme:", v8, v9);
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    ((void (**)(_QWORD, id))v10)[2](v10, v4);
  }
  else
  {
    if (!objc_msgSend(v4, "isCallbackRequest")
      || (-[ICManager callbackScheme](self, "callbackScheme"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "matchesURL:", v6),
          v12,
          !v13))
    {
      v11 = 0;
      goto LABEL_12;
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v15 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("This app does not support the \"%@\" action."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("InterchangeErrorDomain"), 2, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "failureHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v4, "failureHandler");
      v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v22)[2](v22, v20);

    }
  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (void)removeHandlerForIncomingRequestsWithAction:(id)a3 scheme:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[ICURLRequestRegistry sharedRegistry](ICURLRequestRegistry, "sharedRegistry");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeHandlerForIncomingRequestsWithAction:scheme:", v6, v5);

}

- (void)queueRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICManager queueLock](self, "queueLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");
  -[ICManager queuedRequests](self, "queuedRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  objc_msgSend(v6, "unlock");
  -[ICManager performQueuedRequestIfApplicable](self, "performQueuedRequestIfApplicable");

}

- (void)performRequest:(id)a3
{
  id v4;
  _QWORD block[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[ICManager _performRequest:](self, "_performRequest:", v4);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__ICManager_performRequest___block_invoke;
    block[3] = &unk_1E7AF92C0;
    block[4] = self;
    v6 = v4;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
}

- (void)_performRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFInterchangeLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v63 = "-[ICManager _performRequest:]";
    v64 = 2112;
    v65 = v4;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Performing incoming request: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationBundleURLSchemes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v10) && objc_msgSend(v4, "isCallbackRequest"))
  {
    objc_msgSend(v4, "successHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "setInternalCallbackRequest:", 1);
      if (-[ICManager handleIncomingRequest:](self, "handleIncomingRequest:", v4))
        goto LABEL_16;
    }
  }
  else
  {

  }
  if (!objc_msgSend(v4, "isCallbackRequest"))
  {
LABEL_15:
    -[ICManager queueRequest:](self, "queueRequest:", v4);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "provider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    goto LABEL_15;
  }
  -[ICManager callbackScheme](self, "callbackScheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_15;
  objc_msgSend(v4, "scheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  objc_msgSend(v4, "sourceName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    -[ICManager callbackScheme](self, "callbackScheme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "app");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedShortName");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v15, "callbackSourceNameKey");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v19 && v22)
    objc_msgSend(v16, "setObject:forKey:", v19, v22);
  objc_msgSend(v4, "successHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v15, "callbackSuccessURLKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "callbackCancelURLKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v26;
    v57 = v25;
    if (v25)
    {
      v59 = v19;
      v27 = (void *)MEMORY[0x1E0CB3940];
      -[ICManager callbackScheme](self, "callbackScheme");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "scheme");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "UUIDString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@://%@/%@/%@"), v29, CFSTR("x-callback-url"), CFSTR("ic-success"), v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "successURLQueryString");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v33;
      if (v33)
      {
        objc_msgSend(v32, "stringByAppendingFormat:", CFSTR("?%@"), v33);
        v35 = objc_claimAutoreleasedReturnValue();

        v32 = (void *)v35;
      }
      v25 = v57;
      objc_msgSend(v16, "setObject:forKey:", v32, v57);

      v19 = v59;
      v26 = v56;
    }
    if (v26)
    {
      v36 = (void *)MEMORY[0x1E0CB3940];
      -[ICManager callbackScheme](self, "callbackScheme");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "scheme");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueID");
      v60 = v23;
      v39 = v16;
      v40 = v19;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "UUIDString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("%@://%@/%@/%@"), v38, CFSTR("x-callback-url"), CFSTR("ic-cancel"), v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v40;
      v16 = v39;
      v23 = v60;

      v26 = v56;
      objc_msgSend(v16, "setObject:forKey:", v43, v56);

      v25 = v57;
    }

  }
  objc_msgSend(v15, "callbackErrorURLKey");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45 && v44)
  {
    v46 = (void *)MEMORY[0x1E0CB3940];
    -[ICManager callbackScheme](self, "callbackScheme");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "scheme");
    v61 = v23;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueID");
    v58 = v15;
    v49 = v16;
    v50 = v19;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "UUIDString");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringWithFormat:", CFSTR("%@://%@/%@/%@"), v48, CFSTR("x-callback-url"), CFSTR("ic-error"), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v50;
    v16 = v49;
    v15 = v58;

    v23 = v61;
    objc_msgSend(v16, "setObject:forKey:", v53, v44);

  }
  objc_msgSend(v4, "URL");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "URLByAddingValuesFromQueryDictionary:", v16);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGeneratedCallbackURL:", v55);

  -[ICManager queueRequest:](self, "queueRequest:", v4);
LABEL_16:

}

- (ICScheme)callbackScheme
{
  ICScheme *callbackScheme;
  void *v4;
  void *v5;
  void *v6;
  ICScheme *v7;
  ICScheme *v8;

  callbackScheme = self->_callbackScheme;
  if (!callbackScheme)
  {
    +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentApp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "schemes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectMatchingKey:BOOLValue:", CFSTR("callbackScheme"), 1);
    v7 = (ICScheme *)objc_claimAutoreleasedReturnValue();
    v8 = self->_callbackScheme;
    self->_callbackScheme = v7;

    callbackScheme = self->_callbackScheme;
  }
  return callbackScheme;
}

- (void)setCallbackScheme:(id)a3
{
  objc_storeStrong((id *)&self->_callbackScheme, a3);
}

- (BOOL)allowsOpeningFromBackground
{
  return self->_allowsOpeningFromBackground;
}

- (void)setAllowsOpeningFromBackground:(BOOL)a3
{
  self->_allowsOpeningFromBackground = a3;
}

- (void)setQueuedRequests:(id)a3
{
  objc_storeStrong((id *)&self->_queuedRequests, a3);
}

- (void)setQueueLock:(id)a3
{
  objc_storeStrong((id *)&self->_queueLock, a3);
}

- (BOOL)enteringForeground
{
  return self->_enteringForeground;
}

- (void)setEnteringForeground:(BOOL)a3
{
  self->_enteringForeground = a3;
}

- (BOOL)resignedActiveWhileOpeningURL
{
  return self->_resignedActiveWhileOpeningURL;
}

- (void)setResignedActiveWhileOpeningURL:(BOOL)a3
{
  self->_resignedActiveWhileOpeningURL = a3;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_queueLock, 0);
  objc_storeStrong((id *)&self->_queuedRequests, 0);
  objc_storeStrong((id *)&self->_callbackScheme, 0);
}

uint64_t __28__ICManager_performRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performRequest:", *(_QWORD *)(a1 + 40));
}

void __45__ICManager_performQueuedRequestIfApplicable__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
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
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD);
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "applicationState"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "allowsOpeningFromBackground");

    if ((v3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "queueRequest:", *(_QWORD *)(a1 + 40));
      return;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 40), "generatedCallbackURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  getWFInterchangeLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[ICManager performQueuedRequestIfApplicable]_block_invoke";
    v43 = 2112;
    v44 = v7;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Performing request: %@", buf, 0x16u);
  }

  v9 = objc_msgSend(*(id *)(a1 + 40), "deferCompletionUntilReturn");
  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "canOpenURL:", v7);

  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "scheme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "app");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3940];
    if (v21)
    {
      WFLocalizedString(CFSTR("Shortcuts could not open %@ because it is not installed."));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "scheme");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "app");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", v23, v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WFLocalizedString(CFSTR("Shortcuts could not open the app for the URL scheme “%@” because the app is not installed on this device."));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "URL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "scheme");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", v23, v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v27 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("InterchangeErrorDomain"), 1, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "failureHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = *(void **)(a1 + 40);
    if (v30)
    {
      objc_msgSend(v31, "failureHandler");
      v32 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v32)[2](v32, v29);
    }
    else
    {
      objc_msgSend(v31, "successHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(*(id *)(a1 + 40), "successHandler");
      v32 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD, _QWORD), _QWORD, _QWORD))v32[2])(v32, 0, 0);
    }

    goto LABEL_23;
  }
  if (v9)
  {
    +[ICURLRequestRegistry sharedRegistry](ICURLRequestRegistry, "sharedRegistry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerOutgoingRequest:", *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 40), "opener");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_25;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  objc_msgSend(*(id *)(a1 + 40), "opener");
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __45__ICManager_performQueuedRequestIfApplicable__block_invoke_143;
  v34[3] = &unk_1E7AF63C0;
  v35 = *(id *)(a1 + 40);
  v16 = v7;
  v17 = *(_QWORD *)(a1 + 32);
  v36 = v16;
  v37 = v17;
  v38 = v9;
  ((void (**)(_QWORD, id, void *, _QWORD *))v14)[2](v14, v16, v15, v34);

  v18 = v35;
LABEL_24:

LABEL_25:
}

void __45__ICManager_performQueuedRequestIfApplicable__block_invoke_143(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  dispatch_time_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (**v30)(_QWORD, _QWORD);
  void *v31;
  void *v32;
  void *v33;
  _QWORD block[4];
  id v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    if (!*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "successHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "successHandler");
        v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, 0);
LABEL_12:

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "userInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRunningWithSiriUI");

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "failureHandler");
      v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), void *))v7[2])(v7, v10);

      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 40), "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("tel")) & 1) != 0 || *(_BYTE *)(*(_QWORD *)(a1 + 48) + 10))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentUserInterfaceType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D14338]);

      if (!v15)
      {
        if (objc_msgSend(*(id *)(a1 + 32), "retries") < 6)
        {
          v26 = dispatch_time(0, 100000000);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __45__ICManager_performQueuedRequestIfApplicable__block_invoke_2;
          block[3] = &unk_1E7AF92C0;
          v27 = *(id *)(a1 + 32);
          v28 = *(_QWORD *)(a1 + 48);
          v35 = v27;
          v36 = v28;
          dispatch_after(v26, MEMORY[0x1E0C80D38], block);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "failureHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(*(id *)(a1 + 32), "scheme");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "app");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "localizedName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x1E0CB3940];
            if (v19)
            {
              WFLocalizedString(CFSTR("Shortcuts could not open %@. It may not be installed on this device."));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "scheme");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "app");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "localizedName");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "localizedStringWithFormat:", v21, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              WFLocalizedString(CFSTR("Shortcuts could not open the app for the URL scheme “%@”. The app may not be installed on this device."));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "scheme");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "localizedStringWithFormat:", v21, v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }

            objc_msgSend(*(id *)(a1 + 32), "failureHandler");
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = (void (**)(_QWORD, _QWORD))v29;
            if (v5)
            {
              (*(void (**)(uint64_t, id))(v29 + 16))(v29, v5);
            }
            else
            {
              v31 = (void *)MEMORY[0x1E0CB35C8];
              v37 = *MEMORY[0x1E0CB2D50];
              v38[0] = v25;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("InterchangeErrorDomain"), 3, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *))v30)[2](v30, v33);

            }
          }
        }
        goto LABEL_13;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "failureHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "failureHandler");
      v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), _QWORD))v7[2])(v7, 0);
      goto LABEL_12;
    }
  }
LABEL_13:

}

uint64_t __45__ICManager_performQueuedRequestIfApplicable__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRetries:", objc_msgSend(*(id *)(a1 + 32), "retries") + 1);
  return objc_msgSend(*(id *)(a1 + 40), "queueRequest:", *(_QWORD *)(a1 + 32));
}

void __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_2;
  v6[3] = &unk_1E7AF8F70;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v4 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;

  v4 = 40;
  if (a3)
    v4 = 32;
  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = *(id *)(a1 + v4);
  v7 = a2;
  objc_msgSend(v5, "URLWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAddingValuesFromQueryDictionary:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_4;
  block[3] = &unk_1E7AF94B0;
  v12 = v9;
  v10 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:", *(_QWORD *)(a1 + 32));

}

void __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  if (v2 && (objc_msgSend(v2, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "canOpenURL:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      if ((WFURLIsWebPage() & 1) == 0)
      {

LABEL_12:
        objc_msgSend(*(id *)(a1 + 40), "interchangeErrorDictionary");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "URLByAddingValuesFromQueryDictionary:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "scheme");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "callbackScheme");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "scheme");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "isEqualToString:", v9);

        if (v10)
        {
          v11 = *(void **)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bundle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleOpenURL:fromSourceApplication:errorHandler:", v6, v14, *(_QWORD *)(a1 + 56));

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "openURL:", v6);
        }

        return;
      }
      v4 = WFURLIsUniversalLink();

      if (v4)
        goto LABEL_12;
    }
    else
    {

    }
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 40));
}

void __17__ICManager_init__block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  id v14;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "subAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v4, "initWithUUIDString:", v5);

  +[ICURLRequestRegistry sharedRegistry](ICURLRequestRegistry, "sharedRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "popRequestWithUUID:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v3, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "errorWithInterchangeErrorDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "failureHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "failureHandler");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v12, v10);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v7, "successHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v7, "successHandler");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(_QWORD, _QWORD), _QWORD, _QWORD))v12[2])(v12, 0, 0);
    goto LABEL_5;
  }
LABEL_6:

}

void __17__ICManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  id v10;

  v10 = a2;
  v2 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v10, "subAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithUUIDString:", v3);

  +[ICURLRequestRegistry sharedRegistry](ICURLRequestRegistry, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popRequestWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "successHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "successHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v9, 1);

  }
}

void __17__ICManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  id v10;

  v10 = a2;
  v2 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v10, "subAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithUUIDString:", v3);

  +[ICURLRequestRegistry sharedRegistry](ICURLRequestRegistry, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popRequestWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "successHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "successHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v9, 0);

  }
}

@end
