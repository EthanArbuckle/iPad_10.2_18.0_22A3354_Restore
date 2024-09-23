@implementation TranscriptView.FadeView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_100005310(0, &qword_1001EC560, CABackdropLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtCC10VoiceMemos14TranscriptViewP33_6FF8C368E5F76B04FE059DBB2DCAB8DB8FadeView)initWithCoder:(id)a3
{
  id v3;
  _TtCC10VoiceMemos14TranscriptViewP33_6FF8C368E5F76B04FE059DBB2DCAB8DB8FadeView *result;

  v3 = a3;
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease(0xE000000000000000);
  result = (_TtCC10VoiceMemos14TranscriptViewP33_6FF8C368E5F76B04FE059DBB2DCAB8DB8FadeView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100182210, "VoiceMemos/SwiftHelpers.swift", 29, 2, 12, 0, 0);
  __break(1u);
  return result;
}

- (_TtCC10VoiceMemos14TranscriptViewP33_6FF8C368E5F76B04FE059DBB2DCAB8DB8FadeView)initWithFrame:(CGRect)a3
{
  sub_1000F116C((uint64_t)self, (uint64_t)a2, (uint64_t)"VoiceMemos.FadeView", 19);
}

@end
