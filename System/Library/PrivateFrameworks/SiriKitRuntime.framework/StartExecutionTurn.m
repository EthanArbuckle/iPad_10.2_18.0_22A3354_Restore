@implementation StartExecutionTurn

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static StartExecutionTurn.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static StartExecutionTurn.supportsSecureCoding = a3;
}

- (_TtC14SiriKitRuntime18StartExecutionTurn)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime18StartExecutionTurn *)StartExecutionTurn.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14SiriKitRuntime18StartExecutionTurn *v5;

  v4 = a3;
  v5 = self;
  StartExecutionTurn.encode(with:)((NSCoder)v4);

}

- (NSString)debugDescription
{
  _TtC14SiriKitRuntime18StartExecutionTurn *v2;
  uint64_t started;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  started = StartExecutionTurn.debugDescription.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1B5E432E8](started, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC14SiriKitRuntime18StartExecutionTurn)init
{
  _TtC14SiriKitRuntime18StartExecutionTurn *result;

  result = (_TtC14SiriKitRuntime18StartExecutionTurn *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
