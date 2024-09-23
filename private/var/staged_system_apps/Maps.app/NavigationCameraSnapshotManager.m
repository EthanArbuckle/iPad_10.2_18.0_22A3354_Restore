@implementation NavigationCameraSnapshotManager

+ (id)sharedInstance
{
  if (qword_1014D4460 != -1)
    dispatch_once(&qword_1014D4460, &stru_1011E9228);
  return (id)qword_1014D4458;
}

+ (id)traceSnapshotsDictionaryWithContentsOfArchiveFile:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_opt_class(NSDictionary);
  v5 = objc_opt_class(NSString);
  v6 = objc_opt_class(NSArray);
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, objc_opt_class(NavigationCameraSnapshot), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v3));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v8, v9, 0));
  return v10;
}

+ (BOOL)archiveTraceSnapshotsDictionary:(id)a3 toFile:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0));
  v7 = objc_msgSend(v6, "writeToFile:atomically:", v5, 1);

  return v7;
}

- (NavigationCameraSnapshotManager)init
{
  void *v3;
  void *v4;
  void *v5;
  NavigationCameraSnapshotManager *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TraceManager sharedManager](TraceManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tracesDirectoryWithTraceType:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("NavigationCameraSnapshots.plist")));

  v6 = -[NavigationCameraSnapshotManager initWithTraceSnapshotsDictionaryArchiveFile:](self, "initWithTraceSnapshotsDictionaryArchiveFile:", v5);
  return v6;
}

- (NavigationCameraSnapshotManager)initWithTraceSnapshotsDictionaryArchiveFile:(id)a3
{
  id v4;
  NavigationCameraSnapshotManager *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  NSString *v10;
  NSString *archivePath;
  NavigationCameraSnapshotManager *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavigationCameraSnapshotManager;
  v5 = -[NavigationCameraSnapshotManager init](&v14, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByDeletingLastPathComponent"));
    if ((objc_msgSend(v6, "hasSuffix:", CFSTR("/")) & 1) == 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("/")));

      v6 = (void *)v7;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = objc_msgSend(v8, "isWritableFileAtPath:", v6);

    if (v9)
    {
      v10 = (NSString *)objc_msgSend(v4, "copy");
      archivePath = v5->_archivePath;
      v5->_archivePath = v10;

      v12 = v5;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)archivePath
{
  return self->_archivePath;
}

- (NSMutableDictionary)traceSnapshotsDictionary
{
  NSMutableDictionary *traceSnapshotsDictionary;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  _QWORD v10[5];

  traceSnapshotsDictionary = self->_traceSnapshotsDictionary;
  if (!traceSnapshotsDictionary)
  {
    v4 = (void *)objc_opt_class(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotManager archivePath](self, "archivePath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traceSnapshotsDictionaryWithContentsOfArchiveFile:", v5));

    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
    v8 = self->_traceSnapshotsDictionary;
    self->_traceSnapshotsDictionary = v7;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100C0B3E4;
    v10[3] = &unk_1011E9250;
    v10[4] = self;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

    traceSnapshotsDictionary = self->_traceSnapshotsDictionary;
  }
  return traceSnapshotsDictionary;
}

- (id)cameraSnapshotsOfTraceFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotManager traceSnapshotsDictionary](self, "traceSnapshotsDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (objc_msgSend(v6, "count"))
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6));
  else
    v7 = 0;

  return v7;
}

- (void)addCameraSnapshot:(id)a3 toTraceFile:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id WeakRetained;
  id v15;

  v15 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotManager traceSnapshotsDictionary](self, "traceSnapshotsDictionary"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v15));

  if (!v8)
  {
    v8 = objc_alloc_init((Class)NSMutableArray);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotManager traceSnapshotsDictionary](self, "traceSnapshotsDictionary"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v15);

  }
  v10 = objc_msgSend(v8, "count");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotManager _cameraSnapshotComparator](self, "_cameraSnapshotComparator"));
  v12 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, v10, 1536, v11);

  objc_msgSend(v8, "insertObject:atIndex:", v6, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v12));

  if (v13 == v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotsObserver);
    objc_msgSend(WeakRetained, "cameraSnapshotsManager:didInsertAtIndex:toTraceFile:", self, v12, v15);

    -[NavigationCameraSnapshotManager _commitTraceSnapshotsDictionaryToArchive](self, "_commitTraceSnapshotsDictionaryToArchive");
  }

}

- (void)removeCameraSnapshotAtIndex:(unint64_t)a3 fromTraceFile:(id)a4
{
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotManager traceSnapshotsDictionary](self, "traceSnapshotsDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v9));

  if ((unint64_t)objc_msgSend(v7, "count") > a3)
  {
    objc_msgSend(v7, "removeObjectAtIndex:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotsObserver);
    objc_msgSend(WeakRetained, "cameraSnapshotsManager:didRemoveAtIndex:fromTraceFile:", self, a3, v9);

    -[NavigationCameraSnapshotManager _commitTraceSnapshotsDictionaryToArchive](self, "_commitTraceSnapshotsDictionaryToArchive");
  }

}

- (void)_commitTraceSnapshotsDictionaryToArchive
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = objc_alloc((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotManager traceSnapshotsDictionary](self, "traceSnapshotsDictionary"));
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v6 = objc_alloc((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotManager traceSnapshotsDictionary](self, "traceSnapshotsDictionary"));
  v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotManager traceSnapshotsDictionary](self, "traceSnapshotsDictionary"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100C0B860;
  v15[3] = &unk_1011E9278;
  v16 = v5;
  v17 = v8;
  v10 = v8;
  v14 = v5;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);

  v11 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjects:forKeys:", v10, v14);
  v12 = (void *)objc_opt_class(self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotManager archivePath](self, "archivePath"));
  objc_msgSend(v12, "archiveTraceSnapshotsDictionary:toFile:", v11, v13);

}

- (id)_cameraSnapshotComparator
{
  return &stru_1011E92B8;
}

- (NavigationCameraSnapshotsObserver)snapshotsObserver
{
  return (NavigationCameraSnapshotsObserver *)objc_loadWeakRetained((id *)&self->_snapshotsObserver);
}

- (void)setSnapshotsObserver:(id)a3
{
  objc_storeWeak((id *)&self->_snapshotsObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotsObserver);
  objc_storeStrong((id *)&self->_traceSnapshotsDictionary, 0);
  objc_storeStrong((id *)&self->_archivePath, 0);
}

@end
