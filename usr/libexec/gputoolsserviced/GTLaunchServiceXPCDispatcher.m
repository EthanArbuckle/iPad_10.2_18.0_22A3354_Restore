@implementation GTLaunchServiceXPCDispatcher

- (GTLaunchServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  GTLaunchServiceXPCDispatcher *v9;
  objc_super v11;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "protocolMethods"));
  v11.receiver = self;
  v11.super_class = (Class)GTLaunchServiceXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, "initWithProtocolMethods:", v8);

  if (v9)
    objc_storeStrong((id *)&v9->_service, a3);

  return v9;
}

- (void)launchReplayService_error_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *nsobject;
  xpc_object_t reply;
  void *v11;
  GTLaunchService *service;
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class(GTLaunchRequest);
  nsobject = xpc_dictionary_get_nsobject(v7, "request", v8);
  reply = gt_xpc_dictionary_create_reply(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  v14 = 0;
  LOBYTE(v7) = -[GTLaunchService launchReplayService:error:](service, "launchReplayService:error:", nsobject, &v14);
  v13 = v14;
  if ((v7 & 1) == 0)
    xpc_dictionary_set_nserror(v11, "error", v13);
  objc_msgSend(v6, "sendMessage:", v11);

}

- (void)foregroundService_error_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t uint64;
  GTLaunchService *service;
  id v10;
  xpc_object_t reply;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  uint64 = xpc_dictionary_get_uint64(v7, "servicePort");
  service = self->_service;
  v13 = 0;
  -[GTLaunchService foregroundService:error:](service, "foregroundService:error:", uint64, &v13);
  v10 = v13;
  reply = gt_xpc_dictionary_create_reply(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nserror(v12, "error", v10);
  objc_msgSend(v6, "sendMessage:", v12);

}

- (void)resumeService_error_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t uint64;
  GTLaunchService *service;
  id v10;
  xpc_object_t reply;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  uint64 = xpc_dictionary_get_uint64(v7, "servicePort");
  service = self->_service;
  v13 = 0;
  -[GTLaunchService resumeService:error:](service, "resumeService:error:", uint64, &v13);
  v10 = v13;
  reply = gt_xpc_dictionary_create_reply(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nserror(v12, "error", v10);
  objc_msgSend(v6, "sendMessage:", v12);

}

- (void)symbolicatorForService_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t uint64;
  xpc_object_t reply;
  void *v10;
  GTLaunchService *service;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  uint64 = xpc_dictionary_get_uint64(v7, "servicePort");
  reply = gt_xpc_dictionary_create_reply(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001C3C0;
  v14[3] = &unk_100030FC8;
  v15 = v10;
  v16 = v6;
  v12 = v6;
  v13 = v10;
  -[GTLaunchService symbolicatorForService:completionHandler:](service, "symbolicatorForService:completionHandler:", uint64, v14);

}

- (void)processStateForService_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t uint64;
  xpc_object_t reply;
  void *v10;
  GTLaunchService *service;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  uint64 = xpc_dictionary_get_uint64(v7, "servicePort");
  reply = gt_xpc_dictionary_create_reply(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001C318;
  v14[3] = &unk_100030FF0;
  v15 = v10;
  v16 = v6;
  v12 = v6;
  v13 = v10;
  -[GTLaunchService processStateForService:completionHandler:](service, "processStateForService:completionHandler:", uint64, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
