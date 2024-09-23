@implementation TVShowPlayBarView

- (_TtC16MusicApplication17TVShowPlayBarView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication17TVShowPlayBarView *result;

  sub_5414E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC16MusicApplication17TVShowPlayBarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_542228();
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC16MusicApplication17TVShowPlayBarView *v8;
  id v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v9 = a3;
  v8 = self;
  sub_54199C(v5, v7);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication17TVShowPlayBarView *v2;

  v2 = self;
  sub_541A84();

}

- (UIButton)accessibilityPlayButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_playButton));
}

- (UIControl)accessibilityContextualActionsButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_contextualActionsButton));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_title]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_playButtonHandler), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_playButtonHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_buildMenu), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_buildMenu]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_playButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_contextualActionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowPlayBarView_titleLabel));
}

@end
