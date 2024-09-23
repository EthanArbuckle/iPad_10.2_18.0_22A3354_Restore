@implementation RequestContextData

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_audioSource, (uint64_t *)&demangling cache variable for type metadata for AudioSource?);
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_audioDestination, &demangling cache variable for type metadata for AudioDestination?);
  v3 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_responseMode;
  v4 = type metadata accessor for ResponseMode();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_approximatePreviousTTSInterval, (uint64_t *)&demangling cache variable for type metadata for DateInterval?);
  v5 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_restrictions;
  v6 = type metadata accessor for Restrictions();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_positionInSession;
  v8 = type metadata accessor for RequestPositionInSession();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

}

- (NSString)debugDescription
{
  _TtC14SiriKitRuntime18RequestContextData *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = RequestContextData.debugDescription.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1B5E432E8](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14SiriKitRuntime18RequestContextData *v5;

  v4 = a3;
  v5 = self;
  RequestContextData.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static RequestContextData.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static RequestContextData.supportsSecureCoding = a3;
}

- (_TtC14SiriKitRuntime18RequestContextData)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime18RequestContextData *)RequestContextData.init(coder:)(a3);
}

- (_TtC14SiriKitRuntime18RequestContextData)init
{
  _TtC14SiriKitRuntime18RequestContextData *result;

  result = (_TtC14SiriKitRuntime18RequestContextData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
