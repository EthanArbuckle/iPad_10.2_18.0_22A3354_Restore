@implementation MLRExtensionPluginManager

+ (id)pluginManagerForBundleIdentifier:(id)a3 endpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  NSObject *v38;
  _QWORD v39[2];
  _QWORD v40[2];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v39[0] = NSExtensionPointName;
      v39[1] = NSExtensionIdentifierName;
      v40[0] = v7;
      v40[1] = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 2));
      v32 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSExtension extensionsWithMatchingAttributes:error:](NSExtension, "extensionsWithMatchingAttributes:error:", v9, &v32));
      v11 = v32;
      if ((unint64_t)objc_msgSend(v10, "count") < 2)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

        v29 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
        v12 = v29;
        if (v28)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            sub_100008CB0(v10, v12);

          v30 = objc_alloc((Class)a1);
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
          v27 = objc_msgSend(v30, "initWithExtension:", v12);
          goto LABEL_18;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v34 = v6;
          v35 = 2112;
          v36 = v8;
          v37 = 2112;
          v38 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to find extension for identifier=%@ extensionPoint=%@, with error=%@", buf, 0x20u);
        }
      }
      else
      {
        v12 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          sub_100008C30((uint64_t)v6, (uint64_t)v8, v12);
      }
      v27 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v11 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100008C00(v11, v20, v21, v22, v23, v24, v25, v26);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100008BD0(v11, v13, v14, v15, v16, v17, v18, v19);
  }
  v27 = 0;
LABEL_19:

  return v27;
}

- (MLRExtensionPluginManager)initWithExtension:(id)a3
{
  id v5;
  MLRExtensionPluginManager *v6;
  MLRExtensionPluginManager *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *syncQueue;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  id v27;
  const char *v28;
  dispatch_queue_attr_t v29;
  NSObject *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *taskExecutionQueue;
  objc_super v34;

  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MLRExtensionPluginManager;
  v6 = -[MLRExtensionPluginManager init](&v34, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(".")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));

    v13 = (objc_class *)objc_opt_class(v7);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v15, v12));

    v17 = objc_retainAutorelease(v16);
    v18 = (const char *)objc_msgSend(v17, "cStringUsingEncoding:", 4);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create(v18, v20);
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = (OS_dispatch_queue *)v21;

    v23 = (objc_class *)objc_opt_class(v7);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.execution"), v25, v12));

    v27 = objc_retainAutorelease(v26);
    v28 = (const char *)objc_msgSend(v27, "cStringUsingEncoding:", 4);
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = dispatch_queue_create(v28, v30);
    taskExecutionQueue = v7->_taskExecutionQueue;
    v7->_taskExecutionQueue = (OS_dispatch_queue *)v31;

    -[MLRExtensionPluginManager _setupExtensionHandlers](v7, "_setupExtensionHandlers");
  }

  return v7;
}

- (void)_setupExtensionHandlers
{
  _QWORD v3[4];
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006B60;
  v5[3] = &unk_1000186C0;
  objc_copyWeak(&v6, &location);
  -[NSExtension setRequestInterruptionBlock:](self->_extension, "setRequestInterruptionBlock:", v5);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006C7C;
  v3[3] = &unk_1000186E8;
  objc_copyWeak(&v4, &location);
  -[NSExtension setRequestCancellationBlock:](self->_extension, "setRequestCancellationBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)extensionName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension identifier](self->_extension, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(".")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  return v4;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionPluginManager extensionName](self, "extensionName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %@>"), v3, v4));

  return (NSString *)v5;
}

- (void)_activateExtensionIfNecessary
{
  NSObject *v3;
  NSExtension *extension;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSUUID *v8;
  NSUUID *sessionID;
  id v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  if (!self->_sessionID)
  {
    if (self->_stopped)
    {
      v3 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        sub_100008EA8();
    }
    else
    {
      extension = self->_extension;
      v10 = 0;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension beginExtensionRequestWithOptions:inputItems:error:](extension, "beginExtensionRequestWithOptions:inputItems:error:", 0, 0, &v10));
      v3 = v10;
      if (v5)
      {
        v6 = objc_claimAutoreleasedReturnValue(-[NSExtension _extensionContextForUUID:](self->_extension, "_extensionContextForUUID:", v5));
        v7 = objc_opt_class(MLRExtensionHostContext);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          objc_storeStrong((id *)&self->_hostContext, v6);
          v8 = v5;
          sessionID = self->_sessionID;
          self->_sessionID = v8;
        }
        else
        {
          sessionID = (NSUUID *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
          if (os_log_type_enabled(&sessionID->super, OS_LOG_TYPE_ERROR))
            sub_100008E28((uint64_t)v6, &sessionID->super);
        }

      }
      else
      {
        v6 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_100008DC4();
      }

    }
  }
}

