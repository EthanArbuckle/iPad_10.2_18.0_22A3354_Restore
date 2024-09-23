@implementation NIServerSpatialInteractionPayloadAggregator

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100217A78;
  block[3] = &unk_1007FA668;
  block[4] = a1;
  if (qword_100859150 != -1)
    dispatch_once(&qword_100859150, block);
  return (id)qword_100859148;
}

- (id)_initInternal
{
  NIServerSpatialInteractionPayloadAggregator *v2;
  NIServerSpatialInteractionPayloadAggregator *v3;
  uint64_t v4;
  NSData *aggregatedData;
  uint64_t v6;
  NSHashTable *payloadChangeObservers;
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NIServerSpatialInteractionPayloadAggregator;
  v2 = -[NIServerSpatialInteractionPayloadAggregator init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_lock._os_unfair_lock_opaque = 0;
    v9 = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v9, 1));
    aggregatedData = v3->_aggregatedData;
    v3->_aggregatedData = (NSData *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    payloadChangeObservers = v3->_payloadChangeObservers;
    v3->_payloadChangeObservers = (NSHashTable *)v6;

  }
  return v3;
}

- (void)commitChange
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSHashTable *v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  NSObject *v30;
  NSHashTable *v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  NSObject *v36;
  NSData *aggregatedData;
  _BOOL4 findingEnabled;
  int findingStatus;
  int findingConfig;
  os_unfair_lock_s *lock;
  _QWORD block[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[2];
  __int16 v48;
  char v49;
  _QWORD v50[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  NSData *v57;
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  _BYTE v64[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_findingEnabled)
  {
    v49 = 0;
    v47[0] = 1;
    v47[1] = self->_findingStatus;
    v48 = *(_WORD *)&self->_findingConfig;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v47, 5, p_lock));
    if (-[NSData isEqualToData:](self->_aggregatedData, "isEqualToData:", v4))
    {
      v5 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
        sub_1003DFA20(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    else
    {
      objc_storeStrong((id *)&self->_aggregatedData, v4);
      v24 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      {
        aggregatedData = self->_aggregatedData;
        findingEnabled = self->_findingEnabled;
        findingStatus = self->_findingStatus;
        findingConfig = self->_findingConfig;
        *(_DWORD *)buf = 138413058;
        v57 = aggregatedData;
        v58 = 1024;
        v59 = findingEnabled;
        v60 = 1024;
        v61 = findingStatus;
        v62 = 1024;
        v63 = findingConfig;
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "#type19,Commit change (non-empty payload). Aggregated data: %@. Flag FE: %d. FS: %d. FC: %d", buf, 0x1Eu);
      }
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v25 = self->_payloadChangeObservers;
      v26 = -[NSHashTable countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v44 != v27)
              objc_enumerationMutation(v25);
            v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
            v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "payloadChangeObserverQueue"));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100217F6C;
            block[3] = &unk_1007FB340;
            block[4] = v29;
            dispatch_async(v30, block);

          }
          v26 = -[NSHashTable countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        }
        while (v26);
      }

    }
  }
  else
  {
    buf[0] = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 1, p_lock));
    v14 = -[NSData isEqualToData:](self->_aggregatedData, "isEqualToData:", v13);
    v15 = qword_10085F520;
    v16 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v16)
        sub_1003DF9C0(v15, v17, v18, v19, v20, v21, v22, v23);
    }
    else
    {
      if (v16)
        sub_1003DF9F0(v15, v17, v18, v19, v20, v21, v22, v23);
      objc_storeStrong((id *)&self->_aggregatedData, v13);
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v31 = self->_payloadChangeObservers;
      v32 = -[NSHashTable countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(_QWORD *)v52 != v33)
              objc_enumerationMutation(v31);
            v35 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
            v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "payloadChangeObserverQueue"));
            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472;
            v50[2] = sub_100217F64;
            v50[3] = &unk_1007FB340;
            v50[4] = v35;
            dispatch_async(v36, v50);

          }
          v32 = -[NSHashTable countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
        }
        while (v32);
      }

    }
  }
  os_unfair_lock_unlock(lock);
}

- (NSData)aggregatedData
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_aggregatedData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)findingEnabled
{
  NIServerSpatialInteractionPayloadAggregator *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_findingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unsigned)findingStatus
{
  NIServerSpatialInteractionPayloadAggregator *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_findingStatus;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (unsigned)findingConfig
{
  NIServerSpatialInteractionPayloadAggregator *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_findingConfig;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (unsigned)findingConfig2
{
  NIServerSpatialInteractionPayloadAggregator *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_findingConfig2;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)setFindingEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_findingEnabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setFindingStatus:(unsigned __int8)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_findingStatus = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setFindingConfig2:(unsigned __int8)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_findingConfig2 = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setFindingConfig:(unsigned __int8)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_findingConfig = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)addPayloadChangeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_payloadChangeObservers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removePayloadChangeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_payloadChangeObservers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadChangeObservers, 0);
  objc_storeStrong((id *)&self->_aggregatedData, 0);
}

@end
