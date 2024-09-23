@implementation AdjustedVideoView

- (_TtC10ProductKit17AdjustedVideoView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  _TtC10ProductKit17AdjustedVideoView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_featureHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_startedHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_completedHandler);
  *v6 = 0;
  v6[1] = 0;
  v7 = a3;

  result = (_TtC10ProductKit17AdjustedVideoView *)sub_213B2C38C();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC10ProductKit17AdjustedVideoView *v6;

  v5 = a3;
  v6 = self;
  sub_213B1C5BC(a3);

}

- (_TtC10ProductKit17AdjustedVideoView)initWithFrame:(CGRect)a3
{
  _TtC10ProductKit17AdjustedVideoView *result;

  result = (_TtC10ProductKit17AdjustedVideoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_213AD6270((uint64_t)self + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_configuration, &qword_254D18C58);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_mediaPlayerView));
  swift_bridgeObjectRelease();
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_featureHandler));
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_startedHandler));
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_completedHandler));
}

@end
