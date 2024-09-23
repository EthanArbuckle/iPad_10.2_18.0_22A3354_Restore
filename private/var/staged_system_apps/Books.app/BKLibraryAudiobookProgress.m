@implementation BKLibraryAudiobookProgress

- (BKLibraryAudiobookProgress)initWithKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v9;
  id v10;
  id v11;
  BKLibraryAudiobookProgress *v12;
  BKLibraryAudiobookProgress *v13;
  uint64_t v14;
  NSHashTable *observers;
  dispatch_queue_t v16;
  OS_dispatch_queue *access;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  AEAssetAudiobookStatus *audiobookStatus;
  const __CFString *v31;
  _QWORD *v32;
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)BKLibraryAudiobookProgress;
  v12 = -[BKLibraryAudiobookProgress init](&v34, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_kind, a3);
    objc_storeStrong((id *)&v13->_instance, a4);
    objc_storeStrong((id *)&v13->_parameters, a5);
    v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    v16 = dispatch_queue_create("BKLibraryAudiobookProgress.access", 0);
    access = v13->_access;
    v13->_access = (OS_dispatch_queue *)v16;

    v18 = objc_opt_class(NSString);
    v19 = BUDynamicCast(v18, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = objc_opt_class(BKAppDelegate);
    v22 = BCGetUnsafeAppDelegateReference();
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = BUDynamicCast(v21, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sceneManager"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "minifiedPresenter"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "minifiedPresenterAssetCurrentPresenterForAssetID:", v20));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "minifiedAssetStatus"));
    audiobookStatus = v13->_audiobookStatus;
    v13->_audiobookStatus = (AEAssetAudiobookStatus *)v29;

    if (-[NSString isEqualToString:](v13->_kind, "isEqualToString:", CFSTR("chapterProgress")))
    {
      v31 = CFSTR("assetAudiobookStatusTrackProgress");
      v32 = &off_1009CDA50;
    }
    else
    {
      if (!-[NSString isEqualToString:](v13->_kind, "isEqualToString:", CFSTR("timeRemaining")))
      {
LABEL_7:

        goto LABEL_8;
      }
      v31 = CFSTR("assetAudiobookStatusTrackTimeRemaining");
      v32 = &off_1009CDA58;
    }
    -[AEAssetAudiobookStatus addObserver:forKeyPath:options:context:](v13->_audiobookStatus, "addObserver:forKeyPath:options:context:", v13, v31, 0, *v32);
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (void)dealloc
{
  const __CFString *v3;
  _QWORD *v4;
  objc_super v5;

  if (-[NSString isEqualToString:](self->_kind, "isEqualToString:", CFSTR("chapterProgress")))
  {
    v3 = CFSTR("assetAudiobookStatusTrackProgress");
    v4 = &off_1009CDA50;
LABEL_5:
    -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](self->_audiobookStatus, "removeObserver:forKeyPath:context:", self, v3, *v4);
    goto LABEL_6;
  }
  if (-[NSString isEqualToString:](self->_kind, "isEqualToString:", CFSTR("timeRemaining")))
  {
    v3 = CFSTR("assetAudiobookStatusTrackTimeRemaining");
    v4 = &off_1009CDA58;
    goto LABEL_5;
  }
LABEL_6:
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryAudiobookProgress;
  -[BKLibraryAudiobookProgress dealloc](&v5, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  double v8;
  id v9;
  id v10;
  objc_super v11;

  if (off_1009CDA50 == a6 || off_1009CDA58 == a6)
  {
    if (-[NSString isEqualToString:](self->_kind, "isEqualToString:", CFSTR("chapterProgress"), a4, a5))
    {
      -[AEAssetAudiobookStatus assetAudiobookStatusTrackProgress](self->_audiobookStatus, "assetAudiobookStatusTrackProgress");
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[BKLibraryAudiobookProgress setProgress:](self, "setProgress:", v9);

    }
    else if (-[NSString isEqualToString:](self->_kind, "isEqualToString:", CFSTR("timeRemaining")))
    {
      -[AEAssetAudiobookStatus assetAudiobookStatusTrackTimeRemaining](self->_audiobookStatus, "assetAudiobookStatusTrackTimeRemaining");
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithDuration:](NSString, "stringWithDuration:", -v8));
      -[BKLibraryAudiobookProgress setFormattedProgress:](self, "setFormattedProgress:", v10);

    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)BKLibraryAudiobookProgress;
    -[BKLibraryAudiobookProgress observeValueForKeyPath:ofObject:change:context:](&v11, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)setFormattedProgress:(id)a3
{
  id v5;
  NSObject *access;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];

  v5 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10004E540;
  v20 = sub_10004E308;
  v21 = 0;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D3F08;
  block[3] = &unk_1008E75B8;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(access, block);
  objc_storeStrong((id *)&self->_formattedProgress, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = (id)v17[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "dynamicProgressChanged:", self, (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)setProgress:(id)a3
{
  id v5;
  NSObject *access;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];

  v5 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10004E540;
  v20 = sub_10004E308;
  v21 = 0;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D4100;
  block[3] = &unk_1008E75B8;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(access, block);
  objc_storeStrong((id *)&self->_progress, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = (id)v17[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "dynamicProgressChanged:", self, (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)registerProgressObserver:(id)a3
{
  id v4;
  NSObject *access;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D41B4;
  block[3] = &unk_1008E7338;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(access, block);

}

- (void)unregisterProgressObserver:(id)a3
{
  id v4;
  NSObject *access;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D423C;
  block[3] = &unk_1008E7338;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(access, block);

}

- (void)togglePlayPause
{
  -[AEAssetAudiobookStatus assetAudiobookStatusTogglePlayPause](self->_audiobookStatus, "assetAudiobookStatusTogglePlayPause");
}

- (NSString)kind
{
  return self->_kind;
}

- (NSObject)instance
{
  return self->_instance;
}

- (NSObject)parameters
{
  return self->_parameters;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (NSString)formattedProgress
{
  return self->_formattedProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_audiobookStatus, 0);
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
