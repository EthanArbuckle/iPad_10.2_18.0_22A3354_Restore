@implementation MPModelArtist.ListConfiguration.View

- (_TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  _TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View *result;

  v4 = OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_favoriteIndicator;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_2E5600();
  v6 = OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_nameLabel;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)UILabel), "init");

  result = (_TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/ArtistListViewController.swift", 47, 2, 487, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View *v2;

  v2 = self;
  sub_2E5D58();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_2E6140(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View)initWithFrame:(CGRect)a3
{
  _TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View *result;

  result = (_TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.View", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_favoriteIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_nameLabel));
  sub_2E8190((uint64_t)self + OBJC_IVAR____TtCVE16MusicApplicationCSo13MPModelArtist17ListConfiguration4View_typedConfiguration);
}

@end
