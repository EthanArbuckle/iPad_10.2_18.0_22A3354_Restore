@implementation MSDDownloadFileRequest

- (MSDDownloadFileRequest)init
{
  MSDDownloadFileRequest *v2;
  MSDFileDownloadInfo *v3;
  MSDDownloadFileRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDDownloadFileRequest;
  v2 = -[MSDDownloadFileRequest init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(MSDFileDownloadInfo);
    -[MSDDownloadFileRequest setFileInfo:](v2, "setFileInfo:", v3);

    -[MSDDownloadFileRequest setRetryCount:](v2, "setRetryCount:", 2);
    -[MSDDownloadFileRequest setDispatchTime:](v2, "setDispatchTime:", 0.0);
    v4 = v2;
  }

  return v2;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSDDownloadFileRequest;
  if (!-[MSDCDNServerRequest isValid](&v9, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](self, "fileInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileHash"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest completion](self, "completion"));
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest getName](self, "getName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](self, "fileInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: hash=%@; toPath=%@"),
                   v3,
                   v5,
                   v6));

  return v7;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(MSDDownloadFileResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  id v31;
  id v32;
  NSObject *v33;
  uint64_t v35;
  const __CFString *v36;
  id *v37;
  uint64_t *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v42.receiver = self;
  v42.super_class = (Class)MSDDownloadFileRequest;
  v9 = -[MSDServerRequest parseResponseForError:andPayload:](&v42, "parseResponseForError:andPayload:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
  if (v11)
  {
    v21 = 0;
    v13 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("fileSize")));
    v13 = v12;
    if (v12)
      v14 = objc_msgSend(v12, "integerValue");
    else
      v14 = 0;
    objc_msgSend(v10, "setDownloadedSize:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](self, "fileInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
    v17 = objc_msgSend(v15, "hashCheckForFile:", v16);

    if ((v17 & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](self, "fileInfo"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
      v20 = objc_msgSend(v18, "entitlementCheckForFile:", v19);

      if ((v20 & 1) != 0)
      {
        v21 = 0;
        goto LABEL_8;
      }
      v40 = 0;
      v36 = CFSTR("Some file(s) are not allowed to install.");
      v37 = (id *)&v40;
      v38 = &v40;
      v35 = 3727740932;
    }
    else
    {
      v41 = 0;
      v35 = 3727740946;
      v36 = CFSTR("Some file(s) are corrupted.");
      v37 = (id *)&v41;
      v38 = &v41;
    }
    sub_1000B63A4(v38, v35, (uint64_t)v36);
    v21 = *v37;
  }
LABEL_8:
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));

  if (!v22)
    objc_msgSend(v10, "setError:", v21);
  if (v21)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
    v24 = objc_msgSend(v8, "fileExistsAtPath:", v23);

    if (v24)
    {
      v25 = sub_1000604F0();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
        *(_DWORD *)buf = 138543362;
        v44 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Hash check or entitlement check for %{public}@ failed, deleting file", buf, 0xCu);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
      v39 = 0;
      v30 = objc_msgSend(v28, "removeItemAtPath:error:", v29, &v39);
      v31 = v39;

      if ((v30 & 1) == 0)
      {
        v32 = sub_1000604F0();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          sub_1000BFCCC(self, v33);

      }
    }
  }

  return v10;
}

- (MSDFileDownloadInfo)fileInfo
{
  return (MSDFileDownloadInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFileInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (double)dispatchTime
{
  return self->_dispatchTime;
}

- (void)setDispatchTime:(double)a3
{
  self->_dispatchTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileInfo, 0);
}

@end
