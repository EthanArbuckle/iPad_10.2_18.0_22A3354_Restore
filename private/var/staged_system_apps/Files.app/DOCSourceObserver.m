@implementation DOCSourceObserver

- (id)consolidatedErrorIfExists
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver legacyPickersObserverError](self, "legacyPickersObserverError"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver legacyPickersObserverError](self, "legacyPickersObserverError"));
    objc_msgSend(v3, "addObject:", v5);

  }
  if (objc_msgSend(v3, "count"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError observerErrorWithUnderlyingErrors:](NSError, "observerErrorWithUnderlyingErrors:", v3));
  else
    v6 = 0;

  return v6;
}

- (id)_sourcesByBuildingWithSourceBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceBuilder](self, "sourceBuilder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver providers](self, "providers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver legacyPickers](self, "legacyPickers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "buildSourcesProviders:legacyWebViewFileProviders:", v4, v5));

  return v6;
}

- (id)addSubscriberForConfiguration:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007E9FC;
  v9[3] = &unk_1005BEC88;
  v10 = a4;
  v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver _addSubscriberForConfiguration:usingBlock:](self, "_addSubscriberForConfiguration:usingBlock:", a3, v9));

  return v7;
}

- (id)sourceForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sources](self, "sources", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (DOCSourceObserver)initWithUserAction:(unint64_t)a3 hostIdentifier:(id)a4
{
  id v6;
  DOCSourceObserver *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *sourceObserverQueue;
  uint64_t v14;
  NSMutableDictionary *sourcesSubscribers;
  DOCSourceBuilder *v16;
  DOCSourceBuilder *sourceBuilder;
  _TtC5Files16DOCActionManager *v18;
  _TtC5Files16DOCActionManager *sourcesActionManager;
  uint64_t v20;
  FINode *providerDomainsNode;
  uint64_t v22;
  FINodeObserver *providerDomainsFINodeObserver;
  objc_super v25;

  v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)DOCSourceObserver;
  v7 = -[DOCSourceObserver init](&v25, "init");
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);
    v11 = objc_claimAutoreleasedReturnValue(v10);

    v12 = dispatch_queue_create("com.apple.DocumentManager.sources", v11);
    sourceObserverQueue = v7->_sourceObserverQueue;
    v7->_sourceObserverQueue = (OS_dispatch_queue *)v12;

    v7->_observationCount = 0;
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sourcesSubscribers = v7->_sourcesSubscribers;
    v7->_sourcesSubscribers = (NSMutableDictionary *)v14;

    v16 = -[DOCSourceBuilder initWithUserAction:hostIdentifier:]([DOCSourceBuilder alloc], "initWithUserAction:hostIdentifier:", a3, v6);
    sourceBuilder = v7->_sourceBuilder;
    v7->_sourceBuilder = v16;

    v18 = objc_alloc_init(_TtC5Files16DOCActionManager);
    sourcesActionManager = v7->_sourcesActionManager;
    v7->_sourcesActionManager = v18;

    StartFINode();
    v20 = objc_claimAutoreleasedReturnValue(+[FINode providerDomainsContainer](FINode, "providerDomainsContainer"));
    providerDomainsNode = v7->_providerDomainsNode;
    v7->_providerDomainsNode = (FINode *)v20;

    v22 = objc_claimAutoreleasedReturnValue(+[FINodeObserver observerForFINode:withObserver:](FINodeObserver, "observerForFINode:withObserver:", v7->_providerDomainsNode, v7));
    providerDomainsFINodeObserver = v7->_providerDomainsFINodeObserver;
    v7->_providerDomainsFINodeObserver = (FINodeObserver *)v22;

  }
  return v7;
}

- (void)sourceObserverQueue_didReceiveSourceUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[DOCSourceObserver hasReceivedFirstFullUpdate](self, "hasReceivedFirstFullUpdate"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver _sourcesByBuildingWithSourceBuilder](self, "_sourcesByBuildingWithSourceBuilder"));
    -[DOCSourceObserver setSources:](self, "setSources:", v4);

    -[DOCSourceObserver updateCachedDisplayNamesFromSources](self, "updateCachedDisplayNamesFromSources");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver consolidatedErrorIfExists](self, "consolidatedErrorIfExists"));
    -[DOCSourceObserver setSourcesObserverError:](self, "setSourcesObserverError:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver actionManagersFromSources](self, "actionManagersFromSources"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourcesActionManager](self, "sourcesActionManager"));
    objc_msgSend(v7, "setAssociatedActionManagers:", v6);

    -[DOCSourceObserver notifySubscribers](self, "notifySubscribers");
  }
}

