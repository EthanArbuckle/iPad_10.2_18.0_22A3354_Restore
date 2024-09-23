@implementation CRLImageProviderPool

+ (CRLImageProviderPool)sharedPool
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100172BD4;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101414EC0 != -1)
    dispatch_once(&qword_101414EC0, block);
  return (CRLImageProviderPool *)(id)qword_101414EB8;
}

- (CRLImageProviderPool)init
{
  CRLImageProviderPool *v2;
  NSMapTable *v3;
  NSMapTable *mImageDataToImageProviderMap;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLImageProviderPool;
  v2 = -[CRLImageProviderPool init](&v9, "init");
  if (v2)
  {
    v3 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 0);
    mImageDataToImageProviderMap = v2->mImageDataToImageProviderMap;
    v2->mImageDataToImageProviderMap = v3;

    -[CRLImageProviderPool p_updateFileDescriptorLimit](v2, "p_updateFileDescriptorLimit");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "p_didReceiveMemoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "p_applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, v7);

    +[CRLAssetManager addCullingListener:](_TtC8Freeform15CRLAssetManager, "addCullingListener:", v2);
  }
  return v2;
}

- (id)providerForAsset:(id)a3 shouldValidate:(BOOL)a4
{
  return -[CRLImageProviderPool p_providerForData:temporary:shouldValidate:](self, "p_providerForData:temporary:shouldValidate:", a3, 0, a4);
}

- (id)temporaryProviderForAsset:(id)a3 shouldValidate:(BOOL)a4
{
  return -[CRLImageProviderPool p_providerForData:temporary:shouldValidate:](self, "p_providerForData:temporary:shouldValidate:", a3, 1, a4);
}

- (BOOL)isBitmapAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 v10;
  double v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  uint64_t v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
  v6 = sub_1000304B4();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "conformsToType:", v7);

  if ((v8 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    *(_QWORD *)&v11 = objc_opt_class(self, v9).n128_u64[0];
    v13 = objc_msgSend(v12, "p_providerClassForData:", v4, v11);
    *(_QWORD *)&v15 = objc_opt_class(CRLBitmapImageProvider, v14).n128_u64[0];
    v10 = objc_msgSend(v13, "isSubclassOfClass:", v16, v15);
  }

  return v10;
}

+ (Class)p_providerClassForData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t v10;
  __objc2_class *v11;
  objc_class *v12;
  objc_class *v13;
  void *v14;
  NSString *v15;
  uint64_t v16;
  id v17;
  Class v18;
  NSString *v19;
  __CFString *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  CGImage *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  objc_class *v30;
  _QWORD v32[6];
  int v33;
  char v34;
  _BYTE buf[24];
  void *v36;
  __int16 v37;
  void *v38;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = sub_1000304B4();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v4, "conformsToType:", v7);

  if (v8)
  {
    if (qword_10147E588 != -1)
      dispatch_once(&qword_10147E588, &stru_10123D780);
    v9 = off_1013D9F78;
    if (os_log_type_enabled((os_log_t)off_1013D9F78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to render PICT, returning error provider.", buf, 2u);
    }
    goto LABEL_31;
  }
  if (objc_msgSend(v5, "crl_conformsToUTI:", CFSTR("com.adobe.illustrator.ai-image")))
  {
LABEL_7:
    v11 = CRLPDFImageProvider;
    goto LABEL_10;
  }
  if (!objc_msgSend(v4, "conformsToType:", UTTypeImage))
  {
    if (!objc_msgSend(v4, "conformsToType:", UTTypePDF))
    {
      v34 = 0;
      v33 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v36) = 0;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1001733E8;
      v32[3] = &unk_10123D7A8;
      v32[4] = buf;
      v32[5] = &v33;
      objc_msgSend(v3, "performInputStreamReadWithAccessor:", v32);
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24) && (v33 == 1178882085 ? (v22 = v34 == 45) : (v22 = 0), v22))
      {
        objc_opt_class(CRLPDFImageProvider, v21);
        v13 = v29;
      }
      else
      {
        v24 = (CGImage *)objc_msgSend(v3, "newCGImage");
        if (v24)
        {
          objc_opt_class(CRLBitmapImageProvider, v23);
          v13 = v25;
          CGImageRelease(v24);
        }
        else
        {
          v13 = 0;
        }
      }
      _Block_object_dispose(buf, 8);
      if (v13)
        goto LABEL_11;
