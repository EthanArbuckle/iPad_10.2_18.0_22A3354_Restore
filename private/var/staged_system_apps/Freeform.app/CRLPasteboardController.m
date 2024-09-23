@implementation CRLPasteboardController

- (CRLPasteboardController)initWithDelegate:(id)a3
{
  id v4;
  CRLPasteboardController *v5;
  CRLPasteboardController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLPasteboardController;
  v5 = -[CRLPasteboardController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (CRLPasteboardController)init
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
    dispatch_once(&qword_10147E370, &stru_101236690);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLPasteboardController init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m";
    v17 = 1024;
    v18 = 86;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012366B0);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 86, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLPasteboardController init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (id)p_board
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "boardForPasteboardController:", self));

  return v4;
}

- (id)p_boardItemFactory
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "boardItemFactoryForPasteboardController:", self));

  return v4;
}

+ (id)p_cacheDirectoryName
{
  return CFSTR("copy");
}

+ (NSURL)pasteboardCacheDirectory
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  id v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v20 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v20));
  v5 = v20;

  if (v5)
    v7 = 1;
  else
    v7 = v4 == 0;
  if (v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236710);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF87D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236730);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController pasteboardCacheDirectory]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 115, 0, "Unable to create cache directory: %@", v5);
    v13 = v4;
    goto LABEL_26;
  }
  v11 = objc_msgSend((id)objc_opt_class(a1, v6), "p_cacheDirectoryName");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = objc_msgSend(v14, "crl_directoryExistsAt:", v13);

  if ((v15 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v19 = 0;
    objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v19);
    v5 = v19;

    if (v5)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012366D0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF8750();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012366F0);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController pasteboardCacheDirectory]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 111, 0, "Unable to create cache directory: %@", v5);
LABEL_26:

    }
  }
  return (NSURL *)v13;
}

+ (void)clearPasteboardCacheDirectory
{
  CFArrayRef (__cdecl **v3)(CTFontDescriptorRef, CFSetRef);
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  CFArrayRef (__cdecl **v27)(CTFontDescriptorRef, CFSetRef);
  unsigned int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  char *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  uint8_t buf[4];
  unsigned int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];

  v3 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v42 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, &v42));
  v6 = v42;

  if (v6)
    v8 = 1;
  else
    v8 = v5 == 0;
  if (v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012367D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF88D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012367F0);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController clearPasteboardCacheDirectory]"));
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 144, 0, "Unable to create cache directory: %@", v6);
    v14 = v5;
    goto LABEL_45;
  }
  v12 = objc_msgSend((id)objc_opt_class(a1, v7), "p_cacheDirectoryName");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v16 = objc_msgSend(v15, "crl_directoryExistsAt:", v14);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v41 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v14, 0, 1, &v41));
    v6 = v41;

    if (v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236790);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF8850();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012367B0);
      v18 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v18);
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController clearPasteboardCacheDirectory]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v19, 140, 0, "Unable to get contents of copy cache directory: %@", v6);

    }
    else
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v11 = v10;
      v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      if (v20)
      {
        v21 = v20;
        v35 = v14;
        v6 = 0;
        v22 = *(_QWORD *)v38;
        do
        {
          v23 = 0;
          v24 = v6;
          do
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v11);
            v25 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[398], "defaultManager"));
            v36 = v24;
            objc_msgSend(v26, "removeItemAtURL:error:", v25, &v36);
            v6 = v36;

            if (v6)
            {
              v27 = v3;
              v28 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101236750);
              v29 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                v44 = v28;
                v45 = 2082;
                v46 = "+[CRLPasteboardController clearPasteboardCacheDirectory]";
                v47 = 2082;
                v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m";
                v49 = 1024;
                v50 = 136;
                v51 = 2112;
                v52 = v6;
                _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unable to remove item in copy cache directory: %@", buf, 0x2Cu);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101236770);
              v30 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                v33 = v30;
                v34 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = 67109378;
                v44 = v28;
                v45 = 2114;
                v46 = v34;
                _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController clearPasteboardCacheDirectory]"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 136, 0, "Unable to remove item in copy cache directory: %@", v6);

              v3 = v27;
            }
            v23 = (char *)v23 + 1;
            v24 = v6;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
        }
        while (v21);
        v10 = v11;
        v14 = v35;
      }
      else
      {
        v6 = 0;
        v10 = v11;
      }
    }
LABEL_45:

  }
}

- (id)ingestibleItemSourceForPasteboard:(id)a3
{
  id v4;
  CRLPasteboardItemSource *v5;

  v4 = a3;
  v5 = -[CRLPasteboardItemSource initWithPasteboard:pasteboardController:]([CRLPasteboardItemSource alloc], "initWithPasteboard:pasteboardController:", v4, self);

  return v5;
}

- (id)newCopyAssistantWithPasteboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLPasteboardCopyAssistant *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceContextForPasteboardController:", self));

  v7 = -[CRLPasteboardCopyAssistant initWithPasteboard:sourceContext:]([CRLPasteboardCopyAssistant alloc], "initWithPasteboard:sourceContext:", v4, v6);
  -[CRLPasteboardWriteAssistant setDelegate:](v7, "setDelegate:", self);

  return v7;
}

- (id)newDragAssistant
{
  void *v3;
  void *v4;
  CRLDraggingAssistant *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sourceContextForPasteboardController:", self));

  v5 = -[CRLPasteboardWriteAssistant initWithContext:]([CRLDraggingAssistant alloc], "initWithContext:", v4);
  -[CRLPasteboardWriteAssistant setDelegate:](v5, "setDelegate:", self);

  return v5;
}

- (id)newReadAssistantWithPasteboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _TtC8Freeform32CRLPasteboardObjectReadAssistant *v7;
  void *v8;
  _TtC8Freeform32CRLPasteboardObjectReadAssistant *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _TtC8Freeform32CRLPasteboardObjectReadAssistant *v13;
  objc_class *v15;
  NSString *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  uint64_t v40;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_board](self, "p_board"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "store"));
  v7 = [_TtC8Freeform32CRLPasteboardObjectReadAssistant alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crdtContext"));
  v9 = -[CRLPasteboardObjectReadAssistant initWithPasteboard:store:context:](v7, "initWithPasteboard:store:context:", v4, v6, v8);

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1000E1770;
  v31 = sub_1000E1780;
  v32 = 0;
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_1000E1788;
  v24 = &unk_101236818;
  v26 = &v27;
  v10 = dispatch_semaphore_create(0);
  v25 = v10;
  -[CRLPasteboardObjectReadAssistant readPasteboardObjectWithCompletionHandler:](v9, "readPasteboardObjectWithCompletionHandler:", &v21);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (v28[5])
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101236838);
    v11 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class(v28[5], v12);
      v16 = NSStringFromClass(v15);
      v17 = (id)objc_claimAutoreleasedReturnValue(v16);
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v28[5], "domain", v21, v22, v23, v24));
      v19 = objc_msgSend((id)v28[5], "code");
      v20 = v28[5];
      *(_DWORD *)buf = 138544130;
      v34 = v17;
      v35 = 2114;
      v36 = v18;
      v37 = 2048;
      v38 = v19;
      v39 = 2112;
      v40 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "Failed to deserialize from pasteboard. error=errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x2Au);

    }
    v13 = 0;
  }
  else
  {
    v13 = v9;
  }

  _Block_object_dispose(&v27, 8);
  return v13;
}

- (id)pasteboardObjectFromAssistant:(id)a3 boardItems:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pasteboardObject"));
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setBoardItems:", v5);

  return v7;
}

- (id)pasteboardObjectFromAssistant:(id)a3 textStorage:(id)a4 smartCopy:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pasteboardObject"));
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_msgSend(v8, "copyTextFrom:", v7);
      objc_msgSend(v9, "setIsSmartCopyPaste:", v5);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236858);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF8950();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236878);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController pasteboardObjectFromAssistant:textStorage:smartCopy:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 225, 0, "invalid nil value for '%{public}s'", "inWPStorage");

    }
  }

  return v9;
}

- (id)publicTypesForBoardItems:(id)a3 asPDF:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned int v12;
  id v13;
  id v14;
  id v16;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v6, "count") == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "customPublicTypesToPromiseWhenCopyingSingleBoardItem"));
    objc_msgSend(v7, "addObjectsFromArray:", v9);

    if (!objc_msgSend(v7, "count"))
    {

      if (v4)
        goto LABEL_5;
LABEL_7:
      v11 = 0;
      goto LABEL_8;
    }
    v10 = objc_msgSend(v8, "wantsStandardPublicTypesInAdditionToCustomTypesToPromiseWhenCopyingSingleBoardItem");

    if ((v10 & 1) == 0)
      goto LABEL_11;
  }
  if (!v4)
    goto LABEL_7;
LABEL_5:
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier"));
LABEL_8:
  v16 = v11;
  v12 = -[CRLPasteboardController pImageForBoardItems:imageData:dataType:dataName:](self, "pImageForBoardItems:imageData:dataType:dataName:", v6, 0, &v16, 0);
  v13 = v16;

  if (v12)
    objc_msgSend(v7, "addObject:", v13);

LABEL_11:
  v14 = objc_msgSend(v7, "copy");

  return v14;
}

