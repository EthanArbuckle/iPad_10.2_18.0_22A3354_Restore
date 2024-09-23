@implementation ExecutionInputInfo

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static ExecutionInputInfo.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static ExecutionInputInfo.supportsSecureCoding = a3;
}

- (NSString)description
{
  _TtC14SiriKitRuntime18ExecutionInputInfo *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = ExecutionInputInfo.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1B5E432E8](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC14SiriKitRuntime18ExecutionInputInfo)initWithCoder:(id)a3
{
  id v3;
  _TtC14SiriKitRuntime18ExecutionInputInfo *v4;

  v3 = a3;
  v4 = (_TtC14SiriKitRuntime18ExecutionInputInfo *)specialized ExecutionInputInfo.init(coder:)(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14SiriKitRuntime18ExecutionInputInfo *v5;

  v4 = a3;
  v5 = self;
  ExecutionInputInfo.encode(with:)((NSCoder)v4);

}

- (_TtC14SiriKitRuntime18ExecutionInputInfo)init
{
  _TtC14SiriKitRuntime18ExecutionInputInfo *result;

  result = (_TtC14SiriKitRuntime18ExecutionInputInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
