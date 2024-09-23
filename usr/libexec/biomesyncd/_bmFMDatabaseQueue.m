@implementation _bmFMDatabaseQueue

+ (id)databaseQueueWithPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithPath:", v4);

  return v5;
}

+ (id)databaseQueueWithURL:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "databaseQueueWithPath:", v4));

  return v5;
}

+ (id)databaseQueueWithPath:(id)a3 flags:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithPath:flags:", v6, v4);

  return v7;
}

+ (id)databaseQueueWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "databaseQueueWithPath:flags:", v6, v4));

  return v7;
}

+ (Class)databaseClass
{
  return (Class)objc_opt_class(_bmFMDatabase, a2);
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4 vfs:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  _bmFMDatabaseQueue *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v10 = -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", v9, v5, v8);

  return v10;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4 vfs:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  _bmFMDatabaseQueue *v11;
  uint64_t v12;
  _bmFMDatabaseQueue *v13;
  id v14;
  uint64_t v15;
  _bmFMDatabase *db;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  NSString *v20;
  NSString *vfsName;
  _bmFMDatabaseQueue *v22;
  objc_super v24;

  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)_bmFMDatabaseQueue;
  v11 = -[_bmFMDatabaseQueue init](&v24, "init");
  v13 = v11;
  if (v11)
  {
    v14 = objc_msgSend(objc_msgSend((id)objc_opt_class(v11, v12), "databaseClass"), "databaseWithPath:", v9);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    db = v13->_db;
    v13->_db = (_bmFMDatabase *)v15;

    if (!-[_bmFMDatabase openWithFlags:vfs:](v13->_db, "openWithFlags:vfs:", v6, v10))
    {
      NSLog(CFSTR("Could not create database queue for path %@"), v9);
      v22 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v13->_path, a3);
    v17 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("fmdb.%@"), v13));
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v18;

    dispatch_queue_set_specific((dispatch_queue_t)v13->_queue, &off_100069960, v13, 0);
    v13->_openFlags = v6;
    v20 = (NSString *)objc_msgSend(v10, "copy");
    vfsName = v13->_vfsName;
    v13->_vfsName = v20;

  }
  v22 = v13;
LABEL_6:

  return v22;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4
{
  return -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", a3, *(_QWORD *)&a4, 0);
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4;
  void *v6;
  _bmFMDatabaseQueue *v7;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v7 = -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", v6, v4, 0);

  return v7;
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3
{
  void *v4;
  _bmFMDatabaseQueue *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v5 = -[_bmFMDatabaseQueue initWithPath:](self, "initWithPath:", v4);

  return v5;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3
{
  return -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", a3, 6, 0);
}

- (_bmFMDatabaseQueue)init
{
  return -[_bmFMDatabaseQueue initWithPath:](self, "initWithPath:", 0);
}

- (void)dealloc
{
  OS_dispatch_queue *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)_bmFMDatabaseQueue;
  -[_bmFMDatabaseQueue dealloc](&v4, "dealloc");
}

- (void)close
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040AB4;
  block[3] = &unk_100068B38;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)interrupt
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabaseQueue database](self, "database"));
  objc_msgSend(v2, "interrupt");

}

- (id)database
{
  uint64_t v3;
  _bmFMDatabase *db;
  id v5;
  _bmFMDatabase *v6;
  _bmFMDatabase *v7;
  _bmFMDatabase *v8;
  _bmFMDatabase *v9;

  if (-[_bmFMDatabase isOpen](self->_db, "isOpen"))
    goto LABEL_5;
  db = self->_db;
  if (!db)
  {
    v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, v3), "databaseClass"), "databaseWithPath:", self->_path);
    v6 = (_bmFMDatabase *)objc_claimAutoreleasedReturnValue(v5);
    v7 = self->_db;
    self->_db = v6;

    db = self->_db;
  }
  if (-[_bmFMDatabase openWithFlags:vfs:](db, "openWithFlags:vfs:", self->_openFlags, self->_vfsName))
  {
LABEL_5:
    v8 = self->_db;
  }
  else
  {
    NSLog(CFSTR("_bmFMDatabaseQueue could not reopen database for path %@"), self->_path);
    v9 = self->_db;
    self->_db = 0;

    v8 = 0;
  }
  return v8;
}

- (void)inDatabase:(id)a3
{
  id v4;
  void *specific;
  _bmFMDatabaseQueue *v6;
  OS_dispatch_queue *queue;
  id v8;
  _bmFMDatabaseQueue *v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  specific = dispatch_get_specific(&off_100069960);
  v6 = (_bmFMDatabaseQueue *)objc_claimAutoreleasedReturnValue(specific);
  if (v6 == self)
    sub_100041268();
  queue = self->_queue;
  block[1] = 3221225472;
  block[2] = sub_100040C5C;
  block[3] = &unk_100068B60;
  block[4] = self;
  v11 = v4;
  v9 = v6;
  block[0] = _NSConcreteStackBlock;
  v8 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)beginTransaction:(int64_t)a3 withBlock:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040D48;
  block[3] = &unk_100069970;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)inTransaction:(id)a3
{
  -[_bmFMDatabaseQueue beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 0, a3);
}

- (void)inDeferredTransaction:(id)a3
{
  -[_bmFMDatabaseQueue beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 1, a3);
}

- (void)inExclusiveTransaction:(id)a3
{
  -[_bmFMDatabaseQueue beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 0, a3);
}

- (void)inImmediateTransaction:(id)a3
{
  -[_bmFMDatabaseQueue beginTransaction:withBlock:](self, "beginTransaction:withBlock:", 2, a3);
}

- (id)inSavePoint:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100040F2C;
  v16 = sub_100040F3C;
  v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040F44;
  block[3] = &unk_100069998;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)checkpoint:(int)a3 error:(id *)a4
{
  return -[_bmFMDatabaseQueue checkpoint:name:logFrameCount:checkpointCount:error:](self, "checkpoint:name:logFrameCount:checkpointCount:error:", *(_QWORD *)&a3, 0, 0, 0, a4);
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5
{
  return -[_bmFMDatabaseQueue checkpoint:name:logFrameCount:checkpointCount:error:](self, "checkpoint:name:logFrameCount:checkpointCount:error:", *(_QWORD *)&a3, a4, 0, 0, a5);
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7
{
  id v12;
  OS_dispatch_queue *queue;
  id v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  int *v19;
  int *v20;
  id *v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v12 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041198;
  block[3] = &unk_1000699C0;
  v22 = a3;
  block[4] = self;
  v17 = v12;
  v18 = &v23;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v14 = v12;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(a6) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)a6;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)openFlags
{
  return self->_openFlags;
}

- (NSString)vfsName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVfsName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vfsName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