- (BOOL)hasNativeBoardItemsOnPasteboard:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v7;

  v7 = CFSTR("com.apple.freeform.pasteboardState.hasNativeBoardItems");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v3, "containsPasteboardTypes:", v4, v7);

  return v5;
}

- (BOOL)hasSingleNativeImageBoardItemOnPasteboard:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v7;

  v7 = CFSTR("com.apple.freeform.pasteboardState.hasSingleNativeImageBoardItem");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v3, "containsPasteboardTypes:", v4, v7);

  return v5;
}

- (BOOL)hasSingleNativeMovieBoardItemOnPasteboard:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v7;

  v7 = CFSTR("com.apple.freeform.pasteboardState.hasSingleNativeMovieBoardItem");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v3, "containsPasteboardTypes:", v4, v7);

  return v5;
}

- (BOOL)hasOnlyNativeFreehandDrawingBoardItemsOnPasteboard:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v7;

  v7 = CFSTR("com.apple.freeform.pasteboardState.hasOnlyFreehandDrawingBoardItems");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v3, "containsPasteboardTypes:", v4, v7);

  return v5;
}

- (BOOL)hasNativeFreehandDrawingBoardItemsOnPasteboard:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v7;

  v7 = CFSTR("com.apple.freeform.pasteboardState.hasFreehandDrawingBoardItems");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v3, "containsPasteboardTypes:", v4, v7);

  return v5;
}

- (BOOL)hasOnlyNativeTextBoxBoardItemsOnPasteboard:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v7;

  v7 = CFSTR("com.apple.freeform.pasteboardState.hasOnlyNativeTextBoxItems");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v3, "containsPasteboardTypes:", v4, v7);

  return v5;
}

- (unint64_t)boardItemStyleKindsOnPasteboard:(id)a3
{
  unint64_t result;
  void *v4;
  void *v5;
  void *v6;

  result = -[CRLPasteboardController p_integerFromPasteboardStateTypePrefix:pasteboard:](self, "p_integerFromPasteboardStateTypePrefix:pasteboard:", CFSTR("com.apple.freeform.pasteboardState.styleClass-"), a3);
  if ((result & 0x8000000000000000) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236898);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF89E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012368B8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController boardItemStyleKindsOnPasteboard:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 299, 0, "Out-of-bounds type assignment was clamped to min");

    return 0;
  }
  return result;
}

- (BOOL)hasOnlyNativeTextBoxItemsOnPasteboard:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v7;

  v7 = CFSTR("com.apple.freeform.pasteboardState.hasOnlyNativeTextBoxItems");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v3, "containsPasteboardTypes:", v4, v7);

  return v5;
}

- (id)providersForBoardItemsFromPasteboard:(id)a3
{
  return -[CRLPasteboardController providersForBoardItemsForTargetStorage:fromPasteboard:](self, "providersForBoardItemsForTargetStorage:fromPasteboard:", 0, a3);
}

- (id)providersForNativeBoardItemsAndTextFromPasteboard:(id)a3 validGeometries:(BOOL *)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = -[CRLPasteboardController newReadAssistantWithPasteboard:](self, "newReadAssistantWithPasteboard:", v6);
  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_providersForBoardItemsAndTextFromPasteboardReadAssistant:pasteboard:validGeometries:](self, "p_providersForBoardItemsAndTextFromPasteboardReadAssistant:pasteboard:validGeometries:", v7, v6, a4));
  else
    v8 = 0;

  return v8;
}

- (id)providersForNativeBoardItemsFromPasteboard:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CRLBoardItemProviderFactory *v12;
  void *v13;
  CRLBoardItemProviderFactory *v14;
  void *v15;

  v4 = -[CRLPasteboardController newReadAssistantWithPasteboard:](self, "newReadAssistantWithPasteboard:", a3);
  v5 = v4;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pasteboardObject"));
    if (v7)
    {
      v8 = objc_msgSend((id)objc_opt_class(self, v6), "descriptionsForBoardItemsOnPasteboardObject:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItems"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestibleBoardItemAndDescription ingestibleBoardItemAndDescriptionWithBoardItems:descriptions:](CRLIngestibleBoardItemAndDescription, "ingestibleBoardItemAndDescriptionWithBoardItems:descriptions:", v10, v9));

      if (objc_msgSend(v11, "count"))
      {
        v12 = [CRLBoardItemProviderFactory alloc];
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_boardItemFactory](self, "p_boardItemFactory"));
        v14 = -[CRLBoardItemProviderFactory initWithBoardItemFactory:](v12, "initWithBoardItemFactory:", v13);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory styleMappingProvidersForPasteboardBoardItems:](v14, "styleMappingProvidersForPasteboardBoardItems:", v11));
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)providersForBoardItemsForTargetStorage:(id)a3 fromPasteboard:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  CRLBoardItemProviderFactory *v15;
  void *v16;
  CRLBoardItemProviderFactory *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = -[CRLPasteboardController newReadAssistantWithPasteboard:](self, "newReadAssistantWithPasteboard:", v7);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pasteboardObject"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController descriptionsForBoardItemsOnPasteboard:](self, "descriptionsForBoardItemsOnPasteboard:", v7));
      v13 = objc_msgSend((id)objc_opt_class(self, v12), "readPasteboardBoardItemsForTargetStorage:fromPasteboardObject:descriptionsForBoardItems:", v6, v10, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (objc_msgSend(v14, "count"))
      {
        v15 = [CRLBoardItemProviderFactory alloc];
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_boardItemFactory](self, "p_boardItemFactory"));
        v17 = -[CRLBoardItemProviderFactory initWithBoardItemFactory:](v15, "initWithBoardItemFactory:", v16);

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory styleMappingProvidersForPasteboardBoardItems:](v17, "styleMappingProvidersForPasteboardBoardItems:", v14));
      }
      else
      {
        v18 = &__NSArray0__struct;
      }

    }
    else
    {
      v18 = &__NSArray0__struct;
    }

  }
  else
  {
    v18 = &__NSArray0__struct;
  }

  return v18;
}

+ (id)descriptionsForBoardItemsOnPasteboardObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "boardItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "boardItems"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "addObject:", &__NSDictionary0__struct);
      ++v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "boardItems"));
      v10 = objc_msgSend(v9, "count");

    }
    while (v8 < (unint64_t)v10);
  }

  return v5;
}

+ (id)boardItemsForCopyByFixingUpBoardItems:(id)a3 boardItemFactory:(id)a4 board:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  char *i;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "crl_containsObjectPassingTest:", &stru_1012368F8) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "makeDuplicateOfBoardItems:", v7));
    v11 = (char *)objc_msgSend(v7, "count");
    if (objc_msgSend(v10, "count") == v11)
    {
      v13 = v10;
      if (v11)
      {
        v29 = v8;
        for (i = 0; i != v11; ++i)
        {
          v15 = objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", i));
          v17 = sub_100221D0C(v15, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

          if (v18)
          {
            v20 = (objc_class *)objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", i));
            v22 = sub_1002223BC(v20, v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

            if (v23)
              +[CRLConnectionLineAdjustmentHelper transferLaidOutInfoGeometryAndPathSourceFrom:to:withBoardItemOwner:](CRLConnectionLineAdjustmentHelper, "transferLaidOutInfoGeometryAndPathSourceFrom:to:withBoardItemOwner:", v18, v23, v9);

          }
        }
        v13 = v10;
        v8 = v29;
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236918);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF8A6C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236938);
      v25 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController boardItemsForCopyByFixingUpBoardItems:boardItemFactory:board:]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 394, 0, "Unable to duplicate items for fixing up.");

      v13 = v7;
    }
    v24 = v13;

  }
  else
  {
    v24 = v7;
  }

  return v24;
}

+ (id)additionalBoardItemsForCopyImaging:(id)a3 icc:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  char *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  _BYTE v37[128];

  v5 = a4;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "crl_arrayOfObjectsPassingTest:", &stru_101236958));
    v7 = objc_alloc_init((Class)NSMutableArray);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(obj);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v11)));
          if (!v12)
          {
            v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101236978);
            v14 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v28 = v13;
              v29 = 2082;
              v30 = "+[CRLPasteboardController additionalBoardItemsForCopyImaging:icc:]";
              v31 = 2082;
              v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m";
              v33 = 1024;
              v34 = 424;
              v35 = 2082;
              v36 = "rep";
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101236998);
            v15 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v19 = v15;
              v20 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v28 = v13;
              v29 = 2114;
              v30 = v20;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController additionalBoardItemsForCopyImaging:icc:]"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 424, 0, "invalid nil value for '%{public}s'", "rep");

          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "createAdditionalBoardItemsForCopyImaging"));
          objc_msgSend(v7, "addObjectsFromArray:", v18);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
      }
      while (v9);
    }

  }
  else
  {
    v7 = &__NSArray0__struct;
  }

  return v7;
}

- (BOOL)p_shouldKeepHighlights
{
  return 1;
}

