@implementation DeprecatedChapterCell

- (_TtC12NowPlayingUI21DeprecatedChapterCell)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI21DeprecatedChapterCell *)sub_1606C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI21DeprecatedChapterCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_161CF4();
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12NowPlayingUI21DeprecatedChapterCell *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_1609F0(v4, v6);

}

- (BOOL)wantsNowPlayingIndicator
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_wantsNowPlayingIndicator];
}

- (void)setWantsNowPlayingIndicator:(BOOL)a3
{
  int v3;

  v3 = self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_wantsNowPlayingIndicator];
  self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_wantsNowPlayingIndicator] = a3;
  if (v3 != a3)
    -[DeprecatedChapterCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  _TtC12NowPlayingUI21DeprecatedChapterCell *v2;

  v2 = self;
  sub_160CB8();

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  return 0;
}

- (double)accessibilityDuration
{
  return *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_accessibilityDuration];
}

- (void)setAccessibilityDuration:(double)a3
{
  *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_accessibilityDuration] = a3;
}

- (NSString)accessibilityTitle
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (BOOL)accessibilityWantsNowPlayingIndicator
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_wantsNowPlayingIndicator];
}

- (int64_t)accessibilityPlaybackState
{
  return *(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_playbackState];
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_title]);
  v3 = *(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_textComponents];
  swift_release(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_textComponents]);
  swift_release(v3);

}

@end
