@implementation FMDConcurrentMutableDictionary

- (FMDConcurrentMutableDictionary)init
{
  return -[FMDConcurrentMutableDictionary initWithDictionary:](self, "initWithDictionary:", &__NSDictionary0__struct);
}

- (FMDConcurrentMutableDictionary)initWithDictionary:(id)a3
{
  id v4;
  FMDConcurrentMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *underlyingDictionary;
  dispatch_queue_t v8;
  OS_dispatch_queue *dictModQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDConcurrentMutableDictionary;
  v5 = -[FMDConcurrentMutableDictionary init](&v11, "init");
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
    underlyingDictionary = v5->_underlyingDictionary;
    v5->_underlyingDictionary = v6;

    v8 = dispatch_queue_create("com.apple.icloud.FMCore.FMMutableDict.modQueue", 0);
    dictModQueue = v5->_dictModQueue;
    v5->_dictModQueue = (OS_dispatch_queue *)v8;

  }
  return v5;
}

- (unint64_t)count
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDConcurrentMutableDictionary dictModQueue](self, "dictModQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100093718;
  v6[3] = &unk_1002C11C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *v5;
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
  v15 = sub_100093868;
  v16 = sub_100093878;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDConcurrentMutableDictionary dictModQueue](self, "dictModQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100093880;
  block[3] = &unk_1002C18B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[FMDConcurrentMutableDictionary dictModQueue](self, "dictModQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100093998;
  block[3] = &unk_1002C1BA0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDConcurrentMutableDictionary dictModQueue](self, "dictModQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100093A74;
  v7[3] = &unk_1002C13E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)nativeDictionary
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100093868;
  v11 = sub_100093878;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDConcurrentMutableDictionary dictModQueue](self, "dictModQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100093B94;
  v6[3] = &unk_1002C11C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSMutableDictionary)underlyingDictionary
{
  return self->_underlyingDictionary;
}

- (void)setUnderlyingDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingDictionary, a3);
}

- (OS_dispatch_queue)dictModQueue
{
  return self->_dictModQueue;
}

- (void)setDictModQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dictModQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictModQueue, 0);
  objc_storeStrong((id *)&self->_underlyingDictionary, 0);
}

@end
