@implementation TraceManager

+ (id)sharedManager
{
  if (qword_1014D27B8 != -1)
    dispatch_once(&qword_1014D27B8, &stru_1011BA218);
  return (id)qword_1014D27B0;
}

- (TraceManager)init
{
  TraceManager *v2;
  uint64_t v3;
  NSFileManager *fileManager;
  void *v5;
  unsigned __int8 v6;
  id v7;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TraceManager;
  v2 = -[TraceManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    fileManager = v2->_fileManager;
    v2->_fileManager = (NSFileManager *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager tracesDirectoryWithTraceType:](v2, "tracesDirectoryWithTraceType:", 0));
    v9 = 0;
    v6 = +[MNFilePaths createFolderIfNotPresent:error:](MNFilePaths, "createFolderIfNotPresent:error:", v5, &v9);
    v7 = v9;

    if ((v6 & 1) == 0)
      NSLog(CFSTR("Could not create NavTracesDirectory: %@"), v7);
    -[TraceManager _migrateTracesInLegacyDirectory](v2, "_migrateTracesInLegacyDirectory");

  }
  return v2;
}

- (id)tracesDirectoryWithTraceType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (!a3)
    self = (TraceManager *)objc_claimAutoreleasedReturnValue(+[MNFilePaths navTracesDirectoryPath](MNFilePaths, "navTracesDirectoryPath", v3, v4));
  return self;
}

- (id)tracesDirectoryWithTraceType:(int64_t)a3 resolveSymlink:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v10;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager tracesDirectoryWithTraceType:](self, "tracesDirectoryWithTraceType:", a3));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));
    v10 = 0;
    objc_msgSend(v6, "getResourceValue:forKey:error:", &v10, NSURLIsSymbolicLinkKey, 0);
    if (objc_msgSend(v10, "BOOLValue"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByResolvingSymlinksInPath"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));

      v5 = (void *)v8;
    }

  }
  return v5;
}

- (id)_cleanPathForDirectory:(id)a3
{
  id v4;
  NSFileManager *fileManager;
  unsigned int v6;
  id v7;
  void *v8;
  BOOL v9;
  unsigned int v10;
  id v11;
  BOOL v12;
  id v14;
  id v15;

  v4 = a3;
  fileManager = self->_fileManager;
  v15 = 0;
  v6 = -[NSFileManager removeItemAtPath:error:](fileManager, "removeItemAtPath:error:", v4, &v15);
  v7 = v15;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (!v9)
    NSLog(CFSTR("Could not remove trace at path: %@. Error: %@"), v4, v7);
  v14 = v8;
  v10 = +[MNFilePaths createFolderIfNotPresent:error:](MNFilePaths, "createFolderIfNotPresent:error:", v4, &v14);
  v11 = v14;

  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (!v12)
    NSLog(CFSTR("Could not create the folder: %@ Error: %@"), v4, v11);

  return v4;
}

- (id)filenameForUserTrace:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNFilePaths navTraceExtension](MNFilePaths, "navTraceExtension"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathExtension:", v4));

  return v5;
}

- (id)pathForUserTrace:(id)a3 withTraceType:(int64_t)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager filenameForUserTrace:](self, "filenameForUserTrace:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager fullPathForTraceFilename:withTraceType:](self, "fullPathForTraceFilename:withTraceType:", v6, a4));

  return v7;
}

- (id)fullPathForTraceFilename:(id)a3 withTraceType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager tracesDirectoryWithTraceType:](self, "tracesDirectoryWithTraceType:", a4));
  v8 = v7;
  if (v6)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v6));
  else
    v9 = 0;

  return v9;
}

