@implementation RDCommServer

- (RDCommServer)init
{
  RDCommServer *v2;
  RDXPCHandler *v3;
  RDXPCHandler *server;
  uint64_t v5;
  NSXPCInterface *interface;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  RDCommServer *v13;
  objc_super v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;

  v15.receiver = self;
  v15.super_class = (Class)RDCommServer;
  v2 = -[RDCommServer init](&v15, "init");
  if (v2)
  {
    v3 = objc_alloc_init(RDXPCHandler);
    server = v2->server;
    v2->server = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RDXPCProtocol));
    interface = v2->interface;
    v2->interface = (NSXPCInterface *)v5;

    v7 = objc_opt_class(NSString);
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(RDEstimate), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v2->interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, "updatePeer:withEstimate:", 0, 0);
    if (v2->interface)
    {
      v10 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.countryd.update"));
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "setDelegate:", v2);
        if (qword_1000193A8 != -1)
          dispatch_once(&qword_1000193A8, &stru_100014A70);
        v12 = qword_1000193B0;
        if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          v17 = 0;
          v18 = 2082;
          v19 = "";
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"listener is starting connection...\"}", buf, 0x12u);
        }
        objc_msgSend(v11, "resume");
        v13 = v2;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;

  v5 = a4;
  objc_msgSend(v5, "setExportedInterface:", self->interface);
  objc_msgSend(v5, "setExportedObject:", self->server);
  if (qword_1000193A8 != -1)
    dispatch_once(&qword_1000193A8, &stru_100014A70);
  v6 = qword_1000193B0;
  if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_INFO))
  {
    v8[0] = 68289026;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"listener is resuming connection...\"}", (uint8_t *)v8, 0x12u);
  }
  objc_msgSend(v5, "resume");

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->interface, 0);
  objc_storeStrong((id *)&self->server, 0);
}

@end
