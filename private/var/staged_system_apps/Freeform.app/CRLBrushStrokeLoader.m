@implementation CRLBrushStrokeLoader

+ (id)storageForBrushStrokeNamed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10006676C;
  v21 = sub_10006677C;
  v22 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_storageCacheForCurrentThread"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  v7 = (void *)v18[5];
  v18[5] = v6;

  v8 = (void *)v18[5];
  if (!v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader p_brushStrokeLoadQueue](CRLBrushStrokeLoader, "p_brushStrokeLoadQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100066784;
    block[3] = &unk_10122DCF0;
    v16 = a1;
    v10 = v4;
    v14 = v10;
    v15 = &v17;
    dispatch_sync(v9, block);

    objc_msgSend(v5, "setObject:forKey:", v18[5], v10);
    v8 = (void *)v18[5];
  }
  v11 = v8;

  _Block_object_dispose(&v17, 8);
  return v11;
}

+ (void)backgroundLoadAllBrushStrokes
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  dispatch_block_t v8;
  NSObject *v9;
  id obj;
  _QWORD block[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_allLoadableBrushStrokeNames"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v6);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100066968;
        block[3] = &unk_10122DCC8;
        block[4] = v7;
        block[5] = a1;
        v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
        v9 = objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader p_brushStrokeLoadQueue](CRLBrushStrokeLoader, "p_brushStrokeLoadQueue"));
        dispatch_async(v9, v8);

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

+ (id)p_allLoadableBrushStrokeNames
{
  if (qword_101414C58 != -1)
    dispatch_once(&qword_101414C58, &stru_101230AA0);
  return (id)qword_101414C50;
}

+ (id)p_storageCacheForCurrentThread
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "threadDictionary"));

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10006676C;
  v14 = sub_10006677C;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CRLBrushStrokeLoaderStorageCache")));
  v5 = (void *)v11[5];
  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader p_brushStrokeLoadQueue](CRLBrushStrokeLoader, "p_brushStrokeLoadQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100066BD8;
    block[3] = &unk_10122DC18;
    block[4] = v4;
    block[5] = &v10;
    block[6] = a1;
    dispatch_sync(v6, block);

    v5 = (void *)v11[5];
  }
  v7 = v5;
  _Block_object_dispose(&v10, 8);

  return v7;
}

+ (id)p_allStorageCaches
{
  if (qword_101414C68 != -1)
    dispatch_once(&qword_101414C68, &stru_101230AC0);
  return (id)qword_101414C60;
}

+ (id)p_brushStrokeLoadQueue
{
  if (qword_101414C78 != -1)
    dispatch_once(&qword_101414C78, &stru_101230AE0);
  return (id)qword_101414C70;
}

+ (id)p_storagesByBrushName
{
  if (qword_101414C88 != -1)
    dispatch_once(&qword_101414C88, &stru_101230B00);
  return (id)qword_101414C80;
}

+ (id)p_cacheDirectory
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Brushes")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

  return v5;
}

+ (double)p_brushPixelScaleAt100Percent
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  +[UIScreen crl_screenScale](UIScreen, "crl_screenScale");
  v3 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  return fmax(v3 * sqrt(v6 * v8 / 786432.0), 1.0);
}

