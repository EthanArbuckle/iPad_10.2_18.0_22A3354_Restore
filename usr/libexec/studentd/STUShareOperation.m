@implementation STUShareOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  _UNKNOWN **v14;
  uint64_t v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___STUShareOperation;
  if (!objc_msgSendSuper2(&v17, "validateRequest:error:", v6, a4))
    goto LABEL_19;
  v7 = objc_opt_class(CRKShareRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (!a4)
      goto LABEL_19;
    v14 = &off_1000D2C28;
LABEL_18:
    v15 = CRKErrorWithCodeAndUserInfo(2, v14);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_20;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "courseIdentifier"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_19;
    v14 = &off_1000D2C50;
    goto LABEL_18;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "targetType"));

  if (!v9)
  {
    if (!a4)
      goto LABEL_19;
    v14 = &off_1000D2C78;
    goto LABEL_18;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "targetIdentifier"));

  if (!v10)
  {
    if (!a4)
      goto LABEL_19;
    v14 = &off_1000D2CA0;
    goto LABEL_18;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "urls"));
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    if (a4)
    {
      v14 = &off_1000D2CC8;
      goto LABEL_18;
    }
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  v13 = 1;
LABEL_20:

  return v13;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUShareOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[CRKHostResourcesOperation cancel](self->mHostOperation, "cancel");
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  DMFControlSessionIdentifier *v14;
  DMFControlSessionIdentifier *mSessionIdentifier;
  NSSet *v16;
  NSSet *mHostedResources;
  NSMutableArray *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  id v25;
  NSObject *v26;
  NSMutableArray *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _UNKNOWN **v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  void *v45;
  uint8_t buf[4];
  STUShareOperation *v47;
  __int16 v48;
  NSMutableArray *v49;
  _BYTE v50[128];
  const __CFString *v51;
  const __CFString *v52;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeCourseIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    v51 = CFSTR("kCRKItemNameErrorKey");
    v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue(-[NSMutableArray stringValue](v18, "stringValue"));
    v19 = (void *)v31;
    v32 = CFSTR("request.courseIdentifier.stringValue");
    if (v31)
      v32 = (const __CFString *)v31;
    v52 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
    v34 = CRKErrorWithCodeAndUserInfo(12, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[STUShareOperation endOperationWithError:](self, "endOperationWithError:", v35);
LABEL_23:

    goto LABEL_27;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetType"));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("instructor"));

  if ((v11 & 1) == 0)
  {
    v36 = &off_1000D2CF0;
LABEL_26:
    v37 = CRKErrorWithCodeAndUserInfo(2, v36);
    v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v37);
    -[STUShareOperation endOperationWithError:](self, "endOperationWithError:", v18);
    goto LABEL_27;
  }
  v12 = objc_alloc((Class)DMFControlSessionIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetIdentifier"));
  v14 = (DMFControlSessionIdentifier *)objc_msgSend(v12, "initWithString:", v13);
  mSessionIdentifier = self->mSessionIdentifier;
  self->mSessionIdentifier = v14;

  if (!self->mSessionIdentifier)
  {
    v36 = &off_1000D2D18;
    goto LABEL_26;
  }
  v16 = objc_opt_new(NSSet);
  mHostedResources = self->mHostedResources;
  self->mHostedResources = v16;

  v18 = objc_opt_new(NSMutableArray);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "urls"));
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v24, "isFileURL"))
        {
          -[NSMutableArray addObject:](v18, "addObject:", v24);
        }
        else
        {
          v25 = sub_10000F450();
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v27 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "absoluteString"));
            *(_DWORD *)buf = 138543618;
            v47 = self;
            v48 = 2114;
            v49 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%{public}@: Posting share notification for non-hosted URL %{public}@", buf, 0x16u);

          }
          if (!-[STUShareOperation postShareNotificationForURL:](self, "postShareNotificationForURL:", v24))
          {
            v44 = CFSTR("kCRKSessionIdentifierStringErrorKey");
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[DMFControlSessionIdentifier stringValue](self->mSessionIdentifier, "stringValue"));
            v45 = v33;
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
            v38 = CRKErrorWithCodeAndUserInfo(15, v35);
            v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
            -[STUShareOperation endOperationWithError:](self, "endOperationWithError:", v39);

            goto LABEL_23;
          }
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v21)
        continue;
      break;
    }
  }

  if (-[NSMutableArray count](v18, "count"))
  {
    v28 = sub_10000F450();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v47 = self;
      v48 = 2114;
      v49 = v18;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%{public}@: Sharing file urls %{public}@", buf, 0x16u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sandboxExtensions"));
    -[STUShareOperation consumeSandboxExtensions:](self, "consumeSandboxExtensions:", v30);

    -[STUShareOperation hostFileURLs:](self, "hostFileURLs:", v18);
  }
  else
  {
    -[STUShareOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
LABEL_27:

}

- (void)operationDidFinish
{
  -[CRKHostResourcesOperation cancel](self->mHostOperation, "cancel");
  -[STUShareOperation releaseSandboxExtensions](self, "releaseSandboxExtensions");
}

- (BOOL)postShareNotificationForResources:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  if (!v5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUShareOperation.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resources"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUShareOperation baseNotificationUserInfo](self, "baseNotificationUserInfo"));
  v15 = CRKSharedURLResourcesKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("dictionaryValue")));
  v16 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crk_dictionaryByAddingEntriesFromDictionary:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "daemon"));
  v12 = objc_msgSend(v11, "postNotificationToSessionWithIdentifier:name:userInfo:", self->mSessionIdentifier, CRKStudentDidShareURLNotificationName, v9);

  return v12;
}

