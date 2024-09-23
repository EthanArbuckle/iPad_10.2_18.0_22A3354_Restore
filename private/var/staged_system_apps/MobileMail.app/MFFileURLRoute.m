@implementation MFFileURLRoute

- (MFFileURLRoute)initWithScene:(id)a3
{
  id v4;
  MFFileURLRoute *v5;
  MFFileURLRoute *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFFileURLRoute;
  v5 = -[MFFileURLRoute init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v6->_priority = 0;
  }

  return v6;
}

- (BOOL)canRouteRequest:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URL"));
  v4 = objc_msgSend(v3, "isFileURL");

  return v4;
}

- (id)routeRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  void (**v10)(id, _QWORD);
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  void (**v26)(_QWORD, _QWORD);
  void (**v27)(id, _QWORD);
  id v28;
  uint8_t buf[24];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v7 = -[MFFileURLRoute _urlReferencesMailLibrary:](self, "_urlReferencesMailLibrary:", v6);

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      sub_100394024(v9, buf, v8);
    }

    v10 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter"));
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(+[NSError mf_blockedURLErrorWithRequest:](NSError, "mf_blockedURLErrorWithRequest:", v4));
    v10[2](v10, v11);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
    v15 = objc_msgSend(v12, "isReadableFileAtPath:", v14);

    if ((v15 & 1) != 0)
    {
      v10 = (void (**)(id, _QWORD))objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:", 0);
      objc_msgSend(v10, "setShowKeyboardImmediately:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
      objc_msgSend(v10, "insertAttachmentWithURL:", v16);

      v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MFFileURLRoute scene](self, "scene"));
      v11 = v17;
      if (v17)
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100162DCC;
        v25[3] = &unk_10051A960;
        v26 = v17;
        v27 = v10;
        v28 = v5;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
        objc_msgSend(v18, "performBlock:", v25);

      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_generalRoutingErrorWithDescription:request:](NSError, "mf_generalRoutingErrorWithDescription:request:", CFSTR("Cannot present compose. Scene is nil."), v4));
        objc_msgSend(v5, "finishWithError:", v22);

      }
    }
    else
    {
      v19 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
        sub_100394078(v20, buf, v19);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError em_internalErrorWithReason:](NSError, "em_internalErrorWithReason:", CFSTR("non-existent or unreadable file")));
      v10 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue(+[NSError mf_routingErrorWithUnderlyingError:request:allowFallbackRouting:](NSError, "mf_routingErrorWithUnderlyingError:request:allowFallbackRouting:", v21, v4, 1));

      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter"));
      v11[2](v11, v10);
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "future"));
  return v23;
}

- (BOOL)_urlReferencesMailLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;
  unint64_t v9;

  v3 = a3;
  v9 = 0xAAAAAAAAAAAAAAAALL;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EMPersistenceLayoutManager baseMailDirectory](EMPersistenceLayoutManager, "baseMailDirectory"));
  v6 = objc_msgSend(v4, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v9, v5, v3, 0);

  if (v9 < 2)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(self), self);
}

- (int64_t)priority
{
  return self->_priority;
}

- (ComposeCapable)scene
{
  return (ComposeCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
