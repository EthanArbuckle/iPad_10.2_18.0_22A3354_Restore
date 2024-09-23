@implementation BICDiskDataStore

- (BICDiskDataStore)initWithCachePath:(id)a3
{
  id v4;
  BICDiskDataStore *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *readQ;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  uint64_t v17;
  BICWorkQueue *readWorkQueue;
  void *v19;
  CFArrayRef v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BICDiskDataStore;
  v5 = -[BICDiskDataStore init](&v22, "init");
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("DiskDataStore-Read/Write", v9);
    readQ = v5->_readQ;
    v5->_readQ = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_UTILITY, 0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("DiskDataStore-Read/Write", v15);

    v17 = objc_claimAutoreleasedReturnValue(+[BICWorkQueue workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:](BICWorkQueue, "workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:", v5->_readQ, v16, 1));
    readWorkQueue = v5->_readWorkQueue;
    v5->_readWorkQueue = (BICWorkQueue *)v17;

    -[BICWorkQueue setIdentifier:](v5->_readWorkQueue, "setIdentifier:", CFSTR("DiskDataStore-Read/Write"));
    objc_storeStrong((id *)&v5->_writeWorkQueue, v5->_readWorkQueue);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("BICDiskDataStore")));
    -[BICDiskDataStore setCachePath:](v5, "setCachePath:", v19);
    v5->_deviceSupportsASTC = MGGetBoolAnswer(CFSTR("ji56BO1mUeT7Qg9RO7Er9w"));
    v20 = CGImageDestinationCopyTypeIdentifiers();
    v5->_deviceSupportsHEIC = -[__CFArray containsObject:](v20, "containsObject:", AVFileTypeHEIC);

  }
  return v5;
}

- (void)setCachePath:(id)a3
{
  id v5;
  NSString **p_cachePath;
  NSString *cachePath;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;

  v5 = a3;
  if (v5)
  {
    cachePath = self->_cachePath;
    p_cachePath = &self->_cachePath;
    if (!-[NSString isEqualToString:](cachePath, "isEqualToString:", v5))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v9 = objc_msgSend(v8, "fileExistsAtPath:", v5);

      if ((v9 & 1) == 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v15 = 0;
        v11 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v15);
        v12 = v15;

        if ((v11 & 1) == 0)
        {
          v13 = BCImageCacheLog();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            sub_1B98D4();

        }
      }
      objc_storeStrong((id *)p_cachePath, a3);
    }
  }

}

- (signed)storingMedium
{
  return 1;
}

- (BOOL)canStoreDescribedImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));
    if (objc_msgSend(v5, "CGImage"))
    {
      v6 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filePath"));
      v6 = objc_msgSend(v7, "length") != 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)deleteRemovedEntries:(id)a3 deletingCompletedHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v15[5];
  id v16;
  id v17;
  id location;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageDescription"));
        objc_initWeak(&location, self);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BICDiskDataStore writeWorkQueue](self, "writeWorkQueue"));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_15EC48;
        v15[3] = &unk_292A08;
        objc_copyWeak(&v17, &location);
        v15[4] = v11;
        v16 = v7;
        objc_msgSend(v13, "addWorkItemWithPriority:description:block:", v12, CFSTR("DiskDataStore delete removed entries"), v15);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

- (void)afterAllStoreOperationsCompletedPerformBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithPriority:](BICDescribedImage, "describedImageWithPriority:", 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BICDiskDataStore writeWorkQueue](self, "writeWorkQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_15EE90;
  v8[3] = &unk_292A30;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "addWorkItemWithPriority:description:block:", v5, CFSTR("DiskDataStore after all ops"), v8);

}

- (void)fetchImagesForEntry:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  unsigned int v22;
  void (**v23)(id, void *);
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id location;
  void *v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageFromImageEntry:](BICDescribedImage, "describedImageFromImageEntry:", v8));
  objc_msgSend(v11, "setExpiry:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataStoreInformation"));
  if (v12
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(-[BICDiskDataStore cachePath](self, "cachePath")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", v12)),
        v13,
        v14))
  {
    objc_msgSend(v11, "imageSize");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v9, "imageSize");
    v20 = 1;
    if (v16 == v21 && v18 == v19)
    {
      v22 = objc_msgSend(v11, "processingOptions");
      v20 = v22 != objc_msgSend(v9, "processingOptions");
    }
    if ((objc_msgSend(v9, "persistanceOptions") & 2) == 0 || v20)
    {
      +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationDiskReadQueueStart[0], v9);
      objc_initWeak(&location, self);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BICDiskDataStore readWorkQueue](self, "readWorkQueue"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_15F1C8;
      v29[3] = &unk_292A58;
      v30 = v9;
      objc_copyWeak(&v34, &location);
      v28 = v14;
      v31 = v28;
      v32 = v11;
      v33 = v10;
      objc_msgSend(v27, "addWorkItemWithPriority:description:block:", v30, CFSTR("DiskDataStore read"), v29);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);

    }
    else
    {
      objc_msgSend(v11, "setFilePath:", v14);
      v23 = (void (**)(id, void *))objc_retainBlock(v10);
      if (v23)
      {
        v36 = v11;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
        v23[2](v23, v24);

      }
    }
  }
  else
  {
    v25 = objc_retainBlock(v10);
    v26 = v25;
    if (v25)
      (*((void (**)(id, _QWORD))v25 + 2))(v25, 0);

  }
}

