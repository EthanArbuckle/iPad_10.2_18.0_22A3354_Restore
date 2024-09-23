@implementation FMMapOptionsView

- (_TtC6FindMy16FMMapOptionsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100264E70();
}

- (void)mapSettingsButtonAction
{
  _TtC6FindMy16FMMapOptionsView *v2;

  v2 = self;
  sub_100264080();

}

- (void)perspectiveButtonActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy16FMMapOptionsView *v5;

  v4 = a3;
  v5 = self;
  sub_100265004();

}

- (_TtC6FindMy16FMMapOptionsView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy16FMMapOptionsView *result;

  result = (_TtC6FindMy16FMMapOptionsView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMMapOptionsView", 23, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_mediator));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_firstPlatterSeparatorView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_userLocationButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_perspectiveButtonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_perspective2dButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_perspective3dButton));
  swift_release(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy16FMMapOptionsView_set3DPerspectiveEnabled]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_selectionSubscription));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_locationSubscription));
}

@end
