@implementation MLRExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_10001F620 != -1)
    dispatch_once(&qword_10001F620, &stru_100018B30);
  return (id)qword_10001F628;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_10001F630 != -1)
    dispatch_once(&qword_10001F630, &stru_100018B50);
  return (id)qword_10001F638;
}

- (int)pid
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (void)performOnRemoteObjectWithBlock:(id)a3 errorHandler:(id)a4
{
  -[MLRExtensionHostContext performOnRemoteObjectSynchronously:WithBlock:errorHandler:](self, "performOnRemoteObjectSynchronously:WithBlock:errorHandler:", 0, a3, a4);
}

- (void)performOnRemoteObjectSynchronouslyWithBlock:(id)a3 errorHandler:(id)a4
{
  -[MLRExtensionHostContext performOnRemoteObjectSynchronously:WithBlock:errorHandler:](self, "performOnRemoteObjectSynchronously:WithBlock:errorHandler:", 1, a3, a4);
}

- (void)performOnRemoteObjectSynchronously:(BOOL)a3 WithBlock:(id)a4 errorHandler:(id)a5
{
  _BOOL4 v6;
  void (**v8)(id, void *);
  id v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  NSErrorUserInfoKey v26;
  const __CFString *v27;

  v6 = a3;
  v8 = (void (**)(id, void *))a4;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10000FC68;
  v24 = sub_10000FC78;
  v25 = 0;
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000FC80;
    v19[3] = &unk_100018B78;
    v19[5] = &v20;
    v11 = v19;
    v19[4] = v9;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v19));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000FD10;
    v18[3] = &unk_100018B78;
    v18[5] = &v20;
    v11 = v18;
    v18[4] = v9;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18));
  }
  v13 = (void *)v12;

  if (!v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10000FE30(v14);

    if (!v21[5])
    {
      v26 = NSLocalizedDescriptionKey;
      v27 = CFSTR("Fail to create remote object proxy.");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      v16 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kDESDistributedEvaluationErrorDomain, 8000, v15));
      v17 = (void *)v21[5];
      v21[5] = v16;

    }
    if (v9)
      (*((void (**)(id, uint64_t))v9 + 2))(v9, v21[5]);
  }
  if (v8)
    v8[2](v8, v13);

  _Block_object_dispose(&v20, 8);
}

- (id)issueSandBoxExtensionsForFileURLs:(id)a3 requireWrite:(BOOL)a4 outError:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DESSandBoxManager sandboxExtensionsToXPCConnection:fileURLs:requireWrite:outError:](DESSandBoxManager, "sandboxExtensionsToXPCConnection:fileURLs:requireWrite:outError:", v9, v8, v6, a5));

  return v10;
}

@end
