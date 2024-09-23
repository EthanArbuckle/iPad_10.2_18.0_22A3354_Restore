@implementation FlowTaskXPC

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14SiriKitRuntime11FlowTaskXPC *v5;

  v4 = a3;
  v5 = self;
  FlowTaskXPC.encode(with:)((NSCoder)v4);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_creationTime;
  v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14SiriKitRuntime11FlowTaskXPC)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime11FlowTaskXPC *)FlowTaskXPC.init(coder:)(a3);
}

- (NSString)description
{
  _TtC14SiriKitRuntime11FlowTaskXPC *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = FlowTaskXPC.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1B5E432E8](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC14SiriKitRuntime11FlowTaskXPC)init
{
  _TtC14SiriKitRuntime11FlowTaskXPC *result;

  result = (_TtC14SiriKitRuntime11FlowTaskXPC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
