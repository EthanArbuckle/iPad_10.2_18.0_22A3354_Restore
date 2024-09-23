@implementation ConversationCanHandleResult

- (_TtC14SiriKitRuntime27ConversationCanHandleResult)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime27ConversationCanHandleResult *)ConversationCanHandleResult.init(coder:)(a3);
}

- (void).cxx_destruct
{
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime27ConversationCanHandleResult_reformedInput, &demangling cache variable for type metadata for Input?);
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime27ConversationCanHandleResult_flowIdentifier, (uint64_t *)&demangling cache variable for type metadata for UUID?);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static ConversationCanHandleResult.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static ConversationCanHandleResult.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14SiriKitRuntime27ConversationCanHandleResult *v5;

  v4 = a3;
  v5 = self;
  ConversationCanHandleResult.encode(with:)((NSCoder)v4);

}

- (_TtC14SiriKitRuntime27ConversationCanHandleResult)init
{
  _TtC14SiriKitRuntime27ConversationCanHandleResult *result;

  result = (_TtC14SiriKitRuntime27ConversationCanHandleResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
