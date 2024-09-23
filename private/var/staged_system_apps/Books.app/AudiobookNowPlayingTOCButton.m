@implementation AudiobookNowPlayingTOCButton

- (BOOL)hasSupplementalContent
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_hasSupplementalContent);
}

- (void)setHasSupplementalContent:(BOOL)a3
{
  int v3;
  _TtC5Books28AudiobookNowPlayingTOCButton *v4;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_hasSupplementalContent);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_hasSupplementalContent) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1002829EC();

  }
}

- (_TtC5Books28AudiobookNowPlayingTOCButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Books28AudiobookNowPlayingTOCButton *)sub_1002823D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AudiobookNowPlayingTOCButton();
  -[AudiobookNowPlayingTOCButton setImage:forState:](&v6, "setImage:forState:", a3, a4);
}

- (_TtC5Books28AudiobookNowPlayingTOCButton)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC5Books28AudiobookNowPlayingTOCButton *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_hasSupplementalContent) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_platterColor) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_docIconColor) = 0;
  v4 = OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_supplementalView;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_100281FA4();

  result = (_TtC5Books28AudiobookNowPlayingTOCButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/AudiobookNowPlayingTOCButton.swift", 40, 2, 93, 0);
  __break(1u);
  return result;
}

- (NSString)accessibilityValue
{
  _TtC5Books28AudiobookNowPlayingTOCButton *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100282CC4();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC5Books28AudiobookNowPlayingTOCButton *v6;
  NSString v7;
  _TtC5Books28AudiobookNowPlayingTOCButton *v8;
  objc_super v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AudiobookNowPlayingTOCButton();
  -[AudiobookNowPlayingTOCButton setAccessibilityValue:](&v9, "setAccessibilityValue:", v7);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_platterColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_docIconColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_supplementalView));
}

@end
