@implementation SUIdleTracker

- (SUIdleTracker)initWithName:(id)a3 queue:(id)a4 timeoutSeconds:(int64_t)a5 timeoutAction:(id)a6
{
  void *v7;
  id v8;
  SUIdleTracker *result;

  v7 = _Block_copy(a6);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v8 = a4;
  IdleTracker.init(name:queue:timeoutSeconds:timeoutAction:)();
  return result;
}

- (SUIdleTracker)initWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  SUIdleTracker *result;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  IdleTracker.init(name:)(v3, v4);
  return result;
}

- (BOOL)idle
{
  SUIdleTracker *v2;
  char v3;

  v2 = self;
  v3 = IdleTracker.idle.getter();

  return v3 & 1;
}

- (int64_t)count
{
  SUIdleTracker *v2;
  int64_t v3;

  v2 = self;
  v3 = IdleTracker.count.getter();

  return v3;
}

- (id)track
{
  SUIdleTracker *v2;
  void *v3;
  void *v4;

  v2 = self;
  IdleTracker.track()();
  v4 = v3;

  return v4;
}

- (id)trackWithName:(id)a3
{
  id v4;
  SUIdleTracker *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  IdleTracker.track(name:)();
  v7 = v6;

  return v7;
}

- (SUIdleTracker)init
{
  IdleTracker.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR___SUIdleTracker_timeout;
  v4 = OUTLINED_FUNCTION_7_15();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SUIdleTracker_lock);
}

@end