- (int64_t)_graceIntervalBeforeKilling
{
  if (-[MLRExtensionPluginManager shouldTriggerSimulatedCrash](self, "shouldTriggerSimulatedCrash"))
    return 10000000000;
  else
    return 0;
}

- (void)_killExtension:(id)a3 afterInterval:(int64_t)a4
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *syncQueue;
  _QWORD block[4];
  id v11;

  v6 = a3;
  v7 = v6;
  if (a4 < 1)
  {
    objc_msgSend(v6, "_kill:", 9);
  }
  else
  {
    v8 = dispatch_time(0, a4);
    syncQueue = self->_syncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000070C0;
    block[3] = &unk_100018710;
    v11 = v7;
    dispatch_after(v8, syncQueue, block);

  }
}

- (void)_triggerSimulatedCrash
{
  NSObject *v3;
  MLRExtensionHostContext *hostContext;
  _QWORD v5[5];

  v3 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100008F0C(self, v3);

  hostContext = self->_hostContext;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007170;
  v5[3] = &unk_100018778;
  v5[4] = self;
  -[MLRExtensionHostContext performOnRemoteObjectSynchronouslyWithBlock:errorHandler:](hostContext, "performOnRemoteObjectSynchronouslyWithBlock:errorHandler:", &stru_100018750, v5);
}

- (void)_unload
{
  NSObject *v3;
  MLRExtensionHostContext *hostContext;
  NSUUID *sessionID;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v3 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100009010();

  if (self->_sessionID)
  {
    -[NSExtension setRequestCancellationBlock:](self->_extension, "setRequestCancellationBlock:", 0);
    -[NSExtension setRequestInterruptionBlock:](self->_extension, "setRequestInterruptionBlock:", 0);
    hostContext = self->_hostContext;
    self->_hostContext = 0;

    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:", self->_sessionID);
    sessionID = self->_sessionID;
    self->_sessionID = 0;

  }
}

- (void)unload
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000072C8;
  block[3] = &unk_100018710;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

- (id)_recordDirectoriesForIdentifier:(id)a3
{
  id v3;
  DESRecordStoreManager *v4;
  void *v5;

  v3 = a3;
  v4 = objc_opt_new(DESRecordStoreManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DESRecordStoreManager recordDirURLsForBundleId:](v4, "recordDirURLsForBundleId:", v3));

  return v5;
}

- (id)_createSandBoxExtensions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  MLRExtensionHostContext *hostContext;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  MLRExtensionHostContext *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  MLRExtensionHostContext *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v32;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipe"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attachments"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    hostContext = self->_hostContext;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipe"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attachments"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext issueSandBoxExtensionsForFileURLs:requireWrite:outError:](hostContext, "issueSandBoxExtensionsForFileURLs:requireWrite:outError:", v13, 0, a4));

    v15 = objc_msgSend(v14, "count");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipe"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attachments"));
    v18 = objc_msgSend(v17, "count");

    if (v15 != v18)
    {
      v28 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_10000916C(v6, v28);
      goto LABEL_14;
    }
    objc_msgSend(v7, "addObjectsFromArray:", v14);

  }
  v19 = self->_hostContext;
  v20 = DESSubmissionLogDirectoryURL();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v32 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext issueSandBoxExtensionsForFileURLs:requireWrite:outError:](v19, "issueSandBoxExtensionsForFileURLs:requireWrite:outError:", v22, 1, a4));

  if (objc_msgSend(v14, "count") != (id)1)
  {
    v28 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_100009108();
    goto LABEL_14;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
  objc_msgSend(v7, "addObject:", v23);

  v24 = self->_hostContext;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipe"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bundleIdentifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionPluginManager _recordDirectoriesForIdentifier:](self, "_recordDirectoriesForIdentifier:", v26));
  v28 = objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext issueSandBoxExtensionsForFileURLs:requireWrite:outError:](v24, "issueSandBoxExtensionsForFileURLs:requireWrite:outError:", v27, 0, a4));

  if (!-[NSObject count](v28, "count"))
  {
    v30 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_100009074(v6, v30);

LABEL_14:
    v29 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v7, "addObjectsFromArray:", v28);
  v29 = objc_msgSend(v7, "copy");
