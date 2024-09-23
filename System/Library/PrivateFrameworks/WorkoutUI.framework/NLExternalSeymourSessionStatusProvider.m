@implementation NLExternalSeymourSessionStatusProvider

- (BOOL)externalSessionActive
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_isExternalSessionActive;
  swift_beginAccess();
  return *v2;
}

- (void)setExternalSessionActive:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_isExternalSessionActive;
  swift_beginAccess();
  *v4 = a3;
}

- (id)observers
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_observers);
  swift_beginAccess();
  return *v2;
}

- (void)setObservers:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_observers);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NLExternalSeymourSessionStatusProvider)initWithDependenciesWrapper:(id)a3 appBundleIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NLExternalSeymourSessionStatusProvider *v9;

  v4 = sub_24A77B9B0();
  v6 = v5;
  v7 = objc_allocWithZone((Class)type metadata accessor for ExternalSeymourSessionStatusProvider());
  v8 = swift_retain();
  v9 = (NLExternalSeymourSessionStatusProvider *)ExternalSeymourSessionStatusProvider.init(dependencies:appBundleIdentifier:)(v8, v4, v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

- (NLExternalSeymourSessionStatusProvider)init
{
  NLExternalSeymourSessionStatusProvider *result;

  result = (NLExternalSeymourSessionStatusProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_sessionClient);
  swift_release();
  v3 = (char *)self + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_lastUpdateTimestamp;
  v4 = sub_24A778818();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (void)updateStatus
{
  NLExternalSeymourSessionStatusProvider *v2;

  v2 = self;
  ExternalSeymourSessionStatusProvider.updateStatus()();

}

- (void)addObserver:(id)a3
{
  sub_24A73258C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_addObject_);
}

- (void)removeObserver:(id)a3
{
  sub_24A73258C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeObject_);
}

- (void)notifyObservers
{
  NLExternalSeymourSessionStatusProvider *v2;

  v2 = self;
  ExternalSeymourSessionStatusProvider.notifyObservers()();

}

@end
