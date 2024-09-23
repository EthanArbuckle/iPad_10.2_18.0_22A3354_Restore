@implementation GTURLAccessProviderXPCProxy

- (GTURLAccessProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  __objc2_prot *v8;
  void *v9;
  NSString *v10;
  void *v11;
  unsigned int v12;
  GTURLAccessProviderXPCProxy *v13;
  GTServiceConnection *v14;
  void *v15;
  GTServiceConnection *v16;
  GTXPCConnection *connection;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSSet *ignoreMethods;
  GTURLAccessProviderXPCProxy *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v8 = &OBJC_PROTOCOL___GTURLAccessProvider;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protocolName"));
  v10 = NSStringFromProtocol((Protocol *)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (v12)
  {
    v25.receiver = self;
    v25.super_class = (Class)GTURLAccessProviderXPCProxy;
    v13 = -[GTURLAccessProviderXPCProxy init](&v25, "init");
    if (v13)
    {
      v14 = [GTServiceConnection alloc];
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceUDID"));
      v16 = -[GTServiceConnection initWithConnection:device:port:](v14, "initWithConnection:device:port:", v6, v15, objc_msgSend(v7, "servicePort"));
      connection = v13->_connection;
      v13->_connection = (GTXPCConnection *)v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v8));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protocolMethods"));
      v20 = newSetWithArrayMinusArray(v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      ignoreMethods = v13->_ignoreMethods;
      v13->_ignoreMethods = (NSSet *)v21;

    }
    self = v13;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  NSSet *ignoreMethods;
  NSString *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  ignoreMethods = self->_ignoreMethods;
  v6 = NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (-[NSSet containsObject:](ignoreMethods, "containsObject:", v7))
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GTURLAccessProviderXPCProxy;
    v8 = -[GTURLAccessProviderXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  xpc_object_t empty;
  const char *Name;
  GTXPCConnection *connection;
  id v12;
  _QWORD v13[4];
  id v14;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v17;

  v7 = a4;
  v8 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v8);

  *(_OWORD *)task_info_out = 0u;
  v17 = 0u;
  task_info_outCnt = 8;
  if (!task_info(mach_task_self_, 0xFu, task_info_out, &task_info_outCnt))
    xpc_dictionary_set_data(empty, "auditToken", task_info_out, 0x20uLL);
  connection = self->_connection;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008708;
  v13[3] = &unk_100030950;
  v14 = v7;
  v12 = v7;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v13);

}

- (id)makeURL:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *nsobject;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "url", (uint64_t)v5);
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTXPCConnection connection](self->_connection, "connection"));
  xpc_connection_get_audit_token(v8, &v19);

  v9 = APP_SANDBOX_READ;
  v10 = objc_retainAutorelease(v5);
  v11 = objc_msgSend(v10, "fileSystemRepresentation");

  v18[0] = v19;
  v18[1] = v20;
  v12 = (const char *)sandbox_extension_issue_file_to_process(v9, v11, SANDBOX_EXTENSION_DEFAULT, v18);
  if (v12)
  {
    v13 = (char *)v12;
    xpc_dictionary_set_string(empty, "sandboxExtension", v12);
    free(v13);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0));
  if (v14)
  {
    v15 = objc_opt_class(NSURL);
    nsobject = xpc_dictionary_get_nsobject(v14, "identifier", v15);
  }
  else
  {
    nsobject = 0;
  }

  return nsobject;
}

- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  xpc_object_t empty;
  const char *Name;
  id v14;
  const char *v15;
  GTXPCConnection *connection;
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v11);

  v14 = objc_retainAutorelease(v10);
  v15 = (const char *)objc_msgSend(v14, "UTF8String");

  xpc_dictionary_set_string(empty, "deviceUDID", v15);
  connection = self->_connection;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008A88;
  v18[3] = &unk_100030950;
  v19 = v9;
  v17 = v9;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v18);

}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  xpc_object_t empty;
  const char *Name;
  id v14;
  const char *v15;
  GTXPCConnection *connection;
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v11);

  v14 = objc_retainAutorelease(v10);
  v15 = (const char *)objc_msgSend(v14, "UTF8String");

  xpc_dictionary_set_string(empty, "deviceUDID", v15);
  connection = self->_connection;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008C24;
  v18[3] = &unk_100030950;
  v19 = v9;
  v17 = v9;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v18);

}

- (id)urlForPath:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  id v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *nsobject;
  const char *string;
  NSData *v14;
  void *v15;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v8 = objc_retainAutorelease(v5);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  xpc_dictionary_set_string(empty, "path", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0));
  if (v10)
  {
    v11 = objc_opt_class(NSURL);
    nsobject = xpc_dictionary_get_nsobject(v10, "result", v11);
    string = xpc_dictionary_get_string(v10, "sandboxExtension");
    if (string)
    {
      v14 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", string, strlen(string) + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      _CFURLAttachSecurityScopeToFileURL(nsobject, v15);

    }
  }
  else
  {
    nsobject = 0;
  }

  return nsobject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
