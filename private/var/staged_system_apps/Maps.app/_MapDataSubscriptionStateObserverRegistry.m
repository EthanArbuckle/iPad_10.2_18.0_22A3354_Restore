@implementation _MapDataSubscriptionStateObserverRegistry

- (_MapDataSubscriptionStateObserverRegistry)init
{
  _MapDataSubscriptionStateObserverRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *observing;
  _MapDataSubscriptionStateObserverRegistry *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MapDataSubscriptionStateObserverRegistry;
  v2 = -[_MapDataSubscriptionStateObserverRegistry init](&v7, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    observing = v2->_observing;
    v2->_observing = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_observing, "allKeys"));
  v4 = objc_msgSend(v3, "copy");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        sub_1005C716C((uint64_t)self, *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)_MapDataSubscriptionStateObserverRegistry;
  -[_MapDataSubscriptionStateObserverRegistry dealloc](&v10, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;
  _QWORD block[5];
  id v14;

  v10 = a4;
  v11 = v10;
  if (off_1014AE350 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005C73BC;
    block[3] = &unk_1011AC8B0;
    block[4] = self;
    v14 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_MapDataSubscriptionStateObserverRegistry;
    -[_MapDataSubscriptionStateObserverRegistry observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", a3, v10, a5, a6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_observing, 0);
}

@end