LABEL_31:
      if (qword_10147E588 != -1)
        dispatch_once(&qword_10147E588, &stru_10123D7E8);
      v14 = off_1013D9F78;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
        sub_100E011B4(v3, v14);
      v13 = 0;
      goto LABEL_36;
    }
    goto LABEL_7;
  }
  v11 = CRLBitmapImageProvider;
LABEL_10:
  objc_opt_class(v11, v10);
  v13 = v12;
  if (!v12)
    goto LABEL_31;
LABEL_11:
  if (qword_10147E588 != -1)
    dispatch_once(&qword_10147E588, &stru_10123D7C8);
  v14 = off_1013D9F78;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
  {
    v15 = NSStringFromClass(v13);
    v17 = (id)objc_claimAutoreleasedReturnValue(v15);
    if (v3)
    {
      objc_opt_class(v3, v16);
      v19 = NSStringFromClass(v18);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);
    }
    else
    {
      v20 = CFSTR("Nil");
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filename"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetUUID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2112;
    v36 = v26;
    v37 = 2114;
    v38 = v28;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_INFO, "Returning provider of class %{public}@ for <%{public}@: filename=%@, assetUUID=%{public}@> ", buf, 0x2Au);

    if (v3)
  }
LABEL_36:

  v30 = v13;
  return v30;
}

- (id)p_providerForData:(id)a3 temporary:(BOOL)a4 shouldValidate:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  Class v11;
  NSString *v12;
  __CFString *v13;
  CRLImageProviderPool *v14;
  id v15;
  CRLImageProviderPool *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  Class v23;
  NSString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  Class v34;
  NSString *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v44;
  id v45;
  objc_class *v46;
  Class v47;
  NSString *v48;
  uint64_t v49;
  __CFString *v50;
  __CFString *v51;
  Class v52;
  NSString *v53;
  void *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  id v58;
  unint64_t mOpenFileDescriptorLimit;
  uint8_t buf[4];
  __CFString *v62;
  __int16 v63;
  __CFString *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  _BYTE v68[14];
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;

  v5 = a5;
  v7 = (__CFString *)a3;
  v8 = v7;
  if (!v7 || (-[__CFString needsDownload](v7, "needsDownload") & 1) != 0)
  {
    if (-[__CFString needsDownload](v8, "needsDownload"))
    {
      if (qword_10147E588 != -1)
        dispatch_once(&qword_10147E588, &stru_10123D808);
      v9 = off_1013D9F78;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      {
        if (v8)
        {
          objc_opt_class(v8, v10);
          v12 = NSStringFromClass(v11);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue(v12);
        }
        else
        {
          v13 = CFSTR("Nil");
        }
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString filename](v8, "filename"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString assetUUID](v8, "assetUUID"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
        *(_DWORD *)buf = 138543874;
        v62 = v13;
        v63 = 2112;
        v64 = v18;
        v65 = 2114;
        v66 = v20;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Skipping provider for image data needing download <%{public}@: filename=%@, assetUUID=%{public}@> ", buf, 0x20u);

        if (v8)
      }

    }
    v58 = 0;
    mOpenFileDescriptorLimit = 0;
    goto LABEL_22;
  }
  v14 = self;
  objc_sync_enter(v14);
  mOpenFileDescriptorLimit = v14->mOpenFileDescriptorLimit;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](v14->mImageDataToImageProviderMap, "objectForKeyedSubscript:", v8));
  if (v15)
  {
    v58 = -[NSMapTable count](v14->mImageDataToImageProviderMap, "count");
    objc_sync_exit(v14);

    if (!v5)
      goto LABEL_37;
    goto LABEL_31;
  }
  objc_sync_exit(v14);

  v16 = v14;
  objc_sync_enter(v16);
  v15 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](v14->mImageDataToImageProviderMap, "objectForKeyedSubscript:", v8));
  if (v15)
    goto LABEL_13;
  *(_QWORD *)&v44 = objc_opt_class(v16, v17).n128_u64[0];
  v46 = (objc_class *)objc_msgSend(v45, "p_providerClassForData:", v8, v44);
  if (v46)
  {
    v15 = objc_msgSend([v46 alloc], "initWithImageData:", v8);
    if (v15)
    {
      if (!a4)
        -[NSMapTable setObject:forKeyedSubscript:](v14->mImageDataToImageProviderMap, "setObject:forKeyedSubscript:", v15, v8);
LABEL_13:
      v58 = -[NSMapTable count](v14->mImageDataToImageProviderMap, "count");
      goto LABEL_14;
    }
    v58 = 0;
  }
  else
  {
    v58 = 0;
    v15 = 0;
  }
