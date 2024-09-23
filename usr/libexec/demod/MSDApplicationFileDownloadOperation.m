@implementation MSDApplicationFileDownloadOperation

- (id)methodSelectors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_downloadAppArchiveFile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0));

  return v3;
}

- (int64_t)type
{
  return 2;
}

- (BOOL)_downloadAppArchiveFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  unint64_t v18;
  os_signpost_id_t v19;
  id v20;
  NSObject *v21;
  unint64_t v22;
  os_signpost_id_t v23;
  id v24;
  NSObject *v25;
  unint64_t v26;
  os_signpost_id_t v27;
  void *v28;
  unsigned int v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  unint64_t v34;
  os_signpost_id_t v35;
  BOOL v36;
  void *v38;
  int v39;
  id v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](MSDContentCacheManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUniqueIdentifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fileHash"));

  v12 = +[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly");
  if (v9)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appDiffPatchFileForSourceAppUID:targetAppUID:", v9, v7));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      objc_msgSend(v15, "setUseDiffPatch:", 1);

LABEL_5:
      v16 = sub_100060640();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = -[MSDOperation signpostId](self, "signpostId");
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v19 = v18;
        if (os_signpost_enabled(v17))
        {
          v39 = 138412290;
          v40 = v14;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, v19, "File Cache Hit", "File cache hit: %{xcode:string}@", (uint8_t *)&v39, 0xCu);
        }
      }
LABEL_23:

      v36 = 1;
      goto LABEL_24;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "findFileInCache:", v11));
  if (v14)
    goto LABEL_5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileCachePathFromSourcePath:forBackgroundDownload:", 0, v12));
  v20 = sub_100060640();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = -[MSDOperation signpostId](self, "signpostId");
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v23 = v22;
    if (os_signpost_enabled(v21))
    {
      v39 = 138412290;
      v40 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, v23, "Download App", "App identifier: %{xcode:string}@", (uint8_t *)&v39, 0xCu);
    }
  }

  v17 = objc_claimAutoreleasedReturnValue(-[MSDApplicationFileDownloadOperation _downloadAppArchiveFile:ofHash:ofAppUID:currenntAppUID:toFolder:](self, "_downloadAppArchiveFile:ofHash:ofAppUID:currenntAppUID:toFolder:", v5, v11, v7, v9, v14));
  v24 = sub_100060640();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = -[MSDOperation signpostId](self, "signpostId");
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v27 = v26;
    if (os_signpost_enabled(v25))
    {
      v39 = 67109120;
      LODWORD(v40) = v17 != 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, v27, "Download App", "App download result: %{xcode:BOOLean}d", (uint8_t *)&v39, 8u);
    }
  }

  if (v17)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v29 = objc_msgSend(v28, "useDiffPatch");

    if (v29)
    {
      objc_msgSend(v3, "addAppDiffPatchFile:sourceAppUID:targetAppUID:", v17, v9, v7);
    }
    else if ((objc_msgSend(v11, "isEqualToString:", v17) & 1) == 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      objc_msgSend(v30, "setFileHash:", v17);

    }
    v31 = objc_msgSend(v3, "fileSizeInCache:", v17);
    v32 = sub_100060640();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    v34 = -[MSDOperation signpostId](self, "signpostId");
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v35 = v34;
      if (os_signpost_enabled(v33))
      {
        v39 = 134217984;
        v40 = v31;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_EVENT, v35, "File Downloaded", "File download size: %{xcode:size-in-bytes}llu", (uint8_t *)&v39, 0xCu);
      }
    }

    goto LABEL_23;
  }

  -[MSDOperation setRetryable:](self, "setRetryable:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation error](self, "error"));

  if (v38)
  {
    v36 = 0;
    goto LABEL_25;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744736, CFSTR("An error has occurred.")));
  -[MSDOperation setError:](self, "setError:", v14);
  v36 = 0;
LABEL_24:

LABEL_25:
  return v36;
}

- (id)_downloadAppArchiveFile:(id)a3 ofHash:(id)a4 ofAppUID:(id)a5 currenntAppUID:(id)a6 toFolder:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MSDDownloadIPARequest *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(MSDDownloadIPARequest);
  -[MSDDownloadIPARequest setAppID:](v17, "setAppID:", v16);

  -[MSDDownloadIPARequest setFileHash:](v17, "setFileHash:", v15);
  -[MSDDownloadIPARequest setUid:](v17, "setUid:", v14);

  -[MSDDownloadIPARequest setCurrentUID:](v17, "setCurrentUID:", v13);
  -[MSDServerRequest setSavePath:](v17, "setSavePath:", v12);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "originServer"));
  -[MSDDownloadIPARequest setOriginServer:](v17, "setOriginServer:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "handleRequestSync:", v17));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "error"));
  if (v22)
  {
    -[MSDOperation setError:](self, "setError:", v22);
    v25 = 0;
  }
  else
  {
    v23 = objc_msgSend(v21, "isDiffPatch");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    objc_msgSend(v24, "setUseDiffPatch:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fileName"));
  }

  return v25;
}

@end