- (id)p_providersForBoardItemsAndTextFromPasteboardReadAssistant:(id)a3 pasteboard:(id)a4 validGeometries:(BOOL *)a5
{
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pasteboardObject"));
  if (v7)
  {
    v8 = -[CRLPasteboardController p_shouldKeepHighlights](self, "p_shouldKeepHighlights");
    v10 = objc_msgSend((id)objc_opt_class(self, v9), "descriptionsForBoardItemsOnPasteboardObject:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v13 = (void *)objc_opt_class(self, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_boardItemFactory](self, "p_boardItemFactory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "providersForBoardItemsAndTextWithBoardItemFactory:keepHighlights:fromPasteboardObject:descriptionsForBoardItems:validGeometries:", v14, v8, v7, v11, a5));

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)readPasteboardBoardItemsForTargetStorage:(id)a3 fromPasteboardObject:(id)a4 descriptionsForBoardItems:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "boardItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestibleBoardItemAndDescription ingestibleBoardItemAndDescriptionWithBoardItems:descriptions:](CRLIngestibleBoardItemAndDescription, "ingestibleBoardItemAndDescriptionWithBoardItems:descriptions:", v7, v6));

  return v8;
}

- (BOOL)canProduceBoardItemsFromPasteboard:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[CRLPasteboardController hasNativeBoardItemsOnPasteboard:](self, "hasNativeBoardItemsOnPasteboard:", v4)
    || -[CRLPasteboardController hasNativeTextOnPasteboard:](self, "hasNativeTextOnPasteboard:", v4)
    || -[CRLPasteboardController hasImportableRichTextOnPasteboard:](self, "hasImportableRichTextOnPasteboard:", v4)
    || -[CRLPasteboardController hasImportablePlainTextOnPasteboard:](self, "hasImportablePlainTextOnPasteboard:", v4))
  {
    v5 = 1;
  }
  else
  {
    v5 = -[CRLPasteboardController hasImportableBoardItemsOnPasteboard:detectImportableURLsInText:skipFileURLs:](self, "hasImportableBoardItemsOnPasteboard:detectImportableURLsInText:skipFileURLs:", v4, 1, 0);
  }

  return v5;
}

- (BOOL)hasImportableBoardItemsOnPasteboard:(id)a3 detectImportableURLsInText:(BOOL)a4 skipFileURLs:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  CRLPasteboardController *v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  CRLPasteboardController *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (-[CRLPasteboardController hasImportableImagesOnPasteboard:skipFileURLs:](self, "hasImportableImagesOnPasteboard:skipFileURLs:", v8, v5))
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v37 = v5;
    v38 = self;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pasteboardTypes"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v15));
          if ((objc_msgSend(v15, "crl_isPasteboardStateType") & 1) == 0)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedMovieUTTypes](CRLIngestionTypes, "supportedMovieUTTypes"));
            v18 = objc_msgSend(v16, "crl_conformsToAnyUTType:", v17);

            if ((v18 & 1) != 0
              || +[CRLIngestionTypes isValidFileType:](CRLIngestionTypes, "isValidFileType:", v16))
            {

              goto LABEL_25;
            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
        if (v12)
          continue;
        break;
      }
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLs"));
    v9 = objc_msgSend(v19, "count");

    if (v9)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLs"));
      v9 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      v21 = v38;
      if (v9)
      {
        v22 = *(_QWORD *)v48;
        while (2)
        {
          for (j = 0; j != v9; j = (char *)j + 1)
          {
            if (*(_QWORD *)v48 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j);
            if ((objc_msgSend(v24, "isFileURL") & 1) == 0
              && +[CRLURLBoardItemProvider canInitWithURL:](CRLURLBoardItemProvider, "canInitWithURL:", v24))
            {
              LOBYTE(v9) = 1;
              goto LABEL_30;
            }
          }
          v9 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_30:

    }
    else
    {
      v21 = v38;
    }
    if ((v9 & 1) == 0 && !v37)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLs"));
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v44;
        while (2)
        {
          for (k = 0; k != v28; k = (char *)k + 1)
          {
            if (*(_QWORD *)v44 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)k);
            if (objc_msgSend(v31, "isFileURL")
              && +[CRLURLBoardItemProvider canInitWithURL:](CRLURLBoardItemProvider, "canInitWithURL:", v31))
            {
              LOBYTE(v9) = 1;
              goto LABEL_44;
            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
          if (v28)
            continue;
          break;
        }
      }
      LOBYTE(v9) = 0;
LABEL_44:

    }
    if ((v9 & 1) == 0 && v6)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pasteboardTypes"));
      v32 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v40;
LABEL_49:
        v35 = 0;
        while (1)
        {
          if (*(_QWORD *)v40 != v34)
            objc_enumerationMutation(v10);
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_detectedImportableURLOnPasteboard:type:fallbackBoardItemProvider:](v21, "p_detectedImportableURLOnPasteboard:type:fallbackBoardItemProvider:", v8, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v35), 0));

          if (v36)
            break;
          if (v33 == (id)++v35)
          {
            v33 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
            if (v33)
              goto LABEL_49;
            goto LABEL_55;
          }
        }
LABEL_25:
        LOBYTE(v9) = 1;
      }
      else
      {
LABEL_55:
        LOBYTE(v9) = 0;
      }

    }
  }

  return (char)v9;
}

- (BOOL)hasImportableImagesOnPasteboard:(id)a3 skipFileURLs:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedImageUTTypes](CRLIngestionTypes, "supportedImageUTTypes"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pasteboardTypes"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v10)
        objc_enumerationMutation(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v11)));
      v13 = objc_msgSend(v12, "crl_conformsToAnyUTType:", v6);

      if ((v13 & 1) != 0)
        goto LABEL_21;
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  if (!a4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLs", 0));
    v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (!v14)
    {
LABEL_22:

      goto LABEL_23;
    }
    v15 = *(_QWORD *)v22;
LABEL_13:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v15)
        objc_enumerationMutation(v7);
      v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v16);
      if (objc_msgSend(v17, "isFileURL"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "crl_fileTypeIdentifierHandlingFileCoordinationPromises"));
        v19 = objc_msgSend(v18, "crl_conformsToAnyUTType:", v6);

        if ((v19 & 1) != 0)
          break;
      }
      if (v14 == (id)++v16)
      {
        v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
          goto LABEL_13;
        goto LABEL_22;
      }
    }
LABEL_21:
    LOBYTE(v14) = 1;
    goto LABEL_22;
  }
  LOBYTE(v14) = 0;
LABEL_23:

  return (char)v14;
}

- (id)asyncProvidersForBoardItemsFromPasteboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  if (-[CRLPasteboardController hasNativeBoardItemsOnPasteboard:](self, "hasNativeBoardItemsOnPasteboard:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController providersForNativeBoardItemsFromPasteboard:](self, "providersForNativeBoardItemsFromPasteboard:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___CRLIngestibleItemImportableBoardItemProvider, (_QWORD)v18))objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

  }
  else
  {
    switch(-[CRLPasteboardController preferredImportableDataTypeOnPasteboard:detectImportableURLsInText:](self, "preferredImportableDataTypeOnPasteboard:detectImportableURLsInText:", v4, 1))
    {
      case 1uLL:
        v13 = objc_claimAutoreleasedReturnValue(-[CRLPasteboardController providersForBoardItemsFromImportedRichTextFromPasteboard:](self, "providersForBoardItemsFromImportedRichTextFromPasteboard:", v4));
        goto LABEL_26;
      case 2uLL:
        goto LABEL_24;
      case 3uLL:
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012369B8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF8AF4();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012369D8);
        v14 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController asyncProvidersForBoardItemsFromPasteboard:]"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 612, 0, "should not ask for async providers for preferred type file promise!");

LABEL_24:
        v13 = objc_claimAutoreleasedReturnValue(-[CRLPasteboardController providersForBoardItemsImportedFromPasteboard:](self, "providersForBoardItemsImportedFromPasteboard:", v4));
        goto LABEL_26;
      case 4uLL:
        v13 = objc_claimAutoreleasedReturnValue(-[CRLPasteboardController providersForBoardItemsFromImportedTextFromPasteboard:](self, "providersForBoardItemsFromImportedTextFromPasteboard:", v4));
LABEL_26:
        v6 = (void *)v13;
        break;
      default:
        v6 = 0;
        break;
    }
  }

  return v6;
}

- (id)providersForBoardItemsImportedFromPasteboard:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *j;
  id v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = (uint64_t)objc_msgSend(v4, "numberOfItems");
  if (v5 < 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    for (i = 0; i != v6; ++i)
    {
      v9 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndex:", i);
      v11 = (void *)objc_opt_class(self, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pasteboardTypesForItemSet:", v9));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pFilteredPasteboardTypesForPasteboard:types:", v4, v13));

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v24 = v7;
        v18 = v6;
        v19 = *(_QWORD *)v26;
        while (2)
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v15);
            v21 = -[CRLPasteboardController p_newImportableBoardItemProviderFromPasteboard:itemIndex:itemType:](self, "p_newImportableBoardItemProviderFromPasteboard:itemIndex:itemType:", v4, i, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j));
            if (v21)
            {
              v22 = v21;
              v6 = v18;
              v7 = v24;
              if (!v24)
                v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v6));
              objc_msgSend(v7, "addObject:", v22);

              goto LABEL_15;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v17)
            continue;
          break;
        }
        v6 = v18;
        v7 = v24;
      }
LABEL_15:

    }
  }

  return v7;
}

