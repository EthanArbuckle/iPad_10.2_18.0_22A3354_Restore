@implementation GTFileWriterServiceXPCDispatcher

- (GTFileWriterServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  GTFileWriterServiceXPCDispatcher *v9;
  objc_super v11;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "protocolMethods"));
  v11.receiver = self;
  v11.super_class = (Class)GTFileWriterServiceXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, "initWithProtocolMethods:", v8);

  if (v9)
    objc_storeStrong((id *)&v9->_service, a3);

  return v9;
}

- (void)initiateTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  uint64_t v10;
  void *nsarray;
  const char *string;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *nsobject;
  GTFileWriterService *service;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  NSErrorUserInfoKey v28;
  void *v29;
  NSErrorUserInfoKey v30;
  void *v31;

  v6 = a3;
  v7 = a4;
  reply = gt_xpc_dictionary_create_reply(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  v10 = objc_opt_class(GTFileEntry);
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v10);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string))) != 0)
  {
    v14 = (void *)v13;
    v15 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v15
      && (v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15))) != 0)
    {
      v17 = (void *)v16;
      v18 = objc_opt_class(GTFileTransferOptions);
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v18);
      service = self->_service;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10000DE04;
      v25[3] = &unk_100030AE0;
      v26 = v9;
      v27 = v7;
      -[GTFileWriterService initiateTransfer:basePath:fromDevice:options:completionHandler:](service, "initiateTransfer:basePath:fromDevice:options:completionHandler:", nsarray, v14, v17, nsobject, v25);

    }
    else
    {
      v28 = NSLocalizedDescriptionKey;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid device UDID passed to initiateTransfer")));
      v29 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v24));

      xpc_dictionary_set_nserror(v9, "error", v17);
      objc_msgSend(v7, "sendMessage:", v9);
    }

  }
  else
  {
    v30 = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid path passed to initiateTransfer")));
    v31 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v22));

    xpc_dictionary_set_nserror(v9, "error", v14);
    objc_msgSend(v7, "sendMessage:", v9);
  }

}

- (void)startTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  uint64_t v10;
  void *nsarray;
  const char *string;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *nsobject;
  GTFileWriterService *service;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  NSErrorUserInfoKey v28;
  void *v29;
  NSErrorUserInfoKey v30;
  void *v31;

  v6 = a3;
  v7 = a4;
  reply = gt_xpc_dictionary_create_reply(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  v10 = objc_opt_class(GTFileEntry);
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v10);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string))) != 0)
  {
    v14 = (void *)v13;
    v15 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v15
      && (v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15))) != 0)
    {
      v17 = (void *)v16;
      v18 = objc_opt_class(GTFileTransferOptions);
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v18);
      service = self->_service;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10000E178;
      v25[3] = &unk_1000309C8;
      v26 = v9;
      v27 = v7;
      -[GTFileWriterService startTransfer:basePath:fromDevice:options:completionHandler:](service, "startTransfer:basePath:fromDevice:options:completionHandler:", nsarray, v14, v17, nsobject, v25);

    }
    else
    {
      v28 = NSLocalizedDescriptionKey;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid device UDID passed to startTransfer")));
      v29 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v24));

      xpc_dictionary_set_nserror(v9, "error", v17);
      objc_msgSend(v7, "sendMessage:", v9);
    }

  }
  else
  {
    v30 = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid path passed to startTransfer")));
    v31 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v22));

    xpc_dictionary_set_nserror(v9, "error", v14);
    objc_msgSend(v7, "sendMessage:", v9);
  }

}

- (void)beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  uint64_t v10;
  void *nsarray;
  const char *string;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *nsobject;
  uint64_t uint64;
  GTFileWriterService *service;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  NSErrorUserInfoKey v29;
  void *v30;
  NSErrorUserInfoKey v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  reply = gt_xpc_dictionary_create_reply(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  v10 = objc_opt_class(GTFileEntry);
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v10);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string))) != 0)
  {
    v14 = (void *)v13;
    v15 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v15
      && (v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15))) != 0)
    {
      v17 = (void *)v16;
      v18 = objc_opt_class(GTFileTransferOptions);
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v18);
      uint64 = xpc_dictionary_get_uint64(v6, "sessionID");
      service = self->_service;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000E534;
      v26[3] = &unk_100030AE0;
      v27 = v9;
      v28 = v7;
      -[GTFileWriterService beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:](service, "beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:", nsarray, v14, v17, nsobject, uint64, v26);

    }
    else
    {
      v29 = NSLocalizedDescriptionKey;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid device UDID passed to beginTransferSessionWithFileEntries")));
      v30 = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v25));

      xpc_dictionary_set_nserror(v9, "error", v17);
      objc_msgSend(v7, "sendMessage:", v9);
    }

  }
  else
  {
    v31 = NSLocalizedDescriptionKey;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid path passed to beginTransferSessionWithFileEntries")));
    v32 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v23));

    xpc_dictionary_set_nserror(v9, "error", v14);
    objc_msgSend(v7, "sendMessage:", v9);
  }

}

- (void)writeFileData_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id nsdata_nocopy;
  uint64_t uint64;
  xpc_object_t reply;
  void *v11;
  GTFileWriterService *service;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a4;
  v7 = a3;
  nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(v7, "data");
  uint64 = xpc_dictionary_get_uint64(v7, "sessionID");
  reply = gt_xpc_dictionary_create_reply(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E664;
  v15[3] = &unk_100030AE0;
  v16 = v11;
  v17 = v6;
  v13 = v6;
  v14 = v11;
  -[GTFileWriterService writeFileData:sessionID:completionHandler:](service, "writeFileData:sessionID:completionHandler:", nsdata_nocopy, uint64, v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
