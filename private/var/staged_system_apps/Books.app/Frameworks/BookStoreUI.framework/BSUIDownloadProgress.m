@implementation BSUIDownloadProgress

- (BSUIDownloadProgress)initWithKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v9;
  id v10;
  id v11;
  BSUIDownloadProgress *v12;
  BSUIDownloadProgress *v13;
  uint64_t v14;
  NSHashTable *observers;
  dispatch_queue_t v16;
  OS_dispatch_queue *access;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BSUIDownloadProgress;
  v12 = -[BSUIDownloadProgress init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_kind, a3);
    objc_storeStrong((id *)&v13->_instance, a4);
    objc_storeStrong((id *)&v13->_parameters, a5);
    v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    v16 = dispatch_queue_create("BSUIDownloadProgress.access", 0);
    access = v13->_access;
    v13->_access = (OS_dispatch_queue *)v16;

  }
  return v13;
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
  v19 = sub_27DAC;
  v20 = sub_27DBC;
  v21 = 0;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_28958;
  block[3] = &unk_2E42F8;
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
  block[2] = sub_28A0C;
  block[3] = &unk_2E40C8;
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
  block[2] = sub_28A94;
  block[3] = &unk_2E40C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(access, block);

}

- (NSString)formattedProgress
{
  return self->formattedProgress;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->formattedProgress, 0);
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
