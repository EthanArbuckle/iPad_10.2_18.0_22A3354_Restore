@implementation MSDContentFilesDownloadOperation

- (id)methodSelectors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_downloadCreationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0));

  return v3;
}

- (int64_t)type
{
  return 2;
}

- (BOOL)_downloadCreationList
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  os_signpost_id_t v28;
  void *v29;
  id v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  os_signpost_id_t v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  unsigned __int8 v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  void *v49;
  char v50;
  void *v51;
  _BOOL4 v52;
  id v53;
  unsigned int v55;
  id v56;
  void *v57;
  id obj;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v63;
  id v64;
  _QWORD v65[5];
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t *v73;
  unsigned __int8 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint8_t buf[4];
  uint64_t v94;
  uint8_t v95[4];
  uint64_t v96;
  _BYTE v97[128];

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](MSDContentCacheManager, "sharedInstance"));
  v63 = objc_alloc_init((Class)NSCondition);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "creationList"));
  v4 = objc_msgSend(v3, "mutableCopy");

  v56 = objc_alloc_init((Class)NSMutableSet);
  v55 = +[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly");
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v92 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 1;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = sub_1000AC81C;
  v83 = sub_1000AC82C;
  v84 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (os_variant_has_internal_content("com.apple.mobilestoredemod")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance")),
        v6 = objc_msgSend(v5, "concurrentSession"),
        v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance")),
        v8 = objc_msgSend(v7, "concurrentDownloadRequest"),
        v7,
        v61 = (_QWORD)v8 * (_QWORD)v6,
        (uint64_t)((_QWORD)v8 * (_QWORD)v6) >= 1))
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v94 = v61;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Override default value for concurrent download request: %ld", buf, 0xCu);
    }

  }
  else
  {
    v61 = 3;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cloneFailedList"));
  objc_msgSend(v4, "addObjectsFromArray:", v12);

  v77 = 0u;
  v78 = 0u;
  v76 = 0u;
  v75 = 0u;
  obj = v4;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
  if (v13)
  {
    v59 = *(_QWORD *)v76;
LABEL_9:
    v14 = 0;
    v60 = v13;
    while (1)
    {
      if (*(_QWORD *)v76 != v59)
        objc_enumerationMutation(obj);
      v15 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v14);
      v16 = objc_autoreleasePoolPush();
      v17 = -[MSDOperation canPassCheckpoint](self, "canPassCheckpoint");
      if ((v17 & 1) == 0)
        goto LABEL_43;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "masterManifest"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "metadataForFile:", v15));

      if (!v20)
        break;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "getFileType"));
      v22 = objc_msgSend(v21, "isEqualToString:", NSFileTypeRegular);

      if (v22 && objc_msgSend(v20, "getFileSize"))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "getHash"));
        v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "hexStringRepresentation"));

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "findFileInCache:", v24));
        if (v25)
        {
          v26 = sub_100060640();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          v28 = -[MSDOperation signpostId](self, "signpostId");
          if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
          {
            *(_DWORD *)buf = 138412290;
            v94 = (uint64_t)v24;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_EVENT, v28, "File Cache Hit", "File cache hit: %{xcode:string}@", buf, 0xCu);
          }

        }
        else if ((objc_msgSend(v56, "containsObject:", v24) & 1) == 0)
        {
          objc_msgSend(v56, "addObject:", v24);
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contentRootPath"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByAppendingPathComponent:", v15));

          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "fileCachePathFromSourcePath:forBackgroundDownload:", v29, v55));
          v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingPathComponent:", v24));

          objc_msgSend(v63, "lock");
          while (1)
          {
            v35 = v90[3];
            if (v35 < v61)
              break;
            objc_msgSend(v63, "wait");
          }
          if (*((_BYTE *)v86 + 24))
          {
            v90[3] = v35 + 1;
            objc_msgSend(v63, "unlock");
            v36 = sub_100060640();
            v37 = objc_claimAutoreleasedReturnValue(v36);
            v38 = -[MSDOperation signpostId](self, "signpostId");
            if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
            {
              *(_DWORD *)buf = 138412290;
              v94 = (uint64_t)v24;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_BEGIN, v38, "Download File", "File download hash: %{xcode:string}@", buf, 0xCu);
            }

            v65[0] = _NSConcreteStackBlock;
            v65[1] = 3221225472;
            v65[2] = sub_1000AC834;
            v65[3] = &unk_10013FDF8;
            v65[4] = self;
            v74 = v17;
            v66 = v57;
            v24 = v24;
            v71 = &v79;
            v67 = v24;
            v68 = v15;
            v30 = v30;
            v69 = v30;
            v72 = &v85;
            v70 = v63;
            v73 = &v89;
            -[MSDContentFilesDownloadOperation _downloadContentFile:ofHash:toPath:completionHandler:](self, "_downloadContentFile:ofHash:toPath:completionHandler:", v15, v24, v30, v65);

            v31 = 0;
          }
          else
          {
            v39 = sub_1000604F0();
            v40 = objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Aborting file download due to previous error.", buf, 2u);
            }

            objc_msgSend(v63, "unlock");
            v31 = 2;
          }
          goto LABEL_25;
        }
        v29 = 0;
        v30 = 0;
      }
      else
      {
        v29 = 0;
        v30 = 0;
        v24 = 0;
      }
      v31 = 3;
