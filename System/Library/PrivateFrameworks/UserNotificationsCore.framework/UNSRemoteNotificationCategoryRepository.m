@implementation UNSRemoteNotificationCategoryRepository

- (UNSRemoteNotificationCategoryRepository)initWithServiceClient:(id)a3
{
  id v5;
  UNSRemoteNotificationCategoryRepository *v6;
  UNSRemoteNotificationCategoryRepository *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  UNCKeyedObservable *v12;
  UNCKeyedObservable *observable;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UNSRemoteNotificationCategoryRepository;
  v6 = -[UNSRemoteNotificationCategoryRepository init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceClient, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.UserNotificationsCore.UNSRemoteNotificationCategoryRepository", v8);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.UserNotificationsCore.UNSRemoteNotificationCategoryRepository.call-out", v10);

    v12 = -[UNCKeyedObservable initWithQueue:callOutQueue:]([UNCKeyedObservable alloc], "initWithQueue:callOutQueue:", v9, v11);
    observable = v7->_observable;
    v7->_observable = v12;

  }
  return v7;
}

- (void)notifyDidChangeCategoriesForBundleIdentifier:(id)a3
{
  id v4;
  UNCKeyedObservable *observable;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observable = self->_observable;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__UNSRemoteNotificationCategoryRepository_notifyDidChangeCategoriesForBundleIdentifier___block_invoke;
  v7[3] = &unk_251AE02C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[UNCKeyedObservable notifyObserversKey:usingBlock:](observable, "notifyObserversKey:usingBlock:", v6, v7);

}

uint64_t __88__UNSRemoteNotificationCategoryRepository_notifyDidChangeCategoriesForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "categoryRepository:didChangeCategoriesForBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  -[UNCKeyedObservable addObserver:forKey:](self->_observable, "addObserver:forKey:", a3, a4);
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
  -[UNCKeyedObservable removeObserver:forKey:](self->_observable, "removeObserver:forKey:", a3, a4);
}

- (id)allBundleIdentifiers
{
  return (id)-[UNCNotificationCommonServiceServerProtocol allBundleIdentifiersForCategories](self->_serviceClient, "allBundleIdentifiersForCategories");
}

- (id)categoryWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return (id)-[UNCNotificationCommonServiceServerProtocol categoryForIdentifier:bundleIdentifier:](self->_serviceClient, "categoryForIdentifier:bundleIdentifier:", a3, a4);
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  return (id)-[UNCNotificationCommonServiceServerProtocol categoriesForBundleIdentifier:](self->_serviceClient, "categoriesForBundleIdentifier:", a3);
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  -[UNCNotificationCommonServiceServerProtocol setCategories:forBundleIdentifier:](self->_serviceClient, "setCategories:forBundleIdentifier:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_serviceClient, 0);
}

@end
