@implementation IMFileWatcherPathGroup

- (IMFileWatcherPathGroup)initWithFilePath:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  IMFileWatcherPathGroup *v8;
  NSMutableSet *v9;
  NSMutableSet *entries;
  NSString *v11;
  NSString *filePath;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMFileWatcherPathGroup;
  v8 = -[IMFileWatcherPathGroup init](&v14, "init");
  if (v8)
  {
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    entries = v8->_entries;
    v8->_entries = v9;

    v11 = (NSString *)objc_msgSend(v6, "copy");
    filePath = v8->_filePath;
    v8->_filePath = v11;

    objc_storeStrong((id *)&v8->_queue, a4);
    if (!-[IMFileWatcherPathGroup setupSource](v8, "setupSource"))
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IMFileWatcherPathGroup;
  -[IMFileWatcherPathGroup dealloc](&v2, "dealloc");
}

- (BOOL)addEntry:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (self->_source || -[IMFileWatcherPathGroup setupSource](self, "setupSource"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMFileWatcherPathGroup filePath](self, "filePath"));
    objc_msgSend(v4, "setFilePath:", v5);

    -[NSMutableSet addObject:](self->_entries, "addObject:", v4);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)removeEntry:(id)a3
{
  NSMutableSet *entries;
  id v5;

  entries = self->_entries;
  v5 = a3;
  -[NSMutableSet removeObject:](entries, "removeObject:", v5);
  objc_msgSend(v5, "invalidate");

  if (!-[NSMutableSet count](self->_entries, "count"))
    -[IMFileWatcherPathGroup teardown](self, "teardown");
}

- (unint64_t)numberOfEntries
{
  return (unint64_t)-[NSMutableSet count](self->_entries, "count");
}

- (BOOL)setupSource
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  NSObject *v15;
  OS_dispatch_source *source;
  NSObject *v17;
  _QWORD handler[4];
  NSObject *v20;
  IMFileWatcherPathGroup *v21;
  _QWORD v22[5];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_D2ABC;
  v22[3] = &unk_290C78;
  v22[4] = self;
  v3 = objc_retainBlock(v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMFileWatcherPathGroup filePath](self, "filePath"));
  v5 = ((uint64_t (*)(_QWORD *, void *))v3[2])(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    self->_watchingDirectory = 0;
LABEL_9:
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_D2B8C;
    handler[3] = &unk_28B808;
    v15 = v6;
    v20 = v15;
    v21 = self;
    dispatch_source_set_event_handler(v15, handler);
    dispatch_activate(v15);
    source = self->_source;
    self->_source = (OS_dispatch_source *)v15;
    v17 = v15;

    v14 = 1;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMFileWatcherPathGroup filePath](self, "filePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByDeletingLastPathComponent"));
  v9 = ((uint64_t (*)(_QWORD *, void *))v3[2])(v3, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMFileWatcherPathGroup filePath](self, "filePath"));
    v12 = ((uint64_t (*)(_QWORD *, void *))v3[2])(v3, v11);
    v6 = objc_claimAutoreleasedReturnValue(v12);

    if (v6)
    {
      dispatch_source_cancel(v10);
      v13 = 0;
    }
    else
    {
      v6 = v10;
      v13 = 1;
    }
    self->_watchingDirectory = v13;

    goto LABEL_9;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (void)teardown
{
  NSObject *source;
  OS_dispatch_source *v4;

  source = self->_source;
  if (source)
  {
    dispatch_source_cancel(source);
    v4 = self->_source;
    self->_source = 0;

  }
}

- (void)handleDeleteOrRename
{
  _BOOL4 watchingDirectory;
  NSMutableSet *entries;
  IMFileWatcherPathGroup *v5;
  uint64_t v6;

  watchingDirectory = self->_watchingDirectory;
  -[IMFileWatcherPathGroup teardown](self, "teardown");
  if (!-[IMFileWatcherPathGroup setupSource](self, "setupSource"))
  {
    -[IMFileWatcherPathGroup invalidateEntries](self, "invalidateEntries");
    return;
  }
  if (!self->_watchingDirectory)
  {
    entries = self->_entries;
    v5 = self;
    if (watchingDirectory)
      v6 = 1;
    else
      v6 = 3;
    goto LABEL_10;
  }
  if (!watchingDirectory)
  {
    entries = self->_entries;
    v5 = self;
    v6 = 2;
LABEL_10:
    -[IMFileWatcherPathGroup enqueueBlocksForEntries:withChange:](v5, "enqueueBlocksForEntries:withChange:", entries, v6);
  }
}

- (void)handleWrite
{
  id v3;
  int v4;
  void *v5;
  int *v6;
  char *v7;
  stat v8;

  if (self->_watchingDirectory)
  {
    memset(&v8, 0, sizeof(v8));
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[IMFileWatcherPathGroup filePath](self, "filePath")));
    v4 = lstat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v8);

    if (v4 == -1)
    {
      if (*__error() != 2)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMFileWatcherPathGroup filePath](self, "filePath"));
        v6 = __error();
        v7 = strerror(*v6);
        NSLog(CFSTR("Unexpected error with lstat(\"%@\"): %s"), v5, v7);

      }
    }
    else
    {
      -[IMFileWatcherPathGroup teardown](self, "teardown");
      if (-[IMFileWatcherPathGroup setupSource](self, "setupSource"))
      {
        if (!self->_watchingDirectory)
          -[IMFileWatcherPathGroup enqueueBlocksForEntries:withChange:](self, "enqueueBlocksForEntries:withChange:", self->_entries, 1);
      }
      else
      {
        -[IMFileWatcherPathGroup invalidateEntries](self, "invalidateEntries");
      }
    }
  }
  else
  {
    -[IMFileWatcherPathGroup enqueueBlocksForEntries:withChange:](self, "enqueueBlocksForEntries:withChange:", self->_entries, 3);
  }
}

- (void)invalidateEntries
{
  id v3;

  v3 = -[NSMutableSet copy](self->_entries, "copy");
  -[NSMutableSet removeAllObjects](self->_entries, "removeAllObjects");
  -[IMFileWatcherPathGroup enqueueBlocksForEntries:withChange:](self, "enqueueBlocksForEntries:withChange:", v3, 4);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &stru_290CB8);

}

- (void)enqueueBlocksForEntries:(id)a3 withChange:(int)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id obj;
  _QWORD v14[5];
  id v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "block"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queue"));
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_D2F94;
        v14[3] = &unk_290CE0;
        v16 = a4;
        v14[4] = v9;
        v15 = v10;
        v12 = v10;
        objc_msgSend(v11, "addOperationWithBlock:", v14);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (NSString)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
