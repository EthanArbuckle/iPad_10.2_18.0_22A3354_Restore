@implementation CRLBoardItemImporter

+ (void)p_registerDefaultSubclassesIfNeeded
{
  if (!qword_101415538 && qword_101415540 != -1)
    dispatch_once(&qword_101415540, &stru_101253C80);
}

+ (void)registerSubclass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (a3 != a1 && (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", a1) & 1) != 0)
    goto LABEL_16;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253CA0);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E24528();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253CC0);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBoardItemImporter registerSubclass:]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 70, 0, "Invalid parameter not satisfying: %{public}s", "(importerSubclass != self) && [importerSubclass isSubclassOfClass:self]");

  if (a3 != a1)
  {
LABEL_16:
    if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", a1))
    {
      objc_msgSend(a1, "p_registerDefaultSubclassesIfNeeded");
      objc_msgSend((id)qword_101415538, "addObject:", a3);
    }
  }
}

+ (void)p_enumerateRegisteredSubclassesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "p_registerDefaultSubclassesIfNeeded");
  v5 = (void *)qword_101415538;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100347CE4;
  v7[3] = &unk_101253CE8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v7);

}

+ (NSArray)supportedFileTypes
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100347D8C;
  v6[3] = &unk_101253D10;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v3 = v7;
  objc_msgSend(a1, "p_enumerateRegisteredSubclassesUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  return (NSArray *)v4;
}

+ (NSArray)supportedFileUTTypes
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100347E70;
  v6[3] = &unk_101253D10;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v3 = v7;
  objc_msgSend(a1, "p_enumerateRegisteredSubclassesUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  return (NSArray *)v4;
}

+ (NSArray)supportedImageFileTypes
{
  return (NSArray *)+[CRLImageItemImporter protected_supportedFileTypes](CRLImageItemImporter, "protected_supportedFileTypes");
}

+ (NSArray)supportedImageFileUTTypes
{
  return (NSArray *)+[CRLImageItemImporter protected_supportedFileUTTypes](CRLImageItemImporter, "protected_supportedFileUTTypes");
}

+ (NSArray)supportedMovieFileUTTypes
{
  return (NSArray *)+[CRLMovieItemImporter protected_supportedFileUTTypes](CRLMovieItemImporter, "protected_supportedFileUTTypes");
}

+ (BOOL)isSupportedAnimatedImageFileType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  _QWORD v9[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100347F98;
  v9[3] = &unk_101253D10;
  v9[4] = v5;
  objc_msgSend(a1, "p_enumerateRegisteredSubclassesUsingBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  v7 = objc_msgSend(v4, "crl_conformsToAnyUTI:", v6);

  return v7;
}

+ (NSArray)supportedRemoteURLSchemes
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10034807C;
  v6[3] = &unk_101253D10;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v3 = v7;
  objc_msgSend(a1, "p_enumerateRegisteredSubclassesUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  return (NSArray *)v4;
}

+ (BOOL)canImportRemoteURL:(id)a3
{
  return objc_msgSend(a1, "p_subclassForURL:", a3) != 0;
}

+ (NSArray)protected_supportedFileTypes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (NSArray)protected_supportedFileUTTypes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (NSArray)protected_supportedAnimatedImageFileTypes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (NSArray)protected_supportedAnimatedImageFileUTTypes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4
{
  return 1;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  return 1;
}

+ (NSArray)protected_supportedRemoteURLSchemes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (BOOL)protected_canImportFromRemoteURL:(id)a3
{
  return 0;
}

+ (Class)p_subclassForURL:(id)a3
{
  id v4;
  unsigned int v5;
  char v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v20 = 0;
  v5 = objc_msgSend(v4, "isFileURL");
  v6 = v5;
  if (v5)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crl_fileTypeIdentifierHandlingFileCoordinationPromises"));
  else
    v7 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100348250;
  v12[3] = &unk_101253D38;
  v16 = v6;
  v8 = v7;
  v13 = v8;
  v9 = v4;
  v14 = v9;
  v15 = &v17;
  objc_msgSend(a1, "p_enumerateRegisteredSubclassesUsingBlock:", v12);
  v10 = (id)v18[3];

  _Block_object_dispose(&v17, 8);
  return (Class)v10;
}

+ (Class)p_subclassForPreinsertionAssetWrapper:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100348524;
  v9[3] = &unk_101253D60;
  v9[4] = v5;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(a1, "p_enumerateRegisteredSubclassesUsingBlock:", v9);
  v7 = (id)v13[3];

  _Block_object_dispose(&v12, 8);
  return (Class)v7;
}

+ (CRLBoardItemImporter)allocWithZone:(_NSZone *)a3
{
  double v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v5 = objc_opt_class(CRLBoardItemImporter, a2).n128_u64[0];
  if (v6 == a1)
    return (CRLBoardItemImporter *)+[CRLBoardItemImporterPlaceholder allocWithZone:](CRLBoardItemImporterPlaceholder, "allocWithZone:", a3, v5);
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CRLBoardItemImporter;
  return (CRLBoardItemImporter *)objc_msgSendSuper2(&v8, "allocWithZone:", a3, v5);
}

