@implementation _TSF_TSDClockSyncManager

+ (id)sharedClockSyncManager
{
  if (sharedClockSyncManager_onceToken != -1)
    dispatch_once(&sharedClockSyncManager_onceToken, &__block_literal_global);
  return (id)_sharedClockSyncManager;
}

- (_TSF_TSDClockSyncManager)init
{
  _TSF_TSDClockSyncManager *v2;
  uint64_t v3;
  NSMutableDictionary *clockSyncs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TSF_TSDClockSyncManager;
  v2 = -[_TSF_TSDClockSyncManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    clockSyncs = v2->_clockSyncs;
    v2->_clockSyncs = (NSMutableDictionary *)v3;

    v2->_clockSyncsLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)clockSyncForClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4;
  void *v7;
  _TSF_TSDClockSync *v8;
  _TSF_TSDClockSync *v9;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_clockSyncsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_clockSyncs, "objectForKeyedSubscript:", v7);
  v8 = (_TSF_TSDClockSync *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    -[_TSF_TSDClockSync addReference](v8, "addReference");
  }
  else
  {
    v9 = -[_TSF_TSDClockSync initWithClockIdentifier:pid:]([_TSF_TSDClockSync alloc], "initWithClockIdentifier:pid:", a3, v4);
    if (v9)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clockSyncs, "setObject:forKeyedSubscript:", v9, v7);
  }
  os_unfair_lock_unlock(&self->_clockSyncsLock);

  return v9;
}

- (void)releaseClockSyncForClockIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_clockSyncsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_clockSyncs, "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "releaseReference"))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_clockSyncs, "removeObjectForKey:", v6);
    objc_msgSend(v5, "finalizeNotifications");
  }
  os_unfair_lock_unlock(&self->_clockSyncsLock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockSyncs, 0);
}

@end