- (void)updateCachedDisplayNamesFromSources
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceBuilder](self, "sourceBuilder"));
  v4 = objc_msgSend(v3, "userAction");

  if (!v4)
  {
    v5 = objc_alloc((Class)NSUserDefaults);
    v6 = objc_msgSend(v5, "initWithSuiteName:", DOCDefaultsSuiteName);
    v7 = DOCUserDefaultsCachedDisplayNamesBySourceIdentifier;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryForKey:", DOCUserDefaultsCachedDisplayNamesBySourceIdentifier));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sources](self, "sources"));
    v10 = v9;
    if (v8)
      v11 = objc_msgSend(v8, "mutableCopy");
    else
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v9, "count")));
    v12 = v11;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "displayName", (_QWORD)v21));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

    if ((objc_msgSend(v8, "isEqualToDictionary:", v12) & 1) == 0)
      objc_msgSend(v6, "setObject:forKey:", v12, v7);

  }
}

- (void)retrieveSourcesForConfiguration:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000378B0;
  v10[3] = &unk_1005BECD8;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v11 = v8;
  v9 = -[DOCSourceObserver _addSubscriberForConfiguration:usingBlock:](self, "_addSubscriberForConfiguration:usingBlock:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (BOOL)hasReceivedFirstFullUpdate
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver legacyPickers](self, "legacyPickers"));
  if (v3)
  {

    return -[DOCSourceObserver providerNodesFullyPopulated](self, "providerNodesFullyPopulated");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver legacyPickersObserverError](self, "legacyPickersObserverError"));

  if (v4)
    return -[DOCSourceObserver providerNodesFullyPopulated](self, "providerNodesFullyPopulated");
  return 0;
}

- (NSArray)providers
{
  DOCSourceObserver *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver providerNodes](v2, "providerNodes", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "fpDomain"));
        if (v8)
          objc_msgSend(v3, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return (NSArray *)v3;
}

- (NSArray)legacyPickers
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (id)_addSubscriberForConfiguration:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  DOCSourceObserverToken *v8;
  NSObject *v9;
  DOCSourceObserverToken *v10;
  id v11;
  id v12;
  void *v13;
  DOCSourceObserverToken *v14;
  _QWORD block[4];
  DOCSourceObserverToken *v17;
  id v18;
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(DOCSourceObserverToken);
  objc_initWeak(&location, self);
  v9 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FB80;
  block[3] = &unk_1005BEC60;
  objc_copyWeak(&v20, &location);
  v19 = v7;
  v10 = v8;
  v17 = v10;
  v18 = v6;
  v11 = v6;
  v12 = v7;
  dispatch_async(v9, block);

  v13 = v18;
  v14 = v10;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v14;
}

- (void)notifySubscriber:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));

  if (v5)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100060984;
    v17[3] = &unk_1005BED78;
    v6 = v4;
    v18 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v17));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sources](self, "sources"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v7));

    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "block"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "token"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourcesObserverError](self, "sourcesObserverError"));
    ((void (**)(_QWORD, void *, void *, void *))v10)[2](v10, v11, v9, v12);

  }
  else
  {
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "block"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "token"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sources](self, "sources"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourcesObserverError](self, "sourcesObserverError"));
    ((void (**)(_QWORD, void *, void *, void *))v13)[2](v13, v14, v15, v16);

  }
}

- (id)actionManagersFromSources
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sources](self, "sources", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v9, "actionManager") & 1) != 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionManager"));
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = objc_msgSend(v3, "copy");
  return v11;
}

- (void)startObservingSources
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000955C;
  v4[3] = &unk_1005BEA90;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)startObservingLegacyPickers
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;
  uint64_t v8;
  const __CFString *v9;

  objc_initWeak(&location, self);
  v8 = NSExtensionPointName;
  v9 = CFSTR("com.apple.fileprovider-ui");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000147A4;
  v5[3] = &unk_1005BED50;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSExtension beginMatchingExtensionsWithAttributes:completion:](NSExtension, "beginMatchingExtensionsWithAttributes:completion:", v2, v5));

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (int)startObservingDefaultSaveLocation
{
  const char *v2;
  id v3;
  _QWORD handler[4];
  id v6;
  id location;
  int out_token;

  out_token = 0;
  objc_initWeak(&location, self);
  v2 = (const char *)DOCDefaultSaveLocationDidChangeNotification;
  v3 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000C46C8;
  handler[3] = &unk_1005BE5F0;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v2, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

  LODWORD(v2) = out_token;
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return (int)v2;
}

