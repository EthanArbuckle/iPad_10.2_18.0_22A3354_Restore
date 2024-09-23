@implementation TUITemplateFactory

- (TUITemplateFactory)initWithRegistry:(id)a3
{
  id v5;
  TUITemplateFactory *v6;
  TUITemplateFactory *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *cacheQueue;
  NSMutableDictionary *v12;
  NSMutableDictionary *prebuiltTemplates;
  uint64_t v14;
  NSHashTable *prebuiltPackages;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TUITemplateFactory;
  v6 = -[TUITemplateFactory init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_registry, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("TUITemplateFactory.cache", v9);
    cacheQueue = v7->_cacheQueue;
    v7->_cacheQueue = (OS_dispatch_queue *)v10;

    v12 = objc_opt_new(NSMutableDictionary);
    prebuiltTemplates = v7->_prebuiltTemplates;
    v7->_prebuiltTemplates = v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    prebuiltPackages = v7->_prebuiltPackages;
    v7->_prebuiltPackages = (NSHashTable *)v14;

  }
  return v7;
}

- (void)registerPackage:(id)a3
{
  NSObject *cacheQueue;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if ((objc_opt_respondsToSelector(v5, "prebuiltTemplates") & 1) != 0)
  {
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_154CB4;
    block[3] = &unk_23F2B8;
    block[4] = self;
    v7 = v5;
    dispatch_sync(cacheQueue, block);

  }
}

- (void)unregisterPackage:(id)a3
{
  NSObject *cacheQueue;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if ((objc_opt_respondsToSelector(v5, "prebuiltTemplates") & 1) != 0)
  {
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_154EEC;
    block[3] = &unk_23F2B8;
    block[4] = self;
    v7 = v5;
    dispatch_sync(cacheQueue, block);

  }
}

- (void)unregisterAllPackages
{
  NSObject *cacheQueue;
  _QWORD block[5];

  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1550FC;
  block[3] = &unk_241D08;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
}

- (void)debugPackages
{
  NSObject *cacheQueue;
  _QWORD block[5];

  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_155184;
  block[3] = &unk_241D08;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
}

- (id)_prebuiltTemplateForURL:(id)a3 looseMatch:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *cacheQueue;
  id v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1554AC;
  v25 = sub_1554BC;
  v26 = 0;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v6, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByStandardizingPath"));
    objc_msgSend(v7, "setPath:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1554C4;
    block[3] = &unk_242D10;
    v19 = &v21;
    block[4] = self;
    v17 = v10;
    v20 = a4;
    v18 = v6;
    v12 = v10;
    dispatch_sync(cacheQueue, block);

    v13 = (void *)v22[5];
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;
  _Block_object_dispose(&v21, 8);

  return v14;
}

- (id)templateFromURL:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[TUITemplateFactory templateFromURL:looseMatch:](self, "templateFromURL:looseMatch:", a3, 0));
}

- (id)templateFromURL:(id)a3 looseMatch:(BOOL)a4
{
  return (id)objc_claimAutoreleasedReturnValue(-[TUITemplateFactory _prebuiltTemplateForURL:looseMatch:](self, "_prebuiltTemplateForURL:looseMatch:", a3, a4));
}

- (TUIElementRegistry)registry
{
  return self->_registry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_prebuiltTemplates, 0);
  objc_storeStrong((id *)&self->_prebuiltPackages, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

@end