- (id)listOfTracesFromPaths:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MNFilePaths navTraceExtension](MNFilePaths, "navTraceExtension", (_QWORD)v15));
        if ((objc_msgSend(v10, "hasSuffix:", v11) & 1) != 0)
        {

        }
        else
        {
          v12 = objc_msgSend(v10, "hasSuffix:", CFSTR(".trace.sqlite"));

          if ((v12 & 1) == 0)
            goto LABEL_10;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
        objc_msgSend(v4, "addObject:", v13);

LABEL_10:
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)listOfUserTracesWithTraceType:(int64_t)a3
{
  void *v4;
  NSFileManager *fileManager;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager tracesDirectoryWithTraceType:](self, "tracesDirectoryWithTraceType:", a3));
  fileManager = self->_fileManager;
  v22 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager contentsOfDirectoryAtPath:error:](fileManager, "contentsOfDirectoryAtPath:error:", v4, &v22));
  v7 = v22;
  if (v7)
  {
    NSLog(CFSTR("Could not find user traces directory at path: %@"), v4);
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i)));
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingSelector:", "fileCreationDateDescendingSort:"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager listOfTracesFromPaths:](self, "listOfTracesFromPaths:", v16));

  }
  return v8;
}

- (BOOL)deleteUserTraceWithName:(id)a3 withTraceType:(int64_t)a4
{
  TraceManager *v4;
  void *v5;

  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager pathForUserTrace:withTraceType:](self, "pathForUserTrace:withTraceType:", a3, a4));
  LOBYTE(v4) = -[TraceManager deleteUserTraceWithPath:](v4, "deleteUserTraceWithPath:", v5);

  return (char)v4;
}

- (BOOL)deleteUserTraceWithPath:(id)a3
{
  return -[NSFileManager removeItemAtPath:error:](self->_fileManager, "removeItemAtPath:error:", a3, 0);
}

- (BOOL)moveUserTraceAtPath:(id)a3 toPath:(id)a4
{
  return -[NSFileManager moveItemAtPath:toPath:error:](self->_fileManager, "moveItemAtPath:toPath:error:", a3, a4, 0);
}

- (id)clearSimulatedTracePath
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager pathForUserTrace:withTraceType:](self, "pathForUserTrace:withTraceType:", CFSTR("LatestSimulation"), 0));
  if (-[NSFileManager fileExistsAtPath:](self->_fileManager, "fileExistsAtPath:", v3))
    -[NSFileManager removeItemAtPath:error:](self->_fileManager, "removeItemAtPath:error:", v3, 0);
  return v3;
}

- (id)preferredUserTracePathForName:(id)a3 withTraceType:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  objc_msgSend(v7, "setTimeZone:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v10, v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager pathForUserTrace:withTraceType:](self, "pathForUserTrace:withTraceType:", v11, a4));

  return v12;
}

- (id)migrateTraceWithExtraResourceType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".trace.sqlite"), &stru_1011EB268));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNFilePaths navTraceExtension](MNFilePaths, "navTraceExtension"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_1011EB268));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager pathForUserTrace:withTraceType:](self, "pathForUserTrace:withTraceType:", v8, 0));
  LODWORD(v6) = -[TraceManager moveUserTraceAtPath:toPath:](self, "moveUserTraceAtPath:toPath:", v4, v9);

  v10 = 0;
  if ((_DWORD)v6)
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager pathForUserTrace:withTraceType:](self, "pathForUserTrace:withTraceType:", v8, 0));

  return v10;
}

- (id)displayNameForTraceName:(id)a3
{
  return objc_msgSend(a3, "stringByDeletingPathExtension");
}

- (void)_migrateTracesInLegacyDirectory
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  NSFileManager *fileManager;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Maps")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("NavTraces")));

    if (-[NSFileManager fileExistsAtPath:](self->_fileManager, "fileExistsAtPath:", v7))
    {
      v18 = v4;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager contentsOfDirectoryAtPath:error:](self->_fileManager, "contentsOfDirectoryAtPath:error:", v7, 0));
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
            fileManager = self->_fileManager;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v13));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[TraceManager tracesDirectoryWithTraceType:](self, "tracesDirectoryWithTraceType:", 0));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathComponent:", v13));
            -[NSFileManager moveItemAtPath:toPath:error:](fileManager, "moveItemAtPath:toPath:error:", v15, v17, 0);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v10);
      }

      v4 = v18;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