LABEL_14:
  objc_sync_exit(v16);

  if (v15)
  {
    if (!v5)
      goto LABEL_37;
    goto LABEL_31;
  }
LABEL_22:
  if (qword_10147E588 != -1)
    dispatch_once(&qword_10147E588, &stru_10123D828);
  v21 = off_1013D9F78;
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
    {
      objc_opt_class(v8, v22);
      v24 = NSStringFromClass(v23);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue(v24);
    }
    else
    {
      v25 = CFSTR("Nil");
    }
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString filename](v8, "filename"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString assetUUID](v8, "assetUUID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
    *(_DWORD *)buf = 138543874;
    v62 = v25;
    v63 = 2112;
    v64 = v26;
    v65 = 2114;
    v66 = v28;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "No provider found or determinable for data. Falling back to error. <%{public}@: filename=%@, assetUUID=%{public}@> ", buf, 0x20u);

    if (v8)
  }

  v15 = (id)objc_claimAutoreleasedReturnValue(+[CRLErrorImageProvider sharedInstance](CRLErrorImageProvider, "sharedInstance"));
  if (v5)
  {
LABEL_31:
    if ((objc_msgSend(v15, "isError") & 1) == 0 && (objc_msgSend(v15, "isValid") & 1) == 0)
    {
      if (qword_10147E588 != -1)
        dispatch_once(&qword_10147E588, &stru_10123D848);
      v29 = off_1013D9F78;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      {
        objc_opt_class(v15, v30);
        v48 = NSStringFromClass(v47);
        v50 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(v48);
        if (v8)
        {
          objc_opt_class(v8, v49);
          v53 = NSStringFromClass(v52);
          v51 = (__CFString *)objc_claimAutoreleasedReturnValue(v53);
        }
        else
        {
          v51 = CFSTR("Nil");
        }
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString filename](v8, "filename"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString assetUUID](v8, "assetUUID"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "UUIDString"));
        *(_DWORD *)buf = 138544130;
        v62 = v50;
        v63 = 2114;
        v64 = v51;
        v65 = 2112;
        v66 = v54;
        v67 = 2114;
        *(_QWORD *)v68 = v56;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v29, OS_LOG_TYPE_ERROR, "Provider of type %{public}@ says data is not valid <%{public}@: filename=%@, assetUUID=%{public}@> ", buf, 0x2Au);

        if (v8)
      }

      v31 = objc_claimAutoreleasedReturnValue(+[CRLErrorImageProvider sharedInstance](CRLErrorImageProvider, "sharedInstance"));
      v15 = (id)v31;
    }
  }
LABEL_37:
  if (objc_msgSend(v15, "isError"))
  {
    if (qword_10147E588 != -1)
      dispatch_once(&qword_10147E588, &stru_10123D868);
    v32 = off_1013D9F78;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
    {
      if (v8)
      {
        objc_opt_class(v8, v33);
        v35 = NSStringFromClass(v34);
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue(v35);
      }
      else
      {
        v57 = CFSTR("Nil");
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString filename](v8, "filename"));
      v37 = -[__CFString needsDownload](v8, "needsDownload");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString type](v8, "type"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString assetUUID](v8, "assetUUID"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "UUIDString"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[__CFString length](v8, "length")));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringValue"));
      *(_DWORD *)buf = 138544898;
      v62 = v57;
      v63 = 2050;
      v64 = v8;
      v65 = 2112;
      v66 = v36;
      v67 = 1024;
      *(_DWORD *)v68 = v37;
      *(_WORD *)&v68[4] = 2114;
      *(_QWORD *)&v68[6] = v38;
      v69 = 2114;
      v70 = v40;
      v71 = 2112;
      v72 = v42;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "Returning error provider. <%{public}@: %{public}p filename=%@, needsDownload=%i, type=%{public}@, assetUUID=%{public}@, length=%@> ", buf, 0x44u);

      if (v8)
    }

  }
  if (v58 > (id)-[CRLImageProviderPool p_providerLimitForFileDescriptorLimit:](self, "p_providerLimitForFileDescriptorLimit:", mOpenFileDescriptorLimit))-[CRLImageProviderPool p_freeFileDescriptorsWithProviderCount:](self, "p_freeFileDescriptorsWithProviderCount:");

  return v15;
}

