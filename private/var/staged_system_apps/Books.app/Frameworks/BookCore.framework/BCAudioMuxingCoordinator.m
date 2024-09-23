@implementation BCAudioMuxingCoordinator

- (BCAudioMuxingCoordinator)init
{
  BCAudioMuxingCoordinator *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCAudioMuxingCoordinator;
  v2 = -[BCAudioMuxingCoordinator init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_30DB70 != -1)
    dispatch_once(&qword_30DB70, &stru_28FC30);
  return (id)qword_30DB68;
}

- (void)addAudioMuxingObserver:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_8E858;
    v6[3] = &unk_28B808;
    v6[4] = self;
    v7 = v4;
    os_unfair_lock_lock(&self->_lock);
    sub_8E858((uint64_t)v6);
    os_unfair_lock_unlock(&self->_lock);

  }
}

- (void)removeAudioMuxingObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v4;
  _QWORD v5[5];
  id v6;

  p_lock = &self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_8E8F0;
  v5[3] = &unk_28B808;
  v5[4] = self;
  v6 = a3;
  v4 = v6;
  os_unfair_lock_lock(p_lock);
  sub_8E8F0((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

}

- (void)notifyPlaybackWillStart:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  _QWORD *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  BCAudioMuxingCoordinator *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_8EAC8;
  v24 = sub_8EAD8;
  v25 = 0;
  p_lock = &self->_lock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v16 = sub_8EAE0;
  v17 = &unk_28B700;
  v18 = self;
  v19 = &v20;
  v6 = v15;
  os_unfair_lock_lock(p_lock);
  v16((uint64_t)v6);
  os_unfair_lock_unlock(p_lock);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = (id)v21[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v26, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "audioPlaybackWillStart:", v4, (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v26, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v20, 8);
}

- (void)beginLongAudioSessionWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v4)(void);
  void (**v5)(void);

  v4 = (void (**)(void))objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
