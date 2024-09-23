@implementation MessageBase

- (NSString)description
{
  return (NSString *)sub_2468FF3B8(self, (uint64_t)a2, (void (*)(void))sub_24693E694);
}

- (NSString)debugDescription
{
  return (NSString *)sub_2468FF3B8(self, (uint64_t)a2, (void (*)(void))sub_24693E7B4);
}

- (_TtC16SiriMessageTypes11MessageBase)init
{
  MessageBase.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC16SiriMessageTypes11MessageBase_messageId;
  v3 = OUTLINED_FUNCTION_8_12();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
