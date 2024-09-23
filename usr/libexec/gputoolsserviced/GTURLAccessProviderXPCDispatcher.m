@implementation GTURLAccessProviderXPCDispatcher

- (GTURLAccessProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  GTURLAccessProviderXPCDispatcher *v9;
  objc_super v11;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "protocolMethods"));
  v11.receiver = self;
  v11.super_class = (Class)GTURLAccessProviderXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, "initWithProtocolMethods:", v8);

  if (v9)
    objc_storeStrong((id *)&v9->_service, a3);

  return v9;
}

- (void)securityScopedURLFromSandboxID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *nsobject;
  __int128 *data;
  __int128 v11;
  void *v12;
  xpc_object_t reply;
  void *v14;
  GTURLAccessProvider *service;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  size_t length;
  __int128 v24;
  __int128 v25;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(NSURL);
  nsobject = xpc_dictionary_get_nsobject(v6, "identifier", v8);
  v24 = 0u;
  v25 = 0u;
  length = 0;
  data = (__int128 *)xpc_dictionary_get_data(v6, "auditToken", &length);
  if (data && length == 32)
  {
    v11 = data[1];
    v24 = *data;
    v25 = v11;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connection"));
    xpc_connection_get_audit_token(v12, &v24);

  }
  reply = gt_xpc_dictionary_create_reply(v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(reply);
  service = self->_service;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000901C;
  v18[3] = &unk_100030978;
  v19 = v7;
  v20 = v14;
  v21 = v24;
  v22 = v25;
  v16 = v14;
  v17 = v7;
  -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:](service, "securityScopedURLFromSandboxID:completionHandler:", nsobject, v18);

}

- (void)makeURL_:(id)a3 replyConnection:(id)a4
{
  id v6;
  xpc_object_t reply;
  void *v8;
  uint64_t v9;
  void *nsobject;
  const char *string;
  NSData *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  xpc_object_t xdict;

  xdict = a3;
  v6 = a4;
  reply = gt_xpc_dictionary_create_reply(xdict);
  v8 = (void *)objc_claimAutoreleasedReturnValue(reply);
  v9 = objc_opt_class(NSURL);
  nsobject = xpc_dictionary_get_nsobject(xdict, "url", v9);
  if (nsobject)
  {
    string = xpc_dictionary_get_string(xdict, "sandboxExtension");
    if (string)
    {
      v12 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", string, strlen(string) + 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      _CFURLAttachSecurityScopeToFileURL(nsobject, v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GTURLAccessProvider makeURL:](self->_service, "makeURL:", nsobject));
    if ((objc_msgSend(v6, "isTrusted") & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v14, 1));
      objc_msgSend(v15, "setHost:", CFSTR("localhost"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URL"));

      v14 = (void *)v16;
    }
    xpc_dictionary_set_nsobject(v8, "identifier", (uint64_t)v14);

  }
  objc_msgSend(v6, "sendMessage:", v8);

}

- (void)transferIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  uint64_t v10;
  void *nsobject;
  const char *string;
  uint64_t v13;
  void *v14;
  GTURLAccessProvider *service;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a4;
  v7 = a3;
  reply = gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  v10 = objc_opt_class(NSURL);
  nsobject = xpc_dictionary_get_nsobject(v7, "identifier", v10);
  string = xpc_dictionary_get_string(v7, "deviceUDID");

  if (string
    && (v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string))) != 0)
  {
    v14 = (void *)v13;
    service = self->_service;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000093A0;
    v16[3] = &unk_1000309A0;
    v17 = v9;
    v18 = v6;
    -[GTURLAccessProvider transferIdentifier:toDevice:completionHandler:](service, "transferIdentifier:toDevice:completionHandler:", nsobject, v14, v16);

  }
  else
  {
    objc_msgSend(v6, "sendMessage:", v9);
  }

}

- (void)copyIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  uint64_t v10;
  void *nsobject;
  const char *string;
  uint64_t v13;
  void *v14;
  GTURLAccessProvider *service;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  NSErrorUserInfoKey v21;
  void *v22;

  v6 = a4;
  v7 = a3;
  reply = gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  v10 = objc_opt_class(NSURL);
  nsobject = xpc_dictionary_get_nsobject(v7, "identifier", v10);
  string = xpc_dictionary_get_string(v7, "deviceUDID");

  if (string
    && (v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string))) != 0)
  {
    v14 = (void *)v13;
    service = self->_service;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000095F0;
    v18[3] = &unk_1000309C8;
    v19 = v9;
    v20 = v6;
    -[GTURLAccessProvider copyIdentifier:toDevice:completionHandler:](service, "copyIdentifier:toDevice:completionHandler:", nsobject, v14, v18);

  }
  else
  {
    v21 = NSLocalizedDescriptionKey;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTURLAccessProviderXPCDispatcher"), CFSTR("Invalid device UDID passed to copyIdentifier")));
    v22 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v17));

    xpc_dictionary_set_nserror(v9, "error", v14);
    objc_msgSend(v6, "sendMessage:", v9);
  }

}

- (void)urlForPath_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  const char *string;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  const char *v19;
  char *v20;
  _OWORD v21[2];
  __int128 v22;
  __int128 v23;

  v6 = a4;
  v7 = a3;
  reply = gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  string = xpc_dictionary_get_string(v7, "path");

  if (string
    && (v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string))) != 0)
  {
    v12 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GTURLAccessProvider urlForPath:](self->_service, "urlForPath:", v11));
    v14 = objc_msgSend(v13, "startAccessingSecurityScopedResource");
    xpc_dictionary_set_nsobject(v9, "result", (uint64_t)v13);
    v22 = 0u;
    v23 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
    xpc_connection_get_audit_token(v15, &v22);

    v16 = APP_SANDBOX_READ;
    v17 = objc_retainAutorelease(v13);
    v18 = objc_msgSend(v17, "fileSystemRepresentation");
    v21[0] = v22;
    v21[1] = v23;
    v19 = (const char *)sandbox_extension_issue_file_to_process(v16, v18, SANDBOX_EXTENSION_DEFAULT, v21);
    if (v19)
    {
      v20 = (char *)v19;
      xpc_dictionary_set_string(v9, "sandboxExtension", v19);
      free(v20);
    }
    if (v14)
      objc_msgSend(v17, "stopAccessingSecurityScopedResource");
    objc_msgSend(v6, "sendMessage:", v9);

  }
  else
  {
    objc_msgSend(v6, "sendMessage:", v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
