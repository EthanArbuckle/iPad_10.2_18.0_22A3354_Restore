@implementation MBDrive

+ (BOOL)singleFromMultiErrorWithReturnValue:(BOOL)a3 results:(id)a4 error:(id *)a5
{
  if (a5 && !a3 && +[MBError isError:withCode:](MBError, "isError:withCode:", *a5, 2))
  {
    if (objc_msgSend(a4, "count") != (id)1)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBDrive.m"), 51, CFSTR("Unexpected result count"));
    *a5 = objc_msgSend(objc_msgSend(a4, "allValues"), "lastObject");
  }
  return a3;
}

- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  -[MBDrive doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  -[MBDrive doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)enumerateContentsOfDirectoryAtPath:(id)a3 options:(id)a4 recurse:(BOOL)a5 foundItem:(id)a6
{
  _BOOL4 v7;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  id v20;
  BOOL v21;
  id v22;
  id v23;
  id v24;
  void *v26;
  MBDrive *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];

  v7 = a5;
  v34 = 0;
  v11 = objc_autoreleasePoolPush();
  v27 = self;
  v28 = a3;
  v29 = a4;
  v12 = -[MBDrive contentsOfDirectoryAtPath:options:error:](self, "contentsOfDirectoryAtPath:options:error:", a3, a4, &v34);
  if (v12)
  {
    v13 = v12;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = objc_msgSend(v12, "allKeys");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      v26 = v11;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v20 = objc_msgSend(v13, "objectForKeyedSubscript:", v19, v26);
          if (((*((uint64_t (**)(id, uint64_t, id))a6 + 2))(a6, v19, v20) & 1) == 0)
          {
            v34 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Enumeration canceled"));
LABEL_19:
            v11 = v26;
            goto LABEL_20;
          }
          if (objc_msgSend(objc_msgSend(v20, "fileType"), "isEqualToString:", NSFileTypeDirectory))
            v21 = !v7;
          else
            v21 = 1;
          if (!v21)
          {
            v22 = -[MBDrive enumerateContentsOfDirectoryAtPath:options:recurse:foundItem:](v27, "enumerateContentsOfDirectoryAtPath:options:recurse:foundItem:", objc_msgSend(v28, "stringByAppendingPathComponent:", v19), v29, 0, a6);
            v34 = v22;
            if (v22)
            {
              v24 = v22;
              goto LABEL_19;
            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        v11 = v26;
        if (v16)
          continue;
        break;
      }
    }
  }
  else
  {
    v23 = v34;
  }
LABEL_20:
  objc_autoreleasePoolPop(v11);
  return v34;
}

- (id)enumerateContentsOfDirectoryAtPath:(id)a3 options:(id)a4 foundItem:(id)a5
{
  return -[MBDrive enumerateContentsOfDirectoryAtPath:options:recurse:foundItem:](self, "enumerateContentsOfDirectoryAtPath:options:recurse:foundItem:", a3, a4, 1, a5);
}

- (BOOL)usageOfDirectoryAtPath:(id)a3 count:(unint64_t *)a4 size:(unint64_t *)a5 options:(id)a6 error:(id *)a7
{
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  id v16;
  id v17;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v9 = -[MBDrive contentsOfDirectoryAtPath:options:error:](self, "contentsOfDirectoryAtPath:options:error:", a3, a6, a7);
  if (v9)
  {
    v10 = v9;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15);
          v17 = objc_msgSend(v16, "fileType");
          if (objc_msgSend(v17, "isEqualToString:", NSFileTypeDirectory))
          {
            if (!-[MBDrive usageOfDirectoryAtPath:count:size:options:error:](self, "usageOfDirectoryAtPath:count:size:options:error:", objc_msgSend(a3, "stringByAppendingPathComponent:", v15), a4, a5, a6, a7))
            {
              LOBYTE(v9) = 0;
              return (char)v9;
            }
          }
          else if (objc_msgSend(v17, "isEqualToString:", NSFileTypeRegular))
          {
            ++*a4;
            *a5 += (unint64_t)objc_msgSend(v16, "fileSize");
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }
    LOBYTE(v9) = 1;
  }
  return (char)v9;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  -[MBDrive doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  uint64_t v9;
  id v10;
  id v11;

  v10 = a3;
  v11 = a4;
  v9 = 0;
  v7 = -[MBDrive uploadFilesAtPaths:options:results:error:](self, "uploadFilesAtPaths:options:results:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1), a5, &v9, a6);
  return +[MBDrive singleFromMultiErrorWithReturnValue:results:error:](MBDrive, "singleFromMultiErrorWithReturnValue:results:error:", v7, v9, a6);
}

- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  -[MBDrive doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

- (void)uploadBatch:(id)a3 options:(id)a4 completion:(id)a5
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  if (!-[MBDrive uploadFilesAtPaths:options:results:error:](self, "uploadFilesAtPaths:options:results:error:", objc_msgSend(a3, "paths", 0, 0, 0, 0), a4, &v8, &v7)&& !v7)
  {
    sub_100087658();
  }
  (*((void (**)(id, __int128 *, uint64_t, uint64_t))a5 + 2))(a5, &v6, v8, v7);
}

- (void)finishBatchUploadsWithOptions:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  uint64_t v9;
  id v10;
  id v11;

  v10 = a3;
  v11 = a4;
  v9 = 0;
  v7 = -[MBDrive downloadFilesAtPaths:options:results:error:](self, "downloadFilesAtPaths:options:results:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1), a5, &v9, a6);
  return +[MBDrive singleFromMultiErrorWithReturnValue:results:error:](MBDrive, "singleFromMultiErrorWithReturnValue:results:error:", v7, v9, a6);
}

- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  -[MBDrive doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

- (BOOL)uploadData:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v11;
  BOOL v12;
  const __CFString *v13;
  uint64_t v14;
  id v16;

  v11 = MBTemporaryPath(self, a2);
  v16 = 0;
  if (!objc_msgSend(a3, "writeToFile:options:error:", v11, 1, &v16))
  {
    if (objc_msgSend(objc_msgSend(v16, "domain"), "isEqualToString:", NSCocoaErrorDomain)
      && objc_msgSend(v16, "code") == (id)640
      || objc_msgSend(objc_msgSend(v16, "domain"), "isEqualToString:", NSPOSIXErrorDomain)
      && objc_msgSend(v16, "code") == (id)28)
    {
      if (a6)
      {
        v13 = CFSTR("No space writing data to temporary file");
        v14 = 106;
LABEL_11:
        v12 = 0;
        *a6 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v14, v13);
        return v12;
      }
    }
    else if (a6)
    {
      v13 = CFSTR("Error writing data to temporary file");
      v14 = 102;
      goto LABEL_11;
    }
    return 0;
  }
  v12 = -[MBDrive uploadFileAtPath:toPath:options:error:](self, "uploadFileAtPath:toPath:options:error:", v11, a4, a5, a6);
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v11, 0);
  return v12;
}

