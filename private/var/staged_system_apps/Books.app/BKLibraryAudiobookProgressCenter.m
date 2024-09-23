@implementation BKLibraryAudiobookProgressCenter

- (BKLibraryAudiobookProgressCenter)init
{
  BKLibraryAudiobookProgressCenter *v2;
  uint64_t v3;
  NSMapTable *progressInstanceMap;
  uint64_t v5;
  NSMapTable *timeRemainingInstanceMap;
  dispatch_queue_t v7;
  OS_dispatch_queue *access;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKLibraryAudiobookProgressCenter;
  v2 = -[BKLibraryAudiobookProgressCenter init](&v11, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    progressInstanceMap = v2->_progressInstanceMap;
    v2->_progressInstanceMap = (NSMapTable *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    timeRemainingInstanceMap = v2->_timeRemainingInstanceMap;
    v2->_timeRemainingInstanceMap = (NSMapTable *)v5;

    v7 = dispatch_queue_create("BKLibraryAudiobookProgressCenter.access", 0);
    access = v2->_access;
    v2->_access = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "_minifiedAssetPresentersChangedNotification:", CFSTR("BKMnifiedPresentersUpdatedNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("BKMnifiedPresentersUpdatedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryAudiobookProgressCenter;
  -[BKLibraryAudiobookProgressCenter dealloc](&v4, "dealloc");
}

- (void)_minifiedAssetPresentersChangedNotification:(id)a3
{
  -[NSMapTable removeAllObjects](self->_progressInstanceMap, "removeAllObjects", a3);
  -[NSMapTable removeAllObjects](self->_timeRemainingInstanceMap, "removeAllObjects");
}

- (id)dynamicProgressForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *access;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v18;
  BKLibraryAudiobookProgressCenter *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10004E540;
  v27 = sub_10004E308;
  v28 = 0;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D3814;
  block[3] = &unk_1008EF4B0;
  v21 = v10;
  v22 = &v23;
  v18 = v8;
  v19 = self;
  v20 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(access, block);
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_timeRemainingInstanceMap, 0);
  objc_storeStrong((id *)&self->_progressInstanceMap, 0);
}

@end
