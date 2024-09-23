@implementation BadgeView

- (_TtC16MusicApplication9BadgeView)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  _TtC16MusicApplication9BadgeView *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet) = (Class)&_swiftEmptySetSingleton;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MusicApplication9BadgeView_textStyle) = (Class)UIFontTextStyleBody;
  v4 = a3;
  v5 = UIFontTextStyleBody;

  result = (_TtC16MusicApplication9BadgeView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/BadgeView.swift", 32, 2, 73, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication9BadgeView *v6;

  v5 = a3;
  v6 = self;
  sub_AB9E68((uint64_t)a3);

}

- (_TtC16MusicApplication9BadgeView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication9BadgeView *result;

  result = (_TtC16MusicApplication9BadgeView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.BadgeView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9BadgeView_textStyle));
}

@end
