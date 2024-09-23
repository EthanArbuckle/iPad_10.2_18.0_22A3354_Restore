@implementation TaggedSSML

- (NSArray)ssmlSnippets
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for VoiceTaggedSSMLSnippet();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A3AB4BA4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSsmlSnippets:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for VoiceTaggedSSMLSnippet();
  v4 = sub_1A3AB4BB0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12TextToSpeech10TaggedSSML_ssmlSnippets);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)originalSSML
{
  return (NSString *)sub_1A39CA81C();
}

- (void)setOriginalSSML:(id)a3
{
  sub_1A39CA898((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12TextToSpeech10TaggedSSML_originalSSML);
}

- (_TtC12TextToSpeech10TaggedSSML)init
{
  _TtC12TextToSpeech10TaggedSSML *result;

  result = (_TtC12TextToSpeech10TaggedSSML *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