- (id)imageForEntryLocation:(id)a3
{
  return 0;
}

- (void)deleteImageForEntryLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[BICDiskDataStore _filePathFromEntryLocation:](self, "_filePathFromEntryLocation:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("jpg")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("astc")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("heic")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("png")));
  -[BICDiskDataStore _removeFileAtPath:](self, "_removeFileAtPath:", v4);
  -[BICDiskDataStore _removeFileAtPath:](self, "_removeFileAtPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("path")));
  -[BICDiskDataStore _removeFileAtPath:](self, "_removeFileAtPath:", v8);

  -[BICDiskDataStore _removeFileAtPath:](self, "_removeFileAtPath:", v6);
  -[BICDiskDataStore _removeFileAtPath:](self, "_removeFileAtPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("path")));
  -[BICDiskDataStore _removeFileAtPath:](self, "_removeFileAtPath:", v9);

}

- (id)_filePathFromEntryLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage identifierFromEntryLocation:](BICDescribedImage, "identifierFromEntryLocation:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BICDiskDataStore cachePath](self, "cachePath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v4));
  return v8;
}

- (void)_removeFileAtPath:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = 0;
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", v3, &v11);
    v8 = v11;

    if ((v7 & 1) == 0)
    {
      v9 = BCImageCacheLog();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1B99FC();

    }
  }
  else
  {
    v8 = 0;
  }

}

- (void)storeAddedEntries:(id)a3 forRequest:(id)a4 storingCompletedHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id obj;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  BICDiskDataStore *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v8 = a3;
  v25 = a4;
  v21 = a5;
  v9 = dispatch_group_create();
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v41;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v12);
        dispatch_group_enter(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageDescription"));
        if (-[BICDiskDataStore canStoreDescribedImage:](self, "canStoreDescribedImage:", v14))
        {
          objc_initWeak(&location, self);
          objc_msgSend(v14, "setPriority:", 3);
          +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationDiskWriteQueueStart[0], v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BICDiskDataStore writeWorkQueue](self, "writeWorkQueue"));
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_15FA8C;
          v30[3] = &unk_292A80;
          v31 = v25;
          v32 = self;
          v16 = v14;
          v33 = v16;
          v34 = v13;
          v35 = v23;
          v36 = v9;
          objc_copyWeak(&v38, &location);
          v37 = v22;
          objc_msgSend(v15, "addWorkItemWithPriority:description:block:", v16, CFSTR("DiskDataStore write"), v30);

          objc_destroyWeak(&v38);
          objc_destroyWeak(&location);
        }
        else
        {
          dispatch_group_leave(v9);
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v10);
  }

  v17 = objc_claimAutoreleasedReturnValue(-[BICDiskDataStore readQ](self, "readQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_16011C;
  block[3] = &unk_28EDE8;
  v27 = v22;
  v28 = v23;
  v29 = v21;
  v18 = v23;
  v19 = v22;
  v20 = v21;
  dispatch_group_notify(v9, v17, block);

}

- (int64_t)costFor:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 != 1)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICDiskDataStore cachePath](self, "cachePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v5, 0));

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_160268;
  v9[3] = &unk_292AA8;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (CGImage)_readCachedImageFromPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  CGImageSource *v12;
  CGImageSource *v13;
  CGImageRef ImageAtIndex;
  CGImage *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;

  v3 = a3;
  kdebug_trace(725353728, 2, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));

  if (qword_3115B0 != -1)
    dispatch_once(&qword_3115B0, &stru_292AC8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (!v7)
  {
    v16 = BCImageCacheLog();
    v10 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1B9D14();
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributesOfItemAtPath:error:", v9, 0));

  v11 = (unint64_t)-[NSObject fileSize](v10, "fileSize");
  +[BICCacheStats addToCounter:amount:](BICCacheStats, "addToCounter:amount:", kBICCacheStatsCounterDiskBytesRead[0], v11 >> 10);
  v12 = CGImageSourceCreateWithURL((CFURLRef)v4, 0);
  if (!v12)
  {
    v17 = BCImageCacheLog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1B9C54();

LABEL_12:
    v15 = 0;
    goto LABEL_17;
  }
  v13 = v12;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, (CFDictionaryRef)qword_3115A8);
  v15 = ImageAtIndex;
  if (ImageAtIndex)
  {
    CFAutorelease(ImageAtIndex);
  }
  else
  {
    v19 = BCImageCacheLog();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1B9CB4();

  }
  CFRelease(v13);
LABEL_17:

  kdebug_trace(725353728, 3, 0, 0, 0);
  return v15;
}

