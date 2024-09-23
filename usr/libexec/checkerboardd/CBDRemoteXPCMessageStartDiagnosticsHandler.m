@implementation CBDRemoteXPCMessageStartDiagnosticsHandler

- (CBDRemoteXPCMessageStartDiagnosticsHandler)initWithProxyReceiver:(id)a3
{
  id v4;
  CBDRemoteXPCMessageStartDiagnosticsHandler *v5;
  CBDRemoteXPCMessageStartDiagnosticsHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CBDRemoteXPCMessageStartDiagnosticsHandler;
  v5 = -[CBDRemoteXPCMessageStartDiagnosticsHandler init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_startDiagnosticsReceiver, v4);

  return v6;
}

- (id)expectedRemoteMessageClasses
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CBDRemoteXPCMessageStartDiagnostics, a2));
}

- (void)handleRemoteMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;

  v6 = a3;
  v7 = a4;
  v9 = objc_opt_class(CBDRemoteXPCMessageStartDiagnostics, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    v10 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageStartDiagnosticsHandler startDiagnosticsReceiver](self, "startDiagnosticsReceiver"));

    v12 = CheckerBoardLogHandleForCategory(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Start session for message %@", buf, 0xCu);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCMessageStartDiagnosticsHandler startDiagnosticsReceiver](self, "startDiagnosticsReceiver"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100006C00;
      v21[3] = &unk_10000C530;
      v23 = v7;
      v22 = v10;
      objc_msgSend(v15, "startDiagnosticsWithCompletion:", v21);

      v16 = v23;
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Missing proxy receiver for message %@", buf, 0xCu);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.checkerboardd.remoteXPCMessageDomain"), 3, 0));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyWithSuccess:error:", 0, v20));

      (*((void (**)(id, void *))v7 + 2))(v7, v16);
    }

  }
  else
  {
    v17 = CheckerBoardLogHandleForCategory(11);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Expect to handle a start session message, but received %@ instead.", buf, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.checkerboardd.remoteXPCMessageDomain"), 1, 0));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "replyWithSuccess:error:", 0, v19));

    (*((void (**)(id, id))v7 + 2))(v7, v10);
  }

}

- (CBDStartDiagnosticsReceiver)startDiagnosticsReceiver
{
  return (CBDStartDiagnosticsReceiver *)objc_loadWeakRetained((id *)&self->_startDiagnosticsReceiver);
}

- (void)setStartDiagnosticsReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_startDiagnosticsReceiver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_startDiagnosticsReceiver);
}

@end
