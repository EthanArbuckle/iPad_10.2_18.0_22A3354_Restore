@implementation MBDeviceLinkDrive

- (int)mapStatus:(int)a3
{
  int v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;

  v4 = a3 + 15;
  if ((a3 + 15) < 0x10 && ((0xE3F5u >> v4) & 1) != 0)
    return dword_10009D248[v4];
  v5 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No code for DeviceLink error: %d", buf, 8u);
    _MBLog(CFSTR("DEFAULT"), "No code for DeviceLink error: %d", a3);
  }
  return 100;
}

- (BOOL)mapStatus:(int)a3 errorString:(id)a4 path:(id)a5 error:(id *)a6
{
  if (a3 && a6)
    *a6 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", -[MBDeviceLinkDrive mapStatus:](self, "mapStatus:", *(_QWORD *)&a3), a5, CFSTR("%@"), a4);
  return a3 == 0;
}

- (__CFDictionary)mapOptions:(id)a3
{
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  MBDeviceLinkDriveContext *v11;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(a3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(a3, "objectForKeyedSubscript:", v9);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("FileHandleFactory")))
        {
          v11 = -[MBDeviceLinkDriveContext initWithFileHandleFactory:]([MBDeviceLinkDriveContext alloc], "initWithFileHandleFactory:", v10);
          v13[0] = sub_1000199E0;
          v13[1] = sub_100019A5C;
          v13[2] = sub_100019AB0;
          v13[3] = sub_100019B0C;
          v13[4] = sub_100019B78;
          v13[5] = v11;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", -[NSData bytes](+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v13, 48), "bytes")), CFSTR("DLDeviceIOCallbacks"));
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  return (__CFDictionary *)v4;
}

- (id)mapResults:(id)a3
{
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  id v10;
  NSMutableDictionary *v11;
  signed int v12;
  const __CFString *v13;
  const __CFString *v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(a3, "objectForKeyedSubscript:", v9);
        v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0);
        v12 = -[MBDeviceLinkDrive mapStatus:](self, "mapStatus:", objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DLFileErrorCode")), "intValue"));
        v13 = (const __CFString *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DLFileErrorString"));
        if (v13)
          v14 = v13;
        else
          v14 = &stru_1000DBB88;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, NSLocalizedDescriptionKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), v12, v11), v9);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)mapFileType:(id)a3
{
  id *v4;
  unsigned int v5;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DLFileTypeDirectory")) & 1) != 0)
  {
    v4 = (id *)&NSFileTypeDirectory;
  }
  else
  {
    v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("DLFileTypeRegular"));
    v4 = (id *)&NSFileTypeUnknown;
    if (v5)
      v4 = (id *)&NSFileTypeRegular;
  }
  return *v4;
}

- (id)mapAttributes:(id)a3
{
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  NSFileAttributeKey v14;
  NSFileAttributeKey v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v16 = NSFileModificationDate;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(a3, "objectForKeyedSubscript:", v10, v16);
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("DLFileType")))
        {
          v12 = -[MBDeviceLinkDrive mapFileType:](self, "mapFileType:", v11);
          v13 = v5;
          v14 = NSFileType;
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("DLFileSize")))
        {
          v13 = v5;
          v12 = v11;
          v14 = NSFileSize;
        }
        else
        {
          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("DLFileModificationDate")))
            continue;
          v13 = v5;
          v12 = v11;
          v14 = v16;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  return v5;
}

+ (id)deviceLinkDriveWithConnection:(void *)a3
{
  return -[MBDeviceLinkDrive initWithConnection:]([MBDeviceLinkDrive alloc], "initWithConnection:", a3);
}

- (MBDeviceLinkDrive)initWithConnection:(void *)a3
{
  MBDeviceLinkDrive *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MBDeviceLinkDrive;
  result = -[MBDeviceLinkDrive init](&v5, "init");
  if (result)
    result->_connection = a3;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MBDeviceLinkDrive;
  -[MBDeviceLinkDrive dealloc](&v2, "dealloc");
}

- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v8;
  id v9;
  id v11;

  v11 = 0;
  v8 = DLCreateDirectory(self->_connection, a3, -[MBDeviceLinkDrive mapOptions:](self, "mapOptions:", a4), &v11);
  v9 = v11;
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v8, v11, a3, a5);
}

- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  id v23;
  _BYTE v24[128];

  v22 = 0;
  v23 = 0;
  v8 = DLContentsOfDirectory(self->_connection, a3, -[MBDeviceLinkDrive mapOptions:](self, "mapOptions:", a4), &v23, &v22);
  v9 = v23;
  v10 = v22;
  v11 = 0;
  if (!(_DWORD)v8)
  {
    v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v23;
    v13 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", -[MBDeviceLinkDrive mapAttributes:](self, "mapAttributes:", objc_msgSend(v23, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v16))), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v16));
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v14);
    }
  }
  -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v8, v22, a3, a5);
  return v11;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v9;
  id v10;
  id v12;

  v12 = 0;
  v9 = DLCopyItem(self->_connection, a3, a4, -[MBDeviceLinkDrive mapOptions:](self, "mapOptions:", a5), &v12);
  v10 = v12;
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v9, v12, a3, a6);
}

- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v9;
  id v10;
  id v12;

  v12 = 0;
  v9 = DLUploadFile(self->_connection, a3, a4, -[MBDeviceLinkDrive mapOptions:](self, "mapOptions:", a5), &v12);
  v10 = v12;
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v9, v12, a3, a6);
}

- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  uint64_t v9;
  id v10;
  id v12;
  id v13;

  v12 = 0;
  v13 = 0;
  v9 = DLUploadFiles(self->_connection, a3, -[MBDeviceLinkDrive mapOptions:](self, "mapOptions:", a4), &v13, &v12);
  if (a5)
    *a5 = -[MBDeviceLinkDrive mapResults:](self, "mapResults:", v13);

  v10 = v12;
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v9, v12, 0, a6);
}

- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v9;
  id v10;
  id v12;

  v12 = 0;
  v9 = DLDownloadFile(self->_connection, a3, a4, -[MBDeviceLinkDrive mapOptions:](self, "mapOptions:", a5), &v12);
  v10 = v12;
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v9, v12, a3, a6);
}

- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  uint64_t v9;
  id v10;
  id v12;
  id v13;

  v12 = 0;
  v13 = 0;
  v9 = DLDownloadFiles(self->_connection, a3, -[MBDeviceLinkDrive mapOptions:](self, "mapOptions:", a4), &v13, &v12);
  if (a5)
    *a5 = -[MBDeviceLinkDrive mapResults:](self, "mapResults:", v13);

  v10 = v12;
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v9, v12, 0, a6);
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v9;
  id v10;
  id v12;

  v12 = 0;
  v9 = DLMoveItem(self->_connection, a3, a4, -[MBDeviceLinkDrive mapOptions:](self, "mapOptions:", a5), &v12);
  v10 = v12;
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v9, v12, a3, a6);
}

- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  uint64_t v11;
  id v12;
  id v14;
  id v15;

  if (!objc_msgSend(a3, "count"))
    return 1;
  v14 = 0;
  v15 = 0;
  v11 = DLMoveItems(self->_connection, a3, -[MBDeviceLinkDrive mapOptions:](self, "mapOptions:", a4), &v15, &v14);
  if (a5)
    *a5 = -[MBDeviceLinkDrive mapResults:](self, "mapResults:", v15);

  v12 = v14;
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v11, v14, 0, a6);
}

- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v8;
  id v9;
  id v11;

  v11 = 0;
  v8 = DLRemoveItem(self->_connection, a3, -[MBDeviceLinkDrive mapOptions:](self, "mapOptions:", a4), &v11);
  v9 = v11;
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v8, v11, a3, a5);
}

- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  uint64_t v11;
  id v12;
  id v14;
  id v15;

  if (!objc_msgSend(a3, "count"))
    return 1;
  v14 = 0;
  v15 = 0;
  v11 = DLRemoveItems(self->_connection, a3, -[MBDeviceLinkDrive mapOptions:](self, "mapOptions:", a4), &v15, &v14);
  if (a5)
    *a5 = -[MBDeviceLinkDrive mapResults:](self, "mapResults:", v15);

  v12 = v14;
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v11, v14, 0, a6);
}

- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v8;

  v8 = 0;
  v6 = DLGetFreeDiskSpace(self->_connection, a3, &v8);
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v6, v8, 0, a4);
}

- (BOOL)purgeDiskSpace:(unint64_t *)a3 amountRequested:(unint64_t)a4 urgencyLevel:(int)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v10;

  v10 = 0;
  v8 = DLPurgeDiskSpace(self->_connection, a3, a4, *(_QWORD *)&a5, &v10);
  return -[MBDeviceLinkDrive mapStatus:errorString:path:error:](self, "mapStatus:errorString:path:error:", v8, v10, 0, a6);
}

- (void)progressUpdatedWithPercentage:(double)a3 size:(unint64_t)a4
{
  DLSetProgress(self->_connection, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3), +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
}

- (void)connection
{
  return self->_connection;
}

@end