- (BOOL)postShareNotificationForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUShareOperation baseNotificationUserInfo](self, "baseNotificationUserInfo"));
  v11 = CRKSharedURLUserInfoKey;
  v12 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crk_dictionaryByAddingEntriesFromDictionary:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "daemon"));
  LOBYTE(self) = objc_msgSend(v9, "postNotificationToSessionWithIdentifier:name:userInfo:", self->mSessionIdentifier, CRKStudentDidShareURLNotificationName, v7);

  return (char)self;
}

- (id)baseNotificationUserInfo
{
  void *v2;
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUShareOperation request](self, "request"));
  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shareDescription"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shareDescription"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CRKSharedURLDisplayNameUserInfoKey);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "previewImageData"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "previewImageData"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CRKSharedURLPreviewImageDataUserInfoKey);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sourceBundleIdentifier"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sourceBundleIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, CRKSharedURLSourceBundleIdentifierUserInfoKey);

  }
  return v3;
}

- (void)consumeSandboxExtensions:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  int v15;
  id v16;
  NSArray *mSandboxExtensionHandles;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  STUShareOperation *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10));
        v12 = sandbox_extension_consume(objc_msgSend(v11, "bytes"));
        if (v12 < 0)
        {
          v14 = sub_10000F450();
          v13 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v15 = *__error();
            v16 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
            *(_DWORD *)buf = 138543874;
            v23 = self;
            v24 = 1024;
            v25 = v15;
            v26 = 2082;
            v27 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: sandbox_extension_consume failed with error %d for tokenData \"%{public}s\", buf, 0x1Cu);
          }
        }
        else
        {
          v13 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v12));
          -[NSMutableArray addObject:](v5, "addObject:", v13);
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v8);
  }
  mSandboxExtensionHandles = self->mSandboxExtensionHandles;
  self->mSandboxExtensionHandles = &v5->super;

}

