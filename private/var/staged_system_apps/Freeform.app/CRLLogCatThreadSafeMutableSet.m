@implementation CRLLogCatThreadSafeMutableSet

- (CRLLogCatThreadSafeMutableSet)initWithArray:(id)a3
{
  id v4;
  CRLLogCatThreadSafeMutableSet *v5;
  NSMutableSet *v6;
  NSMutableSet *objects;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *logCatQueue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLLogCatThreadSafeMutableSet;
  v5 = -[CRLLogCatThreadSafeMutableSet init](&v13, "init");
  if (v5)
  {
    v6 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v4);
    objects = v5->_objects;
    v5->_objects = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("CRLLogCatQueue", v9);
    logCatQueue = v5->_logCatQueue;
    v5->_logCatQueue = (OS_dispatch_queue *)v10;

  }
  return v5;
}

- (CRLLogCatThreadSafeMutableSet)init
{
  void *v3;
  CRLLogCatThreadSafeMutableSet *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v4 = -[CRLLogCatThreadSafeMutableSet initWithArray:](self, "initWithArray:", v3);

  return v4;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  NSObject *logCatQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  logCatQueue = self->_logCatQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003C1004;
  block[3] = &unk_101230370;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(logCatQueue, block);
  LOBYTE(logCatQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)logCatQueue;
}

- (unint64_t)count
{
  NSObject *logCatQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003C10C8;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)allObjects
{
  NSObject *logCatQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1003C11B0;
  v10 = sub_1003C11C0;
  v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003C11C8;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)immutableSet
{
  NSObject *logCatQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1003C11B0;
  v10 = sub_1003C11C0;
  v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003C12B8;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addObject:(id)a3
{
  id v4;
  NSObject *logCatQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  logCatQueue = self->_logCatQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003C1378;
  v7[3] = &unk_10122D3D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(logCatQueue, v7);

}

- (void)removeObject:(id)a3
{
  id v4;
  NSObject *logCatQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  logCatQueue = self->_logCatQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003C1400;
  v7[3] = &unk_10122D3D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(logCatQueue, v7);

}

- (id)description
{
  NSObject *logCatQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1003C11B0;
  v10 = sub_1003C11C0;
  v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003C14C0;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCatQueue, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
