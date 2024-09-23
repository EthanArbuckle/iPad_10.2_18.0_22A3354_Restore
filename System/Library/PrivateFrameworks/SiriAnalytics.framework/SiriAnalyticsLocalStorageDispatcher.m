@implementation SiriAnalyticsLocalStorageDispatcher

- (SiriAnalyticsLocalStorageDispatcher)initWithPlusStream:(id)a3
{
  id v4;

  v4 = a3;
  return (SiriAnalyticsLocalStorageDispatcher *)LocalStorageDispatcherShim.init(plusStream:)(a3);
}

- (SiriAnalyticsLocalStorageDispatcher)init
{
  LocalStorageDispatcherShim.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SiriAnalyticsLocalStorageDispatcher_underlying);
}

@end