- (id)p_newImportableBoardItemProviderFromPasteboard:(id)a3 itemIndex:(unint64_t)a4 itemType:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CRLBoardItemProviderFactory *v13;
  void *v14;
  CRLBoardItemProviderFactory *v15;
  void *v16;
  void *v17;
  CRLInfoImporterBoardItemProvider *v18;
  uint64_t v19;
  void *v20;
  unsigned __int8 v21;
  CRLBoardItemProviderFactory *v22;
  void *v23;
  void *v24;
  CRLInfoImporterBoardItemProvider *v25;
  void *v26;
  void *v28;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v9));
  if (objc_msgSend(v11, "conformsToType:", UTTypeFileURL))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_importableFileURLFromPasteboard:itemIndex:itemType:](self, "p_importableFileURLFromPasteboard:itemIndex:itemType:", v8, a4, v9));
    if (v12)
    {
      v13 = [CRLBoardItemProviderFactory alloc];
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_boardItemFactory](self, "p_boardItemFactory"));
      v15 = -[CRLBoardItemProviderFactory initWithBoardItemFactory:](v13, "initWithBoardItemFactory:", v14);

      v28 = v12;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory providersForBoardItemsFromURLs:](v15, "providersForBoardItemsFromURLs:", v16));
      if (objc_msgSend(v17, "count"))
        v18 = (CRLInfoImporterBoardItemProvider *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
      else
        v18 = 0;

      goto LABEL_15;
    }
LABEL_20:
    v18 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v11, "conformsToType:", UTTypeURL))
  {
    v19 = objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_importableURLFromPasteboard:itemIndex:itemType:](self, "p_importableURLFromPasteboard:itemIndex:itemType:", v8, a4, v9));
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "importableRichTextTypes"));
    if ((objc_msgSend(v20, "containsObject:", v9) & 1) != 0)
    {

    }
    else
    {
      v21 = +[CRLIngestionTypes isValidPlainTextUTI:](CRLIngestionTypes, "isValidPlainTextUTI:", v9);

      if ((v21 & 1) == 0)
      {
        if (!+[CRLInfoImporterBoardItemProvider canInitWithType:](CRLInfoImporterBoardItemProvider, "canInitWithType:", v9))
        {
          v18 = 0;
          goto LABEL_22;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataForPasteboardType:inItemSet:", v9, v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));

        if (v12 && objc_msgSend(v12, "length"))
        {
          v25 = [CRLInfoImporterBoardItemProvider alloc];
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_boardItemFactory](self, "p_boardItemFactory"));
          v18 = -[CRLInfoImporterBoardItemProvider initWithData:type:boardItemFactory:](v25, "initWithData:type:boardItemFactory:", v12, v9, v26);

          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    v19 = objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_detectedImportableURLOnPasteboard:type:fallbackBoardItemProvider:](self, "p_detectedImportableURLOnPasteboard:type:fallbackBoardItemProvider:", v8, v9, 0));
  }
  v12 = (void *)v19;
  if (!v19)
    goto LABEL_20;
  v22 = [CRLBoardItemProviderFactory alloc];
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_boardItemFactory](self, "p_boardItemFactory"));
  v15 = -[CRLBoardItemProviderFactory initWithBoardItemFactory:](v22, "initWithBoardItemFactory:", v23);

  v18 = (CRLInfoImporterBoardItemProvider *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory providerForBoardItemFromDetectedImportableURL:fallbackBoardItemProvider:](v15, "providerForBoardItemFromDetectedImportableURL:fallbackBoardItemProvider:", v12, 0));
LABEL_15:

LABEL_21:
LABEL_22:

  return v18;
}

- (id)providersForBoardItemsFromImportedTextFromPasteboard:(id)a3
{
  return -[CRLPasteboardController providersForBoardItemsFromImportedTextFromPasteboard:maximumStringLength:](self, "providersForBoardItemsFromImportedTextFromPasteboard:maximumStringLength:", a3, 25600);
}

- (id)providersForBoardItemsFromImportedTextFromPasteboard:(id)a3 maximumStringLength:(unint64_t)a4
{
  id v6;
  CRLBoardItemProviderFactory *v7;
  void *v8;
  CRLBoardItemProviderFactory *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;

  v6 = a3;
  v7 = [CRLBoardItemProviderFactory alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_boardItemFactory](self, "p_boardItemFactory"));
  v9 = -[CRLBoardItemProviderFactory initWithBoardItemFactory:](v7, "initWithBoardItemFactory:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController importedTextStringFromPasteboard:smartPaste:](self, "importedTextStringFromPasteboard:smartPaste:", v6, 0));
  if ((unint64_t)objc_msgSend(v10, "length") <= a4)
  {
    if (objc_msgSend(v10, "length"))
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory providersForBoardItemsFromImportedText:](v9, "providersForBoardItemsFromImportedText:", v10));
    else
      v18 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Pasted Text"), 0, 0));

    v20 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crl_writeToFileUsingName:error:", v12, &v20));
    v14 = v20;
    if (v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012369F8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF8B7C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236A18);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController providersForBoardItemsFromImportedTextFromPasteboard:maximumStringLength:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 722, 0, "Failed to create a temporary file for oversize string: %@", v14);

      v18 = 0;
    }
    else
    {
      v21 = v13;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory providersForBoardItemsFromURLs:](v9, "providersForBoardItemsFromURLs:", v16));
    }

  }
  return v18;
}

- (id)providersForBoardItemsFromImportedRichTextFromPasteboard:(id)a3
{
  return -[CRLPasteboardController providersForBoardItemsFromImportedRichTextFromPasteboard:maximumStringLength:](self, "providersForBoardItemsFromImportedRichTextFromPasteboard:maximumStringLength:", a3, 25600);
}

- (id)providersForBoardItemsFromImportedRichTextFromPasteboard:(id)a3 maximumStringLength:(unint64_t)a4
{
  void *v6;
  CRLBoardItemProviderFactory *v7;
  void *v8;
  CRLBoardItemProviderFactory *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController importedRichTextStringFromPasteboard:smartPaste:](self, "importedRichTextStringFromPasteboard:smartPaste:", a3, 0));
  v7 = [CRLBoardItemProviderFactory alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_boardItemFactory](self, "p_boardItemFactory"));
  v9 = -[CRLBoardItemProviderFactory initWithBoardItemFactory:](v7, "initWithBoardItemFactory:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
  v11 = objc_msgSend(v10, "length");

  if ((unint64_t)v11 <= a4)
  {
    if (objc_msgSend(v6, "length"))
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory providersForBoardItemsFromImportedRichText:](v9, "providersForBoardItemsFromImportedRichText:", v6));
    else
      v19 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Pasted Text"), 0, 0));

    v21 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crl_writeToFileUsingName:type:error:", v13, 0, &v21));
    v15 = v21;
    if (v15)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236A38);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF8BFC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236A58);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController providersForBoardItemsFromImportedRichTextFromPasteboard:maximumStringLength:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 749, 0, "Failed to create a temporary file for oversize string: %@", v15);

      v19 = 0;
    }
    else
    {
      v22 = v14;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory providersForBoardItemsFromURLs:](v9, "providersForBoardItemsFromURLs:", v17));
    }

  }
  return v19;
}

- (id)p_importableURLFromPasteboard:(id)a3 itemIndex:(unint64_t)a4 itemType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v18;
  uint8_t buf[4];
  unsigned int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  id v30;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLs"));
  if (objc_msgSend(v9, "count"))
  {
    if ((unint64_t)objc_msgSend(v9, "count") <= a4)
    {
      v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236A78);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v18 = v11;
        *(_DWORD *)buf = 67110402;
        v20 = v10;
        v21 = 2082;
        v22 = "-[CRLPasteboardController p_importableURLFromPasteboard:itemIndex:itemType:]";
        v23 = 2082;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m";
        v25 = 1024;
        v26 = 799;
        v27 = 2048;
        v28 = a4;
        v29 = 2048;
        v30 = objc_msgSend(v9, "count");
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid URL index %tu: only %tu URLs on pasteboard", buf, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236A98);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController p_importableURLFromPasteboard:itemIndex:itemType:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 799, 0, "Invalid URL index %tu: only %tu URLs on pasteboard", a4, objc_msgSend(v9, "count"));

    }
    if ((unint64_t)objc_msgSend(v9, "count") <= a4)
      v15 = 0;
    else
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a4));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataForPasteboardType:", v8));
    if (v16)
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithDataRepresentation:relativeToURL:](NSURL, "URLWithDataRepresentation:relativeToURL:", v16, 0));
    else
      v15 = 0;

  }
  return v15;
}

- (id)p_importableFileURLFromPasteboard:(id)a3 itemIndex:(unint64_t)a4 itemType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v8));
  if (!objc_msgSend(v10, "conformsToType:", UTTypeURL))
  {
    v11 = 0;
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSURL crl_URLWithStringDataOnPasteboard:itemSet:pasteboardType:](NSURL, "crl_URLWithStringDataOnPasteboard:itemSet:pasteboardType:", v7, v9, v8));
  if (!v11
    || !+[CRLURLBoardItemProvider canInitWithURL:](CRLURLBoardItemProvider, "canInitWithURL:", v11))
  {
    goto LABEL_6;
  }
  v11 = v11;
  v12 = v11;
