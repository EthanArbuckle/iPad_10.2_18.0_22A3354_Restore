@implementation FMActionLandingView

- (_TtC6FindMy19FMActionLandingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001827B8();
}

- (void)scrollViewDidScroll:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  id v6;
  _TtC6FindMy19FMActionLandingView *v7;

  v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy19FMActionLandingView_scrollHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->performButton[OBJC_IVAR____TtC6FindMy19FMActionLandingView_scrollHandler];
    v6 = a3;
    v7 = self;
    sub_1000A190C((uint64_t)v3, v5);
    v3(v6);
    sub_1000327F0((uint64_t)v3, v5);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy19FMActionLandingView *v6;

  v5 = a3;
  v6 = self;
  sub_100182074((uint64_t)a3);

}

- (void)layoutSubviews
{
  _TtC6FindMy19FMActionLandingView *v2;

  v2 = self;
  sub_100182190();

}

- (_TtC6FindMy19FMActionLandingView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy19FMActionLandingView *result;

  result = (_TtC6FindMy19FMActionLandingView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMActionLandingView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_bulletedListView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_scrollContentView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_deviceContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_deviceImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_deviceNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_deviceOwnerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_heightConstraint));

  swift_bridgeObjectRelease(*(_QWORD *)&self->performButton[OBJC_IVAR____TtC6FindMy19FMActionLandingView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->performButton[OBJC_IVAR____TtC6FindMy19FMActionLandingView_footnote]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->performButton[OBJC_IVAR____TtC6FindMy19FMActionLandingView_action]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->performButton[OBJC_IVAR____TtC6FindMy19FMActionLandingView_deviceName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->performButton[OBJC_IVAR____TtC6FindMy19FMActionLandingView_deviceOwner]);
  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy19FMActionLandingView_scrollHandler), *(_QWORD *)&self->performButton[OBJC_IVAR____TtC6FindMy19FMActionLandingView_scrollHandler]);
}

@end
