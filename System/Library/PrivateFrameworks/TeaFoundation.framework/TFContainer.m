@implementation TFContainer

- (TFResolver)resolver
{
  return (TFResolver *)(id)BridgedContainer.resolver.getter();
}

- (TFContainer)initWithBundleAssemblies:(id)a3 assemblies:(id)a4
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_190BE530C();
  v5 = sub_190BE530C();
  return (TFContainer *)BridgedContainer.init(bundleAssemblies:assemblies:)(v4, v5);
}

- (TFContainer)init
{
  BridgedContainer.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end
