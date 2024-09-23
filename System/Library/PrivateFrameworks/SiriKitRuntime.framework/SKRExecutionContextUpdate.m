@implementation SKRExecutionContextUpdate

- (SKRExecutionContextUpdate)initWithCoder:(id)a3
{
  return (SKRExecutionContextUpdate *)ExecutionContextUpdate.init(coder:)(a3);
}

- (NSString)debugDescription
{
  SKRExecutionContextUpdate *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = ExecutionContextUpdate.debugDescription.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1B5E432E8](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t updated;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR___SKRExecutionContextUpdate_undoDirectInvocation, &demangling cache variable for type metadata for Parse.DirectInvocation?);
  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR___SKRExecutionContextUpdate_pommesContext, (uint64_t *)&demangling cache variable for type metadata for PommesContext?);
  v3 = (char *)self + OBJC_IVAR___SKRExecutionContextUpdate_contextUpdateScope;
  updated = type metadata accessor for ContextUpdateScope();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(updated - 8) + 8))(v3, updated);
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static ExecutionContextUpdate.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static ExecutionContextUpdate.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SKRExecutionContextUpdate *v5;

  v4 = a3;
  v5 = self;
  ExecutionContextUpdate.encode(with:)((NSCoder)v4);

}

- (SKRExecutionContextUpdate)init
{
  SKRExecutionContextUpdate *result;

  result = (SKRExecutionContextUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