+ (void)p_loadBrushIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLMutableBrushStrokeStorage *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  int v19;
  id v20;
  xmlDoc *Memory;
  void *v22;
  id v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_storagesByBrushName"));
  if (!objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader p_cacheDirectory](CRLBrushStrokeLoader, "p_cacheDirectory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("/CRLBrushCacheVersion.txt")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v7, 4, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), 17));
    if (!v8 || (objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
    {
      objc_msgSend(a1, "p_clearOnDiskCache");
      objc_msgSend(v9, "writeToFile:atomically:encoding:error:", v7, 0, 4, 0);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (!v10)
  {
    v11 = objc_alloc_init(CRLMutableBrushStrokeStorage);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CRLBrush_"), "stringByAppendingString:", v4));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pathForResource:ofType:", v12, CFSTR("svg")));

    v15 = objc_alloc((Class)NSData);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL crl_fileURLWithPath:](NSURL, "crl_fileURLWithPath:", v14));
    v17 = objc_msgSend(v15, "initWithContentsOfURL:options:error:", v16, 0, 0);

    v18 = (unint64_t)objc_msgSend(v17, "length");
    if (v18 >> 31)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230B20);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEE914();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230B40);
      v28 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadBrushIfNeeded:]"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 203, 0, "Out-of-bounds type assignment failed");

    }
    else
    {
      v19 = v18;
      v20 = objc_retainAutorelease(v17);
      Memory = xmlReadMemory((const char *)objc_msgSend(v20, "bytes"), v19, ", 0, 1);
      v31 = v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("//svg:%@[1]"), CFSTR("split-at-sharp-angles")));
      v23 = sub_100067348(Memory, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = objc_msgSend(v24, "count") != 0;

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v25));
      -[CRLMutableBrushStrokeStorage setOption:forKey:](v11, "setOption:forKey:", v26, CFSTR("split-at-sharp-angles"));

      objc_msgSend(a1, "p_loadLineEndsForBrush:fromSVGDoc:intoStorage:", v4, Memory, v11);
      objc_msgSend(a1, "p_loadSectionsForBrush:fromSVGDoc:intoStorage:", v4, Memory, v11);
      xmlFreeDoc(Memory);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMutableBrushStrokeStorage deepCopy](v11, "deepCopy"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, v4);

    }
  }

}

+ (void)p_clearOnDiskCache
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  char *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t buf[4];
  unsigned int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];

  v2 = objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader p_cacheDirectory](CRLBrushStrokeLoader, "p_cacheDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v38 = 0;
  v32 = (void *)v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v2, &v38));
  v5 = v38;

  if (!v4)
  {
    v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230B60);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEE994(v7, (uint64_t)v5, v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230B80);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_clearOnDiskCache]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 231, 0, "%{public}@", v11);

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v16);
        if (objc_msgSend(v17, "hasPrefix:", CFSTR("CRLBrush")))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingPathComponent:", v17));
          v33 = v5;
          v20 = objc_msgSend(v18, "removeItemAtPath:error:", v19, &v33);
          v21 = v33;

          if ((v20 & 1) == 0)
          {
            v22 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101230BA0);
            v23 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v28 = v23;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "description"));
              *(_DWORD *)buf = 67110146;
              v40 = v22;
              v41 = 2082;
              v42 = "+[CRLBrushStrokeLoader p_clearOnDiskCache]";
              v43 = 2082;
              v44 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m";
              v45 = 1024;
              v46 = 234;
              v47 = 2112;
              v48 = v29;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d %@", buf, 0x2Cu);

            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101230BC0);
            v24 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v30 = v24;
              v31 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v40 = v22;
              v41 = 2114;
              v42 = v31;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_clearOnDiskCache]"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "description"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 234, 0, "%@", v27);

          }
          v5 = v21;
        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
    }
    while (v14);
  }

}

+ (void)p_loadLineEndTextureForBrush:(id)a3 lineEnd:(id)a4 path:(CGPath *)a5 andBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGImage *Image;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  CGContext *v23;
  float v24;
  float v25;
  void *v26;
  void *v27;
  void *v28;
  CGAffineTransform v29;
  CGAffineTransform transform;
  CGRect v31;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader p_cacheDirectory](CRLBrushStrokeLoader, "p_cacheDirectory"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("/CRLBrushEnd_%@_%@.png"), v13, v12));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithContentsOfFile:](CRLImage, "imageWithContentsOfFile:", v15));
  v17 = v16;
  if (v16)
  {
    Image = CGImageRetain((CGImageRef)objc_msgSend(v16, "CGImage"));
  }
  else
  {
    +[CRLBrushStrokeLoader p_brushPixelScaleAt100Percent](CRLBrushStrokeLoader, "p_brushPixelScaleAt100Percent");
    v20 = v19 * 100.0 / height;
    v21 = width * v20;
    v22 = height * v20;
    v23 = sub_10040FA64(3, v21, v22);
    CGContextSetRGBFillColor(v23, 1.0, 1.0, 1.0, 1.0);
    v24 = v21;
    v31.size.width = ceilf(v24);
    v25 = v22;
    v31.size.height = ceilf(v25);
    v31.origin.x = 0.0;
    v31.origin.y = 0.0;
    CGContextFillRect(v23, v31);
    CGContextSetRGBFillColor(v23, 0.0, 0.0, 0.0, 1.0);
    CGAffineTransformMakeScale(&transform, v20, v20);
    CGContextConcatCTM(v23, &transform);
    CGAffineTransformMakeTranslation(&v29, -x, -y);
    CGContextConcatCTM(v23, &v29);
    CGContextAddPath(v23, a5);
    CGContextFillPath(v23);
    Image = CGBitmapContextCreateImage(v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", Image));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "PNGRepresentation"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL crl_fileURLWithPath:](NSURL, "crl_fileURLWithPath:", v15));
    objc_msgSend(v27, "writeToURL:atomically:", v28, 1);
    CGContextRelease(v23);

  }
  CGImageRelease(Image);

}