- (void)addInterestInProviderForAsset:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLImageProviderPool providerForAsset:shouldValidate:](self, "providerForAsset:shouldValidate:", a3, 0));
    objc_msgSend(v6, "addInterest");

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D888);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E012D4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D8A8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProviderPool addInterestInProviderForAsset:]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProviderPool.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 252, 0, "invalid nil value for '%{public}s'", "imageData");

  }
}

- (void)removeInterestInProviderForAsset:(id)a3
{
  id v4;
  CRLImageProviderPool *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](v5->mImageDataToImageProviderMap, "objectForKeyedSubscript:", v4));
    objc_msgSend(v6, "removeInterest");

    objc_sync_exit(v5);
  }
  else
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D8C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E01420();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D8E8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E01368(v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProviderPool removeInterestInProviderForAsset:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProviderPool.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 260, 0, "invalid nil value for '%{public}s'", "imageData");

  }
}

- (BOOL)p_rngSaysToFlush
{
  return sub_1003C6618() < 0.5;
}

- (void)p_flushRandomImageProvidersExcludingProvider:(id)a3
{
  id v4;
  CRLImageProviderPool *v5;
  void *v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](v5->mImageDataToImageProviderMap, "objectEnumerator"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v15;
    *(_QWORD *)&v8 = 134217984;
    v13 = v8;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        if (v11 != v4 && -[CRLImageProviderPool p_rngSaysToFlush](v5, "p_rngSaysToFlush"))
        {
          if (qword_10147E588 != -1)
            dispatch_once(&qword_10147E588, &stru_10123D908);
          v12 = off_1013D9F78;
          if (os_log_type_enabled((os_log_t)off_1013D9F78, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v19 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Flushing image provider %p at random.", buf, 0xCu);
          }
          objc_msgSend(v11, "flush", v13);
        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)flushImageProviders
{
  NSObject *v3;
  CRLImageProviderPool *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];

  if (qword_10147E588 != -1)
    dispatch_once(&qword_10147E588, &stru_10123D928);
  v3 = off_1013D9F78;
  if (os_log_type_enabled((os_log_t)off_1013D9F78, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Flushing all image providers.", buf, 2u);
  }
  v4 = self;
  objc_sync_enter(v4);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](v4->mImageDataToImageProviderMap, "objectEnumerator", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "flush");
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

  -[NSMapTable removeAllObjects](v4->mImageDataToImageProviderMap, "removeAllObjects");
  objc_sync_exit(v4);

}

- (void)willCullAssets:(id)a3
{
  id v4;
  CRLImageProviderPool *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[NSMapTable removeObjectForKey:](v5->mImageDataToImageProviderMap, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)willCloseContainerForAssets:(id)a3
{
  -[CRLImageProviderPool willCullAssets:](self, "willCullAssets:", a3);
}

- (void)willCloseBoardDataStoreForAssets:(id)a3
{
  -[CRLImageProviderPool willCullAssets:](self, "willCullAssets:", a3);
}

- (unint64_t)p_providerLimitForFileDescriptorLimit:(unint64_t)a3
{
  return a3 >> 2;
}

- (void)p_freeFileDescriptorsWithProviderCount:(unint64_t)a3
{
  CRLImageProviderPool *v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t mOpenFileDescriptorLimit;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  unint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  unint64_t v18;
  NSObject *v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  unint64_t v25;
  unint64_t v26;
  NSObject *v27;
  unint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *i;
  void *v33;
  char *v34;
  unsigned int v35;
  uint64_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  unsigned int v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  unint64_t v59;
  id v60;
  unint64_t v61;
  void *v62;
  unint64_t v63;
  CRLImageProviderPool *obj;
  uint64_t v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE buf[34];
  __int16 v76;
  const char *v77;
  _BYTE v78[128];
  _BYTE v79[128];

  v4 = self;
  objc_sync_enter(v4);
  obj = v4;
  -[CRLImageProviderPool p_updateFileDescriptorLimit](v4, "p_updateFileDescriptorLimit");
  v5 = -[CRLImageProviderPool p_providerLimitForFileDescriptorLimit:](v4, "p_providerLimitForFileDescriptorLimit:", v4->mOpenFileDescriptorLimit);
  if (v5 < a3)
  {
    v6 = a3;
    if (qword_10147E580 != -1)
      dispatch_once(&qword_10147E580, &stru_10123D948);
    v7 = off_1013D9F70;
    if (os_log_type_enabled((os_log_t)off_1013D9F70, OS_LOG_TYPE_DEFAULT))
    {
      mOpenFileDescriptorLimit = v4->mOpenFileDescriptorLimit;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = mOpenFileDescriptorLimit;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "1st stage of fd grief. %tu providers and %tu fds allowed. Freeing 0-interest providers.", buf, 0x16u);
    }
    v9 = -[CRLImageProviderPool p_removeProvidersWithZeroInterest](v4, "p_removeProvidersWithZeroInterest");
    v10 = v6 - v9;
    if (qword_10147E580 != -1)
      dispatch_once(&qword_10147E580, &stru_10123D968);
    v11 = off_1013D9F70;
    if (os_log_type_enabled((os_log_t)off_1013D9F70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "1st stage of fd grief. Freed %tu providers.", buf, 0xCu);
    }
    a3 = v10;
  }
  if (a3 > v5)
  {
    if (v4->mHaveRaisedFileDescriptorLimit)
    {
      v12 = a3;
      if (qword_10147E580 != -1)
        dispatch_once(&qword_10147E580, &stru_10123D988);
      v13 = off_1013D9F70;
      if (os_log_type_enabled((os_log_t)off_1013D9F70, OS_LOG_TYPE_DEFAULT))
      {
        v14 = obj->mOpenFileDescriptorLimit;
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v14;
        v15 = "2nd stage of fd grief. %tu providers and %tu fds allowed. Already raised the limit, skipping.";
        v16 = v13;
        a3 = v12;
        v17 = 22;
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
        goto LABEL_41;
      }
      goto LABEL_40;
    }
    if (v4->mOpenFileDescriptorLimit > 0x7FF)
    {
      v12 = a3;
      if (qword_10147E580 != -1)
        dispatch_once(&qword_10147E580, &stru_10123D9E8);
      v24 = off_1013D9F70;
      if (!os_log_type_enabled((os_log_t)off_1013D9F70, OS_LOG_TYPE_DEFAULT))
      {
LABEL_40:
        a3 = v12;
        goto LABEL_41;
      }
      v25 = obj->mOpenFileDescriptorLimit;
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = 2048;
      v15 = "2nd stage of fd grief. %tu providers and %tu fds allowed. Limit already at least %tu.";
      v16 = v24;
      a3 = v12;
LABEL_38:
      v17 = 32;
      goto LABEL_39;
    }
    v18 = a3;
    if (qword_10147E580 != -1)
      dispatch_once(&qword_10147E580, &stru_10123D9A8);
    v19 = off_1013D9F70;
    if (os_log_type_enabled((os_log_t)off_1013D9F70, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v4->mOpenFileDescriptorLimit;
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = 2048;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "2nd stage of fd grief. %tu providers and %tu fds allowed. Will raise limit to %tu.", buf, 0x20u);
    }
    if (v4->mOpenFileDescriptorLimit <= 0x7FF)
    {
      v21 = 2048;
      do
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        if (getrlimit(8, (rlimit *)buf) || *(_QWORD *)buf >= v21)
          break;
        *(_QWORD *)buf = 2048;
        if (setrlimit(8, (const rlimit *)buf))
        {
          v21 -= 256;
        }
        else
        {
          v4->mOpenFileDescriptorLimit = *(_QWORD *)buf;
          v5 = -[CRLImageProviderPool p_providerLimitForFileDescriptorLimit:](v4, "p_providerLimitForFileDescriptorLimit:");
        }
      }
      while (v4->mOpenFileDescriptorLimit < v21);
    }
    v4->mHaveRaisedFileDescriptorLimit = 1;
    if (qword_10147E580 != -1)
      dispatch_once(&qword_10147E580, &stru_10123D9C8);
    v22 = off_1013D9F70;
    if (os_log_type_enabled((os_log_t)off_1013D9F70, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v4->mOpenFileDescriptorLimit;
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = 2048;
      v15 = "2nd stage of fd grief. %tu providers and %tu fds allowed. Limit now %tu.";
      v16 = v22;
      a3 = v18;
      goto LABEL_38;
    }
    a3 = v18;
  }
LABEL_41:
  if (a3 > v5)
  {
    if (qword_10147E580 != -1)
      dispatch_once(&qword_10147E580, &stru_10123DA08);
    v61 = a3;
    v26 = a3 - ((3 * v5) >> 2);
    v27 = off_1013D9F70;
    if (os_log_type_enabled((os_log_t)off_1013D9F70, OS_LOG_TYPE_DEFAULT))
    {
      v28 = obj->mOpenFileDescriptorLimit;
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v61;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "3rd stage of fd grief. %tu providers and %tu fds allowed. Freeing the least interesting %tu providers.", buf, 0x20u);
    }
    v29 = objc_alloc_init((Class)NSMutableArray);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](obj->mImageDataToImageProviderMap, "objectEnumerator"));
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    if (v31)
    {
      v65 = *(_QWORD *)v72;
      v62 = v30;
      v63 = v26;
      do
      {
        v66 = v31;
        for (i = 0; i != v66; i = (char *)i + 1)
        {
          if (*(_QWORD *)v72 != v65)
            objc_enumerationMutation(v30);
          v33 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
          v34 = (char *)objc_msgSend(v29, "count");
          if ((unint64_t)v34 >= v26)
          {
            v35 = objc_msgSend(v33, "interest");
            if (v34)
            {
              v37 = v35;
              v38 = 0;
              v39 = 0x7FFFFFFFFFFFFFFFLL;
              do
              {
                *(_QWORD *)&v40 = objc_opt_class(CRLImageProvider, v36).n128_u64[0];
                v42 = v41;
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", v38, v40));
                v44 = sub_100221D0C(v42, v43);
                v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

                if ((int)objc_msgSend(v45, "interest") > v37)
                {
                  v37 = objc_msgSend(v45, "interest");
                  v39 = (uint64_t)v38;
                }

                ++v38;
              }
              while (v34 != v38);
              v30 = v62;
              v26 = v63;
              if (v39 != 0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(v29, "replaceObjectAtIndex:withObject:", v39, v33);
            }
          }
          else
          {
            objc_msgSend(v29, "addObject:", v33);
          }
        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      }
      while (v31);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v46 = v29;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v68;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v68 != v48)
            objc_enumerationMutation(v46);
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)v49), "imageData"));
          if (v50)
          {
            -[NSMapTable removeObjectForKey:](obj->mImageDataToImageProviderMap, "removeObjectForKey:", v50);
          }
          else
          {
            v51 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10123DA28);
            v52 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)&buf[4] = v51;
              *(_WORD *)&buf[8] = 2082;
              *(_QWORD *)&buf[10] = "-[CRLImageProviderPool p_freeFileDescriptorsWithProviderCount:]";
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProviderPool.m";
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = 416;
              v76 = 2082;
              v77 = "imageData";
              _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10123DA48);
            v53 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
            {
              v56 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v51;
              *(_WORD *)&buf[8] = 2114;
              *(_QWORD *)&buf[10] = v56;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v53, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProviderPool p_freeFileDescriptorsWithProviderCount:]"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProviderPool.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v54, v55, 416, 0, "invalid nil value for '%{public}s'", "imageData");

          }
          v49 = (char *)v49 + 1;
        }
        while (v47 != v49);
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
      }
      while (v47);
    }

    v57 = objc_msgSend(v46, "count");
    if (qword_10147E580 != -1)
      dispatch_once(&qword_10147E580, &stru_10123DA68);
    v58 = off_1013D9F70;
    if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = obj->mOpenFileDescriptorLimit;
      v60 = objc_msgSend(v46, "count");
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v61 - (_QWORD)v57;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v59;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v60;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v58, OS_LOG_TYPE_DEFAULT, "3rd stage of fd grief. %tu providers and %tu fds allowed. Freed %tu providers.", buf, 0x20u);
    }

  }
  objc_sync_exit(obj);

}

