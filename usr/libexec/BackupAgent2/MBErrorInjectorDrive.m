@implementation MBErrorInjectorDrive

+ (unint64_t)subcountForOperation:(id)a3
{
  unsigned int v6;
  signed int v7;
  int v8;

  v6 = objc_msgSend(a3, "type");
  if (v6 > 6)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBErrorInjectorDrive.m"), 40, CFSTR("Unexpected operation type: %d"), objc_msgSend(a3, "type"));
    return 0;
  }
  else
  {
    v7 = 1;
    if (((1 << v6) & 0x43) == 0)
    {
      if (((1 << v6) & 0xC) != 0)
      {
        v7 = 2 * objc_msgSend(a3, "count");
        if (v7 <= 1)
          return 1;
      }
      else
      {
        v8 = objc_msgSend(a3, "count");
        if (v8 <= 1)
          return 1;
        else
          return v8;
      }
    }
  }
  return v7;
}

+ (id)keysFromDictionary:(id)a3 toIndex:(unint64_t)a4
{
  if ((unint64_t)objc_msgSend(a3, "count") <= a4)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBErrorInjectorDrive.m"), 46, CFSTR("Index out of range"));
  return objc_msgSend(objc_msgSend(objc_msgSend(a3, "allKeys"), "sortedArrayUsingSelector:", "compare:"), "subarrayWithRange:", 0, a4);
}

+ (id)subdictionary:(id)a3 withKeys:(id)a4
{
  NSMutableDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(a4, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(a4);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10)), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  return v6;
}

+ (id)subdictionary:(id)a3 toIndex:(unint64_t)a4
{
  return +[MBErrorInjectorDrive subdictionary:withKeys:](MBErrorInjectorDrive, "subdictionary:withKeys:", a3, +[MBErrorInjectorDrive keysFromDictionary:toIndex:](MBErrorInjectorDrive, "keysFromDictionary:toIndex:", a3, a4));
}

- (MBErrorInjectorDrive)initWithScript:(id)a3 delegate:(id)a4 index:(unint64_t)a5 subindex:(unint64_t)a6
{
  MBErrorInjectorDrive *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MBErrorInjectorDrive;
  v11 = -[MBErrorInjectorDrive init](&v13, "init");
  if (v11)
  {
    v11->_script = (MBDriveScript *)a3;
    v11->_delegate = (MBDrive *)a4;
    v11->_index = a5;
    if (-[MBErrorInjectorDrive count](v11, "count") <= a5)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("MBErrorInjectorDrive.m"), 71, CFSTR("Index out of range"));
    v11->_subindex = a6;
    if (-[MBErrorInjectorDrive subcount](v11, "subcount") <= a6)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("MBErrorInjectorDrive.m"), 74, CFSTR("Subindex out of range"));
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBErrorInjectorDrive;
  -[MBErrorInjectorDrive dealloc](&v3, "dealloc");
}

- (BOOL)done
{
  _BYTE *v3;
  char *v4;

  v3 = -[MBErrorInjectorDrive index](self, "index");
  if (v3 != (char *)-[MBErrorInjectorDrive count](self, "count") - 1)
    return 0;
  v4 = -[MBErrorInjectorDrive subindex](self, "subindex");
  return v4 == (char *)-[MBErrorInjectorDrive subcount](self, "subcount") - 1;
}

- (unint64_t)nextIndex
{
  unint64_t v3;
  char *v4;
  unint64_t result;

  v3 = -[MBErrorInjectorDrive subindex](self, "subindex");
  v4 = (char *)-[MBErrorInjectorDrive subcount](self, "subcount") - 1;
  result = -[MBErrorInjectorDrive index](self, "index");
  if ((char *)v3 == v4)
    ++result;
  return result;
}

- (unint64_t)count
{
  return -[MBDriveScript operationCount](self->_script, "operationCount");
}

- (unint64_t)nextSubindex
{
  _BYTE *v3;

  v3 = -[MBErrorInjectorDrive subindex](self, "subindex");
  if (v3 == (char *)-[MBErrorInjectorDrive subcount](self, "subcount") - 1)
    return 0;
  else
    return -[MBErrorInjectorDrive subindex](self, "subindex") + 1;
}

- (unint64_t)subcount
{
  return +[MBErrorInjectorDrive subcountForOperation:](MBErrorInjectorDrive, "subcountForOperation:", -[MBDriveScript operationAtIndex:](self->_script, "operationAtIndex:", self->_index));
}

- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  if (-[MBDriveScript index](self->_script, "index") != self->_index)
    return -[MBDrive createDirectoryAtPath:options:error:](self->_delegate, "createDirectoryAtPath:options:error:", a3, a4, a5);
  if (a5)
    *a5 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Simulated I/O error"));
  return 0;
}

- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  if (-[MBDriveScript index](self->_script, "index") != self->_index)
    return -[MBDrive contentsOfDirectoryAtPath:options:error:](self->_delegate, "contentsOfDirectoryAtPath:options:error:", a3, a4, a5);
  if (a5)
    *a5 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Simulated I/O error"));
  return 0;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  if (-[MBDriveScript index](self->_script, "index") != self->_index)
    return -[MBDrive copyItemAtPath:toPath:options:error:](self->_delegate, "copyItemAtPath:toPath:options:error:", a3, a4, a5, a6);
  if (a6)
    *a6 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Simulated I/O error"));
  return 0;
}

- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  unint64_t subindex;
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  id v17;
  unsigned int v18;

  if (-[MBDriveScript index](self->_script, "index") != self->_index)
    return -[MBDrive uploadFilesAtPaths:options:results:error:](self->_delegate, "uploadFilesAtPaths:options:results:error:", a3, a4, a5, a6);
  subindex = self->_subindex;
  if (subindex >= 2 * (uint64_t)objc_msgSend(a3, "count"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBErrorInjectorDrive.m"), 134, CFSTR("Subindex out of range"));
  v13 = objc_msgSend(objc_msgSend(a3, "allKeys"), "sortedArrayUsingSelector:", "compare:");
  v14 = +[MBErrorInjectorDrive subdictionary:withKeys:](MBErrorInjectorDrive, "subdictionary:withKeys:", a3, objc_msgSend(v13, "subarrayWithRange:", 0, self->_subindex >> 1));
  v15 = self->_subindex;
  if ((v15 & 1) != 0)
  {
    v16 = objc_msgSend(v13, "objectAtIndexedSubscript:", v15 >> 1);
    v17 = objc_msgSend(a3, "objectForKeyedSubscript:", v16);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v17, "stringByAppendingPathExtension:", kMBUploadFileExtension), v16);
  }
  v18 = -[MBDrive uploadFilesAtPaths:options:results:error:](self->_delegate, "uploadFilesAtPaths:options:results:error:", v14, a4, a5, a6);
  if (a6)
  {
    if (v18)
      *a6 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Simulated I/O error"));
  }
  return 0;
}

- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  unint64_t subindex;
  unsigned int v13;

  if (-[MBDriveScript index](self->_script, "index") != self->_index)
    return -[MBDrive uploadFilesAtPaths:options:results:error:](self->_delegate, "uploadFilesAtPaths:options:results:error:", a3, a4, a5, a6);
  subindex = self->_subindex;
  if (subindex >= (unint64_t)objc_msgSend(a3, "count"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBErrorInjectorDrive.m"), 162, CFSTR("Subindex out of range"));
  v13 = -[MBDrive uploadFilesAtPaths:options:results:error:](self->_delegate, "uploadFilesAtPaths:options:results:error:", +[MBErrorInjectorDrive subdictionary:toIndex:](MBErrorInjectorDrive, "subdictionary:toIndex:", a3, self->_subindex), a4, a5, a6);
  if (a6)
  {
    if (v13)
      *a6 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Simulated I/O error"));
  }
  return 0;
}

- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  unint64_t subindex;
  unsigned int v13;

  if (-[MBDriveScript index](self->_script, "index") != self->_index)
    return -[MBDrive moveItemsAtPaths:options:results:error:](self->_delegate, "moveItemsAtPaths:options:results:error:", a3, a4, a5, a6);
  subindex = self->_subindex;
  if (subindex >= (unint64_t)objc_msgSend(a3, "count"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBErrorInjectorDrive.m"), 181, CFSTR("Subindex out of range"));
  v13 = -[MBDrive moveItemsAtPaths:options:results:error:](self->_delegate, "moveItemsAtPaths:options:results:error:", +[MBErrorInjectorDrive subdictionary:toIndex:](MBErrorInjectorDrive, "subdictionary:toIndex:", a3, self->_subindex), a4, a5, a6);
  if (a6)
  {
    if (v13)
      *a6 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Simulated I/O error"));
  }
  return 0;
}

- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  NSObject *v12;
  unint64_t v13;
  unint64_t index;
  unint64_t subindex;
  unint64_t v16;
  unsigned int v17;
  BOOL result;
  MBError *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;

  v12 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = -[MBDriveScript index](self->_script, "index");
    index = self->_index;
    subindex = self->_subindex;
    *(_DWORD *)buf = 138413058;
    v21 = a3;
    v22 = 2048;
    v23 = v13;
    v24 = 2048;
    v25 = index;
    v26 = 2048;
    v27 = subindex;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "-[MBErrorInjectorDrive remoteItemsAtPath:%@ ...]: %lu %lu %lu", buf, 0x2Au);
    _MBLog(CFSTR("INFO"), "-[MBErrorInjectorDrive remoteItemsAtPath:%@ ...]: %lu %lu %lu", a3, -[MBDriveScript index](self->_script, "index"), self->_index, self->_subindex);
  }
  if (-[MBDriveScript index](self->_script, "index") != self->_index)
    return -[MBDrive removeItemsAtPaths:options:results:error:](self->_delegate, "removeItemsAtPaths:options:results:error:", a3, a4, a5, a6);
  if (!objc_msgSend(a3, "count"))
    return 1;
  v16 = self->_subindex;
  if (v16 >= (unint64_t)objc_msgSend(a3, "count"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBErrorInjectorDrive.m"), 202, CFSTR("Subindex out of range"));
  v17 = -[MBDrive removeItemsAtPaths:options:results:error:](self->_delegate, "removeItemsAtPaths:options:results:error:", objc_msgSend(a3, "subarrayWithRange:", 0, self->_subindex), a4, a5, a6);
  result = 0;
  if (a6)
  {
    if (v17)
    {
      v19 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Simulated I/O error"));
      result = 0;
      *a6 = v19;
    }
  }
  return result;
}

- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4
{
  return -[MBDrive freeSpace:error:](self->_delegate, "freeSpace:error:", a3, a4);
}

- (unint64_t)index
{
  return self->_index;
}

- (unint64_t)subindex
{
  return self->_subindex;
}

@end