+ (void)p_loadLineEndsForBrush:(id)a3 fromSVGDoc:(_xmlDoc *)a4 intoStorage:(id)a5
{
  id v7;
  const __CFString *v8;
  CFArrayRef (__cdecl **v9)(CTFontDescriptorRef, CFSetRef);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  unsigned int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  CGFloat v47;
  double a;
  double v49;
  double v50;
  double v51;
  double v52;
  CGPath *v53;
  CGPath *v54;
  CGPath *v55;
  CGPath *v56;
  const __CFString *v57;
  double MaxX;
  CGFloat MidY;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  id obj;
  CGFloat ty;
  CGFloat tx;
  CGFloat d;
  CGFloat c;
  CGFloat b;
  uint64_t v71;
  _xmlDoc *v72;
  id v74;
  id v75;
  id v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  CGAffineTransform v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  CGAffineTransform v90;
  _BYTE v91[128];
  CGRect v92;
  CGRect v93;
  CGRect BoundingBox;

  v75 = a3;
  v74 = a5;
  v7 = sub_100067348(a4, CFSTR("//svg:path['_wrap'=substring(@id,string-length(@id)-4)]"));
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(v7);
  v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
  if (v76)
  {
    v8 = CFSTR("d");
    v71 = *(_QWORD *)v87;
    b = CGAffineTransformIdentity.b;
    d = CGAffineTransformIdentity.d;
    c = CGAffineTransformIdentity.c;
    ty = CGAffineTransformIdentity.ty;
    tx = CGAffineTransformIdentity.tx;
    v9 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    v72 = a4;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v87 != v71)
          objc_enumerationMutation(obj);
        v82 = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v10), "objectForKey:", CFSTR("nodeAttributes")));
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v8));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("id")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringToIndex:", (char *)objc_msgSend(v12, "length") - 5));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithFormat:", CFSTR("//svg:path[@id='%@_end']"), v13));
        v15 = sub_100067348(a4, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        if (objc_msgSend(v16, "count") != (id)1)
        {
          v17 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101230BE0);
          v18 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v90.a) = 67109890;
            HIDWORD(v90.a) = v17;
            LOWORD(v90.b) = 2082;
            *(_QWORD *)((char *)&v90.b + 2) = "+[CRLBrushStrokeLoader p_loadLineEndsForBrush:fromSVGDoc:intoStorage:]";
            WORD1(v90.c) = 2082;
            *(_QWORD *)((char *)&v90.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m";
            WORD2(v90.d) = 1024;
            *(_DWORD *)((char *)&v90.d + 6) = 290;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Arrow head needs path", (uint8_t *)&v90, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101230C00);
          v19 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v61 = v19;
            v62 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            LODWORD(v90.a) = 67109378;
            HIDWORD(v90.a) = v17;
            LOWORD(v90.b) = 2114;
            *(_QWORD *)((char *)&v90.b + 2) = v62;
            _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v90, 0x12u);

            v9 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadLineEndsForBrush:fromSVGDoc:intoStorage:]"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 290, 0, "Arrow head needs path");

          v9 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
        }
        v83 = v16;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastObject"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("nodeAttributes")));

        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v8));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[444], "stringWithFormat:", CFSTR("//svg:rect[@id='%@_end_bounds']"), v13));
        v26 = sub_100067348(a4, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

        if (objc_msgSend(v27, "count") != (id)1)
        {
          v28 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101230C20);
          v29 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v90.a) = 67109890;
            HIDWORD(v90.a) = v28;
            LOWORD(v90.b) = 2082;
            *(_QWORD *)((char *)&v90.b + 2) = "+[CRLBrushStrokeLoader p_loadLineEndsForBrush:fromSVGDoc:intoStorage:]";
            WORD1(v90.c) = 2082;
            *(_QWORD *)((char *)&v90.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m";
            WORD2(v90.d) = 1024;
            *(_DWORD *)((char *)&v90.d + 6) = 297;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Arrow head needs bounding rect", (uint8_t *)&v90, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101230C40);
          v30 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v63 = v30;
            v64 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            LODWORD(v90.a) = 67109378;
            HIDWORD(v90.a) = v28;
            LOWORD(v90.b) = 2114;
            *(_QWORD *)((char *)&v90.b + 2) = v64;
            _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v90, 0x12u);

          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadLineEndsForBrush:fromSVGDoc:intoStorage:]"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 297, 0, "Arrow head needs bounding rect");

        }
        v81 = (void *)v24;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastObject"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("nodeAttributes")));

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("x")));
        objc_msgSend(v35, "doubleValue");
        v37 = v36;
        v78 = v36;

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("y")));
        objc_msgSend(v38, "doubleValue");
        v40 = v39;

        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("width")));
        objc_msgSend(v41, "doubleValue");
        v80 = v42;

        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("height")));
        objc_msgSend(v43, "doubleValue");
        v45 = v44;
        v79 = v44;

        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" ")));
        v85.a = CGAffineTransformIdentity.a;
        v85.b = b;
        v85.c = c;
        v85.d = d;
        v85.tx = tx;
        v85.ty = ty;
        CGAffineTransformTranslate(&v90, &v85, 0.0, -0.5);
        v85 = v90;
        CGAffineTransformScale(&v90, &v85, 2.0 / v45, 2.0 / v45);
        v85 = v90;
        CGAffineTransformTranslate(&v90, &v85, -v37, -v40);
        v85 = v90;
        CGAffineTransformRotate(&v90, &v85, -1.57079633);
        a = v90.a;
        v47 = v90.b;
        v49 = v90.c;
        v50 = v90.d;
        v51 = v90.tx;
        v52 = v90.ty;
        v53 = +[CRLSVGToBezierPathConverter newPathFromSVGPathString:](CRLSVGToBezierPathConverter, "newPathFromSVGPathString:", v84);
        v90.a = a;
        v90.b = v47;
        v77 = v47;
        v90.c = v49;
        v90.d = v50;
        v90.tx = v51;
        v90.ty = v52;
        v54 = sub_1000C8414(v53, &v90);
        v55 = +[CRLSVGToBezierPathConverter newPathFromSVGPathString:](CRLSVGToBezierPathConverter, "newPathFromSVGPathString:", v24);
        v90.a = a;
        v90.b = v47;
        v90.c = v49;
        v90.d = v50;
        v90.tx = v51;
        v90.ty = v52;
        v56 = sub_1000C8414(v55, &v90);
        v57 = v8;
        v92.origin.x = v78;
        v92.origin.y = v40;
        v92.size.width = v80;
        v92.size.height = v79;
        MaxX = CGRectGetMaxX(v92);
        v93.origin.x = v78;
        v93.origin.y = v40;
        v93.size.width = v80;
        v93.size.height = v79;
        MidY = CGRectGetMidY(v93);
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[CRLLineEnd lineEndWithPath:wrapPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:wrapPath:endPoint:isFilled:identifier:", v56, v54, 1, v46, v51 + v49 * MidY + a * MaxX, v52 + v50 * MidY + v77 * MaxX));
        objc_msgSend(v74, "setLineEnd:forKey:", v60, v46);
        BoundingBox = CGPathGetBoundingBox(v54);
        objc_msgSend(a1, "p_loadLineEndTextureForBrush:lineEnd:path:andBounds:", v75, v46, v56, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
        CGPathRelease(v55);
        CGPathRelease(v56);
        CGPathRelease(v53);
        CGPathRelease(v54);

        v8 = v57;
        v10 = v82 + 1;
        a4 = v72;
        v9 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
      }
      while (v76 != (id)(v82 + 1));
      v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
    }
    while (v76);
  }

}

