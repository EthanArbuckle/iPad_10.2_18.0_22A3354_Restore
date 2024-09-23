@implementation STUDownloadResourcesOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  _UNKNOWN **v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___STUDownloadResourcesOperation;
  if (!objc_msgSendSuper2(&v15, "validateRequest:error:", v6, a4))
    goto LABEL_13;
  v7 = objc_opt_class(CRKDownloadResourcesRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (!a4)
      goto LABEL_13;
    v12 = &off_1000D2BB0;
LABEL_12:
    v13 = CRKErrorWithCodeAndUserInfo(2, v12);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "courseIdentifier"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_13;
    v12 = &off_1000D2BD8;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    if (a4)
    {
      v12 = &off_1000D2C00;
      goto LABEL_12;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  CRKDownloadResourcesOperation *v16;
  CRKDownloadResourcesOperation *mDownloadOperation;
  void *v18;
  uint64_t v19;
  int v20;
  STUDownloadResourcesOperation *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationManager"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientIdentityForGroupIdentifier:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trustedAnchorCertificatesForGroupIdentifier:", v9));

  if (v8 && v10)
  {
    v11 = sub_10000E3E4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
      v20 = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@: Downloading resources %{public}@", (uint8_t *)&v20, 0x16u);

    }
    v14 = objc_alloc((Class)CRKDownloadResourcesOperation);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
    v16 = (CRKDownloadResourcesOperation *)objc_msgSend(v14, "initWithResources:clientIdentity:trustedCertificates:", v15, v8, v10);
    mDownloadOperation = self->mDownloadOperation;
    self->mDownloadOperation = v16;

    -[CRKDownloadResourcesOperation addTarget:selector:forOperationEvents:](self->mDownloadOperation, "addTarget:selector:forOperationEvents:", self, "downloadOperationDidProgress:", 8);
    -[CRKDownloadResourcesOperation addTarget:selector:forOperationEvents:](self->mDownloadOperation, "addTarget:selector:forOperationEvents:", self, "downloadOperationDidFinish:", 6);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
    objc_msgSend(v18, "addOperation:", self->mDownloadOperation);
  }
  else
  {
    v19 = CRKErrorWithCodeAndUserInfo(8, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[STUDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v18);
  }

}

- (void)cancel
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUDownloadResourcesOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000E4A4;
  v3[3] = &unk_1000C97E8;
  v3[4] = self;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v3);
}

- (void)updateProgressWithDownloadOperation:(id)a3
{
  id v4;
  float v5;
  unsigned int v6;
  float v7;
  id v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[STUDownloadResourcesOperation request](self, "request"));
  v5 = (float)(uint64_t)objc_msgSend(v4, "totalUnitCount");
  v6 = objc_msgSend(v9, "openAfterDownloadCompletes");
  v7 = *(float *)"33s?";
  if (!v6)
    v7 = 1.0;
  -[STUDownloadResourcesOperation setTotalUnitCount:](self, "setTotalUnitCount:", (uint64_t)(float)(v5 / v7));
  v8 = objc_msgSend(v4, "completedUnitCount");

  -[STUDownloadResourcesOperation setCompletedUnitCount:](self, "setCompletedUnitCount:", v8);
}

- (void)openURLs:(id)a3
{
  NSArray *v5;
  NSArray *mURLsToOpen;
  void *v7;
  NSString *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDownloadResourcesOperation.m"), 100, CFSTR("%@ must be called from the main thread"), v9);

  }
  v5 = (NSArray *)objc_msgSend(v10, "copy");
  mURLsToOpen = self->mURLsToOpen;
  self->mURLsToOpen = v5;

  -[STUTaskOperation requestToBecomeExclusive](self, "requestToBecomeExclusive");
}

- (void)finishWithURLs:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  STUDownloadResourcesOperation *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  if (-[STUDownloadResourcesOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUDownloadResourcesOperation isCancelled](self, "isCancelled"))
    {
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      -[STUDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v6);
    }
    else
    {
      v7 = sub_10000E3E4();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138543618;
        v10 = self;
        v11 = 2114;
        v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: Finishing operation with URLs %{public}@", (uint8_t *)&v9, 0x16u);
      }

      v6 = (void *)objc_opt_new(CRKDownloadResourcesResultObject);
      objc_msgSend(v6, "setResourceFileURLs:", v4);
      -[STUDownloadResourcesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v6);
    }

  }
}

