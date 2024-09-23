@implementation RemoteConversationSpeechData

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriKitRuntime28RemoteConversationSpeechData_userSpecificInfo));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriKitRuntime28RemoteConversationSpeechData_speechPackage));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime28RemoteConversationSpeechData_asrLocation;
  v4 = type metadata accessor for ExecutionLocation();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC14SiriKitRuntime28RemoteConversationSpeechData_nlLocation, v4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14SiriKitRuntime28RemoteConversationSpeechData *v5;

  v4 = a3;
  v5 = self;
  RemoteConversationSpeechData.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static RemoteConversationSpeechData.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static RemoteConversationSpeechData.supportsSecureCoding = a3;
}

- (_TtC14SiriKitRuntime28RemoteConversationSpeechData)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime28RemoteConversationSpeechData *)RemoteConversationSpeechData.init(coder:)(a3);
}

- (_TtC14SiriKitRuntime28RemoteConversationSpeechData)init
{
  _TtC14SiriKitRuntime28RemoteConversationSpeechData *result;

  result = (_TtC14SiriKitRuntime28RemoteConversationSpeechData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