LABEL_15:

  return v29;
}

- (id)_skipTaskError
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSErrorUserInfoKey v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionPluginManager extensionName](self, "extensionName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ignoring tasks after plugin=%@ is requested to stop."), v2));

  v4 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100009200();

  v5 = kDESDistributedEvaluationErrorDomain;
  v9 = NSLocalizedDescriptionKey;
  v10 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v5, 8003, v6));

  return v7;
}

- (id)_failToGetHostError
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSErrorUserInfoKey v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionPluginManager extensionName](self, "extensionName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Fail to get host context for %@."), v2));

  v4 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100009200();

  v5 = kDESDistributedEvaluationErrorDomain;
  v9 = NSLocalizedDescriptionKey;
  v10 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v5, 8004, v6));

  return v7;
}

- (id)_failToPerformErrorWithError:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 stopped;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];

  v4 = a3;
  if (!v4)
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("error should not be nil"), 0));
    objc_exception_throw(v17);
  }
  v5 = v4;
  stopped = self->_stopped;
  v7 = objc_claimAutoreleasedReturnValue(-[MLRExtensionPluginManager extensionName](self, "extensionName"));
  v8 = (void *)v7;
  if (stopped)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Not responding to stop request?"), v7));

    v10 = kDESDistributedEvaluationErrorDomain;
    v20[0] = NSLocalizedDescriptionKey;
    v20[1] = NSUnderlyingErrorKey;
    v21[0] = v9;
    v21[1] = v5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, 8015, v11));

    v13 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100009264();
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ crashed?"), v7));

    v14 = kDESDistributedEvaluationErrorDomain;
    v18[0] = NSLocalizedDescriptionKey;
    v18[1] = NSUnderlyingErrorKey;
    v19[0] = v13;
    v19[1] = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, 8016, v15));

  }
  return v12;
}

- (id)sandboxExtensionsForTask:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  MLRExtensionHostContext *hostContext;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = v6;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "MLRSandboxExtensionRequests"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        hostContext = self->_hostContext;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLs"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext issueSandBoxExtensionsForFileURLs:requireWrite:outError:](hostContext, "issueSandBoxExtensionsForFileURLs:requireWrite:outError:", v14, objc_msgSend(v12, "requireWrite"), a4));

        v16 = objc_msgSend(v15, "count");
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLs"));
        v18 = objc_msgSend(v17, "count");

        if (v16 != v18)
        {

          v19 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v7, "addObjectsFromArray:", v15);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
        continue;
      break;
    }
  }

  v19 = v7;
LABEL_11:

  return v19;
}

- (id)performTask:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *taskExecutionQueue;
  id v8;
  void *v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(_QWORD *);
  void *v15;
  MLRExtensionPluginManager *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100007DCC;
  v30 = sub_100007DDC;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100007DCC;
  v24 = sub_100007DDC;
  v25 = 0;
  taskExecutionQueue = self->_taskExecutionQueue;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100007DE4;
  v15 = &unk_100018840;
  v16 = self;
  v18 = &v20;
  v8 = v6;
  v17 = v8;
  v19 = &v26;
  dispatch_sync(taskExecutionQueue, &v12);
  if (a4)
  {
    v9 = (void *)v21[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  -[MLRExtensionPluginManager unload](self, "unload", v12, v13, v14, v15, v16);
  v10 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (id)performTrialTask:(id)a3 outError:(id *)a4
{
  id v6;
  NSObject *taskExecutionQueue;
  id v8;
  void *v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(_QWORD *);
  void *v15;
  MLRExtensionPluginManager *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100007DCC;
  v30 = sub_100007DDC;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100007DCC;
  v24 = sub_100007DDC;
  v25 = 0;
  taskExecutionQueue = self->_taskExecutionQueue;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10000835C;
  v15 = &unk_100018840;
  v16 = self;
  v18 = &v20;
  v8 = v6;
  v17 = v8;
  v19 = &v26;
  dispatch_sync(taskExecutionQueue, &v12);
  if (a4)
  {
    v9 = (void *)v21[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  -[MLRExtensionPluginManager unload](self, "unload", v12, v13, v14, v15, v16);
  v10 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

- (int64_t)_graceIntervalBeforeUnloading
{
  return 5000000000;
}

- (void)stopWithCompletion:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000087F0;
  v7[3] = &unk_100018890;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(syncQueue, v7);

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_hostContext, 0);
  objc_storeStrong((id *)&self->_taskExecutionQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