- (NSArray)sources
{
  return self->_sources;
}

- (NSMutableDictionary)sourcesSubscribers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSError)sourcesObserverError
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (_TtC5Files16DOCActionManager)sourcesActionManager
{
  return self->_sourcesActionManager;
}

- (OS_dispatch_queue)sourceObserverQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (DOCSourceBuilder)sourceBuilder
{
  return (DOCSourceBuilder *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSourcesObserverError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setObservationCount:(unint64_t)a3
{
  self->_observationCount = a3;
}

- (void)setLegacyPickersObserverContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setLegacyPickers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setDefaultSaveLocationObserverContext:(int)a3
{
  self->_defaultSaveLocationObserverContext = a3;
}

- (void)retrieveAllSourcesCompletionBlock:(id)a3
{
  -[DOCSourceObserver retrieveSourcesForConfiguration:usingBlock:](self, "retrieveSourcesForConfiguration:usingBlock:", 0, a3);
}

- (unint64_t)observationCount
{
  return self->_observationCount;
}

- (void)notifySubscribers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sources](self, "sources"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver _sourcesByBuildingWithSourceBuilder](self, "_sourcesByBuildingWithSourceBuilder"));
    -[DOCSourceObserver setSources:](self, "setSources:", v4);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourcesSubscribers](self, "sourcesSubscribers", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

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
        -[DOCSourceObserver notifySubscriber:](self, "notifySubscriber:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSError)legacyPickersObserverError
{
  return (NSError *)objc_getProperty(self, a2, 104, 1);
}

- (id)addSubscriber:(id)a3
{
  return -[DOCSourceObserver addSubscriberForConfiguration:usingBlock:](self, "addSubscriberForConfiguration:usingBlock:", 0, a3);
}

- (void)stopObservingSources
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C36A0;
  v4[3] = &unk_1005BEA90;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)removeSubscriberForToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C3808;
  block[3] = &unk_1005BECB0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)domainDisplayNameForItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C390C;
  v8[3] = &unk_1005BED00;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[DOCSourceObserver retrieveAllSourcesCompletionBlock:](self, "retrieveAllSourcesCompletionBlock:", v8);

}

- (void)childrenAdded:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C3BC4;
  block[3] = &unk_1005BECB0;
  objc_copyWeak(&v12, &location);
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)childrenDeleted:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C3D54;
  block[3] = &unk_1005BECB0;
  objc_copyWeak(&v12, &location);
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)childChanged:(id)a3 in:(id)a4 for:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  DOCSourceObserver *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  if (-[DOCSourceObserver isProviderNode:](self, "isProviderNode:", v8))
  {
    v10 = self;
    objc_sync_enter(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver pendingChildPropertyChanges](v10, "pendingChildPropertyChanges"));
    v12 = objc_msgSend(v11, "count");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5));
    if (v11)
    {
      objc_msgSend(v11, "addObject:", v13);

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v13));

      -[DOCSourceObserver setPendingChildPropertyChanges:](v10, "setPendingChildPropertyChanges:", v11);
    }

    objc_sync_exit(v10);
    if (!v12)
    {
      objc_initWeak(&location, v10);
      v14 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](v10, "sourceObserverQueue"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000C3FA8;
      v15[3] = &unk_1005BEA90;
      objc_copyWeak(&v16, &location);
      dispatch_async(v14, v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }

}

- (void)openSyncCompleted:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C4188;
  v6[3] = &unk_1005BEA90;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)nodeShouldBeReloaded:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C427C;
  v6[3] = &unk_1005BEA90;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)updateProviderNodes
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver providerDomainsNode](self, "providerDomainsNode"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iteratorWithOptions:", 0));

  -[DOCSourceObserver setProviderNodesFullyPopulated:](self, "setProviderNodesFullyPopulated:", objc_msgSend(v9, "fullyPopulated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "first"));
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      objc_msgSend(v5, "addObject:", v7);
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "next"));

      v7 = (void *)v8;
    }
    while (v8);
  }
  -[DOCSourceObserver setProviderNodes:](self, "setProviderNodes:", v5);

}

- (NSArray)providerNodes
{
  DOCSourceObserver *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_providerNodes;
  objc_sync_exit(v2);

  return v3;
}

