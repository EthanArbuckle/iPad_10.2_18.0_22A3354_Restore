@implementation PHPickerResult

+ (id)crl_loadFileRepresentationsForResultItemProviders:(id)a3 supportedTypeIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  id v22;
  id obj;
  void *v25;
  void *v26;
  NSObject *group;
  void *v28;
  CRLTemporaryDirectory *v29;
  uint64_t v30;
  _QWORD block[6];
  id v32;
  _QWORD *v33;
  _QWORD v34[8];
  NSObject *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  id v39;
  _QWORD v40[3];
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[4];
  int v53;
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];

  v21 = a3;
  v7 = a4;
  v22 = a5;
  v54 = 0;
  v29 = -[CRLTemporaryDirectory initWithSignature:error:]([CRLTemporaryDirectory alloc], "initWithSignature:error:", CFSTR("PHPickerResult.crl_loadFileRepresentationsForResultItemProviders"), &v54);
  v20 = v54;
  if (v29)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2810000000;
    v52[3] = &unk_1010E66AB;
    v53 = 0;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = sub_10049AD2C;
    v50[4] = sub_10049AD3C;
    v51 = 0;
    group = dispatch_group_create();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v21;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v8)
    {
      v30 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v30)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "registeredTypeIdentifiers", v20));
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v43;
            while (2)
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(_QWORD *)v43 != v13)
                  objc_enumerationMutation(v11);
                v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v15, "crl_conformsToAnyUTI:", v7))
                {
                  dispatch_group_enter(group);
                  v40[0] = 0;
                  v40[1] = v40;
                  v40[2] = 0x2020000000;
                  v41 = 0;
                  v34[0] = _NSConcreteStackBlock;
                  v34[1] = 3221225472;
                  v34[2] = sub_10049AD44;
                  v34[3] = &unk_101261D30;
                  v34[4] = v29;
                  v34[5] = v15;
                  v36 = v40;
                  v37 = v52;
                  v34[6] = v25;
                  v34[7] = v28;
                  v38 = v50;
                  v39 = a1;
                  v35 = group;
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadFileRepresentationForTypeIdentifier:completionHandler:", v15, v34));
                  objc_msgSend(v26, "addObject:", v16);

                  _Block_object_dispose(v40, 8);
                  goto LABEL_17;
                }
              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
              if (v12)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v8);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10049B37C;
    block[3] = &unk_101261D58;
    block[4] = v29;
    block[5] = v28;
    v32 = v22;
    v33 = v50;
    dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress crl_progressWithChildren:](NSProgress, "crl_progressWithChildren:", v26));

    _Block_object_dispose(v50, 8);
    _Block_object_dispose(v52, 8);

  }
  else
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101261C48);
    v18 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100E3A454(v18, v20);
    if (v22)
      (*((void (**)(id, _QWORD, _QWORD, id))v22 + 2))(v22, 0, 0, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 1, v20, v21));
  }

  return v17;
}

+ (id)crl_safeLastPathComponentForItemURL:(id)a3 registeredTypeIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  CGImageSource *v13;
  CGImageSource *v14;
  CFStringRef Type;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  NSObject *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathExtension"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = v7;
LABEL_16:
    v21 = v10;
    goto LABEL_17;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v12 = objc_msgSend(v6, "crl_conformsToUTI:", v11);

  if ((v12 & 1) == 0)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("mov")));
    goto LABEL_16;
  }
  v13 = CGImageSourceCreateWithURL((CFURLRef)v5, 0);
  if (!v13)
  {
    v23 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261DB8);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3A720(v23, v24);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261DD8);
    v25 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PHPickerResult(CRLAdditions) crl_safeLastPathComponentForItemURL:registeredTypeIdentifier:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/PHPickerResult_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v19, 127, 0, "Unable to create image source to check file type for photo picker file URL with no file extension.");
    v17 = 0;
    goto LABEL_27;
  }
  v14 = v13;
  Type = CGImageSourceGetType(v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(Type);
  CFRelease(v14);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crl_UTIFilenameExtension"));
  if (!-[__CFString length](v17, "length"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261D78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3A7C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261D98);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PHPickerResult(CRLAdditions) crl_safeLastPathComponentForItemURL:registeredTypeIdentifier:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/PHPickerResult_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 125, 0, "No file extension for CG-provided type identifier: %{public}@", v16);

LABEL_27:
  }

  if (-[__CFString length](v17, "length"))
  {
    v26 = v17;
  }
  else
  {
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crl_UTIFilenameExtension"));

    if (!-[__CFString length](v26, "length"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261DF8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3A690();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261E18);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PHPickerResult(CRLAdditions) crl_safeLastPathComponentForItemURL:registeredTypeIdentifier:]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/PHPickerResult_CRLAdditions.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 132, 0, "No file extension for file URL with registered type identifier: %{public}@", v6);

    }
  }
  if (v26)
    v30 = v26;
  else
    v30 = CFSTR("jpeg");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathExtension:", v30));

LABEL_17:
  return v21;
}

+ (id)crl_typeIdentifiersForResults:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  id v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeMovie, "identifier"));
  v22 = objc_alloc_init((Class)NSMutableSet);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemProvider"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "registeredTypeIdentifiers"));

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (!v13)
          goto LABEL_19;
        v14 = v13;
        v15 = *(_QWORD *)v24;
        while (2)
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
            if ((objc_msgSend(v17, "crl_conformsToUTI:", v4) & 1) != 0)
            {
              v18 = v4;
LABEL_18:
              objc_msgSend(v22, "addObject:", v18);
              goto LABEL_19;
            }
            if ((objc_msgSend(v17, "crl_conformsToUTI:", v5) & 1) != 0)
            {
              v18 = v5;
              goto LABEL_18;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v14)
            continue;
          break;
        }
LABEL_19:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  v19 = objc_msgSend(v22, "copy");
  return v19;
}

@end