+ (void)p_loadImageForBrush:(id)a3 intoStorage:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  CGContext *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  id v38;
  BOOL v39;
  CGImage *Image;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  char *v48;
  uint64_t v49;
  void *i;
  uint64_t v51;
  void *v52;
  id v53;
  char *v54;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGAffineTransform transform;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  CGRect ClipBoundingBox;
  CGRect v78;
  CGRect v79;

  v5 = a3;
  v6 = a4;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader p_cacheDirectory](CRLBrushStrokeLoader, "p_cacheDirectory"));
  v56 = v5;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "stringByAppendingFormat:", CFSTR("/CRLBrush_%@.png"), v5));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "paths"));
  if (!v63)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230C60);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEEB1C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230C80);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadImageForBrush:intoStorage:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 340, 0, "invalid nil value for '%{public}s'", "paths");

  }
  v57 = (void *)v7;
  v11 = objc_claimAutoreleasedReturnValue(+[CRLImage imageWithContentsOfFile:](CRLImage, "imageWithContentsOfFile:", v7));
  if (v11)
  {
    v12 = (void *)v11;
  }
  else
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bounds"));
    if (!v60)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230CA0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEEA78();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230CC0);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadImageForBrush:intoStorage:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 346, 0, "invalid nil value for '%{public}s'", "bounds");

    }
    v16 = objc_msgSend(v6, "totalSectionCount");
    if (v16 == (id)1)
      v17 = 2048.0;
    else
      v17 = 512.0;
    v18 = sub_10040FA64(3, v17, (double)(unint64_t)v16 * 80.0);
    CGContextSetRGBFillColor(v18, 0.0, 0.0, 0.0, 1.0);
    ClipBoundingBox = CGContextGetClipBoundingBox(v18);
    CGContextFillRect(v18, ClipBoundingBox);
    CGContextSetRGBFillColor(v18, 1.0, 1.0, 1.0, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "allKeys"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sortedArrayUsingSelector:"));

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = v20;
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    if (v61)
    {
      v21 = 0;
      v59 = *(_QWORD *)v72;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v72 != v59)
            objc_enumerationMutation(obj);
          v62 = v22;
          v23 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", v23));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", v23));
          if (objc_msgSend(v24, "count"))
          {
            v26 = 0;
            do
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v26));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "originalPath"));

              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", v26));
              objc_msgSend(v29, "CGRectValue");

              objc_msgSend(v28, "bounds");
              x = v78.origin.x;
              y = v78.origin.y;
              width = v78.size.width;
              height = v78.size.height;
              v34 = fmin(CGRectGetMinX(v78), 0.0);
              v79.origin.x = x;
              v79.origin.y = y;
              v79.size.width = width;
              v79.size.height = height;
              v35 = (double)v21 * 80.0;
              v36 = v17 / (fmax(CGRectGetMaxX(v79), 1.0) - v34);
              v37 = 32;
              do
              {
                CGContextSaveGState(v18);
                CGAffineTransformMakeTranslation(&transform, 0.0, (double)(unint64_t)v35);
                CGContextConcatCTM(v18, &transform);
                CGAffineTransformMakeScale(&v69, v36, (double)v37);
                CGContextConcatCTM(v18, &v69);
                CGAffineTransformMakeTranslation(&v68, -v34, 0.5);
                CGContextConcatCTM(v18, &v68);
                v38 = objc_retainAutorelease(v28);
                CGContextAddPath(v18, (CGPathRef)objc_msgSend(v38, "CGPath"));
                CGContextFillPath(v18);
                v35 = (double)(v37 + (unint64_t)v35) + 4.0;
                CGContextRestoreGState(v18);
                v39 = v37 > 3;
                v37 >>= 1;
              }
              while (v39);
              ++v21;

              ++v26;
            }
            while (v26 < (unint64_t)objc_msgSend(v24, "count"));
          }

          v22 = v62 + 1;
        }
        while ((id)(v62 + 1) != v61);
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      }
      while (v61);
    }

    Image = CGBitmapContextCreateImage(v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", Image));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "PNGRepresentation"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL crl_fileURLWithPath:](NSURL, "crl_fileURLWithPath:", v57));
    objc_msgSend(v41, "writeToURL:atomically:", v42, 1);
    CGImageRelease(Image);
    CGContextRelease(v18);

  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "allKeys"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "sortedArrayUsingSelector:", "compare:"));

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v45 = v44;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
  if (v46)
  {
    v47 = v46;
    v48 = 0;
    v49 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v49)
          objc_enumerationMutation(v45);
        v51 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", v51));
        v53 = objc_msgSend(v52, "count");

        if (v53)
        {
          v54 = &v48[(_QWORD)v53];
          do
          {
            objc_msgSend(v6, "addTextureIndex:forKey:", v48++, v51);
            v53 = (char *)v53 - 1;
          }
          while (v53);
          v48 = v54;
        }
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    }
    while (v47);
  }

  objc_msgSend(v6, "setImage:", v12);
}

