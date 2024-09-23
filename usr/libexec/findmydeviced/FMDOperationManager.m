@implementation FMDOperationManager

+ (id)sharedManager
{
  if (qword_100306650 != -1)
    dispatch_once(&qword_100306650, &stru_1002C3528);
  return (id)qword_100306648;
}

- (FMDOperationManager)init
{
  FMDOperationManager *v2;
  void *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDOperationManager;
  v2 = -[FMDOperationManager init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMDOperationManager setActionQueueMap:](v2, "setActionQueueMap:", v3);

    v4 = dispatch_queue_create("FMDOperationManagerSerialQueue", 0);
    -[FMDOperationManager setSerialQueue:](v2, "setSerialQueue:", v4);

  }
  return v2;
}

- (BOOL)addAction:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  FMDOperationManager *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[FMDOperationManager serialQueue](self, "serialQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005528C;
  v12[3] = &unk_1002C3550;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v8) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

- (BOOL)cancelAction:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  FMDOperationManager *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[FMDOperationManager serialQueue](self, "serialQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100055620;
  v12[3] = &unk_1002C3550;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v8) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(self, a2), self);
}

- (NSMutableDictionary)actionQueueMap
{
  return self->_actionQueueMap;
}

- (void)setActionQueueMap:(id)a3
{
  objc_storeStrong((id *)&self->_actionQueueMap, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_actionQueueMap, 0);
}

@end
