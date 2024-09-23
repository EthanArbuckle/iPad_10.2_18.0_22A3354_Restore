@implementation IMFileWatcher

+ (id)defaultWatcher
{
  if (qword_30DC90 != -1)
    dispatch_once(&qword_30DC90, &stru_290BC8);
  return (id)qword_30DC88;
}

- (IMFileWatcher)init
{
  IMFileWatcher *v2;
  id v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *groups;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMFileWatcher;
  v2 = -[IMFileWatcher init](&v9, "init");
  if (v2)
  {
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.iBooks.IMFileWatcher.%p"), v2)));
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groups = v2->_groups;
    v2->_groups = v6;

  }
  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *v3;
  NSObject *queue;
  NSMutableDictionary *v5;
  objc_super v6;
  _QWORD block[4];
  NSMutableDictionary *v8;

  v3 = self->_groups;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D2240;
  block[3] = &unk_28B960;
  v8 = v3;
  v5 = v3;
  dispatch_async(queue, block);

  v6.receiver = self;
  v6.super_class = (Class)IMFileWatcher;
  -[IMFileWatcher dealloc](&v6, "dealloc");
}

- (id)watchFileAtPath:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_D23A0;
  v26 = sub_D23B0;
  v27 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D23B8;
  block[3] = &unk_290C30;
  block[4] = self;
  v18 = v8;
  v20 = v10;
  v21 = &v22;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (void)removeWatcher:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  IMFileWatcher *v9;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = sub_D2508;
    block[3] = &unk_28B808;
    v6 = v4;
    block[0] = _NSConcreteStackBlock;
    v8 = v4;
    v9 = self;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
