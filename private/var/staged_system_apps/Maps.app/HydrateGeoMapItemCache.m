@implementation HydrateGeoMapItemCache

- (HydrateGeoMapItemCache)init
{
  HydrateGeoMapItemCache *v2;
  uint64_t v3;
  NSMutableDictionary *inProgressCompletionsByHandle;
  uint64_t v5;
  NSMutableDictionary *resolvedMapItemByHandle;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HydrateGeoMapItemCache;
  v2 = -[HydrateGeoMapItemCache init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    inProgressCompletionsByHandle = v2->_inProgressCompletionsByHandle;
    v2->_inProgressCompletionsByHandle = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    resolvedMapItemByHandle = v2->_resolvedMapItemByHandle;
    v2->_resolvedMapItemByHandle = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_create("com.apple.Maps.HydrateGeoMapItemCache", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

+ (id)sharedCache
{
  if (qword_1014D32D8 != -1)
    dispatch_once(&qword_1014D32D8, &stru_1011C6920);
  return (id)qword_1014D32D0;
}

- (void)resolveRTMapItem:(id)a3 shouldUpdateAttributes:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *serialQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HydrateGeoMapItemCache *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  serialQueue = self->_serialQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10079D5CC;
  v13[3] = &unk_1011BE4E8;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(serialQueue, v13);

}

- (void)performCompletionsFor:(id)a3 mapItem:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *serialQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  HydrateGeoMapItemCache *v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10079DBA4;
  v21[4] = sub_10079DBB4;
  v22 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10079DBBC;
  block[3] = &unk_1011C6970;
  v16 = v9;
  v17 = self;
  v19 = v10;
  v20 = v21;
  v18 = v8;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(serialQueue, block);

  _Block_object_dispose(v21, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_resolvedMapItemByHandle, 0);
  objc_storeStrong((id *)&self->_inProgressCompletionsByHandle, 0);
}

@end
