@implementation CRLDisplayLinkManager

+ (id)sharedManager
{
  if (qword_101415258 != -1)
    dispatch_once(&qword_101415258, &stru_101247828);
  return (id)qword_101415250;
}

- (id)p_initWithPlatformAdapterClass:(Class)a3
{
  CRLDisplayLinkManager *v4;
  NSMutableSet *v5;
  NSMutableSet *registeredLinks;
  NSMutableSet *v7;
  NSMutableSet *activeLinks;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLDisplayLinkManager;
  v4 = -[CRLDisplayLinkManager init](&v10, "init");
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    registeredLinks = v4->_registeredLinks;
    v4->_registeredLinks = v5;

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeLinks = v4->_activeLinks;
    v4->_activeLinks = v7;

    v4->_adapterClass = a3;
  }
  return v4;
}

- (CRLDisplayLinkManager)init
{
  uint64_t v3;

  v3 = objc_opt_class(CRLCADisplayLinkPlatformAdapter, a2);
  return (CRLDisplayLinkManager *)-[CRLDisplayLinkManager p_initWithPlatformAdapterClass:](self, "p_initWithPlatformAdapterClass:", v3);
}

- (void)addLink:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableSet addObject:](self->_registeredLinks, "addObject:", v4);
  if ((objc_msgSend(v4, "paused") & 1) == 0)
    -[NSMutableSet addObject:](self->_activeLinks, "addObject:", v4);
  -[CRLDisplayLinkManager p_updateState](self, "p_updateState");

}

- (void)removeLink:(id)a3
{
  NSMutableSet *registeredLinks;
  id v5;

  registeredLinks = self->_registeredLinks;
  v5 = a3;
  -[NSMutableSet removeObject:](registeredLinks, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_activeLinks, "removeObject:", v5);

  -[CRLDisplayLinkManager p_updateState](self, "p_updateState");
}

- (void)updatePausedForLink:(id)a3
{
  id v4;
  unsigned int v5;
  NSMutableSet *activeLinks;

  v4 = a3;
  v5 = objc_msgSend(v4, "paused");
  activeLinks = self->_activeLinks;
  if (v5)
    -[NSMutableSet removeObject:](activeLinks, "removeObject:", v4);
  else
    -[NSMutableSet addObject:](activeLinks, "addObject:", v4);

  -[CRLDisplayLinkManager p_updateState](self, "p_updateState");
}

- (void)p_updateState
{
  CRLDisplayLinkPlatformAdapter *adapter;
  id v4;
  id v5;
  BOOL v6;
  id v7;
  BOOL v8;

  adapter = self->_adapter;
  v4 = -[NSMutableSet count](self->_registeredLinks, "count");
  v5 = -[NSMutableSet count](self->_activeLinks, "count");
  if (adapter)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    -[CRLDisplayLinkManager p_destroyPlatformAdapter](self, "p_destroyPlatformAdapter");
    return;
  }
  v7 = v5;
  if (v4)
    v8 = adapter == 0;
  else
    v8 = 0;
  if (v8)
  {
    -[CRLDisplayLinkManager p_createPlatformAdapter](self, "p_createPlatformAdapter");
  }
  else if (!v4)
  {
    return;
  }
  if ((v7 == 0) != -[CRLDisplayLinkPlatformAdapter paused](self->_adapter, "paused"))
    -[CRLDisplayLinkPlatformAdapter setPaused:](self->_adapter, "setPaused:", v7 == 0);
}

- (void)p_createPlatformAdapter
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  CRLDisplayLinkPlatformAdapter *adapter;

  if (self->_adapter)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247848);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E110BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247868);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDisplayLinkManager p_createPlatformAdapter]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLink.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 181, 0, "expected nil value for '%{public}s'", "_adapter");

  }
  v6 = -[objc_class initWithTarget:action:](-[objc_class alloc](self->_adapterClass, "alloc"), "initWithTarget:action:", self, "p_linkTriggeredAt:forTargetTime:");
  adapter = self->_adapter;
  self->_adapter = v6;

}

- (void)p_destroyPlatformAdapter
{
  CRLDisplayLinkPlatformAdapter *adapter;
  void *v4;
  void *v5;
  void *v6;
  CRLDisplayLinkPlatformAdapter *v7;

  adapter = self->_adapter;
  if (!adapter)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247888);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1115C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012478A8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDisplayLinkManager p_destroyPlatformAdapter]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLink.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 186, 0, "invalid nil value for '%{public}s'", "_adapter");

    adapter = self->_adapter;
  }
  -[CRLDisplayLinkPlatformAdapter invalidate](adapter, "invalidate");
  v7 = self->_adapter;
  self->_adapter = 0;

}

- (void)p_linkTriggeredAt:(double)a3 forTargetTime:(double)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[NSMutableSet copy](self->_activeLinks, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "i_triggerHandlerAtTime:targetTime:", a3, a4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_activeLinks, 0);
  objc_storeStrong((id *)&self->_registeredLinks, 0);
}

@end