- (unint64_t)p_imageProviderMemoryThreshold
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCapabilities currentCapabilities](CRLCapabilities, "currentCapabilities"));
  v3 = objc_msgSend(v2, "isRendererH5OrBelow");

  if (v3)
    return 0x4000000;
  else
    return 0x10000000;
}

- (unint64_t)p_estimatedSizeOfAllProviders
{
  CRLImageProviderPool *v2;
  void *v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = self;
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](v2->mImageDataToImageProviderMap, "objectEnumerator", 0));
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v4 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "i_flushableMemoryEstimate");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v4;
}

- (void)flushProvidersToFreeMemoryIfNecessaryExcludingProvider:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[CRLImageProviderPool p_estimatedSizeOfAllProviders](self, "p_estimatedSizeOfAllProviders");
  if (v4 > -[CRLImageProviderPool p_imageProviderMemoryThreshold](self, "p_imageProviderMemoryThreshold"))
    -[CRLImageProviderPool p_flushRandomImageProvidersExcludingProvider:](self, "p_flushRandomImageProvidersExcludingProvider:", v5);

}

- (void)p_didReceiveMemoryWarning:(id)a3
{
  -[CRLImageProviderPool p_removeProvidersWithZeroInterest](self, "p_removeProvidersWithZeroInterest", a3);
  -[CRLImageProviderPool p_flushProvidersWithNoOneActivelyHoldingAReference](self, "p_flushProvidersWithNoOneActivelyHoldingAReference");
}