- (void)setProviderNodes:(id)a3
{
  NSObject *v4;
  DOCSourceObserver *v5;
  NSArray *v6;
  NSArray *providerNodes;
  id v8;

  v8 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = self;
  objc_sync_enter(v5);
  if (-[NSArray isEqualToArray:](v5->_providerNodes, "isEqualToArray:", v8))
  {
    objc_sync_exit(v5);

  }
  else
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    providerNodes = v5->_providerNodes;
    v5->_providerNodes = v6;

    objc_sync_exit(v5);
    -[DOCSourceObserver providersChanged](v5, "providersChanged");
    -[DOCSourceObserver sourceObserverQueue_didReceiveSourceUpdate](v5, "sourceObserverQueue_didReceiveSourceUpdate");
  }

}

- (void)providersChanged
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver providers](self, "providers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier", (_QWORD)v14));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  +[FPProviderDomain setDomainCache:](FPProviderDomain, "setDomainCache:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission"));
  objc_msgSend(v13, "cachePersonaStringForProviders:", v6);

}

- (BOOL)isProviderNode:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver providerNodes](self, "providerNodes"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)stopObservingLegacyPickers
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver legacyPickersObserverContext](self, "legacyPickersObserverContext"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceObserver legacyPickersObserverContext](self, "legacyPickersObserverContext"));
    +[NSExtension endMatchingExtensions:](NSExtension, "endMatchingExtensions:", v4);

    -[DOCSourceObserver setLegacyPickersObserverContext:](self, "setLegacyPickersObserverContext:", 0);
  }
}

- (void)stopObservingDefaultSaveLocation
{
  if (-[DOCSourceObserver defaultSaveLocationObserverContext](self, "defaultSaveLocationObserverContext"))
  {
    notify_cancel(-[DOCSourceObserver defaultSaveLocationObserverContext](self, "defaultSaveLocationObserverContext"));
    -[DOCSourceObserver setDefaultSaveLocationObserverContext:](self, "setDefaultSaveLocationObserverContext:", 0);
  }
}

- (void)didReceiveSourceUpdate
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[DOCSourceObserver sourceObserverQueue](self, "sourceObserverQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C47EC;
  v4[3] = &unk_1005BEA90;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)cachedDisplayNameForSourceIdentifier:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  v4 = objc_alloc((Class)NSUserDefaults);
  v5 = objc_msgSend(v4, "initWithSuiteName:", DOCDefaultsSuiteName);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryForKey:", DOCUserDefaultsCachedDisplayNamesBySourceIdentifier));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v3));
  v8 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {

    v7 = 0;
  }

  return v7;
}

- (void)setSourcesActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_sourcesActionManager, a3);
}

- (void)setSourceObserverQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setSourcesSubscribers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)providerNodesFullyPopulated
{
  return self->_providerNodesFullyPopulated;
}

- (void)setProviderNodesFullyPopulated:(BOOL)a3
{
  self->_providerNodesFullyPopulated = a3;
}

- (NSMutableSet)pendingChildPropertyChanges
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPendingChildPropertyChanges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (FINode)providerDomainsNode
{
  return (FINode *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProviderDomainsNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (FINodeObserver)providerDomainsFINodeObserver
{
  return (FINodeObserver *)objc_getProperty(self, a2, 88, 1);
}

- (void)setProviderDomainsFINodeObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setLegacyPickersObserverError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (id)legacyPickersObserverContext
{
  return objc_getProperty(self, a2, 112, 1);
}

- (int)defaultSaveLocationObserverContext
{
  return self->_defaultSaveLocationObserverContext;
}

- (void)setSourceBuilder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBuilder, 0);
  objc_storeStrong(&self->_legacyPickersObserverContext, 0);
  objc_storeStrong((id *)&self->_legacyPickersObserverError, 0);
  objc_storeStrong((id *)&self->_legacyPickers, 0);
  objc_storeStrong((id *)&self->_providerDomainsFINodeObserver, 0);
  objc_storeStrong((id *)&self->_providerDomainsNode, 0);
  objc_storeStrong((id *)&self->_pendingChildPropertyChanges, 0);
  objc_storeStrong((id *)&self->_sourcesSubscribers, 0);
  objc_storeStrong((id *)&self->_sourcesObserverError, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_sourceObserverQueue, 0);
  objc_storeStrong((id *)&self->_sourcesActionManager, 0);
  objc_storeStrong((id *)&self->_providerNodes, 0);
}

@end
