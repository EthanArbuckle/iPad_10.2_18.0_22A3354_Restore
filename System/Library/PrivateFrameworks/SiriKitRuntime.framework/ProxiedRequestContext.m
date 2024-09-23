@implementation ProxiedRequestContext

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14SiriKitRuntime21ProxiedRequestContext *v5;

  v4 = a3;
  v5 = self;
  ProxiedRequestContext.encode(with:)((NSCoder)v4);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime21ProxiedRequestContext_interactionType;
  v4 = type metadata accessor for InteractionType();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime21ProxiedRequestContext_inputOrigin;
  v6 = type metadata accessor for InputOrigin();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime21ProxiedRequestContext_bargeInContext, (uint64_t *)&demangling cache variable for type metadata for BargeInContext?);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriKitRuntime21ProxiedRequestContext_aceRemoteExecution));
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static ProxiedRequestContext.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static ProxiedRequestContext.supportsSecureCoding = a3;
}

- (_TtC14SiriKitRuntime21ProxiedRequestContext)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime21ProxiedRequestContext *)ProxiedRequestContext.init(coder:)(a3);
}

- (_TtC14SiriKitRuntime21ProxiedRequestContext)init
{
  _TtC14SiriKitRuntime21ProxiedRequestContext *result;

  result = (_TtC14SiriKitRuntime21ProxiedRequestContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
