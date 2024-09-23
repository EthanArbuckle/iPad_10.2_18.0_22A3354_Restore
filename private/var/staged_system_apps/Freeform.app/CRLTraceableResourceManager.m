@implementation CRLTraceableResourceManager

+ (id)sharedManager
{
  if (qword_1014157C8 != -1)
    dispatch_once(&qword_1014157C8, &stru_101259A50);
  return (id)qword_1014157C0;
}

- (CRLTraceableResourceManager)init
{
  CRLTraceableResourceManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSHashTable *v7;
  NSHashTable *knownTraceableResources;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLTraceableResourceManager;
  v2 = -[CRLTraceableResourceManager init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("CRLTraceableResourceManager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 0);
    knownTraceableResources = v2->_knownTraceableResources;
    v2->_knownTraceableResources = v7;

  }
  return v2;
}

- (void)registerTraceableResource:(id)a3
{
  NSObject *queue;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, a3);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003DC6FC;
  block[3] = &unk_101259A78;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)knownTraceableResources
{
  NSObject *queue;
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
  v9 = sub_1003DB058;
  v10 = sub_1003DB068;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003DC7FC;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)logSerializationAsError
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceManager knownTraceableResources](self, "knownTraceableResources"));
  v3 = objc_msgSend(v2, "count");
  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101259A98);
  v4 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
    sub_100E2E138((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v2;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "logSerializationAsErrorWithPrefix:", CFSTR("  "), (_QWORD)v23);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101259AB8);
  v16 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
    sub_100E2E0D0((uint64_t)v3, v16, v17, v18, v19, v20, v21, v22);

}

- (id)serializationDescription
{
  void *v2;
  NSMutableString *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceManager knownTraceableResources](self, "knownTraceableResources"));
  v3 = objc_opt_new(NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%tu traceable resource(s)\n"), objc_msgSend(v2, "count"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("\n[%tu] %@\n"), (char *)v9 + v7, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), (_QWORD)v11);
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 += (uint64_t)v9;
    }
    while (v6);
  }

  return v3;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceManager serializationDescription](self, "serializationDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>\n%@"), v5, self, v6));

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownTraceableResources, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
