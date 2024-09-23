@implementation CRLMetalShaderLibraryLoader

+ (id)loadDefaultLibraryWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", a1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loadLibraryWithDevice:bundle:", v4, v5));

  return v6;
}

+ (id)loadLibraryWithDevice:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241EC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0840C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241EE0);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShaderLibraryLoader loadLibraryWithDevice:bundle:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    v14 = "Can't initialize shader library with nil device.";
    v15 = v9;
    v16 = v11;
    v17 = 34;
    goto LABEL_31;
  }
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241F00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0848C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241F20);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShaderLibraryLoader loadLibraryWithDevice:bundle:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    v14 = "Can't initialize shader library with nil bundle.";
    v15 = v9;
    v16 = v11;
    v17 = 39;
LABEL_31:
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, v17, 0, v14);
    v8 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v20 = 0;
  v8 = objc_msgSend(v5, "newDefaultLibraryWithBundle:error:", v6, &v20);
  v9 = v20;
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241F40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0850C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241F60);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShaderLibraryLoader loadLibraryWithDevice:bundle:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 45, 0, "Failed to create library, error %@", v9);

    goto LABEL_32;
  }
LABEL_33:

  return v8;
}

@end