LABEL_7:

  return v12;
}

- (id)p_detectedImportableURLOnPasteboard:(id)a3 type:(id)a4 fallbackBoardItemProvider:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "importableRichTextTypes"));
  v11 = objc_msgSend(v10, "containsObject:", v9);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController importedRichTextStringFromPasteboard:smartPaste:](self, "importedRichTextStringFromPasteboard:smartPaste:", v8, 0));
    v13 = objc_msgSend(v12, "length");
    if (v13)
    {
      v36 = xmmword_100EEE418;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attribute:atIndex:effectiveRange:", NSLinkAttributeName, 0, &v36));
      if (v15 && v36 == __PAIR128__((unint64_t)v13, 0))
      {
        v16 = objc_opt_class(NSURL, v14);
        v17 = sub_100221D0C(v16, v15);
        v13 = (id)objc_claimAutoreleasedReturnValue(v17);
        if (v13)
        {
LABEL_15:

          goto LABEL_17;
        }
        v19 = objc_opt_class(NSString, v18);
        v20 = sub_100221D0C(v19, v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (!v22)
        {
          v13 = 0;
          goto LABEL_14;
        }
        v23 = (void *)objc_opt_class(self, v21);
        v24 = v22;
        v25 = 0;
      }
      else
      {
        v28 = objc_opt_class(self, v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "string"));
        v23 = (void *)v28;
        v24 = v22;
        v25 = 1;
      }
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "detectedImportableURLForPasteboardString:canTrimWhitespace:", v24, v25));
LABEL_14:

      goto LABEL_15;
    }
  }
  else
  {
    if (!+[CRLIngestionTypes isValidPlainTextUTI:](CRLIngestionTypes, "isValidPlainTextUTI:", v9))
    {
      v13 = 0;
LABEL_22:
      v30 = 0;
      goto LABEL_38;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController importedTextStringFromPasteboard:smartPaste:](self, "importedTextStringFromPasteboard:smartPaste:", v8, 0));
    if (v12)
    {
      v27 = objc_msgSend((id)objc_opt_class(self, v26), "detectedImportableURLForPasteboardString:canTrimWhitespace:", v12, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue(v27);
    }
    else
    {
      v13 = 0;
    }
  }
LABEL_17:

  if (!v13
    || !+[CRLURLBoardItemProvider canInitWithURL:](CRLURLBoardItemProvider, "canInitWithURL:", v13))
  {
    goto LABEL_22;
  }
  v13 = v13;
  if (a5)
  {
    if (v11)
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController providersForBoardItemsFromImportedRichTextFromPasteboard:](self, "providersForBoardItemsFromImportedRichTextFromPasteboard:", v8));
    else
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController providersForBoardItemsFromImportedTextFromPasteboard:](self, "providersForBoardItemsFromImportedTextFromPasteboard:", v8));
    v31 = v29;
    if (objc_msgSend(v29, "count"))
    {
      if (objc_msgSend(v31, "count") != (id)1)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101236AB8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF8C7C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101236AD8);
        v32 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController p_detectedImportableURLOnPasteboard:type:fallbackBoardItemProvider:]"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 929, 0, "There should be only one rich or plain text board item provider when there is text on the pasteboard");

      }
      *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", 0));
    }

  }
  v30 = v13;
LABEL_38:

  return v30;
}

+ (id)detectedImportableURLForPasteboardString:(id)a3 canTrimWhitespace:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7));

  }
  v8 = (char *)objc_msgSend(v6, "length");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLURLBoardItemProvider supportedRemoteURLSchemes](CRLURLBoardItemProvider, "supportedRemoteURLSchemes"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v20 = v5;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (v8 >= (char *)objc_msgSend(v14, "length") + 1)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v15, "lowercaseString"));

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR(":")));
          LOBYTE(v15) = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v15 & 1) != 0)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));

            goto LABEL_15;
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
    v18 = 0;
LABEL_15:
    v5 = v20;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)copyBoardItems:(id)a3 toPasteboard:(id)a4 asPDF:(BOOL)a5 writeAssistant:(id)a6 nativeOnly:(BOOL)a7 icc:(id)a8
{
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CRLContentDescriptionTranslator *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  _BOOL4 v43;

  v43 = a7;
  v10 = a5;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v17 = a8;
  v41 = v10;
  if (v10 && v43)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236AF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF8E2C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236B18);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController copyBoardItems:toPasteboard:asPDF:writeAssistant:nativeOnly:icc:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 968, 0, "asPDF is ignored when nativeOnly is specified");

  }
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236B38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF8D98();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236B58);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController copyBoardItems:toPasteboard:asPDF:writeAssistant:nativeOnly:icc:]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 970, 0, "invalid nil value for '%{public}s'", "inPasteboard");

  }
  objc_msgSend((id)objc_opt_class(self, v16), "clearPasteboardCacheDirectory");
  v42 = v17;
  objc_storeWeak((id *)&self->_icc, v17);
  v24 = objc_autoreleasePoolPush();
  if (v15)
  {
    v25 = v14;
    v26 = objc_alloc_init(CRLContentDescriptionTranslator);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLContentDescriptionTranslator contentDescriptionForBoardItems:](v26, "contentDescriptionForBoardItems:", v13));
    v29 = (void *)objc_opt_class(self, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_boardItemFactory](self, "p_boardItemFactory"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_board](self, "p_board"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "boardItemsForCopyByFixingUpBoardItems:boardItemFactory:board:", v13, v30, v31));

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController pasteboardObjectFromAssistant:boardItems:](self, "pasteboardObjectFromAssistant:boardItems:", v15, v32));
    if (v33)
    {
      objc_msgSend(v15, "setContentDescription:", v27);
      if (!v43)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController publicTypesForBoardItems:asPDF:](self, "publicTypesForBoardItems:asPDF:", v32, v41));
        objc_msgSend(v15, "setDataProvider:forTypes:", self, v35);
        if (v41)
          objc_msgSend(v15, "setExcludeNativeData:", 1);
        objc_msgSend((id)objc_opt_class(self, v36), "cacheWithBoardItems:", v32);

      }
      v37 = objc_opt_class(CRLPasteboardCopyAssistant, v34);
      v38 = sub_100221D0C(v37, v15);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      objc_msgSend(v39, "copyToPasteboard");

    }
    v13 = (id)v32;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236B78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF8D04();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236B98);
    v25 = v14;
    v40 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v40);
    v26 = (CRLContentDescriptionTranslator *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController copyBoardItems:toPasteboard:asPDF:writeAssistant:nativeOnly:icc:]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 991, 0, "invalid nil value for '%{public}s'", "writeAssistant");
  }

  objc_autoreleasePoolPop(v24);
}

- (void)copyUninsertedFreehandDrawingItems:(id)a3 toPasteboard:(id)a4
{
  id v6;
  id v7;
  CRLContentDescriptionTranslator *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (objc_msgSend(v12, "count"))
  {
    v7 = -[CRLPasteboardController newCopyAssistantWithPasteboard:](self, "newCopyAssistantWithPasteboard:", v6);
    v8 = objc_alloc_init(CRLContentDescriptionTranslator);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLContentDescriptionTranslator contentDescriptionForBoardItems:](v8, "contentDescriptionForBoardItems:", v12));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController pasteboardObjectFromAssistant:boardItems:](self, "pasteboardObjectFromAssistant:boardItems:", v7, v12));

    if (v10)
    {
      objc_msgSend(v7, "setContentDescription:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController publicTypesForBoardItems:asPDF:](self, "publicTypesForBoardItems:asPDF:", v12, 0));
      objc_msgSend(v7, "setDataProvider:forTypes:", self, v11);
      objc_msgSend(v7, "copyToPasteboard");

    }
  }

}

- (BOOL)hasImportablePlainTextOnPasteboard:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  if ((objc_msgSend(v3, "containsImportableTextTypes") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pasteboardTypes"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v10, (_QWORD)v13));
          if ((objc_msgSend(v11, "conformsToType:", UTTypePlainText) & 1) != 0
            || +[CRLPasteboardController p_isURLTypeExcludingFileURL:](CRLPasteboardController, "p_isURLTypeExcludingFileURL:", v10))
          {

            v4 = 1;
            goto LABEL_15;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v4 = 0;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v4 = 0;
    }
LABEL_15:

  }
  return v4;
}

- (BOOL)hasImportableRichTextOnPasteboard:(id)a3
{
  return _objc_msgSend(a3, "containsImportableRichTextTypes");
}

- (id)importedRichTextStringFromPasteboard:(id)a3 smartPaste:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "richTextStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[CRLWPStorageSanitizer filterText:removingAttachments:](CRLWPStorageSanitizer, "filterText:removingAttachments:", v7, 0));

    v7 = (void *)v8;
  }
  if (a4)
  {
    if (v7)
      v9 = objc_msgSend(v5, "isSmartCopy");
    else
      v9 = 0;
    *a4 = v9;
  }

  return v7;
}

