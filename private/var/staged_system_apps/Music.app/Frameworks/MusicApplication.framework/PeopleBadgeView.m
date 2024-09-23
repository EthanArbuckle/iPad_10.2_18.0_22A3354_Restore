@implementation PeopleBadgeView

- (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView)init
{
  return (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView *)sub_8676EC();
}

- (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_socialPersons) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_artworkCachingReference) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_visibleArtworkComponents) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_reusableArtworkComponents) = (Class)_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/SocialProfilesAccessoryView.swift", 50, 2, 130, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_867478();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView *v2;

  v2 = self;
  sub_867CDC();

}

- (void)clearArtworkCatalogs
{
  _TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView *v2;

  v2 = self;
  sub_867FC0();

}

- (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView *result;

  result = (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.PeopleBadgeView", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_socialPersons));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_artworkCachingReference));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_visibleArtworkComponents));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_reusableArtworkComponents));
}

@end
