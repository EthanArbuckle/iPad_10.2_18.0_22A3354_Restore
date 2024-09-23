@implementation AudiobookTOCCell

- (_TtC5Books16AudiobookTOCCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC5Books16AudiobookTOCCell *)sub_10047A98C(a3, (uint64_t)a4, v6);
}

- (_TtC5Books16AudiobookTOCCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10047C3C4();
}

- (void)prepareForReuse
{
  _TtC5Books16AudiobookTOCCell *v2;

  v2 = self;
  sub_10047B51C();

}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_10035B798(self, (uint64_t)a2, (void (*)(void))sub_10047B6C0);
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_10047BF00(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_10035B798(self, (uint64_t)a2, (void (*)(void))sub_10047B91C);
}

- (void)setAccessibilityValue:(id)a3
{
  sub_10047BF00(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityValue_);
}

- (NSArray)accessibilityUserInputLabels
{
  _TtC5Books16AudiobookTOCCell *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10047BFE4();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityUserInputLabels:(id)a3
{
  uint64_t v4;
  _TtC5Books16AudiobookTOCCell *v5;
  NSArray v6;
  _TtC5Books16AudiobookTOCCell *v7;
  objc_super v8;

  if (a3)
  {
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
    v5 = self;
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v7 = self;
    v6.super.isa = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AudiobookTOCCell();
  -[AudiobookTOCCell setAccessibilityUserInputLabels:](&v8, "setAccessibilityUserInputLabels:", v6.super.isa);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->chapterTitle[OBJC_IVAR____TtC5Books16AudiobookTOCCell_chapterTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->chapterTitle[OBJC_IVAR____TtC5Books16AudiobookTOCCell_chapterTime]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->chapterTitle[OBJC_IVAR____TtC5Books16AudiobookTOCCell_accessibleChapterTime]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books16AudiobookTOCCell_chapterTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books16AudiobookTOCCell_chapterTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books16AudiobookTOCCell_bookmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books16AudiobookTOCCell_nowPlayingIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books16AudiobookTOCCell_nowPlayingView));
}

@end
