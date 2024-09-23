@implementation TranscriptWaitingImageView

- (_TtC10VoiceMemos26TranscriptWaitingImageView)init
{
  return (_TtC10VoiceMemos26TranscriptWaitingImageView *)sub_1000F36C8();
}

- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithCoder:(id)a3
{
  id v3;
  _TtC10VoiceMemos26TranscriptWaitingImageView *result;

  v3 = a3;
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease(0xE000000000000000);
  result = (_TtC10VoiceMemos26TranscriptWaitingImageView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100182210, "VoiceMemos/SwiftHelpers.swift", 29, 2, 12, 0, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC10VoiceMemos26TranscriptWaitingImageView *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  v2 = self;
  v3 = -[TranscriptWaitingImageView image](v2, "image");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "size");
    v6 = v5;
    objc_msgSend(v4, "size");

    v7 = nullsub_8(v6);
    v9 = v8;
  }
  else
  {
    v14.receiver = v2;
    v14.super_class = (Class)type metadata accessor for TranscriptWaitingImageView();
    -[TranscriptWaitingImageView intrinsicContentSize](&v14, "intrinsicContentSize");
    v7 = v10;
    v9 = v11;

  }
  v12 = v7;
  v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithImage:(id)a3
{
  id v3;
  _TtC10VoiceMemos26TranscriptWaitingImageView *result;

  v3 = a3;
  result = (_TtC10VoiceMemos26TranscriptWaitingImageView *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.TranscriptWaitingImageView", 37, "init(image:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC10VoiceMemos26TranscriptWaitingImageView *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC10VoiceMemos26TranscriptWaitingImageView *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.TranscriptWaitingImageView", 37, "init(image:highlightedImage:)", 29, 0);
  __break(1u);
  return result;
}

- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithFrame:(CGRect)a3
{
  _TtC10VoiceMemos26TranscriptWaitingImageView *result;

  result = (_TtC10VoiceMemos26TranscriptWaitingImageView *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.TranscriptWaitingImageView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
