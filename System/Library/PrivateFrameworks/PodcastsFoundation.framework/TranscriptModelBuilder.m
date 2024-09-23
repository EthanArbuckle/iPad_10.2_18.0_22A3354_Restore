@implementation TranscriptModelBuilder

- (void)parser:(id)a3 didStartElementType:(int64_t)a4
{
  id v6;
  _TtC18PodcastsFoundation22TranscriptModelBuilder *v7;

  v6 = a3;
  v7 = self;
  sub_1A9201984(v6, a4);

}

- (void)parser:(id)a3 didEndElementType:(int64_t)a4
{
  id v6;
  _TtC18PodcastsFoundation22TranscriptModelBuilder *v7;

  v6 = a3;
  v7 = self;
  sub_1A92022E4((uint64_t *)a4);

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC18PodcastsFoundation22TranscriptModelBuilder *v10;

  v6 = sub_1A93F8040();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1A920275C(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)parserDidStartDocument:(id)a3
{
  id v4;
  _TtC18PodcastsFoundation22TranscriptModelBuilder *v5;

  v4 = a3;
  v5 = self;
  sub_1A9202974();

}

- (void)parserDidEndDocument:(id)a3
{
  id v4;
  _TtC18PodcastsFoundation22TranscriptModelBuilder *v5;

  v4 = a3;
  v5 = self;
  sub_1A9202C4C();

}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6;
  _TtC18PodcastsFoundation22TranscriptModelBuilder *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1A9202F9C(v8, "Error parsing TTML: %@");

}

- (void)parser:(id)a3 validationErrorOccurred:(id)a4
{
  id v6;
  _TtC18PodcastsFoundation22TranscriptModelBuilder *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1A9202F9C(v8, "Error validating TTML: %@");

}

- (_TtC18PodcastsFoundation22TranscriptModelBuilder)init
{
  return (_TtC18PodcastsFoundation22TranscriptModelBuilder *)TranscriptModelBuilder.init()();
}

- (void).cxx_destruct
{
  sub_1A92022B4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation22TranscriptModelBuilder_currentParagraph), *(_QWORD *)&self->currentParagraph[OBJC_IVAR____TtC18PodcastsFoundation22TranscriptModelBuilder_currentParagraph], *(_QWORD *)&self->currentParagraph[OBJC_IVAR____TtC18PodcastsFoundation22TranscriptModelBuilder_currentParagraph + 8], *(_QWORD *)&self->currentParagraph[OBJC_IVAR____TtC18PodcastsFoundation22TranscriptModelBuilder_currentParagraph+ 16], *(_QWORD *)&self->currentParagraph[OBJC_IVAR____TtC18PodcastsFoundation22TranscriptModelBuilder_currentParagraph+ 24]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end
