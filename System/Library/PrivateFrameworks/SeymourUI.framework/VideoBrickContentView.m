@implementation VideoBrickContentView

- (_TtC9SeymourUI21VideoBrickContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6FCF80();
}

- (_TtC9SeymourUI21VideoBrickContentView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI21VideoBrickContentView *result;

  result = (_TtC9SeymourUI21VideoBrickContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];
  uint64_t v8;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_artworkView));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_fetchArtworkHandler));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_fetchFallbackArtworkHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_completedIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_recencyIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_labelLayoutGuide));
  v3 = *(_OWORD *)((char *)&self->super._viewFlags + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout + 8);
  v7[6] = *(_OWORD *)((char *)&self->super._viewDelegate + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[7] = v3;
  v8 = *(_QWORD *)((char *)&self->super._viewFlags + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout + 24);
  v4 = *(_OWORD *)((char *)&self->super._swiftAnimationInfo + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[2] = *(_OWORD *)((char *)&self->super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[3] = v4;
  v5 = *(_OWORD *)((char *)&self->super._window + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[4] = *(_OWORD *)((char *)&self->super._layerRetained + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[5] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[0] = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[1] = v6;
  sub_22B186048((uint64_t)v7);
}

@end
