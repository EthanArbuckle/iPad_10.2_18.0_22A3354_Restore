@implementation QCAction

- (QCAction)initWithAccount:(id)a3 shutdownActivityPending:(BOOL)a4 serverInteractionController:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  QCAction *v10;
  QCAction *v11;
  objc_super v13;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)QCAction;
  v10 = -[QCAction init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[QCAction setAccount:](v10, "setAccount:", v8);
    -[QCAction setShutdownActivityPending:](v11, "setShutdownActivityPending:", v6);
    -[QCAction setServerInteractionController:](v11, "setServerInteractionController:", v9);
  }

  return v11;
}

- (id)actionType
{
  return CFSTR("QCAction");
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  FMDRequestQueueCheck *v9;
  void *v10;
  FMDRequestQueueCheck *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FMDNetworkAction *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction account](self, "account"));
  v6 = objc_msgSend(v5, "unregisterState");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction commandContext](self, "commandContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pendingActionUUID"));
    -[QCAction setCommandContextUUID:](self, "setCommandContextUUID:", v8);

    v9 = [FMDRequestQueueCheck alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction account](self, "account"));
    v11 = -[FMDRequestQueueCheck initWithAccount:shutdownActivityPending:](v9, "initWithAccount:shutdownActivityPending:", v10, -[QCAction shutdownActivityPending](self, "shutdownActivityPending"));

    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100054160;
    v20[3] = &unk_1002C1E30;
    objc_copyWeak(&v22, &location);
    v21 = v4;
    -[FMDRequest setCompletionHandler:](v11, "setCompletionHandler:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction requestDecorator](self, "requestDecorator"));
    -[FMDRequest setDecorator:](v11, "setDecorator:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction serverInteractionController](self, "serverInteractionController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction commandContext](self, "commandContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accessory"));

    if (v15)
    {
      v16 = -[FMDNetworkAction initWithRequest:andServerInteractionController:]([FMDNetworkAction alloc], "initWithRequest:andServerInteractionController:", v11, v13);
      -[QCAction setNetworkAction:](self, "setNetworkAction:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMDOperationManager sharedManager](FMDOperationManager, "sharedManager"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accessoryIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
      objc_msgSend(v17, "addAction:forIdentifier:", v16, v19);

    }
    else
    {
      -[QCAction setRequest:](self, "setRequest:", v11);
      objc_msgSend(v13, "enqueueRequest:", v11);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
}

- (void)willCancelAction
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  QCAction *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction commandContext](self, "commandContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessory"));

  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction request](self, "request"));
    v12 = 138412802;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "QCAction(%@) will cancel request(%@) with command context accessory(%@)", (uint8_t *)&v12, 0x20u);

  }
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDOperationManager sharedManager](FMDOperationManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction networkAction](self, "networkAction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    objc_msgSend(v8, "cancelAction:forIdentifier:", v9, v11);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction serverInteractionController](self, "serverInteractionController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction request](self, "request"));
    objc_msgSend(v8, "cancelRequest:", v9);
  }

}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serverInteractionController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction serverInteractionController](self, "serverInteractionController"));
    v9 = v7 == v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("QC(0x%p)"), self);
}

- (void)_didCompleteQueueCheckRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "willRetry") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "httpResponseError"));
    if (v8
      || (uint64_t)objc_msgSend(v6, "httpResponseStatus") < 200
      || (uint64_t)objc_msgSend(v6, "httpResponseStatus") > 399)
    {

    }
    else if ((objc_msgSend(v6, "cancelled") & 1) == 0)
    {
      v16 = sub_1000031B8();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fm_logID"));
        v20 = 138412546;
        v21 = v18;
        v22 = 2048;
        v23 = objc_msgSend(v6, "httpResponseStatus");
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@: successful with status %ld.", (uint8_t *)&v20, 0x16u);

      }
      v19 = objc_msgSend(v6, "httpResponseStatus");
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "httpResponseBody"));
      -[QCAction _handleQueueCheckResponseWithStatus:andBody:completion:](self, "_handleQueueCheckResponseWithStatus:andBody:completion:", v19, v11, v7);
      goto LABEL_12;
    }
    v9 = objc_msgSend(v6, "cancelled");
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fm_logID"));
        v20 = 138412290;
        v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Cancelled", (uint8_t *)&v20, 0xCu);
