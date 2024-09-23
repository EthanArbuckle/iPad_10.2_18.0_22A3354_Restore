@implementation MSDPricingUpdateController

+ (id)sharedInstance
{
  if (qword_100175268 != -1)
    dispatch_once(&qword_100175268, &stru_10013E578);
  return (id)qword_100175260;
}

- (void)receivedUpdateRequest:(id)a3 fromRequest:(id)a4
{
  _xpc_connection_s *v6;
  id v7;
  void *v8;
  xpc_object_t reply;
  id v10;
  const char *v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];

  v6 = (_xpc_connection_s *)a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  reply = xpc_dictionary_create_reply(v7);
  if (!reply)
    reply = xpc_dictionary_create(0, 0, 0);
  v10 = v8;
  objc_sync_enter(v10);
  if ((objc_msgSend(v10, "aboutToReboot") & 1) != 0 || objc_msgSend(v10, "mode") == 7)
    v11 = "NO";
  else
    v11 = "YES";
  xpc_dictionary_set_string(reply, "MSDResult", v11);
  objc_sync_exit(v10);

  xpc_connection_send_message(v6, reply);
  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received Pricing update request.", v14, 2u);
  }

  -[MSDPricingUpdateController setState:](self, "setState:", 1);
  if (objc_msgSend(v10, "mode") == 5)
    -[MSDPricingUpdateController setNeedUpdate:](self, "setNeedUpdate:", 1);
  if (objc_msgSend(v10, "mode") == 2 || objc_msgSend(v10, "mode") == 4)
    -[MSDPricingUpdateController restartMonitor](self, "restartMonitor");

}

- (void)receivedHeartBeat:(id)a3 fromRequest:(id)a4
{
  id v6;
  _xpc_connection_s *v7;
  void *v8;
  xpc_object_t reply;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = (_xpc_connection_s *)a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  reply = xpc_dictionary_create_reply(v6);

  if (!reply)
    reply = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(reply, "MSDResult", "YES");
  xpc_connection_send_message(v7, reply);

  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received Pricing heart beat.", v12, 2u);
  }

  if ((objc_msgSend(v8, "mode") == 2 || objc_msgSend(v8, "mode") == 4)
    && -[MSDPricingUpdateController state](self, "state") <= 1)
  {
    -[MSDPricingUpdateController restartMonitor](self, "restartMonitor");
  }

}

- (void)receivedCompletionNotice:(id)a3 fromRequest:(id)a4
{
  id v6;
  _xpc_connection_s *v7;
  void *v8;
  xpc_object_t reply;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = (_xpc_connection_s *)a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  reply = xpc_dictionary_create_reply(v6);

  if (!reply)
    reply = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(reply, "MSDResult", "YES");
  xpc_connection_send_message(v7, reply);

  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received Pricing completion notice.", v12, 2u);
  }

  -[MSDPricingUpdateController stopMonitor](self, "stopMonitor");
  -[MSDPricingUpdateController setState:](self, "setState:", 2);
  if (-[MSDPricingUpdateController switchModeAfterCompletion](self, "switchModeAfterCompletion")
    && !-[MSDPricingUpdateController canceled](self, "canceled"))
  {
    objc_msgSend(v8, "switchModeImmediately:", 5);
  }

}

- (void)receivedOtherMessages:(id)a3 fromRequest:(id)a4
{
  _xpc_connection_s *v5;
  xpc_object_t reply;
  xpc_object_t message;

  v5 = (_xpc_connection_s *)a3;
  reply = xpc_dictionary_create_reply(a4);
  if (!reply)
    reply = xpc_dictionary_create(0, 0, 0);
  message = reply;
  xpc_dictionary_set_string(reply, "MSDResult", "YES");
  xpc_connection_send_message(v5, message);

}

- (void)operationCanceled
{
  -[MSDPricingUpdateController setCanceled:](self, "setCanceled:", 1);
}

- (BOOL)completed
{
  unsigned int v2;
  void *v3;
  void *v4;
  double v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  uint8_t v10[16];

  v2 = -[MSDPricingUpdateController state](self, "state");
  if (v2 - 2 < 2)
    return 1;
  if (v2 == 1)
    return 0;
  if (v2)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknow Pricing app state.", v10, 2u);
    }

    return 1;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastRebootTime"));
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5 <= -60.0;

  return v6;
}

- (void)stopMonitor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B0E4;
  block[3] = &unk_10013D868;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)restartMonitor
{
  void *v3;
  unsigned __int8 v4;
  _QWORD block[5];

  -[MSDPricingUpdateController stopMonitor](self, "stopMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v4 = objc_msgSend(v3, "aboutToReboot");

  if ((v4 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003B1CC;
    block[3] = &unk_10013D868;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)pricingUpdateTimeOut:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  int v16;
  int v17;

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Heart beat monitor timer triggered.", (uint8_t *)&v16, 2u);
  }

  -[MSDPricingUpdateController stopMonitor](self, "stopMonitor");
  if (-[MSDPricingUpdateController state](self, "state") <= 1)
  {
    -[MSDPricingUpdateController setState:](self, "setState:", 3);
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 67109120;
      v17 = 120;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No XPC message from Pricing app for %d seconds.", (uint8_t *)&v16, 8u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727741024, CFSTR("Pricing app stopped.")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
    objc_msgSend(v9, "demoUpdateFailed:", v8);

  }
  if (-[MSDPricingUpdateController switchModeAfterCompletion](self, "switchModeAfterCompletion"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v11 = (uint64_t)objc_msgSend(v10, "timeShowingFatalError");

    if ((_DWORD)v11)
    {
      v12 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 67109120;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Override MSDTimeShowingFatalError timeout: %u", (uint8_t *)&v16, 8u);
      }

    }
    else
    {
      v11 = 900;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](MSDDemoUpdateTimeKeeper, "sharedInstance"));
    v15 = objc_msgSend(v14, "setCompletionTimeForFatalError:", v11);

  }
}

- (BOOL)switchModeAfterCompletion
{
  return self->_switchModeAfterCompletion;
}

- (void)setSwitchModeAfterCompletion:(BOOL)a3
{
  self->_switchModeAfterCompletion = a3;
}

- (BOOL)needUpdate
{
  return self->_needUpdate;
}

- (void)setNeedUpdate:(BOOL)a3
{
  self->_needUpdate = a3;
}

- (NSTimer)heartBeatMonitor
{
  return self->_heartBeatMonitor;
}

- (void)setHeartBeatMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_heartBeatMonitor, a3);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartBeatMonitor, 0);
}

@end