LABEL_25:

      objc_autoreleasePoolPop(v16);
      if (v31 != 3 && v31)
      {

        if (v31 == 6)
          goto LABEL_58;
        goto LABEL_47;
      }
      if ((id)++v14 == v60)
      {
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
        if (v13)
          goto LABEL_9;
        goto LABEL_45;
      }
    }
    v41 = sub_1000604F0();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      sub_1000CBBF8(v95, &v96, v42);

LABEL_43:
    v20 = 0;
    v29 = 0;
    v30 = 0;
    v24 = 0;
    v31 = 6;
    goto LABEL_25;
  }
LABEL_45:

LABEL_47:
  objc_msgSend(v63, "lock");
  while (v90[3] >= 1)
    objc_msgSend(v63, "wait");
  objc_msgSend(v63, "unlock");
  if (*((_BYTE *)v86 + 24))
  {
    if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
    {
      if (+[NSPropertyListSerialization propertyList:isValidForFormat:](NSPropertyListSerialization, "propertyList:isValidForFormat:", v80[5], 100))
      {
        v43 = (void *)v80[5];
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/tmp/DownloadedFileList.plist")));
        v64 = 0;
        v45 = objc_msgSend(v43, "writeToURL:error:", v44, &v64);
        v46 = v64;

        if ((v45 & 1) == 0)
        {
          v47 = sub_1000604F0();
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v46, "localizedDescription"));
            sub_1000CBB58(v49, (uint64_t)buf, v48);
          }

        }
      }
      else
      {
        v53 = sub_1000604F0();
        v46 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          sub_1000CBBB8(v46);
      }
      v50 = 1;
      goto LABEL_63;
    }
    v50 = 1;
  }
  else
  {
LABEL_58:
    -[MSDOperation setRetryable:](self, "setRetryable:", 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation error](self, "error"));
    v52 = v51 == 0;

    if (v52)
    {
      v46 = objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727744736, CFSTR("An error has occurred.")));
      -[MSDOperation setError:](self, "setError:", v46);
      v50 = 0;
LABEL_63:

      goto LABEL_64;
    }
    v50 = 0;
  }
LABEL_64:
  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);

  return v50 & 1;
}

- (void)_downloadContentFile:(id)a3 ofHash:(id)a4 toPath:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MSDDownloadFileRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v14 = objc_alloc_init(MSDDownloadFileRequest);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v14, "fileInfo"));
  objc_msgSend(v15, "setFile:", v10);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v14, "fileInfo"));
  objc_msgSend(v16, "setFileHash:", v11);

  -[MSDServerRequest setSavePath:](v14, "setSavePath:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "originServer"));
  -[MSDCDNServerRequest setOriginServer:](v14, "setOriginServer:", v18);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000ACC10;
  v21[3] = &unk_10013FE20;
  v19 = v13;
  v22 = v19;
  objc_copyWeak(&v23, &location);
  -[MSDServerRequest setCompletion:](v14, "setCompletion:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  objc_msgSend(v20, "handleRequestAsync:", v14);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

@end
