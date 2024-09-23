@implementation STUOpenFilesOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _UNKNOWN **v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];

  v6 = a3;
  v28.receiver = a1;
  v28.super_class = (Class)&OBJC_METACLASS___STUOpenFilesOperation;
  if (!objc_msgSendSuper2(&v28, "validateRequest:error:", v6, a4))
    goto LABEL_25;
  v7 = objc_opt_class(CRKOpenFilesRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v18 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3BF0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
LABEL_22:
      v17 = 0;
      *a4 = v19;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileItems"));
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    if (a4)
    {
      v21 = &off_1000D3C18;
LABEL_21:
      v22 = CATErrorWithCodeAndUserInfo(2, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v22);
      goto LABEL_22;
    }
LABEL_25:
    v17 = 0;
    goto LABEL_26;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileItems", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "fileData"));

        if (!v15)
        {
          if (a4)
          {
            v20 = CATErrorWithCodeAndUserInfo(2, &off_1000D3C40);
            *a4 = (id)objc_claimAutoreleasedReturnValue(v20);
          }

          goto LABEL_25;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v12)
        continue;
      break;
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "senderName"));
  if (!v16)
  {
    if (a4)
    {
      v21 = &off_1000D3C68;
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  v17 = 1;
LABEL_26:

  return v17;
}

- (void)cancel
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUOpenFilesOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100057730;
  v3[3] = &unk_1000C97E8;
  v3[4] = self;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v3);
}

- (void)runWithRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *mCreateFileOperations;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  STUOpenFilesOperation *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = sub_100057934();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileItems"));
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@: Creating temporary files for items %{public}@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crk_mapUsingBlock:", &stru_1000CB5E0));
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  mCreateFileOperations = self->mCreateFileOperations;
  self->mCreateFileOperations = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v12, "addOperations:waitUntilFinished:", self->mCreateFileOperations, 0);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000579F4;
  v15[3] = &unk_1000C97E8;
  v15[4] = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v15));
  objc_msgSend(v13, "cat_addDependencies:", self->mCreateFileOperations);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v14, "addOperation:", v13);

}

- (void)createFileOperationsDidFinish:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  STUOpenFilesOperation *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];

  v4 = a3;
  if (-[STUOpenFilesOperation isCanceled](self, "isCanceled"))
  {
    v5 = CATErrorWithCodeAndUserInfo(404, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    -[STUOpenFilesOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error", (_QWORD)v17));

          if (v12)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
            -[STUOpenFilesOperation endOperationWithError:](self, "endOperationWithError:", v16);

            goto LABEL_15;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v8)
          continue;
        break;
      }
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("resultObject")));
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));

    v14 = sub_100057934();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 2114;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@: Created tempoarary files %{public}@", buf, 0x16u);
    }

    -[STUOpenFilesOperation openURLs:](self, "openURLs:", v6);
  }
LABEL_15:

}

- (void)openURLs:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  CRKShowOpenDialogOperation *v11;
  CRKShowOpenDialogOperation *mShowDialogOperation;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  id v17;

  v5 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenFilesOperation.m"), 96, CFSTR("%@ must be called from the main thread"), v16);

  }
  v17 = (id)objc_claimAutoreleasedReturnValue(-[STUOpenFilesOperation request](self, "request"));
  v6 = objc_alloc((Class)CRKShowOpenDialogOperation);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "previewImageData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "senderName"));
  v9 = objc_msgSend(v17, "autoAccept");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sourceBundleIdentifier"));
  v11 = (CRKShowOpenDialogOperation *)objc_msgSend(v6, "initWithFileURLs:keepOriginalFiles:previewImageData:senderName:autoAccept:sourceBundleIdentifier:filesDescription:", v5, 0, v7, v8, v9, v10, 0);

  mShowDialogOperation = self->mShowDialogOperation;
  self->mShowDialogOperation = v11;

  -[CRKShowOpenDialogOperation addTarget:selector:forOperationEvents:](self->mShowDialogOperation, "addTarget:selector:forOperationEvents:", self, "showDialogOperationDidFinish:", 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v13, "addOperation:", self->mShowDialogOperation);

}

- (void)showDialogOperationDidFinish:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
    -[STUOpenFilesOperation endOperationWithError:](self, "endOperationWithError:", v5);

  }
  else
  {
    -[STUOpenFilesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCreateFileOperations, 0);
  objc_storeStrong((id *)&self->mShowDialogOperation, 0);
}

@end