- (void)p_applicationDidEnterBackground:(id)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100175454;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(v5, block);

}

- (unint64_t)p_removeProvidersWithZeroInterest
{
  CRLImageProviderPool *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v2 = self;
  objc_sync_enter(v2);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](v2->mImageDataToImageProviderMap, "objectEnumerator"));
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if ((int)objc_msgSend(v8, "interest") >= 1)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageData"));
          v10 = objc_msgSend(v9, "hasOwners");

          if ((v10 & 1) != 0)
            continue;
        }
        if (!v4)
          v4 = objc_alloc_init((Class)NSMutableArray);
        objc_msgSend(v4, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j), "imageData", (_QWORD)v18));
        if (v15)
          -[NSMapTable removeObjectForKey:](v2->mImageDataToImageProviderMap, "removeObjectForKey:", v15);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

  v16 = objc_msgSend(v11, "count");
  objc_sync_exit(v2);

  return (unint64_t)v16;
}

- (void)p_flushProvidersWithNoOneActivelyHoldingAReference
{
  CRLImageProviderPool *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v2 = self;
  objc_sync_enter(v2);
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](v2->mImageDataToImageProviderMap, "objectEnumerator", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "i_flushIfNoOneUsing");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)p_updateFileDescriptorLimit
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  rlim_t rlim_cur;
  rlimit v9;

  v9.rlim_cur = 0;
  v9.rlim_max = 0;
  if (getrlimit(8, &v9))
  {
    v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DA88);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E014B4(v4, v3);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DAA8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProviderPool p_updateFileDescriptorLimit]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProviderPool.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 522, 0, "Failed to get fd limit: getrlimit set errno to %d. Assuming limit of 256.", *__error());

    rlim_cur = 256;
  }
  else
  {
    rlim_cur = v9.rlim_cur;
  }
  self->mOpenFileDescriptorLimit = rlim_cur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mImageDataToImageProviderMap, 0);
}

@end