- (CRLBoardItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CRLBoardItemImporter *v11;
  NSURL *v12;
  NSURL *URL;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253D80);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E245B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253DA0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter initWithURL:boardItemFactory:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 266, 0, "Invalid parameter not satisfying: %{public}s", "URL != nil");

  }
  v15.receiver = self;
  v15.super_class = (Class)CRLBoardItemImporter;
  v11 = -[CRLBoardItemImporter init](&v15, "init");
  if (v11)
  {
    v12 = (NSURL *)objc_msgSend(v6, "copy");
    URL = v11->_URL;
    v11->_URL = v12;

    objc_storeStrong((id *)&v11->_boardItemFactory, a4);
  }

  return v11;
}

- (CRLBoardItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CRLBoardItemImporter *v12;
  CRLBoardItemImporter *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253DC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24640();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253DE0);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter initWithData:boardItemFactory:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 279, 0, "Invalid parameter not satisfying: %{public}s", "assetWrapper != nil");

  }
  v15.receiver = self;
  v15.super_class = (Class)CRLBoardItemImporter;
  v12 = -[CRLBoardItemImporter init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preinsertionAsset, a3);
    objc_storeStrong((id *)&v13->_boardItemFactory, a4);
  }

  return v13;
}

- (id)p_placeholderInit
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;

  objc_opt_class(self, a2);
  v4 = v3;
  *(_QWORD *)&v6 = objc_opt_class(CRLBoardItemImporterPlaceholder, v5).n128_u64[0];
  if (v4 != v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253E00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E246CC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253E20);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter p_placeholderInit]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 295, 0, "Do not call method");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLBoardItemImporter p_placeholderInit]"));
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v12, 0));

    objc_exception_throw(v13);
  }
  v14.receiver = self;
  v14.super_class = (Class)CRLBoardItemImporter;
  return -[CRLBoardItemImporter init](&v14, "init", v6);
}

- (void)importBoardItemWithCompletionHandler:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  Class v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  Class v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  Class v22;
  NSString *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253E40);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 67110146;
    v28 = v5;
    v29 = 2082;
    v30 = "-[CRLBoardItemImporter importBoardItemWithCompletionHandler:]";
    v31 = 2082;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    v33 = 1024;
    v34 = 302;
    v35 = 2114;
    v36 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253E60);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v28 = v5;
    v29 = 2114;
    v30 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter importBoardItemWithCompletionHandler:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
  objc_opt_class(self, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 302, 0, "Abstract method not overridden by %{public}@", v20);

  objc_opt_class(self, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v24, "-[CRLBoardItemImporter importBoardItemWithCompletionHandler:]"));
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v25, 0));

  objc_exception_throw(v26);
}

- (void)cancel
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253E80);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLBoardItemImporter cancel]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    v31 = 1024;
    v32 = 306;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253EA0);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter cancel]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 306, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLBoardItemImporter cancel]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (BOOL)usesProgressDialog
{
  return 1;
}

- (CRLProgress)progress
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253EC0);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLBoardItemImporter progress]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    v31 = 1024;
    v32 = 314;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253EE0);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter progress]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 314, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLBoardItemImporter progress]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253F00);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLBoardItemImporter boardItem]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    v31 = 1024;
    v32 = 320;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253F20);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter boardItem]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 320, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLBoardItemImporter boardItem]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (NSError)error
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253F40);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLBoardItemImporter error]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    v31 = 1024;
    v32 = 326;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253F60);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter error]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 326, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLBoardItemImporter error]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (unint64_t)uploadDataLength
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253F80);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLBoardItemImporter uploadDataLength]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    v31 = 1024;
    v32 = 332;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253FA0);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter uploadDataLength]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 332, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLBoardItemImporter uploadDataLength]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (unint64_t)embeddedDataLength
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253FC0);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLBoardItemImporter embeddedDataLength]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m";
    v31 = 1024;
    v32 = 338;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253FE0);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporter embeddedDataLength]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 338, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLBoardItemImporter embeddedDataLength]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

+ (NSString)defaultPastedImageName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("pasted-image"), 0, 0));

  return (NSString *)v3;
}

+ (NSString)defaultPastedMovieName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("pasted-movie"), 0, 0));

  return (NSString *)v3;
}

- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory
{
  return self->_boardItemFactory;
}

- (NSURL)URL
{
  return self->_URL;
}

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)preinsertionAsset
{
  return self->_preinsertionAsset;
}

- (CRLBoardItemImporterDelegate)delegate
{
  return (CRLBoardItemImporterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void)setSuggestedName:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preinsertionAsset, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_boardItemFactory, 0);
}

@end
