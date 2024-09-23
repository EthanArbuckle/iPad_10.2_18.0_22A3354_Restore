@implementation CBDRemoteXPCMessagePingHandler

- (CBDRemoteXPCMessagePingHandler)init
{
  CBDRemoteXPCMessagePingHandler *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CBDRemoteXPCMessagePingHandler;
  v2 = -[CBDRemoteXPCMessagePingHandler init](&v7, "init");
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory(11);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Use default ip generator.", v6, 2u);
    }

    objc_storeWeak((id *)&v2->_ipGenerator, v2);
  }
  return v2;
}

- (CBDRemoteXPCMessagePingHandler)initWithIPGenerator:(id)a3
{
  id v4;
  CBDRemoteXPCMessagePingHandler *v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  id v11;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBDRemoteXPCMessagePingHandler;
  v5 = -[CBDRemoteXPCMessagePingHandler init](&v9, "init");
  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory(11);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Use an ip generator %@ instead of the default generator.", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_ipGenerator, v4);
  }

  return v5;
}

- (id)expectedRemoteMessageClasses
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CBDRemoteXPCMessagePing, a2));
}

- (void)handleRemoteMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v9 = objc_opt_class(CBDRemoteXPCMessagePing, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    v10 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessagePingHandler ipGenerator](self, "ipGenerator"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "generateLocalIPAddress:", v10));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBDRemoteXPCMessagePingReply replyToRemoteMessage:success:error:](CBDRemoteXPCMessagePingReply, "replyToRemoteMessage:success:error:", v10, 1, 0));
      objc_msgSend(v13, "setIp:", v12);
    }
    else
    {
      v17 = CheckerBoardLogHandleForCategory(11);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received ping message, but the connection is nil.", (uint8_t *)&v20, 2u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.checkerboardd.remoteXPCMessageDomain"), 2, 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBDRemoteXPCMessagePingReply replyToRemoteMessage:success:error:](CBDRemoteXPCMessagePingReply, "replyToRemoteMessage:success:error:", v10, 0, v19));

    }
    v7[2](v7, v13);

    v7 = (void (**)(id, void *))v12;
  }
  else
  {
    v14 = CheckerBoardLogHandleForCategory(11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Expect to handle a ping message, but received %@ instead.", (uint8_t *)&v20, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.checkerboardd.remoteXPCMessageDomain"), 1, 0));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[CBDRemoteXPCMessagePingReply replyToRemoteMessage:success:error:](CBDRemoteXPCMessagePingReply, "replyToRemoteMessage:success:error:", v6, 0, v16));

    v7[2](v7, v10);
  }

}

- (id)generateLocalIPAddress:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "connection"));
  v4 = xpc_remote_connection_copy_remote_address_string();

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
  else
    v5 = 0;
  return v5;
}

- (CBDPingIPGenerator)ipGenerator
{
  return (CBDPingIPGenerator *)objc_loadWeakRetained((id *)&self->_ipGenerator);
}

- (void)setIpGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_ipGenerator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ipGenerator);
}

@end
