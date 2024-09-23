@implementation CBDRemoteXPCMessageSetupHandler

- (CBDRemoteXPCMessageSetupHandler)initWithProxyReceiver:(id)a3
{
  id v4;
  CBDRemoteXPCMessageSetupHandler *v5;
  CBDRemoteXPCMessageSetupHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CBDRemoteXPCMessageSetupHandler;
  v5 = -[CBDRemoteXPCMessageSetupHandler init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_proxyReceiver, v4);

  return v6;
}

- (id)expectedRemoteMessageClasses
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CBDRemoteXPCMessageSetup, a2));
}

- (void)handleRemoteMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;

  v6 = a3;
  v7 = a4;
  v9 = objc_opt_class(CBDRemoteXPCMessageSetup, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    v10 = v6;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "server"));
    if (v11
      && (v12 = (void *)v11,
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "port")),
          v13,
          v12,
          v13))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetupHandler proxyReceiver](self, "proxyReceiver"));

      if (v14)
      {
        v15 = objc_alloc((Class)CBSProxyServer);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "server"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "port"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "token"));
        v19 = objc_msgSend(v15, "initWithServer:port:token:", v16, v17, v18);

        v20 = CheckerBoardLogHandleForCategory(11);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v10;
          v37 = 2112;
          v38 = v19;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Start setting proxy server info for message %@. proxyServer = %@", buf, 0x16u);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageSetupHandler proxyReceiver](self, "proxyReceiver"));
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100004F38;
        v32[3] = &unk_10000C530;
        v34 = v7;
        v33 = v10;
        objc_msgSend(v22, "setProxyServer:completion:", v19, v32);

        goto LABEL_15;
      }
      v30 = CheckerBoardLogHandleForCategory(11);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v10;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Missing proxy receiver for message %@", buf, 0xCu);
      }

      v28 = 3;
    }
    else
    {
      v26 = CheckerBoardLogHandleForCategory(11);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v10;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Missing server info for message %@.", buf, 0xCu);
      }

      v28 = 4;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.checkerboardd.remoteXPCMessageDomain"), v28, 0));
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyWithSuccess:error:", 0, v29));

    (*((void (**)(id, id))v7 + 2))(v7, v19);
LABEL_15:

    goto LABEL_16;
  }
  v23 = CheckerBoardLogHandleForCategory(11);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Expect to handle a setup message, but received %@ instead.", buf, 0xCu);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.checkerboardd.remoteXPCMessageDomain"), 1, 0));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "replyWithSuccess:error:", 0, v25));

  (*((void (**)(id, id))v7 + 2))(v7, v10);
LABEL_16:

}

- (CBDProxyReceiver)proxyReceiver
{
  return (CBDProxyReceiver *)objc_loadWeakRetained((id *)&self->_proxyReceiver);
}

- (void)setProxyReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_proxyReceiver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxyReceiver);
}

@end
