@implementation CRLInfoImporterBoardItemProvider

+ (BOOL)canInitWithType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", a3));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter supportedImageFileUTTypes](CRLBoardItemImporter, "supportedImageFileUTTypes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter supportedMovieFileUTTypes](CRLBoardItemImporter, "supportedMovieFileUTTypes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter supportedFileUTTypes](CRLBoardItemImporter, "supportedFileUTTypes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7));

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          if (objc_msgSend(v3, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), (_QWORD)v16))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLInfoImporterBoardItemProvider disallowedTypes](CRLInfoImporterBoardItemProvider, "disallowedTypes"));
            v14 = objc_msgSend(v13, "containsObject:", v3);

            if (!v14)
            {
              LOBYTE(v10) = 1;
              goto LABEL_14;
            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

+ (NSArray)disallowedTypes
{
  if (qword_101415598 != -1)
    dispatch_once(&qword_101415598, &stru_1012559F0);
  return (NSArray *)(id)qword_101415590;
}

- (CRLInfoImporterBoardItemProvider)initWithData:(id)a3 type:(id)a4 boardItemFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRLInfoImporterBoardItemProvider *v12;
  CRLInfoImporterBoardItemProvider *v13;
  NSString *v14;
  NSString *type;
  CRLScaledProgress *v16;
  CRLScaledProgress *progress;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRLInfoImporterBoardItemProvider;
  v12 = -[CRLInfoImporterBoardItemProvider init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    v14 = (NSString *)objc_msgSend(v10, "copy");
    type = v13->_type;
    v13->_type = v14;

    objc_storeStrong((id *)&v13->_boardItemFactory, a5);
    v16 = objc_alloc_init(CRLScaledProgress);
    progress = v13->_progress;
    v13->_progress = v16;

  }
  return v13;
}

- (CRLInfoImporterBoardItemProvider)initWithURL:(id)a3 type:(id)a4 boardItemFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRLInfoImporterBoardItemProvider *v11;
  CRLTemporaryDirectory *v12;
  id v13;
  CRLTemporaryDirectory *temporaryDirectory;
  void *v15;
  void *v16;
  uint64_t v17;
  NSURL *dataURL;
  void *v19;
  NSURL *v20;
  NSString *v21;
  NSString *type;
  CRLScaledProgress *v23;
  CRLScaledProgress *progress;
  void *v25;
  id v27;
  id v28;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CRLInfoImporterBoardItemProvider;
  v11 = -[CRLInfoImporterBoardItemProvider init](&v29, "init");
  if (v11)
  {
    v28 = 0;
    v12 = -[CRLTemporaryDirectory initWithSignature:error:]([CRLTemporaryDirectory alloc], "initWithSignature:error:", CFSTR("ImporterBoardItemProvider"), &v28);
    v13 = v28;
    temporaryDirectory = v11->_temporaryDirectory;
    v11->_temporaryDirectory = v12;

    if (!v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTemporaryDirectory URL](v11->_temporaryDirectory, "URL"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URLByAppendingPathComponent:", v16));
      dataURL = v11->_dataURL;
      v11->_dataURL = (NSURL *)v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v20 = v11->_dataURL;
      v27 = 0;
      objc_msgSend(v19, "copyItemAtURL:toURL:error:", v8, v20, &v27);
      v13 = v27;

      if (!v13)
      {
        v21 = (NSString *)objc_msgSend(v9, "copy");
        type = v11->_type;
        v11->_type = v21;

        v23 = objc_alloc_init(CRLScaledProgress);
        progress = v11->_progress;
        v11->_progress = v23;

      }
    }
    objc_storeStrong((id *)&v11->_boardItemFactory, a5);
    if (v13)
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_101255A10);
      v25 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        sub_100E276BC((uint64_t)v8, v25, v13);

      v11 = 0;
    }

  }
  return v11;
}

