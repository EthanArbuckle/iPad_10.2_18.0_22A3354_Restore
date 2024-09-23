@implementation CRLCIKernelLoader

+ (id)loadKernelWithMetalName:(id)a3 legacyName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCapabilities currentCapabilities](CRLCapabilities, "currentCapabilities"));
  if ((objc_msgSend(v8, "isMetalCapable") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCapabilities currentCapabilities](CRLCapabilities, "currentCapabilities"));
    v10 = sub_1000A6700();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metalCapabilitiesForDevice:", v11));
    v13 = objc_msgSend(v12, "isCoreImageMetalCapable");

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_loadMetalKernelWithName:", v6));
      if (!v14)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125F238);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E35F44();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125F258);
        v15 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader loadKernelWithMetalName:legacyName:]"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 27, 0, "Unable to load Metal CIKernel with name: %{public}@", v6);
LABEL_24:

        v14 = 0;
        goto LABEL_25;
      }
      goto LABEL_25;
    }
  }
  else
  {

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_loadLegacyKernelWithName:", v7));
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F278);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E35FD4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F298);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader loadKernelWithMetalName:legacyName:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 30, 0, "Unable to load legacy CIKernel with name: %{public}@", v7);
    goto LABEL_24;
  }
LABEL_25:

  return v14;
}

+ (id)p_loadMetalKernelWithName:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void **p_cache;
  CFArrayRef (__cdecl **v10)(CTFontDescriptorRef, CFSetRef);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void **v26;
  void *v27;
  void *v28;
  uint64_t v29;
  Class v30;
  NSString *v31;
  void *v32;
  void *v33;
  void **v34;
  void *v35;
  NSObject *v37;
  uint64_t v38;
  Class v39;
  NSString *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  unsigned int v45;
  id v46;
  id v47;
  uint8_t buf[4];
  unsigned int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(a1, v5).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v7, v6));
  p_cache = &OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer.cache;
  v10 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F2B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36208();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F2D8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadMetalKernelWithName:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 40, 0, "invalid nil value for '%{public}s'", "tsdBundle");

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("coreimage"), CFSTR("metallib")));
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F2F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3617C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F318);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadMetalKernelWithName:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 42, 0, "invalid nil value for '%{public}s'", "metalLibraryURL");

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v14));
  if (!v18)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F338);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36064();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F358);
    v35 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v35);
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadMetalKernelWithName:]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v27, 44, 0, "invalid nil value for '%{public}s'", "metalLibraryData");
    v19 = 0;
    goto LABEL_51;
  }
  v47 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", v4, v18, &v47));
  v20 = v47;
  v46 = v4;
  if (!v19)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F378);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E360F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F398);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadMetalKernelWithName:]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 48, 0, "invalid nil value for '%{public}s'", "kernelToReturn");

    v10 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    p_cache = &OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer.cache;

    v4 = v46;
  }
  if (v20)
  {
    v45 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F3B8);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v37 = v24;
      objc_opt_class(v20, v38);
      v40 = NSStringFromClass(v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "domain"));
      v43 = objc_msgSend(v20, "code");
      *(_DWORD *)buf = 67111170;
      v49 = v45;
      v50 = 2082;
      v51 = "+[CRLCIKernelLoader p_loadMetalKernelWithName:]";
      v52 = 2082;
      v53 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m";
      v54 = 1024;
      v55 = 49;
      v56 = 2112;
      v57 = v46;
      v58 = 2114;
      v59 = v41;
      v60 = 2114;
      v61 = v42;
      v62 = 2048;
      v63 = v43;
      v64 = 2112;
      v65 = v20;

      v10 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
      p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F3D8);
    v25 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v25);
    v26 = p_cache + 373;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[444], "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadMetalKernelWithName:]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
    objc_opt_class(v20, v29);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "domain"));
    v44 = objc_msgSend(v20, "code");
    v34 = v26;
    v4 = v46;

LABEL_51:
  }

  return v19;
}

+ (id)p_loadLegacyKernelWithName:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  CFArrayRef (__cdecl **v9)(CTFontDescriptorRef, CFSetRef);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  Class v25;
  NSString *v26;
  void *v27;
  CFArrayRef (__cdecl **v28)(CTFontDescriptorRef, CFSetRef);
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v41;
  uint64_t v42;
  Class v43;
  NSString *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  uint8_t buf[4];
  unsigned int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(a1, v5).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v7, v6));
  v9 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F3F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E364F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F418);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadLegacyKernelWithName:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 60, 0, "invalid nil value for '%{public}s'", "tsdBundle");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLForResource:withExtension:", v4, CFSTR("cikernel")));
  if (v13)
  {
    v50 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfURL:encoding:error:](NSString, "stringWithContentsOfURL:encoding:error:", v13, 4, &v50));
    v15 = v50;
    v48 = v14;
    if (!v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125F478);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E36464();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125F498);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadLegacyKernelWithName:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 66, 0, "invalid nil value for '%{public}s'", "kernelCodeString");

      v14 = 0;
    }
    v49 = v4;
    if (v15)
    {
      v19 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125F4B8);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v41 = v20;
        objc_opt_class(v15, v42);
        v44 = NSStringFromClass(v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));
        v47 = objc_msgSend(v15, "code");
        *(_DWORD *)buf = 67111170;
        v52 = v19;
        v53 = 2082;
        v54 = "+[CRLCIKernelLoader p_loadLegacyKernelWithName:]";
        v9 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
        v55 = 2082;
        v56 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m";
        v57 = 1024;
        v58 = 67;
        v59 = 2112;
        v60 = v4;
        v61 = 2114;
        v62 = v45;
        v63 = 2114;
        v64 = v46;
        v65 = 2048;
        v66 = v47;
        v67 = 2112;
        v68 = v15;

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125F4D8);
      v21 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadLegacyKernelWithName:]"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
      objc_opt_class(v15, v24);
      v26 = NSStringFromClass(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = v9;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));

      v9 = v28;
      v14 = v48;
    }
    if (v14)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[CIKernel kernelsWithString:](CIKernel, "kernelsWithString:", v14));
      if (objc_msgSend(v30, "count") != (id)1)
      {
        v31 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125F4F8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E363AC(v31);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125F518);
        v32 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadLegacyKernelWithName:]"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 74, 0, "expected equality between %{public}s and %{public}s", "kernelsFromString.count", "1U");

      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstObject"));
      v4 = v49;
      if (!v35)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125F538);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E36320();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125F558);
        v36 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadLegacyKernelWithName:]"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 76, 0, "invalid nil value for '%{public}s'", "kernelToReturn");

        v4 = v49;
      }

      v14 = v48;
    }
    else
    {
      v35 = 0;
      v4 = v49;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F438);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36294();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F458);
    v39 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v39);
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadLegacyKernelWithName:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v14, 62, 0, "invalid nil value for '%{public}s'", "kernelURL");
    v35 = 0;
  }

  return v35;
}

@end
