@implementation Artwork.Placeholder.View

- (_TtCVV11MusicCoreUI7Artwork11Placeholder4View)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCVV11MusicCoreUI7Artwork11Placeholder4View *result;

  v5 = OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_contentView;
  v6 = objc_allocWithZone((Class)UIImageView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtCVV11MusicCoreUI7Artwork11Placeholder4View *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003B2590, "MusicCoreUI/ArtworkPlaceholder.swift", 36, 2, 100, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtCVV11MusicCoreUI7Artwork11Placeholder4View *v2;

  v2 = self;
  Artwork.Placeholder.View.layoutSubviews()();

}

- (_TtCVV11MusicCoreUI7Artwork11Placeholder4View)initWithFrame:(CGRect)a3
{
  _TtCVV11MusicCoreUI7Artwork11Placeholder4View *result;

  result = (_TtCVV11MusicCoreUI7Artwork11Placeholder4View *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.View", 16, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_typedConfiguration);
  v4 = *(void **)&self->typedConfiguration[OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_typedConfiguration];
  v5 = *(void **)&self->typedConfiguration[OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_typedConfiguration
                                         + 8];
  objc_release(*(id *)&self->typedConfiguration[OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_typedConfiguration
                                              + 16]);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_contentView));
}

@end
