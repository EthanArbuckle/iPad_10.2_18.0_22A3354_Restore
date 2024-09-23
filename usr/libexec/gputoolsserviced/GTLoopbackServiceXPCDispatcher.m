@implementation GTLoopbackServiceXPCDispatcher

- (GTLoopbackServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  GTLoopbackServiceXPCDispatcher *v9;
  objc_super v11;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "protocolMethods"));
  v11.receiver = self;
  v11.super_class = (Class)GTLoopbackServiceXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, "initWithProtocolMethods:", v8);

  if (v9)
    objc_storeStrong((id *)&v9->_service, a3);

  return v9;
}

- (void)echo_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  xpc_object_t reply;
  void *v10;
  id nsdictionary_any;

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTLoopbackService echo:](self->_service, "echo:", nsdictionary_any));
  reply = gt_xpc_dictionary_create_reply(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nsobject(v10, "data", (uint64_t)v8);
  objc_msgSend(v6, "sendMessage:", v10);

}

- (void)echo_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id nsdictionary_any;
  xpc_object_t reply;
  void *v10;
  GTLoopbackService *service;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  reply = gt_xpc_dictionary_create_reply(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011278;
  v14[3] = &unk_100030BC8;
  v15 = v10;
  v16 = v6;
  v12 = v6;
  v13 = v10;
  -[GTLoopbackService echo:completionHandler:](service, "echo:completionHandler:", nsdictionary_any, v14);

}

- (void)echo_repeat_callback_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id nsdictionary_any;
  uint64_t uint64;
  uint64_t v10;
  xpc_object_t array;
  void *v12;
  GTLoopbackService *service;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  uint64 = xpc_dictionary_get_uint64(v7, "repeat");
  v10 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  array = xpc_dictionary_get_array(v7, "_pathHistory");
  v12 = (void *)objc_claimAutoreleasedReturnValue(array);

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  service = self->_service;
  v22[3] = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000113F8;
  v16[3] = &unk_100030BF0;
  v19 = v22;
  v20 = v10;
  v21 = uint64;
  v17 = v12;
  v18 = v6;
  v14 = v6;
  v15 = v12;
  -[GTLoopbackService echo:repeat:callback:](service, "echo:repeat:callback:", nsdictionary_any, uint64, v16);

  _Block_object_dispose(v22, 8);
}

- (void)echo_repeat_callback_complete_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id nsdictionary_any;
  uint64_t uint64;
  uint64_t v10;
  xpc_object_t array;
  void *v12;
  xpc_object_t reply;
  void *v14;
  GTLoopbackService *service;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  uint64 = xpc_dictionary_get_uint64(v7, "repeat");
  v10 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  array = xpc_dictionary_get_array(v7, "_pathHistory");
  v12 = (void *)objc_claimAutoreleasedReturnValue(array);
  reply = gt_xpc_dictionary_create_reply(v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001163C;
  v22[3] = &unk_100030C18;
  v25 = v10;
  v23 = v12;
  v24 = v6;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000116D0;
  v19[3] = &unk_100030BC8;
  v20 = v14;
  v21 = v24;
  v16 = v24;
  v17 = v14;
  v18 = v12;
  -[GTLoopbackService echo:repeat:callback:complete:](service, "echo:repeat:callback:complete:", nsdictionary_any, uint64, v22, v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
