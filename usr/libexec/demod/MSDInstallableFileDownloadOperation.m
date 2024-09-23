@implementation MSDInstallableFileDownloadOperation

- (id)methodSelectors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_downloadInstallableFile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0));

  return v3;
}

- (int64_t)type
{
  return 2;
}

- (BOOL)_downloadInstallableFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  unint64_t v17;
  os_signpost_id_t v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  unint64_t v22;
  os_signpost_id_t v23;
  id v24;
  id v25;
  NSObject *v26;
  unint64_t v27;
  os_signpost_id_t v28;
  BOOL v29;
  void *v31;
  int v32;
  id v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](MSDContentCacheManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileHash"));

  v8 = +[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "findFileInCache:", v7));

  if (v9)
  {
    v10 = sub_100060640();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = -[MSDOperation signpostId](self, "signpostId");
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v13 = v12;
      if (os_signpost_enabled(v11))
      {
        v32 = 138412290;
        v33 = v7;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, v13, "File Cache Hit", "File cache hit: %{xcode:string}@", (uint8_t *)&v32, 0xCu);
      }
    }
LABEL_16:
    v29 = 1;
    goto LABEL_17;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileCachePathFromSourcePath:forBackgroundDownload:", 0, v8));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", v7));

  v15 = sub_100060640();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = -[MSDOperation signpostId](self, "signpostId");
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = v17;
    if (os_signpost_enabled(v16))
    {
      v32 = 138412290;
      v33 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Download File", "File download hash: %{xcode:string}@", (uint8_t *)&v32, 0xCu);
    }
  }

  v19 = -[MSDInstallableFileDownloadOperation _downloadInstallableFile:ofHash:toPath:](self, "_downloadInstallableFile:ofHash:toPath:", v5, v7, v11);
  v20 = sub_100060640();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = -[MSDOperation signpostId](self, "signpostId");
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v23 = v22;
    if (os_signpost_enabled(v21))
    {
      v32 = 67109120;
      LODWORD(v33) = v19;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v23, "Download File", "File download result: %{xcode:BOOLean}d", (uint8_t *)&v32, 8u);
    }
  }

  if (v19)
  {
    v24 = objc_msgSend(v3, "fileSizeInCache:", v7);
    v25 = sub_100060640();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = -[MSDOperation signpostId](self, "signpostId");
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v28 = v27;
      if (os_signpost_enabled(v26))
      {
        v32 = 134217984;
        v33 = v24;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, v28, "File Downloaded", "File download size: %{xcode:size-in-bytes}llu", (uint8_t *)&v32, 0xCu);
      }
    }

    goto LABEL_16;
  }

  -[MSDOperation setRetryable:](self, "setRetryable:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation error](self, "error"));

  if (v31)
  {
    v29 = 0;
    goto LABEL_18;
  }
  v11 = objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744736, CFSTR("An error has occurred.")));
  -[MSDOperation setError:](self, "setError:", v11);
  v29 = 0;
LABEL_17:

LABEL_18:
  return v29;
}

- (BOOL)_downloadInstallableFile:(id)a3 ofHash:(id)a4 toPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  MSDDownloadFileRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "originServer"));

  v13 = objc_alloc_init(MSDDownloadFileRequest);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v13, "fileInfo"));
  objc_msgSend(v14, "setFile:", v10);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v13, "fileInfo"));
  objc_msgSend(v15, "setFileHash:", v9);

  -[MSDServerRequest setSavePath:](v13, "setSavePath:", v8);
  -[MSDCDNServerRequest setOriginServer:](v13, "setOriginServer:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "handleRequestSync:", v13));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "error"));
  if (v18)
    -[MSDOperation setError:](self, "setError:", v18);

  return v18 == 0;
}

@end
