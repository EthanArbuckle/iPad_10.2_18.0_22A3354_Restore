@implementation FlowPluginInfo

- (_TtC14SiriKitRuntime14FlowPluginInfo)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime14FlowPluginInfo *)FlowPluginInfo.init(coder:)(a3);
}

- (NSString)description
{
  _TtC14SiriKitRuntime14FlowPluginInfo *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = FlowPluginInfo.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1B5E432E8](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14SiriKitRuntime14FlowPluginInfo *v5;

  v4 = a3;
  v5 = self;
  FlowPluginInfo.encode(with:)((NSCoder)v4);

}

- (_TtC14SiriKitRuntime14FlowPluginInfo)init
{
  _TtC14SiriKitRuntime14FlowPluginInfo *result;

  result = (_TtC14SiriKitRuntime14FlowPluginInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