- (id)dataAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v9;
  NSDictionary *v10;
  id v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSFileAttributeKey v16;
  const char *v17;
  uint64_t v18;
  NSData *v19;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;

  v9 = MBTemporaryPath(self, a2);
  if (-[MBDrive downloadFileAtPath:toPath:options:error:](self, "downloadFileAtPath:toPath:options:error:", a3, v9, a4, a5))
  {
    v10 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", v9, 0);
    v11 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("MemoryMapped")), "BOOLValue");
    v12 = (int)v11;
    v14 = MBGetDefaultLog(v11, v13);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (!v15)
      {
        v18 = 8;
        goto LABEL_11;
      }
      v16 = NSFileSize;
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      v23 = 2048;
      v24 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", NSFileSize), "unsignedIntegerValue");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Opening file mapped at '%@' (%{bytes}lu)", buf, 0x16u);
      v17 = "Opening file mapped at '%@' (%{bytes}lu)";
      v18 = 8;
    }
    else
    {
      if (!v15)
      {
        v18 = 0;
        goto LABEL_11;
      }
      v16 = NSFileSize;
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      v23 = 2048;
      v24 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", NSFileSize), "unsignedIntegerValue");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Opening file unmapped at '%@' (%{bytes}lu)", buf, 0x16u);
      v18 = 0;
      v17 = "Opening file unmapped at '%@' (%{bytes}lu)";
    }
    _MBLog(CFSTR("INFO"), v17, v9, objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v16), "unsignedIntegerValue"));
LABEL_11:
    v19 = +[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v9, v18, a5);
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v9, 0);
    return v19;
  }
  return 0;
}

- (BOOL)uploadPropertyList:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  NSData *v10;
  BOOL result;
  MBError *v12;
  uint64_t v13;

  v13 = 0;
  v10 = +[NSPropertyListSerialization dataFromPropertyList:format:errorDescription:](NSPropertyListSerialization, "dataFromPropertyList:format:errorDescription:", a3, 200, &v13);
  if (v10)
    return -[MBDrive uploadData:toPath:options:error:](self, "uploadData:toPath:options:error:", v10, a4, a5, a6);
  if (!a6)
    return 0;
  v12 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 10, CFSTR("Error serializing property list: %@"), v13);
  result = 0;
  *a6 = v12;
  return result;
}

- (id)propertyListAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id result;
  MBError *v8;
  uint64_t v9;

  v9 = 0;
  result = -[MBDrive dataAtPath:options:error:](self, "dataAtPath:options:error:", a3, a4);
  if (result)
  {
    result = +[NSPropertyListSerialization propertyListFromData:mutabilityOption:format:errorDescription:](NSPropertyListSerialization, "propertyListFromData:mutabilityOption:format:errorDescription:", result, 0, 0, &v9);
    if (!result)
    {
      if (a5)
      {
        v8 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 11, a3, CFSTR("Error deserializing property list: %@"), v9);
        result = 0;
        *a5 = v8;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  uint64_t v9;
  id v10;
  id v11;

  v10 = a3;
  v11 = a4;
  v9 = 0;
  v7 = -[MBDrive moveItemsAtPaths:options:results:error:](self, "moveItemsAtPaths:options:results:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1), a5, &v9, a6);
  return +[MBDrive singleFromMultiErrorWithReturnValue:results:error:](MBDrive, "singleFromMultiErrorWithReturnValue:results:error:", v7, v9, a6);
}

- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  -[MBDrive doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  uint64_t v8;
  id v9;

  v9 = a3;
  v8 = 0;
  v6 = -[MBDrive removeItemsAtPaths:options:results:error:](self, "removeItemsAtPaths:options:results:error:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1), a4, &v8, a5);
  return +[MBDrive singleFromMultiErrorWithReturnValue:results:error:](MBDrive, "singleFromMultiErrorWithReturnValue:results:error:", v6, v8, a5);
}

- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  -[MBDrive doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4
{
  -[MBDrive doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)purgeDiskSpace:(unint64_t *)a3 amountRequested:(unint64_t)a4 urgencyLevel:(int)a5 error:(id *)a6
{
  if (a6)
    *a6 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 21, CFSTR("PurgeDiskSpace not implemented"), *(_QWORD *)&a5);
  return 0;
}

@end