- (void)releaseSandboxExtensions
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->mSandboxExtensionHandles;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        sandbox_extension_release(objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "integerValue", (_QWORD)v7));
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)hostFileURLs:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CRKHostResourcesOperation *v14;
  CRKHostResourcesOperation *mHostOperation;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  STUShareOperation *v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v5 = sub_10000F450();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v19 = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@: Hosting file URLs %{public}@", (uint8_t *)&v19, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configurationManager"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMFControlSessionIdentifier groupIdentifier](self->mSessionIdentifier, "groupIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientIdentityForGroupIdentifier:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMFControlSessionIdentifier groupIdentifier](self->mSessionIdentifier, "groupIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trustedAnchorCertificatesForGroupIdentifier:", v11));

  if (v10 && objc_msgSend(v12, "count"))
  {
    v13 = objc_msgSend(objc_alloc((Class)CRKHostResourcesConfiguration), "initWithResourceURLs:serverIdentity:trustedCertificates:", v4, v10, v12);
    objc_msgSend(v13, "setMaximumAllowedDownloads:", 1);
    v14 = (CRKHostResourcesOperation *)objc_msgSend(objc_alloc((Class)CRKHostResourcesOperation), "initWithConfiguration:", v13);
    mHostOperation = self->mHostOperation;
    self->mHostOperation = v14;

    -[CRKHostResourcesOperation setDelegate:](self->mHostOperation, "setDelegate:", self);
    -[CRKHostResourcesOperation addTarget:selector:forOperationEvents:](self->mHostOperation, "addTarget:selector:forOperationEvents:", self, "hostOperationDidFinish:", 6);
    v16 = objc_msgSend((id)objc_opt_class(self), "resourceHostingQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v17, "addOperation:", self->mHostOperation);

  }
  else
  {
    v18 = CRKErrorWithCodeAndUserInfo(17, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue(v18);
    -[STUShareOperation endOperationWithError:](self, "endOperationWithError:", v13);
  }

}

- (void)hostOperationDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  STUShareOperation *v10;

  v4 = a3;
  if (-[STUShareOperation isExecuting](self, "isExecuting"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
      -[STUShareOperation endOperationWithError:](self, "endOperationWithError:", v6);

    }
    else
    {
      v7 = sub_10000F450();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138543362;
        v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: Host operation did finish successfully", (uint8_t *)&v9, 0xCu);
      }

      -[STUShareOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
  }

}

- (void)hostResourcesOperation:(id)a3 didPublishResources:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v5 = a4;
  if (-[STUShareOperation isExecuting](self, "isExecuting"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
    v7 = self->mHostedResources;
    v8 = v6;
    if (v8 | v7)
    {
      v9 = objc_msgSend((id)v7, "isEqual:", v8);

      if ((v9 & 1) == 0)
      {
        objc_storeStrong((id *)&self->mHostedResources, v6);
        if (!-[STUShareOperation postShareNotificationForResources:](self, "postShareNotificationForResources:", v5))
        {
          v14 = CFSTR("kCRKSessionIdentifierStringErrorKey");
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMFControlSessionIdentifier stringValue](self->mSessionIdentifier, "stringValue"));
          v15 = v10;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
          v12 = CRKErrorWithCodeAndUserInfo(15, v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          -[STUShareOperation endOperationWithError:](self, "endOperationWithError:", v13);

        }
      }
    }

  }
}

- (void)hostResourcesOperation:(id)a3 downloadDidStart:(id)a4 fileURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  STUShareOperation *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;

  v7 = a4;
  v8 = a5;
  if (-[STUShareOperation isExecuting](self, "isExecuting"))
  {
    v9 = sub_10000F450();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      v12 = 138543874;
      v13 = self;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ started download - %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)hostResourcesOperation:(id)a3 downloadDidFinish:(id)a4 fileURL:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  STUShareOperation *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (-[STUShareOperation isExecuting](self, "isExecuting"))
  {
    v12 = sub_10000F450();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "verboseDescription"));
        v18 = 138544130;
        v19 = self;
        v20 = 2114;
        v21 = v9;
        v22 = 2114;
        v23 = v15;
        v24 = 2114;
        v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ failed to download - %{public}@. %{public}@", (uint8_t *)&v18, 0x2Au);

      }
      -[STUShareOperation endOperationWithError:](self, "endOperationWithError:", v11);
    }
    else
    {
      if (v14)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
        v18 = 138543874;
        v19 = self;
        v20 = 2114;
        v21 = v9;
        v22 = 2114;
        v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ finished download - %{public}@", (uint8_t *)&v18, 0x20u);

      }
    }
  }

}

+ (id)resourceHostingQueue
{
  if (qword_1000FC0D0 != -1)
    dispatch_once(&qword_1000FC0D0, &stru_1000C9CA0);
  return (id)qword_1000FC0D8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHostedResources, 0);
  objc_storeStrong((id *)&self->mSandboxExtensionHandles, 0);
  objc_storeStrong((id *)&self->mHostOperation, 0);
  objc_storeStrong((id *)&self->mSessionIdentifier, 0);
}

@end
