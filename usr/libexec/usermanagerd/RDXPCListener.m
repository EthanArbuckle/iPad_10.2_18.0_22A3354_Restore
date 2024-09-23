@implementation RDXPCListener

+ (id)sharedListener
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008564C;
  block[3] = &unk_1000D0DE0;
  block[4] = a1;
  if (qword_1000E01E0 != -1)
    dispatch_once(&qword_1000E01E0, block);
  return (id)qword_1000E01D8;
}

- (void)startListening
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RDXPCListener xpcListener](self, "xpcListener"));
  objc_msgSend(v2, "resume");

}

- (void)stopListening
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RDXPCListener xpcListener](self, "xpcListener"));
  objc_msgSend(v2, "suspend");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  void (*v17)(uint64_t);
  void ***v18;
  NSObject *v19;
  unsigned int v20;
  uint64_t v21;
  const char *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void **v30;
  _QWORD v31[4];
  id v32;
  void **v33;
  _QWORD v34[4];
  id v35;
  __int16 v36;
  uint64_t v37;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_xpcConnection"));
  __xpc_connection_set_logging(v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RDClient clientWithXPCConnection:](RDClient, "clientWithXPCConnection:", v4));
  if (objc_msgSend(v6, "hasEntitlement:", CFSTR("com.apple.mobile.keybagd.bubbled.sync")))
  {
    if (qword_1000E0200 != -1)
      dispatch_once(&qword_1000E0200, &stru_1000D1C90);
    v7 = (id)qword_1000E01F8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 0;
      v8 = sub_100007750(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if ((_DWORD)v9)
      {
        v36 = 0;
        v10 = (const char *)_os_log_send_and_compose_impl(v9, &v37, 0, 0);
        v11 = (char *)v10;
        if (v10)
          sub_100007780(v10);
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    if (qword_1000E0200 != -1)
      dispatch_once(&qword_1000E0200, &stru_1000D1C90);
    v19 = (id)qword_1000E01F8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 0;
      v20 = sub_100007750(1);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        v21 = v20;
      else
        v21 = v20 & 0xFFFFFFFE;
      if ((_DWORD)v21)
      {
        v36 = 0;
        v22 = (const char *)_os_log_send_and_compose_impl(v21, &v37, 0, 0);
        v23 = (char *)v22;
        if (v22)
          sub_100007780(v22);
      }
      else
      {
        v23 = 0;
      }
      free(v23);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedServer](RDServer, "sharedServer"));
    objc_msgSend(v24, "addBubbleClient:", v6);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RDClient sharedBubbleXPCInterface](RDClient, "sharedBubbleXPCInterface"));
    objc_msgSend(v4, "setRemoteObjectInterface:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedBubbleXPCInterface](RDServer, "sharedBubbleXPCInterface"));
    objc_msgSend(v4, "setExportedInterface:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedServer](RDServer, "sharedServer"));
    objc_msgSend(v4, "setExportedObject:", v27);

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100085C10;
    v31[3] = &unk_1000D0F50;
    v16 = &v32;
    v32 = v6;
    objc_msgSend(v4, "setInvalidationHandler:", v31);
    v30 = _NSConcreteStackBlock;
    v17 = sub_100085C54;
    v18 = &v30;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedServer](RDServer, "sharedServer"));
    objc_msgSend(v12, "addClient:", v6);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RDClient sharedXPCInterface](RDClient, "sharedXPCInterface"));
    objc_msgSend(v4, "setRemoteObjectInterface:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedXPCInterface](RDServer, "sharedXPCInterface"));
    objc_msgSend(v4, "setExportedInterface:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedServer](RDServer, "sharedServer"));
    objc_msgSend(v4, "setExportedObject:", v15);

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100085B88;
    v34[3] = &unk_1000D0F50;
    v16 = &v35;
    v35 = v6;
    objc_msgSend(v4, "setInvalidationHandler:", v34);
    v33 = _NSConcreteStackBlock;
    v17 = sub_100085BCC;
    v18 = &v33;
  }
  v18[1] = (void **)3221225472;
  v18[2] = (void **)v17;
  v18[3] = (void **)&unk_1000D0F50;
  v18[4] = (void **)v6;
  v28 = v6;
  objc_msgSend(v4, "setInterruptionHandler:", v18);

  objc_msgSend(v4, "resume");
  return 1;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