LABEL_11:

      }
    }
    else if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fm_logID"));
      v14 = objc_msgSend(v6, "httpResponseStatus");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "httpResponseError"));
      v20 = 138412802;
      v21 = v13;
      v22 = 2048;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Error (%ld) %@", (uint8_t *)&v20, 0x20u);

      goto LABEL_11;
    }
LABEL_12:

  }
}

- (void)_handleQueueCheckResponseWithStatus:(int64_t)a3 andBody:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  NSObject *v20;
  const char *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  QCAction *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  const char *v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t v45[24];

  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  switch(a3)
  {
    case 200:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDStartupRegisterManager sharedInstance](FMDStartupRegisterManager, "sharedInstance"));
      v11 = v10;
      v12 = 5;
LABEL_7:
      objc_msgSend(v10, "eventDidOccur:", v12);

      break;
    case 210:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDStartupRegisterManager sharedInstance](FMDStartupRegisterManager, "sharedInstance"));
      v11 = v10;
      v12 = 7;
      goto LABEL_7;
    case 204:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDStartupRegisterManager sharedInstance](FMDStartupRegisterManager, "sharedInstance"));
      v11 = v10;
      v12 = 6;
      goto LABEL_7;
  }
  if (!v8 || !objc_msgSend(v8, "count"))
  {
    v18 = 0;
    goto LABEL_20;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cmd")));
  v14 = sub_1000031B8();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v45 = 138412290;
    *(_QWORD *)&v45[4] = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Command Received: %@", v45, 0xCu);
  }

  v16 = -[QCAction _copyHandlerForCommand:params:](self, "_copyHandlerForCommand:params:", v13, v8);
  v17 = v16;
  v18 = v16 != 0;
  if (v16)
  {
    objc_msgSend(v16, "executeCommand");
    v19 = sub_1000031B8();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v45 = 138412290;
      *(_QWORD *)&v45[4] = v13;
      v21 = "Successfully finished command %@";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, v45, 0xCu);
    }
  }
  else
  {
    v22 = sub_1000031B8();
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v45 = 138412290;
      *(_QWORD *)&v45[4] = v13;
      v21 = "No handler found for command %@";
      goto LABEL_18;
    }
  }

LABEL_20:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMDStartupRegisterManager sharedInstance](FMDStartupRegisterManager, "sharedInstance", *(_OWORD *)v45));
  objc_msgSend(v23, "eventDidOccur:", 8);

  if (v9)
    v9[2](v9);
  switch(a3)
  {
    case 200:
      v24 = sub_1000031B8();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v26)
        {
          *(_WORD *)v45 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "More messages pending - checking now...", v45, 2u);
        }

        v27 = [QCAction alloc];
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction account](self, "account"));
        v29 = -[QCAction shutdownActivityPending](self, "shutdownActivityPending");
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction serverInteractionController](self, "serverInteractionController"));
        v25 = -[QCAction initWithAccount:shutdownActivityPending:serverInteractionController:](v27, "initWithAccount:shutdownActivityPending:serverInteractionController:", v28, v29, v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction requestDecorator](self, "requestDecorator"));
        -[NSObject setRequestDecorator:](v25, "setRequestDecorator:", v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction commandContext](self, "commandContext"));
        -[NSObject setCommandContext:](v25, "setCommandContext:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
        v34 = objc_msgSend(v33, "enqueueAction:", v25);

        goto LABEL_40;
      }
      if (v26)
      {
        *(_WORD *)v45 = 0;
        v36 = "Not checking for new messages - previous command was not successful or duplicate";
        goto LABEL_33;
      }
      goto LABEL_40;
    case 204:
      v37 = sub_1000031B8();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v45 = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "No more pending messages on the server 204...", v45, 2u);
      }

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction commandContext](self, "commandContext"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "accessory"));

      if (-[NSObject connectionState](v25, "connectionState") == (id)1)
      {
        v40 = sub_1000031B8();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction commandContextUUID](self, "commandContextUUID"));
          *(_DWORD *)v45 = 138412290;
          *(_QWORD *)&v45[4] = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "QCAction marking command complete %@", v45, 0xCu);

        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction commandContext](self, "commandContext"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction commandContextUUID](self, "commandContextUUID"));
        objc_msgSend(v43, "setActionCompleted:", v44);

      }
      goto LABEL_40;
    case 210:
      v35 = sub_1000031B8();
      v25 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v45 = 0;
        v36 = "No more pending messages on the server 210...";
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v36, v45, 2u);
      }