- (void)downloadOperationDidFinish:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  STUDownloadResourcesOperation *v15;

  v4 = a3;
  if (-[STUDownloadResourcesOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUDownloadResourcesOperation isCancelled](self, "isCancelled"))
    {
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = objc_claimAutoreleasedReturnValue(v5);
    }
    else
    {
      -[STUDownloadResourcesOperation updateProgressWithDownloadOperation:](self, "updateProgressWithDownloadOperation:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (!v7)
      {
        v9 = sub_10000E3E4();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v14 = 138543362;
          v15 = self;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: Download operation did finish", (uint8_t *)&v14, 0xCu);
        }

        v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUDownloadResourcesOperation request](self, "request"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resultObject"));
        if (objc_msgSend(v8, "openAfterDownloadCompletes"))
        {
          v12 = sub_10000E3E4();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v14 = 138543362;
            v15 = self;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: Opening URLs", (uint8_t *)&v14, 0xCu);
          }

          -[STUDownloadResourcesOperation openURLs:](self, "openURLs:", v11);
        }
        else
        {
          -[STUDownloadResourcesOperation finishWithURLs:](self, "finishWithURLs:", v11);
        }

        goto LABEL_7;
      }
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
    }
    v8 = (void *)v6;
    -[STUDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v6);
LABEL_7:

  }
}

- (void)exclusivityRequestDidComplete:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CRKShowOpenDialogOperation *v20;
  CRKShowOpenDialogOperation *mShowDialogOperation;
  void *v22;
  uint8_t buf[4];
  STUDownloadResourcesOperation *v24;

  v4 = a3;
  if (-[STUDownloadResourcesOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUDownloadResourcesOperation isCancelled](self, "isCancelled"))
    {
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      -[STUDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v6);

    }
    else if (v4)
    {
      -[STUDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v4);
    }
    else
    {
      -[STUDownloadResourcesOperation setExclusive:](self, "setExclusive:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUDownloadResourcesOperation request](self, "request"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation instructorName](self, "instructorName"));
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enrollmentRecord"));
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groupName"));

      }
      v13 = sub_10000E3E4();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v24 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@: Showing accept file dialogue", buf, 0xCu);
      }

      v15 = objc_alloc((Class)CRKShowOpenDialogOperation);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", self->mURLsToOpen));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "previewImageData"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceBundleIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resourcesDescription"));
      v20 = (CRKShowOpenDialogOperation *)objc_msgSend(v15, "initWithFileURLs:keepOriginalFiles:previewImageData:senderName:autoAccept:sourceBundleIdentifier:filesDescription:", v16, 0, v17, v10, 0, v18, v19);
      mShowDialogOperation = self->mShowDialogOperation;
      self->mShowDialogOperation = v20;

      -[CRKShowOpenDialogOperation addTarget:selector:forOperationEvents:userInfo:](self->mShowDialogOperation, "addTarget:selector:forOperationEvents:userInfo:", self, "showDialogOperationDidFinish:URLs:", 6, self->mURLsToOpen);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
      objc_msgSend(v22, "addOperation:", self->mShowDialogOperation);

    }
  }

}

- (void)showDialogOperationDidFinish:(id)a3 URLs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  STUDownloadResourcesOperation *v15;

  v6 = a3;
  v7 = a4;
  if (-[STUDownloadResourcesOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUDownloadResourcesOperation isCancelled](self, "isCancelled"))
    {
      v8 = CATErrorWithCodeAndUserInfo(404, 0);
      v9 = objc_claimAutoreleasedReturnValue(v8);
    }
    else
    {
      v10 = sub_10000E3E4();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v14 = 138543362;
        v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@: Finished showing accept file dialogue", (uint8_t *)&v14, 0xCu);
      }

      -[STUDownloadResourcesOperation setCompletedUnitCount:](self, "setCompletedUnitCount:", -[STUDownloadResourcesOperation totalUnitCount](self, "totalUnitCount"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));

      if (!v12)
      {
        -[STUDownloadResourcesOperation finishWithURLs:](self, "finishWithURLs:", v7);
        goto LABEL_9;
      }
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
    }
    v13 = (void *)v9;
    -[STUDownloadResourcesOperation endOperationWithError:](self, "endOperationWithError:", v9);

  }
LABEL_9:

}

- (BOOL)isExclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mURLsToOpen, 0);
  objc_storeStrong((id *)&self->mShowDialogOperation, 0);
  objc_storeStrong((id *)&self->mDownloadOperation, 0);
}

@end