- (id)importedTextStringFromPasteboard:(id)a3 smartPaste:(BOOL *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  BOOL *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];

  v5 = a3;
  v6 = v5;
  if (a4)
    *a4 = 0;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pasteboardTypes"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v10)
        objc_enumerationMutation(v7);
      if (+[CRLPasteboardController p_isURLTypeExcludingFileURL:](CRLPasteboardController, "p_isURLTypeExcludingFileURL:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v11)))
      {
        break;
      }
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_32;
      }
    }
    v30 = a4;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLs"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v13)
    {
      v14 = v13;
      v7 = 0;
      v15 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "absoluteString"));
          if (objc_msgSend(v17, "length"))
          {
            if (v7)
            {
              v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("%C%@"), 10, v17));

              v7 = (id)v18;
            }
            else
            {
              v7 = v17;
            }
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v14);
    }
    else
    {
      v7 = 0;
    }

    if (!objc_msgSend(v7, "length"))
    {
      a4 = v30;
      goto LABEL_32;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crl_stringByFixingBrokenSurrogatePairs"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "crlwp_stringByNormalizingParagraphBreaks"));
    v21 = (id)objc_claimAutoreleasedReturnValue(+[CRLWPStorageSanitizer filterText:](CRLWPStorageSanitizer, "filterText:", v20));

    a4 = v30;
    if (v30 && objc_msgSend(v21, "length"))
      *v30 = 1;

    if (v21)
    {
LABEL_45:
      if (!a4)
        goto LABEL_49;
      goto LABEL_46;
    }
  }
  else
  {
LABEL_32:

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "strings"));
  v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (!v21)
  {
LABEL_44:

    goto LABEL_45;
  }
  v23 = *(_QWORD *)v32;
LABEL_35:
  v24 = 0;
  while (1)
  {
    if (*(_QWORD *)v32 != v23)
      objc_enumerationMutation(v22);
    v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v24);
    if (objc_msgSend(v25, "length"))
      break;
    if (v21 == (id)++v24)
    {
      v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      if (v21)
        goto LABEL_35;
      goto LABEL_44;
    }
  }
  v26 = v25;

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "crl_stringByFixingBrokenSurrogatePairs"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "crlwp_stringByNormalizingParagraphBreaks"));
    v21 = (id)objc_claimAutoreleasedReturnValue(+[CRLWPStorageSanitizer filterText:](CRLWPStorageSanitizer, "filterText:", v28));

    v22 = v26;
    goto LABEL_44;
  }
  v21 = 0;
  if (a4)
  {
LABEL_46:
    if (v21 && objc_msgSend(v6, "isSmartCopy"))
      *a4 = 1;
  }
LABEL_49:

  return v21;
}

- (BOOL)hasTextStoragesOnPasteboard:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v7;

  v7 = CFSTR("com.apple.freeform.pasteboardState.hasTextStoragesAttachmentsNotAllowed");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v3, "containsPasteboardTypes:", v4, v7);

  return v5;
}

- (BOOL)hasNativeTextOnPasteboard:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v7;

  v7 = CFSTR("com.apple.freeform.pasteboardState.hasNativeText");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v3, "containsPasteboardTypes:", v4, v7);

  return v5;
}

- (BOOL)hasNativeBoardItemsContainingTextOnPasteboard:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  const __CFString *v7;

  v7 = CFSTR("com.apple.freeform.pasteboardState.hasNativeBoardItemsContainingText");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v3, "containsPasteboardTypes:", v4, v7);

  return v5;
}

- (void)copyTextStorage:(id)a3 selection:(id)a4 toPasteboard:(id)a5 smartCopy:(BOOL)a6 writeAssistant:(id)a7 nativeOnly:(BOOL)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  unsigned int v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  char *v44;
  uint64_t v45;
  id v46;
  void *v47;
  CRLContentDescriptionTranslator *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  BOOL v60;
  unsigned int v61;
  id v62;
  void *v63;
  void *v64;
  CRLPasteboardController *v65;
  void *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  void *v72;
  void *v73;
  uint8_t buf[4];
  unsigned int v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  const char *v83;
  _BYTE v84[128];
  void *v85;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  if (v17)
  {
    v18 = v17;
    v19 = 0;
  }
  else
  {
    v18 = -[CRLPasteboardController newCopyAssistantWithPasteboard:](self, "newCopyAssistantWithPasteboard:", v16);
    v19 = v18;
    if (!v18)
      goto LABEL_42;
  }
  v60 = a8;
  if (v15)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "visualRangesArray"));
  }
  else
  {
    v21 = objc_msgSend(v14, "range");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v21, v22));
    v85 = v23;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v85, 1));

  }
  v65 = self;
  v66 = v18;
  v62 = v16;
  v63 = v20;
  v61 = v10;
  v64 = v19;
  if ((unint64_t)objc_msgSend(v20, "count") < 2)
  {
    v27 = v14;
    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", 0));
    v40 = (uint64_t)objc_msgSend(v24, "rangeValue");
    v42 = v45;
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v24 = v20;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
    if (v25)
    {
      v26 = v25;
      v59 = v15;
      v27 = 0;
      v28 = *(_QWORD *)v69;
      v67 = v14;
      while (1)
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v69 != v28)
            objc_enumerationMutation(v24);
          v30 = objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v29), "rangeValue");
          v32 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", v14, v30, v31);
          if (v32)
          {
            if (v27)
              goto LABEL_15;
          }
          else
          {
            v34 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101236BB8);
            v35 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v75 = v34;
              v76 = 2082;
              v77 = "-[CRLPasteboardController copyTextStorage:selection:toPasteboard:smartCopy:writeAssistant:nativeOnly:]";
              v78 = 2082;
              v79 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m";
              v80 = 1024;
              v81 = 1209;
              v82 = 2082;
              v83 = "innerStorage";
              _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101236BD8);
            v36 = v24;
            v37 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v43 = v37;
              v44 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v75 = v34;
              v76 = 2114;
              v77 = v44;
              _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController copyTextStorage:selection:toPasteboard:smartCopy:writeAssistant:nativeOnly:]"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v38, v39, 1209, 0, "invalid nil value for '%{public}s'", "innerStorage");

            v24 = v36;
            v14 = v67;
            if (v27)
            {
LABEL_15:
              objc_msgSend(v27, "replaceCharactersIn:withStorage:", objc_msgSend(v27, "length"), 0, v32);
              v33 = v27;
              goto LABEL_26;
            }
          }
          v33 = v32;
          v27 = v33;
LABEL_26:
          v40 = (uint64_t)objc_msgSend(v33, "range");
          v42 = v41;

          v29 = (char *)v29 + 1;
        }
        while (v26 != v29);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
        if (!v26)
        {
          v15 = v59;
          v16 = v62;
          v10 = v61;
          goto LABEL_31;
        }
      }
    }
    v27 = 0;
    v40 = 0x7FFFFFFFFFFFFFFFLL;
    v42 = 0;
  }
LABEL_31:

  if (v27)
    v46 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", v27, v40, v42);
  else
    v46 = 0;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController pasteboardObjectFromAssistant:textStorage:smartCopy:](v65, "pasteboardObjectFromAssistant:textStorage:smartCopy:", v66, v46, v10));
  if (v47)
  {
    v48 = objc_alloc_init(CRLContentDescriptionTranslator);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLContentDescriptionTranslator contentDescriptionForTextStorage:range:boardItems:](v48, "contentDescriptionForTextStorage:range:boardItems:", v46, v40, v42, &__NSArray0__struct));
    objc_msgSend(v66, "setContentDescription:", v49);

    v51 = v66;
    if (!v60)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
      v73 = v52;
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v73, 1));
      objc_msgSend(v66, "setDataProvider:forTypes:", v65, v53);

      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
      v72 = v54;
      v51 = v66;
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v72, 1));
      objc_msgSend(v66, "setDataProvider:forTypes:", v65, v55);

    }
    v56 = v64;
    if (!v64)
    {
      v57 = objc_opt_class(CRLPasteboardCopyAssistant, v50);
      v58 = sub_100221D0C(v57, v51);
      v56 = (void *)objc_claimAutoreleasedReturnValue(v58);
    }
    objc_msgSend(v56, "copyToPasteboardIsSmartCopy:", v61);

    v16 = v62;
  }
  else
  {
    v51 = v66;
    v56 = v64;
  }

LABEL_42:
}