- (CRLInfoImporterBoardItemProvider)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101255A30);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLInfoImporterBoardItemProvider init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m";
    v17 = 1024;
    v18 = 124;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101255A50);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInfoImporterBoardItemProvider init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 124, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLInfoImporterBoardItemProvider init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  unsigned int v14;
  id v15;
  id v16;
  const __CFString *v17;
  id v18;
  void *v19;
  unsigned int v20;
  id v21;
  const __CFString *v22;
  id v23;
  int v24;
  void *v25;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v26;
  NSData *data;
  void *v28;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v29;
  CRLBoardItemImporter *v30;
  uint64_t v31;
  CRLBoardItemImporter *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unsigned int v36;
  void *v37;
  const __CFString *v38;
  CRLBoardItemImporter *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  id v49;
  const __CFString *v50;
  id v51;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v52;
  NSData *v53;
  void *v54;
  CRLBoardItemImporter *v55;
  CRLBoardItemImporter *v56;
  CRLBoardItemImporter *infoImporter;
  CRLBoardItemImporter *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void (**v62)(_QWORD);
  CRLBoardItemImporter *v63;
  id v64;

  v5 = (void (**)(_QWORD))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", self->_type));
  if (!v6)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255A70);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E27980(&self->_type, v7, v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255A90);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInfoImporterBoardItemProvider provideBoardItemWithFactory:completionHandler:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 132, 0, "Failed to create a UTType for %{public}@", self->_type);

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredFilenameExtension"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedMovieUTTypes](CRLIngestionTypes, "supportedMovieUTTypes"));
  v14 = objc_msgSend(v6, "crl_conformsToAnyUTType:", v13);

  if (v14)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter defaultPastedMovieName](CRLBoardItemImporter, "defaultPastedMovieName"));
    v16 = objc_alloc((Class)NSString);
    v17 = CFSTR("mov");
    if (v12)
      v17 = v12;
    v18 = objc_msgSend(v16, "initWithFormat:", CFSTR("%@.%@"), v15, v17);
    goto LABEL_21;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedImageUTTypes](CRLIngestionTypes, "supportedImageUTTypes"));
  v20 = objc_msgSend(v6, "crl_conformsToAnyUTType:", v19);

  if (v20)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter defaultPastedImageName](CRLBoardItemImporter, "defaultPastedImageName"));
    v21 = objc_alloc((Class)NSString);
    v22 = CFSTR("png");
    if (v12)
      v22 = v12;
    v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@.%@"), v15, v22);
    v24 = 1;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
    v15 = v25;
    if (v12)
    {
      v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v25, v12);
LABEL_21:
      v23 = v18;
      v24 = 0;
      goto LABEL_22;
    }
    v15 = v25;
    v24 = 0;
    v23 = v15;
  }
LABEL_22:

  if (self->_data)
  {
    v62 = v5;
    v26 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
    data = self->_data;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemFactory assetOwner](self->_boardItemFactory, "assetOwner"));
    v64 = 0;
    v29 = -[CRLPreinsertionAssetWrapper initWithData:filename:owner:error:](v26, "initWithData:filename:owner:error:", data, v23, v28, &v64);
    v30 = (CRLBoardItemImporter *)v64;

    if (!v29)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255AB0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E27868();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255AD0);
      v5 = v62;
      v40 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInfoImporterBoardItemProvider provideBoardItemWithFactory:completionHandler:]"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v41, v42, 160, 0, "Error %@ creating pre-insertion asset wrapper for data.", v30);
      goto LABEL_41;
    }
    v32 = -[CRLBoardItemImporter initWithData:boardItemFactory:]([CRLBoardItemImporter alloc], "initWithData:boardItemFactory:", v29, self->_boardItemFactory);
    if (v24 && (objc_opt_class(CRLImageItemImporter, v31), (objc_opt_isKindOfClass(v32, v33) & 1) == 0))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedMovieUTTypes](CRLIngestionTypes, "supportedMovieUTTypes"));
      v48 = objc_msgSend(v6, "crl_conformsToAnyUTType:", v47);

      if (v48)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter defaultPastedMovieName](CRLBoardItemImporter, "defaultPastedMovieName"));
        v38 = CFSTR("mov");
        goto LABEL_53;
      }
    }
    else if (v14)
    {
      objc_opt_class(CRLMovieItemImporter, v31);
      if ((objc_opt_isKindOfClass(v32, v34) & 1) == 0)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedImageUTTypes](CRLIngestionTypes, "supportedImageUTTypes"));
        v36 = objc_msgSend(v6, "crl_conformsToAnyUTType:", v35);

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter defaultPastedImageName](CRLBoardItemImporter, "defaultPastedImageName"));
          v38 = CFSTR("png");
