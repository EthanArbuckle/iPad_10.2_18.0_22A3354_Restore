@implementation NEAgentAppPushExtension

- (NSXPCInterface)managerInterface
{
  if (qword_1000CF890 != -1)
    dispatch_once(&qword_1000CF890, &stru_1000BD3B8);
  return (NSXPCInterface *)(id)qword_1000CF888;
}

- (NSXPCInterface)driverInterface
{
  if (qword_1000CF8A0 != -1)
    dispatch_once(&qword_1000CF8A0, &stru_1000BD3D8);
  return (NSXPCInterface *)(id)qword_1000CF898;
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
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  NEAgentAppPushExtension *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if (v8)
    {
      v11 = ne_log_obj(v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        v14 = 138412546;
        v15 = self;
        v16 = 2112;
        v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ extension [%@] was uninstalled", (uint8_t *)&v14, 0x16u);

      }
      sub_1000059DC(self, 0);
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
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  NEAgentAppPushExtension *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if (v8)
    {
      v11 = ne_log_obj(v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        v14 = 138412546;
        v15 = self;
        v16 = 2112;
        v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ update for extension [%@] started", (uint8_t *)&v14, 0x16u);

      }
      sub_1000059DC(self, 1);
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
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  NEAgentAppPushExtension *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if (v8)
    {
      v11 = ne_log_obj(v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        v14 = 138412546;
        v15 = self;
        v16 = 2112;
        v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ update for extension [%@] is in progress", (uint8_t *)&v14, 0x16u);

      }
      sub_1000059DC(self, 1);
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
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  NEAgentAppPushExtension *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if (v8)
    {
      v11 = ne_log_obj(v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        v14 = 138412546;
        v15 = self;
        v16 = 2112;
        v17 = v13;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ update for extension [%@] completed", (uint8_t *)&v14, 0x16u);

      }
      sub_1000059DC(self, 2);
    }
  }

}

- (void)didReceiveIncomingCallWithUserInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NEAgentAppPushExtension *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ received incoming call with user info %@", (uint8_t *)&v11, 0x16u);
  }

  if (self)
  {
    v8 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension managerObjectFactory](self, "managerObjectFactory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managerObject"));

    objc_msgSend(v10, "reportIncomingCall:", v8);
  }

}

- (void)didReceivePushToTalkMessageWithUserInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NEAgentAppPushExtension *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ received PushToTalk message with user info %@", (uint8_t *)&v11, 0x16u);
  }

  if (self)
  {
    v8 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension managerObjectFactory](self, "managerObjectFactory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managerObject"));

    objc_msgSend(v10, "reportPushToTalkMessage:", v8);
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
  v6[2] = sub_100005890;
  v6[3] = &unk_1000BEA00;
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
  v6[2] = sub_1000057B8;
  v6[3] = &unk_1000BEB80;
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
  v10[2] = sub_100005650;
  v10[3] = &unk_1000BD6E0;
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