- (id)textStorageFromPasteboard:(id)a3 forTargetStorage:(id)a4 smartPaste:(BOOL *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v7 = -[CRLPasteboardController newReadAssistantWithPasteboard:](self, "newReadAssistantWithPasteboard:", a3, a4);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pasteboardObject"));
    v10 = v9;
    if (v9)
    {
      if (a5)
        *a5 = objc_msgSend(v9, "isSmartCopyPaste");
      if (objc_msgSend(v10, "hasNativeText"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController delegate](self, "delegate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "boardItemFactoryForPasteboardController:", self));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "makeTextboxFromCopiedTextWith:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "textStorage"));

LABEL_13:
        goto LABEL_14;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boardItems"));
      v16 = objc_msgSend(v15, "count");

      if (v16 == (id)1)
      {
        v18 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boardItems"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
        v21 = sub_100221D0C(v18, v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v21);

        if (v12)
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textStorage"));
        else
          v14 = 0;
        goto LABEL_13;
      }
    }
    v14 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (unint64_t)preferredImportableDataTypeOnPasteboard:(id)a3 detectImportableURLsInText:(BOOL)a4
{
  return -[CRLPasteboardController preferredImportableDataTypeOnPasteboard:detectImportableURLsInText:skipFileURLs:](self, "preferredImportableDataTypeOnPasteboard:detectImportableURLsInText:skipFileURLs:", a3, a4, 0);
}

- (unint64_t)preferredImportableDataTypeOnPasteboard:(id)a3 detectImportableURLsInText:(BOOL)a4 skipFileURLs:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  unint64_t v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (-[CRLPasteboardController hasImportableBoardItemsOnPasteboard:detectImportableURLsInText:skipFileURLs:](self, "hasImportableBoardItemsOnPasteboard:detectImportableURLsInText:skipFileURLs:", v8, v6, v5))
  {
    v9 = 2;
  }
  else if (-[CRLPasteboardController hasImportableRichTextOnPasteboard:](self, "hasImportableRichTextOnPasteboard:", v8))
  {
    v9 = 1;
  }
  else if (-[CRLPasteboardController hasImportablePlainTextOnPasteboard:](self, "hasImportablePlainTextOnPasteboard:", v8))
  {
    v9 = 4;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)promisedUTIsForPasteboard:(id)a3
{
  return 0;
}

- (BOOL)hasNativeTypesOnPasteboard:(id)a3
{
  return objc_msgSend(a3, "containsNativePasteboardTypes");
}

- (id)descriptionForPasteboard:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSDictionary *v7;
  void *v8;
  id v9;
  NSDictionary *cachedGeneralDescription;
  id v11;
  int64_t v12;
  int64_t v13;
  NSDictionary *v14;
  NSDictionary *v15;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[CRLPasteboard generalPasteboard](CRLPasteboard, "generalPasteboard"));

  if (v5 == v4)
  {
    v9 = objc_msgSend(v4, "changeCount");
    if (v9 != (id)self->_cachedGeneralDescriptionChangeCount)
    {
      v12 = (int64_t)v9;
      v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[CRLPasteboardObjectReadAssistant contentDescriptionFrom:](_TtC8Freeform32CRLPasteboardObjectReadAssistant, "contentDescriptionFrom:", v4));
      objc_storeStrong((id *)&self->_cachedGeneralDescription, v7);
      self->_cachedGeneralDescriptionChangeCount = v12;
      goto LABEL_14;
    }
    cachedGeneralDescription = self->_cachedGeneralDescription;
    goto LABEL_10;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(+[CRLPasteboard stylePasteboard](CRLPasteboard, "stylePasteboard"));

  if (v6 == v4)
  {
    v11 = objc_msgSend(v4, "changeCount");
    if (v11 != (id)self->_cachedStyleDescriptionChangeCount)
    {
      v13 = (int64_t)v11;
      v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[CRLPasteboardObjectReadAssistant contentDescriptionFrom:](_TtC8Freeform32CRLPasteboardObjectReadAssistant, "contentDescriptionFrom:", v4));
      objc_storeStrong((id *)&self->_cachedStyleDescription, v7);
      self->_cachedStyleDescriptionChangeCount = v13;
      goto LABEL_14;
    }
    cachedGeneralDescription = self->_cachedStyleDescription;
LABEL_10:
    v7 = cachedGeneralDescription;
    goto LABEL_14;
  }
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[CRLPasteboardObjectReadAssistant contentDescriptionFrom:](_TtC8Freeform32CRLPasteboardObjectReadAssistant, "contentDescriptionFrom:", v4));
  if (!v7)
  {
    if (objc_msgSend(v4, "containsImportableTextTypes"))
    {
      v19 = CFSTR("hasText");
      v20 = &__kCFBooleanTrue;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      v17 = CFSTR("text");
      v18 = v8;
      v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

    }
    else
    {
      v7 = 0;
    }
  }
LABEL_14:
  if (v7)
    v14 = v7;
  else
    v14 = (NSDictionary *)&__NSDictionary0__struct;
  v15 = v14;

  return v15;
}

- (id)descriptionsForBoardItemsOnPasteboard:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController descriptionForPasteboard:](self, "descriptionForPasteboard:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLContentDescriptionTranslator descriptionsForBoardItemsInContentDescription:](CRLContentDescriptionTranslator, "descriptionsForBoardItemsInContentDescription:", v3));

  return v4;
}

- (id)pasteboardPromise:(id)a3 propertyListForType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id WeakRetained;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  id v50;
  id v51;
  id v52;
  NSAttributedStringDocumentAttributeKey v53;
  NSAttributedStringDocumentType v54;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "promisedPasteboardObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItems"));
  v9 = objc_msgSend(v8, "count");

  if (v9 == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v6));
    if (!v10)
      goto LABEL_8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crl_anyObject"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "promisedDataForPublicType:", v10));

    if (v13)
    {

      goto LABEL_43;
    }
    if ((objc_msgSend(v10, "conformsToType:", UTTypePlainText) & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItems"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "crl_anyObject"));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "promisedStringForCopy"));

      if (v13)
        goto LABEL_43;
    }
    else
    {
LABEL_8:

    }
  }
  if (objc_msgSend(v7, "hasNativeText"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController delegate](self, "delegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "boardItemFactoryForPasteboardController:", self));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "makeTextboxFromCopiedTextWith:", v17));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
      v20 = objc_msgSend(v6, "isEqualToString:", v19);

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "text"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "string"));

        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dataUsingEncoding:allowLossyConversion:", 4, 1));
        goto LABEL_25;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
      v24 = objc_msgSend(v6, "isEqualToString:", v23);

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "text"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "coreTextAttributedString"));

        v26 = objc_msgSend(v22, "length");
        v53 = NSDocumentTypeDocumentAttribute;
        v54 = NSRTFTextDocumentType;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
        v52 = 0;
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dataFromRange:documentAttributes:error:", 0, v26, v27, &v52));
        v28 = v52;

        if (v28)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          v49 = v22;
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101236BF8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DF8F34();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101236C18);
          v29 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController pasteboardPromise:propertyListForType:]"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 1556, 0, "Error creating rich text string: %@", v28);

          v22 = v49;
        }

LABEL_25:
        if (v13)
          goto LABEL_43;
        goto LABEL_28;
      }
    }

  }
LABEL_28:
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePNG, "identifier"));
  v33 = objc_msgSend(v6, "isEqualToString:", v32);

  if (v33)
  {
    v34 = v6;
    v36 = (void *)objc_opt_class(self, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItems"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "additionalBoardItemsForCopyImaging:icc:", v37, WeakRetained));

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItems"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "arrayByAddingObjectsFromArray:", v39));

    v50 = v34;
    v51 = 0;
    v42 = -[CRLPasteboardController pImageForBoardItems:imageData:dataType:dataName:](self, "pImageForBoardItems:imageData:dataType:dataName:", v41, &v51, &v50, 0);
    v43 = v51;
    v44 = v50;

    v13 = 0;
    if (v42)
    {
      if (objc_msgSend(v44, "isEqualToString:", v34))
        v13 = v43;
      else
        v13 = 0;
    }

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236C38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF8EB4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236C58);
    v45 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController pasteboardPromise:propertyListForType:]"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v46, v47, 1576, 0, "Request for property list for unsupported pasteboard type %@", v6);

    v13 = 0;
  }
LABEL_43:

  return v13;
}

- (void)distillPasteboardContentDescription:(id)a3 intoPasteboardStateTypes:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  v7 = (void *)objc_opt_class(CRLContentDescriptionTranslator, v6);
  if (objc_msgSend(v7, "hasNativeBoardItemsInContentDescription:", v11))
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.freeform.pasteboardState.hasNativeBoardItems"));
  if (objc_msgSend(v7, "hasTextStoragesInContentDescription:", v11))
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.freeform.pasteboardState.hasTextStoragesAttachmentsNotAllowed"));
  if (objc_msgSend(v7, "hasNativeTextInContentDescription:", v11))
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.freeform.pasteboardState.hasNativeText"));
  if (objc_msgSend(v7, "hasNativeBoardItemsContainingTextInContentDescription:", v11))
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.freeform.pasteboardState.hasNativeBoardItemsContainingText"));
  if ((objc_msgSend(v7, "hasSingleNativeImageBoardItemInContentDescription:", v11) & 1) != 0)
  {
    v8 = CFSTR("com.apple.freeform.pasteboardState.hasSingleNativeImageBoardItem");
  }
  else
  {
    if (!objc_msgSend(v7, "hasSingleNativeMovieBoardItemInContentDescription:", v11))
      goto LABEL_14;
    v8 = CFSTR("com.apple.freeform.pasteboardState.hasSingleNativeMovieBoardItem");
  }
  objc_msgSend(v5, "addObject:", v8);
LABEL_14:
  if (objc_msgSend(v7, "hasOnlyFreehandDrawingBoardItemsInContentDescription:", v11))
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.freeform.pasteboardState.hasOnlyFreehandDrawingBoardItems"));
  if (objc_msgSend(v7, "hasAnyFreehandDrawingBoardItemsInContentDescription:", v11))
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.freeform.pasteboardState.hasFreehandDrawingBoardItems"));
  if (objc_msgSend(v7, "hasOnlyNativeTextBoxBoardItemsInContentDescription:", v11))
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.freeform.pasteboardState.hasOnlyNativeTextBoxItems"));
  if (objc_msgSend(v7, "hasNativeTypesInContentDescription:", v11))
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.freeform.pasteboardState.hasNativeTypes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringToPrefixForStyleCopyingTypeFromDescription:", v11));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.freeform.pasteboardState.styleClass-"), "stringByAppendingString:", v9));
    objc_msgSend(v5, "addObject:", v10);

  }
}