LABEL_53:
          v49 = objc_alloc((Class)NSString);
          if (v12)
            v50 = v12;
          else
            v50 = v38;
          v51 = objc_msgSend(v49, "initWithFormat:", CFSTR("%@.%@"), v37, v50);

          v52 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
          v53 = self->_data;
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemFactory assetOwner](self->_boardItemFactory, "assetOwner"));
          v63 = v30;
          v29 = -[CRLPreinsertionAssetWrapper initWithData:filename:owner:error:](v52, "initWithData:filename:owner:error:", v53, v51, v54, &v63);
          v55 = v63;

          if (v29)
          {
            v23 = v51;
            v30 = v55;
LABEL_59:

            v56 = -[CRLBoardItemImporter initWithData:boardItemFactory:]([CRLBoardItemImporter alloc], "initWithData:boardItemFactory:", v29, self->_boardItemFactory);
            infoImporter = self->_infoImporter;
            self->_infoImporter = v56;

            v30 = (CRLBoardItemImporter *)v29;
            v5 = v62;
            goto LABEL_60;
          }
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101255AF0);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E278F4();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101255B10);
          v61 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v61);
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInfoImporterBoardItemProvider provideBoardItemWithFactory:completionHandler:]"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v41, v42, 185, 0, "Error %@ creating pre-insertion asset wrapper for data.", v55);
          v23 = v51;
          v30 = v55;
          v5 = v62;
LABEL_41:

          goto LABEL_60;
        }
      }
    }

    goto LABEL_59;
  }
  if (self->_dataURL)
  {
    v39 = -[CRLBoardItemImporter initWithURL:boardItemFactory:]([CRLBoardItemImporter alloc], "initWithURL:boardItemFactory:", self->_dataURL, self->_boardItemFactory);
    v30 = self->_infoImporter;
    self->_infoImporter = v39;
  }
  else
  {
    v43 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255B30);
    v44 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E277C0(v43, v44);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255B50);
    v45 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v45);
    v30 = (CRLBoardItemImporter *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInfoImporterBoardItemProvider provideBoardItemWithFactory:completionHandler:]"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInfoImporterBoardItemProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v46, 191, 0, "No data or URL available. Unable to import.");

  }
LABEL_60:

  v58 = self->_infoImporter;
  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter progress](v58, "progress"));
    -[CRLScaledProgress setProgress:](self->_progress, "setProgress:", v59);
    objc_msgSend(v59, "maxValue");
    -[CRLScaledProgress setMaxValue:](self->_progress, "setMaxValue:");
    -[CRLBoardItemImporter setDelegate:](self->_infoImporter, "setDelegate:", self);
    -[CRLBoardItemImporter importBoardItemWithCompletionHandler:](self->_infoImporter, "importBoardItemWithCompletionHandler:", v5);
  }
  else
  {
    v60 = objc_claimAutoreleasedReturnValue(-[CRLInfoImporterBoardItemProvider delegate](self, "delegate"));
    v59 = (void *)v60;
    if (v60
      && (objc_opt_respondsToSelector(v60, "importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:") & 1) != 0)
    {
      objc_msgSend(v59, "importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:", self);
    }
    if (v5)
      v5[2](v5);
  }

}

- (void)cancel
{
  -[CRLBoardItemImporter cancel](self->_infoImporter, "cancel");
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return -[CRLBoardItemImporter boardItem](self->_infoImporter, "boardItem");
}

- (NSError)error
{
  return -[CRLBoardItemImporter error](self->_infoImporter, "error");
}

- (unint64_t)uploadDataLength
{
  return -[CRLBoardItemImporter uploadDataLength](self->_infoImporter, "uploadDataLength");
}

- (unint64_t)embeddedDataLength
{
  return -[CRLBoardItemImporter embeddedDataLength](self->_infoImporter, "embeddedDataLength");
}

- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  void (**v9)(id, _QWORD, uint64_t);
  void *v10;
  id v11;

  v9 = (void (**)(id, _QWORD, uint64_t))a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInfoImporterBoardItemProvider delegate](self, "delegate"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "importableBoardItemProvider:needsMediaCompatibilityFeedbackWithReasons:forMediaType:usingBlock:", self, a4, a5, v9);
  else
    v9[2](v9, 0, 1);

}

- (void)boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  v4 = objc_claimAutoreleasedReturnValue(-[CRLInfoImporterBoardItemProvider delegate](self, "delegate", a3));
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector(v4, "importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:");
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:", self);
      v5 = v7;
    }
  }

}

- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CRLIngestibleItemImportableBoardItemProviderDelegate *)a3;
}

- (CRLProgress)progress
{
  return &self->_progress->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_infoImporter, 0);
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong((id *)&self->_boardItemFactory, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_dataURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
