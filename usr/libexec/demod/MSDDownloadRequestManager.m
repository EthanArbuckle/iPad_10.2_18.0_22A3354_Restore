@implementation MSDDownloadRequestManager

- (MSDDownloadRequestManager)initWithCellularAccess:(BOOL)a3 andFDCUpdateDelegate:(id)a4
{
  _BOOL8 v4;
  id v6;
  MSDDownloadRequestManager *v7;
  MSDDownloadRequestManager *v8;
  dispatch_queue_t v9;
  id v10;
  NSObject *v11;
  id v12;
  MSDContentServer *v13;
  void *v14;
  MSDDownloadRequestManager *v15;
  objc_super v17;

  v4 = a3;
  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MSDDownloadRequestManager;
  v7 = -[MSDDownloadRequestManager init](&v17, "init");
  v8 = v7;
  if (v7)
  {
    -[MSDDownloadRequestManager setDownloadRequestsLock:](v7, "setDownloadRequestsLock:", 0);
    v9 = dispatch_queue_create("com.apple.downloadManagerUpdateQueue", 0);
    -[MSDDownloadRequestManager setUpdateQueue:](v8, "setUpdateQueue:", v9);

    -[MSDDownloadRequestManager setFdcDelegate:](v8, "setFdcDelegate:", v6);
    v10 = sub_100060640();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    -[MSDDownloadRequestManager setSignpostId:](v8, "setSignpostId:", os_signpost_id_generate(v11));

    v12 = objc_alloc_init((Class)NSMutableDictionary);
    -[MSDDownloadRequestManager setDownloadRequestCompletions:](v8, "setDownloadRequestCompletions:", v12);

    v13 = -[MSDContentServer initWithCellularAccess:]([MSDContentServer alloc], "initWithCellularAccess:", v4);
    -[MSDDownloadRequestManager setServer:](v8, "setServer:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager server](v8, "server"));
    objc_msgSend(v14, "setObserver:", v8);

    v15 = v8;
  }

  return v8;
}

- (void)downloadFileForRequest:(id)a3
{
  id v4;
  MSDDownloadFileResponse *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;

  v4 = a3;
  v5 = objc_alloc_init(MSDDownloadFileResponse);
  if ((objc_msgSend(v4, "isValid") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "savePath"));
    v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

    if (!v8)
    {
      if (!-[MSDDownloadRequestManager _coalesceDownloadRequestForFileWithSameHash:](self, "_coalesceDownloadRequestForFileWithSameHash:", v4))
      {
        -[MSDDownloadRequestManager _dispatchRequest:](self, "_dispatchRequest:", v4);
        goto LABEL_13;
      }
      v14 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543362;
        v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Coalesce current download file request with existing one.", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_11;
    }
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "savePath"));
      v18 = 138543362;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "File already exists at save path: %{public}@", (uint8_t *)&v18, 0xCu);

    }
    -[MSDServerResponse setError:](v5, "setError:", 0);
  }
  else
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C0FF4(v4, v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744769, CFSTR("Input is invalid")));
    -[MSDServerResponse setError:](v5, "setError:", v17);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));

  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));
    (*(void (**)(uint64_t, MSDDownloadFileResponse *))(v13 + 16))(v13, v5);
LABEL_11:

  }
LABEL_13:

}

- (void)_dispatchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "savePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("IN_PROGRESS")));
  objc_msgSend(v4, "setSavePath:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadCredentials"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originServer"));
  v9 = objc_msgSend(v7, "isValidForOriginServer:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager server](self, "server"));
    objc_msgSend(v10, "downloadFile:", v4);

  }
  else
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000C1088(v4, v12);

    v13 = objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager updateQueue](self, "updateQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005D6F8;
    v14[3] = &unk_10013DE28;
    v14[4] = self;
    v15 = v4;
    dispatch_async(v13, v14);

  }
}

- (BOOL)_coalesceDownloadRequestForFileWithSameHash:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_downloadRequestsLock;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "savePath"));
  p_downloadRequestsLock = &self->_downloadRequestsLock;
  os_unfair_lock_lock(&self->_downloadRequestsLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager downloadRequestCompletions](self, "downloadRequestCompletions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v5));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));

    v10 = objc_retainBlock(v9);
    objc_msgSend(v8, "addObject:", v10);

    v11 = v8;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));

    v13 = objc_retainBlock(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v13));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager downloadRequestCompletions](self, "downloadRequestCompletions"));
    objc_msgSend(v9, "setObject:forKey:", v11, v5);
  }

  os_unfair_lock_unlock(p_downloadRequestsLock);
  return v8 != 0;
}