+ (BOOL)p_isURLTypeExcludingFileURL:(id)a3
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", a3));
  if (objc_msgSend(v3, "conformsToType:", UTTypeURL))
    v4 = objc_msgSend(v3, "conformsToType:", UTTypeFileURL) ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)pImageForBoardItems:(id)a3 imageData:(id *)a4 dataType:(id *)a5 dataName:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  void *v17;
  CGImage *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  __CFData *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  __int128 v29;
  CGImageRef image[2];

  v10 = a3;
  v11 = objc_msgSend(v10, "count");
  v12 = v11;
  if (a5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier"));
    v14 = objc_msgSend(v13, "isEqual:", *a5);

    if (v12)
      goto LABEL_3;
  }
  else
  {
    v14 = 0;
    if (v11)
    {
LABEL_3:
      *(_OWORD *)image = 0u;
      v15 = (id)objc_claimAutoreleasedReturnValue(-[CRLPasteboardController p_board](self, "p_board"));
      v27 = v15;
      v28 = v10;
      v29 = v14;
      image[0] = 0;
      LOBYTE(image[1]) = 0;
      -[CRLPasteboardController pImageInfosWithReadLock:](self, "pImageInfosWithReadLock:", &v27);
      v16 = *((id *)&v29 + 1);
      v17 = v16;
      if (v16)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v16);
        if (a5)
          *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier", v27));
        if (a6)
          *a6 = CFSTR("CopiedImage.pdf");
        v18 = image[0];
        if (!image[0])
          goto LABEL_26;
      }
      else
      {
        v18 = image[0];
        if (!image[0])
        {
          v19 = 0;
          goto LABEL_27;
        }
        if (a5)
          *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePNG, "identifier", v27));
        if (a6)
          *a6 = CFSTR("CopiedImage.png");
        if (a4)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          if (LOBYTE(image[1]))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 144.0));
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, kCGImagePropertyDPIWidth);

            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 144.0));
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, kCGImagePropertyDPIHeight);

          }
          v23 = sub_10043507C(v18, v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v25 = v24;
          if (v24)
            *a4 = objc_retainAutorelease(v24);

        }
      }
      CGImageRelease(v18);
LABEL_26:
      v19 = 1;
LABEL_27:

      goto LABEL_28;
    }
  }
  v19 = 0;
LABEL_28:

  return v19;
}

- (void)pImageInfosWithReadLock:(id *)a3
{
  CRLCanvasImager *v4;
  CRLCanvasImager *v5;
  void *v6;
  id var3;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v4 = -[CRLCanvasImager initWithBoard:]([CRLCanvasImager alloc], "initWithBoard:", a3->var0);
  v5 = v4;
  if (v4)
  {
    -[CRLCanvasImager setInfos:](v4, "setInfos:", a3->var1);
    if (a3->var2)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasImager pdfData](v5, "pdfData"));
      var3 = a3->var3;
      a3->var3 = v6;

    }
    if (!a3->var3)
    {
      if (objc_msgSend(a3->var1, "count") != (id)1)
        goto LABEL_17;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3->var1, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v8, "viewScaleToUseWhenRasterizingSingleBoardItemForCopy");
      v10 = v9;

      if (v10 < 0.0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101236C78);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF8FB4();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101236C98);
        v11 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController pImageInfosWithReadLock:]"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1772, 0, "requestedViewScale should never be negative.");

      }
      if (v10 > 0.0)
      {
        -[CRLCanvasImager setViewScale:](v5, "setViewScale:", v10);
        v14 = 0;
      }
      else
      {
LABEL_17:
        -[CRLCanvasImager setContentsScale:](v5, "setContentsScale:", 2.0);
        v14 = 1;
      }
      a3->var5 = v14;
      -[CRLCanvasImager setMaximumImagePixelSize:](v5, "setMaximumImagePixelSize:", sub_10040EB5C());
      a3->var4 = -[CRLCanvasImager newImage](v5, "newImage");
    }
  }

}

- (int64_t)p_integerFromPasteboardStateTypePrefix:(id)a3 pasteboard:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int64_t v23;
  _BYTE v24[128];

  v5 = a3;
  v23 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "pasteboardTypes"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      if (objc_msgSend(v11, "hasPrefix:", v5))
        break;
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = objc_msgSend(objc_alloc((Class)NSScanner), "initWithString:", v11);
    objc_msgSend(v13, "scanString:intoString:", v5, 0);
    if ((objc_msgSend(v13, "scanInteger:", &v23) & 1) != 0)
    {
      if ((objc_msgSend(v13, "isAtEnd") & 1) != 0)
      {
LABEL_31:

        v12 = v23;
        goto LABEL_32;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236CF8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF903C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236D18);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController p_integerFromPasteboardStateTypePrefix:pasteboard:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 1809, 0, "Expected scanner to be at end from pasteboard state type \"%@\".", v11);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236CB8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF90BC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236CD8);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController p_integerFromPasteboardStateTypePrefix:pasteboard:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 1807, 0, "Expected scanner to read integer from pasteboard state type \"%@\".", v11);
    }

    goto LABEL_31;
  }
LABEL_9:

  v12 = 0;
LABEL_32:

  return v12;
}

+ (id)pFilteredPasteboardTypesForPasteboard:(id)a3 types:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "crl_arrayOfObjectsPassingTest:", &stru_101236D58));
  v7 = objc_msgSend((id)objc_opt_class(a1, v6), "p_movePublicURLBeforePlainTextIfNeededInTypes:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

+ (BOOL)p_pasteboardHasPlainAndRichHyperlink:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pasteboardTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(v3, "indexOfObject:", CFSTR("public.url-name"));
    v6 = 0;
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v7;
      if (v5 < v7)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
        v10 = objc_msgSend(v3, "indexOfObject:", v9);

        v6 = v10 != (id)0x7FFFFFFFFFFFFFFFLL && v8 < v10;
      }
    }
  }

  return v6;
}

+ (id)p_movePublicURLBeforePlainTextIfNeededInTypes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
    v7 = objc_msgSend(v3, "indexOfObject:", v6);

    v8 = objc_msgSend(v3, "indexOfObject:", CFSTR("public.url-name"));
    if (v7 >= v8)
      v9 = v8;
    else
      v9 = v7;
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL && v5 > v9)
    {
      v11 = objc_msgSend(v3, "mutableCopy");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v5));
      objc_msgSend(v11, "removeObjectAtIndex:", v5);
      objc_msgSend(v11, "insertObject:atIndex:", v12, v9);

      v3 = v11;
    }
  }
  return v3;
}

- (CRLPasteboardControllerDelegate)delegate
{
  return (CRLPasteboardControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_icc);
  objc_storeStrong((id *)&self->_cachedStyleDescription, 0);
  objc_storeStrong((id *)&self->_cachedGeneralDescription, 0);
}

- (void)copyStyleFromItem:(id)a3 to:(id)a4
{
  id v7;
  CRLPasteboardController *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(v9, a3);
  swift_unknownObjectRelease(a3);
  sub_1007811B0((uint64_t)v9, (uint64_t)v7);

  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v9);
}

- (BOOL)containsStylesRelevantTo:(id)a3 on:(id)a4
{
  uint64_t v6;
  id v7;
  CRLPasteboardController *v8;
  char v9;
  char v10;

  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, &protocol witness table for AnyHashable);
  v7 = a4;
  v8 = self;
  sub_1007813A0(v6, (uint64_t)v7);
  v10 = v9;

  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (id)commandsToPasteStyleTo:(id)a3 from:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  CRLPasteboardController *v11;
  Class isa;

  v7 = type metadata accessor for CRLStyledItem(0);
  v8 = sub_100784888();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_100781660(v9, (uint64_t)v10);

  swift_bridgeObjectRelease();
  type metadata accessor for CRLCommand();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)commandsToPasteTextStyleTo:(id)a3 in:(_NSRange)a4 from:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  CRLPasteboardController *v11;
  Class isa;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = self;
  sub_100783460((uint64_t)v9, location, length, (uint64_t)v10);

  type metadata accessor for CRLCommand();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

+ (id)providersForBoardItemsAndTextWithBoardItemFactory:(id)a3 keepHighlights:(BOOL)a4 fromPasteboardObject:(id)a5 descriptionsForBoardItems:(id)a6 validGeometries:(BOOL *)a7
{
  _BOOL4 v10;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  Class isa;

  v10 = a4;
  v12 = sub_1004B804C(&qword_1013F14F0);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, v12);
  v14 = a3;
  v15 = a5;
  sub_100783FBC((uint64_t)v14, v10, (uint64_t)v15, v13, a7);

  swift_bridgeObjectRelease();
  sub_1004B804C(&qword_1013F14F8);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

+ (void)cacheWithBoardItems:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for CRLBoardItem(0);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  sub_10078436C(v5);
  swift_bridgeObjectRelease();
}

@end