- (id)_writeCachedImage:(CGImage *)a3 unprocessed:(BOOL)a4 toRelativePath:(id)a5
{
  id v7;
  NSObject *v8;
  __CFString *v9;
  const __CFDictionary *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFURL *v14;
  CGImageDestination *v15;
  CGImageDestination *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  NSObject *v22;

  v7 = a5;
  kdebug_trace(725353728, 6, 0, 0, 0);
  if (a3)
  {
    if (qword_3115E8 != -1)
      dispatch_once(&qword_3115E8, &stru_292AE8);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathExtension"));
    if (-[NSObject isEqualToString:](v8, "isEqualToString:", CFSTR("heic")))
    {
      v9 = (__CFString *)qword_3115C0;
      v10 = (const __CFDictionary *)qword_3115D8;
    }
    else if (-[NSObject isEqualToString:](v8, "isEqualToString:", CFSTR("astc")))
    {
      v9 = (__CFString *)qword_3115B8;
      v10 = (const __CFDictionary *)qword_3115D0;
    }
    else if (-[NSObject isEqualToString:](v8, "isEqualToString:", CFSTR("png")))
    {
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePNG, "identifier"));

      v10 = 0;
    }
    else
    {
      v9 = (__CFString *)qword_3115C8;
      v10 = (const __CFDictionary *)qword_3115E0;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICDiskDataStore cachePath](self, "cachePath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", v7));

    v14 = (const __CFURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));
    v15 = CGImageDestinationCreateWithURL(v14, v9, 1uLL, 0);
    if (v15)
    {
      v16 = v15;
      CGImageDestinationAddImage(v15, a3, v10);
      CGImageDestinationFinalize(v16);
      CFRelease(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v14, "path"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attributesOfItemAtPath:error:", v18, 0));

      v20 = (unint64_t)objc_msgSend(v19, "fileSize");
      +[BICCacheStats addToCounter:amount:](BICCacheStats, "addToCounter:amount:", kBICCacheStatsCounterDiskBytesWritten[0], v20 >> 10);

    }
    else
    {
      v21 = BCImageCacheLog();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1B9DD4();

    }
  }
  else
  {
    v11 = BCImageCacheLog();
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1B9D74();
  }

  kdebug_trace(725353728, 7, 0, 0, 0);
  return v7;
}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, void *))v5 + 2))(v5, &__NSArray0__struct);
    v5 = v6;
  }

}

- (void)_clean:(id)a3
{
  id v4;
  NSString *cachePath;
  void *v6;
  void (**v7)(_QWORD);
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BICDiskDataStore cachePath](self, "cachePath"));
  cachePath = self->_cachePath;
  self->_cachePath = (NSString *)&stru_296430;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v6, "removeItemAtPath:error:", v8, 0);

  -[BICDiskDataStore setCachePath:](self, "setCachePath:", v8);
  v7 = (void (**)(_QWORD))objc_retainBlock(v4);

  if (v7)
    v7[2](v7);

}

- (BICDataStoringDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->delegate, a3);
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (BICWorkQueue)readWorkQueue
{
  return self->_readWorkQueue;
}

- (void)setReadWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_readWorkQueue, a3);
}

- (BICWorkQueue)writeWorkQueue
{
  return self->_writeWorkQueue;
}

- (void)setWriteWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_writeWorkQueue, a3);
}

- (OS_dispatch_queue)readQ
{
  return self->_readQ;
}

- (void)setReadQ:(id)a3
{
  objc_storeStrong((id *)&self->_readQ, a3);
}

- (BOOL)deviceSupportsASTC
{
  return self->_deviceSupportsASTC;
}

- (void)setDeviceSupportsASTC:(BOOL)a3
{
  self->_deviceSupportsASTC = a3;
}

- (BOOL)deviceSupportsHEIC
{
  return self->_deviceSupportsHEIC;
}

- (void)setDeviceSupportsHEIC:(BOOL)a3
{
  self->_deviceSupportsHEIC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readQ, 0);
  objc_storeStrong((id *)&self->_writeWorkQueue, 0);
  objc_storeStrong((id *)&self->_readWorkQueue, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->delegate, 0);
}

@end