- (void)_handleCompletionForDownloadRequest:(id)a3 withResponse:(id)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_downloadRequestsLock;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "savePath"));
  p_downloadRequestsLock = &self->_downloadRequestsLock;
  os_unfair_lock_lock(&self->_downloadRequestsLock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager downloadRequestCompletions](self, "downloadRequestCompletions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

  if (v10)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15));
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

    objc_msgSend(v11, "removeAllObjects", (_QWORD)v17);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager downloadRequestCompletions](self, "downloadRequestCompletions"));
  objc_msgSend(v16, "removeObjectForKey:", v7);

  os_unfair_lock_unlock(p_downloadRequestsLock);
}

- (void)_updateFDCforRequest:(id)a3
{
  MSDDownloadFileResponse *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = objc_alloc_init(MSDDownloadFileResponse);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "downloadCredentials"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "originServer"));
  v7 = objc_msgSend(v5, "isValidForOriginServer:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager server](self, "server"));
    objc_msgSend(v8, "downloadFile:", v18);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager fdcDelegate](self, "fdcDelegate"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "downloadCredentials"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "manifestInfo"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager fdcDelegate](self, "fdcDelegate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "updateFileDownloadCredentialFromManifestInfo:", v11));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "error"));
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "error"));
        -[MSDServerResponse setError:](v4, "setError:", v15);

        -[MSDDownloadRequestManager _finishDownloadRequest:withReponse:](self, "_finishDownloadRequest:withReponse:", v18, v4);
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager server](self, "server"));
        objc_msgSend(v17, "downloadFile:", v18);

      }
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744513, CFSTR("Download Credential Expired")));
      -[MSDServerResponse setError:](v4, "setError:", v16);

      -[MSDDownloadRequestManager _finishDownloadRequest:withReponse:](self, "_finishDownloadRequest:withReponse:", v18, v4);
    }
  }

}

- (void)_finishDownloadRequest:(id)a3 withReponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const std::__fs::filesystem::path *v16;
  id v17;
  const std::__fs::filesystem::path *v18;
  std::error_code *v19;
  int v20;
  int *v21;
  NSString *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  dispatch_time_t v28;
  dispatch_queue_global_t global_queue;
  NSObject *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  MSDDownloadRequestManager *v37;
  id v38;
  _QWORD block[4];
  id v40;
  _BYTE location[12];
  __int16 v42;
  void *v43;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager updateQueue](self, "updateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005DF28;
  block[3] = &unk_10013D868;
  v9 = v7;
  v40 = v9;
  dispatch_async(v8, block);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "savePath"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathExtension"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "savePath"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByDeletingPathExtension"));

  if (v11 && objc_msgSend(v11, "isEqualToString:", CFSTR("IN_PROGRESS")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

    if (!v14)
    {
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "savePath")));
      v16 = (const std::__fs::filesystem::path *)objc_msgSend(v15, "UTF8String");
      v17 = objc_retainAutorelease(v13);
      v18 = (const std::__fs::filesystem::path *)objc_msgSend(v17, "UTF8String");
      rename(v16, v18, v19);
      LODWORD(v16) = v20;

      if ((_DWORD)v16)
      {
        v21 = __error();
        v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", strerror(*v21));
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v24 = sub_1000604F0();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1000C1140((uint64_t)v17, (uint64_t)v23, v25);

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727740944, v23));
        objc_msgSend(v9, "setError:", v26);

      }
    }
    objc_msgSend(v6, "setSavePath:", v13);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (!v27)
    goto LABEL_15;
  if ((uint64_t)objc_msgSend(v6, "retryCount") < 1)
  {
    v31 = sub_1000604F0();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "savePath"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v33;
      v42 = 2114;
      v43 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Download Failed for file: %{public}@ with error: %{public}@", location, 0x16u);

    }
LABEL_15:
    -[MSDDownloadRequestManager _handleCompletionForDownloadRequest:withResponse:](self, "_handleCompletionForDownloadRequest:withResponse:", v6, v9);
    goto LABEL_16;
  }
  objc_initWeak((id *)location, self);
  v28 = dispatch_time(0, 3000000000);
  global_queue = dispatch_get_global_queue(25, 0);
  v30 = objc_claimAutoreleasedReturnValue(global_queue);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10005E014;
  v35[3] = &unk_10013EC70;
  v36 = v6;
  objc_copyWeak(&v38, (id *)location);
  v37 = self;
  dispatch_after(v28, v30, v35);

  objc_destroyWeak(&v38);
  objc_destroyWeak((id *)location);
LABEL_16:

}

- (MSDFDCUpdateDelegate)fdcDelegate
{
  return self->_fdcDelegate;
}

- (void)setFdcDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_fdcDelegate, a3);
}

- (os_unfair_lock_s)downloadRequestsLock
{
  return self->_downloadRequestsLock;
}

- (void)setDownloadRequestsLock:(os_unfair_lock_s)a3
{
  self->_downloadRequestsLock = a3;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (MSDContentServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (NSMutableDictionary)downloadRequestCompletions
{
  return self->_downloadRequestCompletions;
}

- (void)setDownloadRequestCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_downloadRequestCompletions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadRequestCompletions, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_fdcDelegate, 0);
}

@end
