@implementation WKUIAssetLoadStatusProvider

- (int64_t)assetLoadStatus
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___WKUIAssetLoadStatusProvider_assetLoadStatus);
  swift_beginAccess();
  return *v2;
}

- (void)setAssetLoadStatus:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___WKUIAssetLoadStatusProvider_assetLoadStatus);
  swift_beginAccess();
  *v4 = a3;
}

- (WKUIAssetLoadStatusProvider)initWithWorkoutIdentifier:(id)a3 dependencies:(id)a4 assetLoadStatus:(int64_t)a5 bundleReason:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char *v13;

  v8 = sub_24A77B9B0();
  v10 = v9;
  v11 = *(_QWORD *)((char *)a4 + OBJC_IVAR___SMDependencies_dependencies);
  v12 = objc_allocWithZone((Class)type metadata accessor for WorkoutAssetLoadStatusProvider());
  swift_retain();
  v13 = WorkoutAssetLoadStatusProvider.init(workoutIdentifier:dependencies:assetLoadStatus:bundleReason:)(v8, v10, v11, a5, 2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (WKUIAssetLoadStatusProvider *)v13;
}

- (WKUIAssetLoadStatusProvider)init
{
  WKUIAssetLoadStatusProvider *result;

  result = (WKUIAssetLoadStatusProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___WKUIAssetLoadStatusProvider_assetClient);
  swift_release();
  swift_release();

}

- (void)addObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___WKUIAssetLoadStatusProvider_observers), sel_addObject_, a3);
}

- (void)removeObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___WKUIAssetLoadStatusProvider_observers), sel_removeObject_, a3);
}

@end
