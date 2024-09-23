@implementation NEAgentAppPushExtension

- (NSXPCInterface)managerInterface
{
  if (qword_10000E1D0 != -1)
    dispatch_once(&qword_10000E1D0, &stru_1000082E0);
  return (NSXPCInterface *)(id)qword_10000E1C8;
}

- (NSXPCInterface)driverInterface
{
  if (qword_10000E1E0 != -1)
    dispatch_once(&qword_10000E1E0, &stru_100008300);
  return (NSXPCInterface *)(id)qword_10000E1D8;
}

- (void)handleCancel
{
  -[NEAgentAppPushExtension stopWithReason:](self, "stopWithReason:", 1);
}

- (void)handleAppsUninstalled:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  NEAgentAppPushExtension *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if (v8)
    {
      v9 = ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        v12 = 138412546;
        v13 = self;
        v14 = 2112;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ extension [%@] was uninstalled", (uint8_t *)&v12, 0x16u);

      }
      sub_100001C30(self, 0);
    }
  }

}

- (void)handleAppsUpdateBegins:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  NEAgentAppPushExtension *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if (v8)
    {
      v9 = ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        v12 = 138412546;
        v13 = self;
        v14 = 2112;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ update for extension [%@] started", (uint8_t *)&v12, 0x16u);

      }
      sub_100001C30(self, 1);
    }
  }

}

- (void)handleAppsUpdateEnding:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  NEAgentAppPushExtension *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if (v8)
    {
      v9 = ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        v12 = 138412546;
        v13 = self;
        v14 = 2112;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ update for extension [%@] is in progress", (uint8_t *)&v12, 0x16u);

      }
      sub_100001C30(self, 1);
    }
  }

}

- (void)handleAppsUpdateEnds:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  NEAgentAppPushExtension *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if (v8)
    {
      v9 = ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        v12 = 138412546;
        v13 = self;
        v14 = 2112;
        v15 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@ update for extension [%@] completed", (uint8_t *)&v12, 0x16u);

      }
      sub_100001C30(self, 2);
    }
  }

}

- (void)didReceiveIncomingCallWithUserInfo:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NEAgentAppPushExtension *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ received incoming call with user info %@", (uint8_t *)&v10, 0x16u);
  }

  if (self)
  {
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension managerObjectFactory](self, "managerObjectFactory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managerObject"));

    objc_msgSend(v9, "reportIncomingCall:", v7);
  }

}

- (void)didReceivePushToTalkMessageWithUserInfo:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NEAgentAppPushExtension *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ received PushToTalk message with user info %@", (uint8_t *)&v10, 0x16u);
  }

  if (self)
  {
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension managerObjectFactory](self, "managerObjectFactory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managerObject"));

    objc_msgSend(v9, "reportPushToTalkMessage:", v7);
  }

}

- (void)startConnectionWithProviderConfig:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100001AE4;
  v6[3] = &unk_100008328;
  v6[4] = self;
  objc_msgSend(v5, "startConnectionWithProviderConfig:completionHandler:", v4, v6);

}

- (void)stopWithReason:(int)a3
{
  uint64_t v3;
  void *v5;
  _QWORD v6[5];

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100001A0C;
  v6[3] = &unk_100008420;
  v6[4] = self;
  objc_msgSend(v5, "stopWithReason:completionHandler:", v3, v6);

}

- (void)setProviderConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  objc_msgSend(v5, "setProviderConfiguration:", v4);

}

- (void)sendOutgoingCallMessage:(id)a3 andMessageID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000018A4;
  v10[3] = &unk_100008350;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "sendOutgoingCallMessage:completionHandler:", v7, v10);

}

- (void)sendTimerEvent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  objc_msgSend(v2, "sendTimerEvent");

}

- (void)sendExtensionFailed
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension managerObjectFactory](self, "managerObjectFactory"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managerObject"));

  objc_msgSend(v3, "sendExtensionFailed");
}

@end
