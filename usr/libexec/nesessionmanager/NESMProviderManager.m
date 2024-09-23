@implementation NESMProviderManager

- (NESMProviderManager)init
{
  NESMProviderManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  uint64_t v8;
  OS_xpc_event_publisher *eventPublisher;
  NSMutableDictionary *v10;
  NSMutableDictionary *registrationMap;
  NSMutableArray *v12;
  NSMutableArray *extensionsBeingUpdated;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NESMProviderManager;
  v2 = -[NESMProviderManager init](&v15, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("NESMProviderManager queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = xpc_event_publisher_create("com.apple.networkextension.provider.matching", v2->_queue);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    eventPublisher = v2->_eventPublisher;
    v2->_eventPublisher = (OS_xpc_event_publisher *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registrationMap = v2->_registrationMap;
    v2->_registrationMap = v10;

    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    extensionsBeingUpdated = v2->_extensionsBeingUpdated;
    v2->_extensionsBeingUpdated = v12;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTerminationOperations, 0);
  objc_storeStrong((id *)&self->_extensionsBeingUpdated, 0);
  objc_storeStrong((id *)&self->_registrationMap, 0);
  objc_storeStrong((id *)&self->_eventPublisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
