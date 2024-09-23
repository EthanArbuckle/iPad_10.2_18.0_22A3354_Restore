@implementation CarPlayAudiobookData

- (NSString)description
{
  _TtC5Books20CarPlayAudiobookData *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1001E1FD8();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC5Books20CarPlayAudiobookData)init
{
  _TtC5Books20CarPlayAudiobookData *result;

  result = (_TtC5Books20CarPlayAudiobookData *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000022, 0x80000001007B4470, "Books/CarPlayAudiobookData.swift", 32, 2, 29, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC5Books20CarPlayAudiobookData_title]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books20CarPlayAudiobookData_chapters));
}

@end