+ (void)p_loadSectionsForBrush:(id)a3 fromSVGDoc:(_xmlDoc *)a4 intoStorage:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  CGPath *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  id v52;
  id v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  CGAffineTransform v60;
  _BYTE v61[128];

  v53 = a3;
  v52 = a5;
  v7 = sub_100067348(a4, CFSTR("//svg:path['_section'=substring(@id,string-length(@id)-7)]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!objc_msgSend(v8, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230CE0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEEBC0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230D00);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadSectionsForBrush:fromSVGDoc:intoStorage:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 472, 0, "No sections");

  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v12)
  {
    v13 = v12;
    v51 = *(_QWORD *)v57;
    v49 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v50 = *(_OWORD *)&CGAffineTransformIdentity.a;
    v48 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v57 != v51)
          objc_enumerationMutation(obj);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v14), "objectForKey:", CFSTR("nodeAttributes")));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("d")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("id")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("//svg:rect[@id='%@_bounds']"), v17));
        v19 = sub_100067348(a4, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

        if (objc_msgSend(v20, "count") != (id)1)
        {
          v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101230D20);
          v22 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v60.a) = 67109890;
            HIDWORD(v60.a) = v21;
            LOWORD(v60.b) = 2082;
            *(_QWORD *)((char *)&v60.b + 2) = "+[CRLBrushStrokeLoader p_loadSectionsForBrush:fromSVGDoc:intoStorage:]";
            WORD1(v60.c) = 2082;
            *(_QWORD *)((char *)&v60.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m";
            WORD2(v60.d) = 1024;
            *(_DWORD *)((char *)&v60.d + 6) = 481;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Section needs bounding rect", (uint8_t *)&v60, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101230D40);
          v23 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v44 = v23;
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            LODWORD(v60.a) = 67109378;
            HIDWORD(v60.a) = v21;
            LOWORD(v60.b) = 2114;
            *(_QWORD *)((char *)&v60.b + 2) = v45;
            _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v60, 0x12u);

          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadSectionsForBrush:fromSVGDoc:intoStorage:]"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 481, 0, "Section needs bounding rect");

        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastObject"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("nodeAttributes")));

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("x")));
        objc_msgSend(v28, "doubleValue");
        v30 = v29;

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("y")));
        objc_msgSend(v31, "doubleValue");
        v33 = v32;

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("width")));
        objc_msgSend(v34, "doubleValue");
        v36 = v35;

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("height")));
        objc_msgSend(v37, "doubleValue");
        v39 = v38;

        v40 = +[CRLSVGToBezierPathConverter newPathFromSVGPathString:](CRLSVGToBezierPathConverter, "newPathFromSVGPathString:", v16);
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v40));
        *(_OWORD *)&v60.a = v50;
        *(_OWORD *)&v60.c = v49;
        *(_OWORD *)&v60.tx = v48;
        *(_OWORD *)&v55.a = v50;
        *(_OWORD *)&v55.c = v49;
        *(_OWORD *)&v55.tx = v48;
        CGAffineTransformTranslate(&v60, &v55, 0.0, -0.5);
        v54 = v60;
        CGAffineTransformScale(&v55, &v54, 1.0 / v36, 1.0 / v39);
        v60 = v55;
        v54 = v55;
        CGAffineTransformTranslate(&v55, &v54, -v30, -v33);
        v60 = v55;
        objc_msgSend(v41, "transformUsingAffineTransform:", &v55);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "substringToIndex:", objc_msgSend(v17, "rangeOfString:", CFSTR("_"))));
        if (objc_msgSend(v53, "isEqualToString:", CFSTR("Chalk2")))
          v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("small")) ^ 1;
        else
          v43 = 0;
        objc_msgSend(v52, "addPath:withBounds:shouldSmooth:forKey:", v41, v43, v42, v30, v33, v36, v39);
        CGPathRelease(v40);

        v14 = (char *)v14 + 1;
      }
      while (v13 != v14);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v13);
  }

  objc_msgSend(a1, "p_loadImageForBrush:intoStorage:", v53, v52);
}

@end