LABEL_40:

      break;
  }

}

- (id)_copyHandlerForCommand:(id)a3 params:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  int v17;
  objc_class *v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction _commandHandlers](self, "_commandHandlers"));
  v9 = (objc_class *)objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v10 = sub_1000031B8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = v9;
    v19 = 2112;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Using handler %@ for command type %@", (uint8_t *)&v17, 0x16u);
  }

  if (v9)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
    v13 = objc_msgSend([v9 alloc], "initWithParams:provider:", v7, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[QCAction commandContext](self, "commandContext"));
    objc_msgSend(v13, "setCommandContext:", v14);

  }
  else
  {
    v15 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_10022943C((uint64_t)v6, v12);
    v13 = 0;
  }

  return v13;
}

- (id)_commandHandlers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  int v20;
  uint64_t v21;
  _QWORD v22[9];
  _QWORD v23[9];

  v2 = (void *)qword_100306640;
  if (qword_100306640)
    return v2;
  v22[0] = CFSTR("register");
  v23[0] = objc_opt_class(FMDCommandHandlerRegistration, a2);
  v22[1] = CFSTR("message");
  v23[1] = objc_opt_class(FMDCommandHandlerMessage, v3);
  v22[2] = CFSTR("locate");
  v23[2] = objc_opt_class(FMDCommandHandlerLocate, v4);
  v22[3] = CFSTR("dataUpdate");
  v23[3] = objc_opt_class(FMDCommandHandlerDataUpdate, v5);
  v22[4] = CFSTR("wipe");
  v23[4] = objc_opt_class(FMDCommandHandlerWipe, v6);
  v22[5] = CFSTR("notify");
  v23[5] = objc_opt_class(FMDCommandHandlerNotify, v7);
  v22[6] = CFSTR("lock");
  v23[6] = objc_opt_class(FMDCommandHandlerRemoteLock, v8);
  v22[7] = CFSTR("identityV5");
  v23[7] = objc_opt_class(FMDCommandHandlerIdentityV5, v9);
  v22[8] = CFSTR("lost");
  v23[8] = objc_opt_class(FMDCommandHandlerLostMode, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 9));
  v12 = objc_msgSend(v11, "mutableCopy");
  v13 = (void *)qword_100306640;
  qword_100306640 = (uint64_t)v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (objc_msgSend(v14, "isInternalBuild"))
  {
    v15 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("DisableRemoteAccessoryConfig"), kFMDNotBackedUpPrefDomain);

    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend((id)qword_100306640, "fm_safeSetObject:forKey:", objc_opt_class(FMDCommandHandlerAccessoryConfiguration, v16), CFSTR("accessory_config"));
LABEL_7:
  v17 = sub_1000031B8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = qword_100306640;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Command handlers : %@", (uint8_t *)&v20, 0xCu);
  }

  v2 = (void *)qword_100306640;
  return v2;
}

- (FMDCommandContext)commandContext
{
  return self->_commandContext;
}

- (void)setCommandContext:(id)a3
{
  objc_storeStrong((id *)&self->_commandContext, a3);
}

- (FMDRequestDecorator)requestDecorator
{
  return self->_requestDecorator;
}

- (void)setRequestDecorator:(id)a3
{
  objc_storeStrong((id *)&self->_requestDecorator, a3);
}

- (FMDRequestQueueCheck)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (FMDNetworkAction)networkAction
{
  return self->_networkAction;
}

- (void)setNetworkAction:(id)a3
{
  objc_storeStrong((id *)&self->_networkAction, a3);
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)shutdownActivityPending
{
  return self->_shutdownActivityPending;
}

- (void)setShutdownActivityPending:(BOOL)a3
{
  self->_shutdownActivityPending = a3;
}

- (FMDServerInteractionController)serverInteractionController
{
  return (FMDServerInteractionController *)objc_loadWeakRetained((id *)&self->_serverInteractionController);
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeWeak((id *)&self->_serverInteractionController, a3);
}

- (NSUUID)commandContextUUID
{
  return self->_commandContextUUID;
}

- (void)setCommandContextUUID:(id)a3
{
  objc_storeStrong((id *)&self->_commandContextUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandContextUUID, 0);
  objc_destroyWeak((id *)&self->_serverInteractionController);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_networkAction, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_requestDecorator, 0);
  objc_storeStrong((id *)&self->_commandContext, 0);
}

@end
