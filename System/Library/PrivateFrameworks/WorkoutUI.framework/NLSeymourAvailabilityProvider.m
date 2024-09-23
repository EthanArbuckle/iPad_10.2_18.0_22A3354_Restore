@implementation NLSeymourAvailabilityProvider

- (int64_t)availability
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___NLSeymourAvailabilityProvider_availability);
  swift_beginAccess();
  return *v2;
}

- (void)setAvailability:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___NLSeymourAvailabilityProvider_availability);
  swift_beginAccess();
  *v4 = a3;
}

- (id)observers
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___NLSeymourAvailabilityProvider_observers);
  swift_beginAccess();
  return *v2;
}

- (void)setObservers:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___NLSeymourAvailabilityProvider_observers);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NLSeymourAvailabilityProvider)initWithDependenciesWrapper:(id)a3
{
  id v3;
  NLSeymourAvailabilityProvider *v4;

  v3 = objc_allocWithZone((Class)type metadata accessor for SeymourAvailabilityProvider());
  swift_retain();
  v4 = (NLSeymourAvailabilityProvider *)SeymourAvailabilityProvider.init(dependencies:)();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (NLSeymourAvailabilityProvider)init
{
  NLSeymourAvailabilityProvider *result;

  result = (NLSeymourAvailabilityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___NLSeymourAvailabilityProvider_subscriptionClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___NLSeymourAvailabilityProvider_contentAvailabilityClient);

}

- (void)update
{
  NLSeymourAvailabilityProvider *v2;

  v2 = self;
  SeymourAvailabilityProvider.update()();

}

- (void)addObserver:(id)a3
{
  sub_24A6B2424((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_addObject_);
}

- (void)removeObserver:(id)a3
{
  sub_24A6B2424((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeObject_);
}

- (void)notifyObservers
{
  NLSeymourAvailabilityProvider *v2;

  v2 = self;
  SeymourAvailabilityProvider.notifyObservers()();

}

@end
