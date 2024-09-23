@implementation TVSessionWatchDiscoveryView

- (_TtC9SeymourUI27TVSessionWatchDiscoveryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B96DA38();
}

- (void)didTapStartStandaloneButton
{
  void (*v2)(uint64_t);
  _TtC9SeymourUI27TVSessionWatchDiscoveryView *v3;
  uint64_t v4;

  v2 = (void (*)(uint64_t))(*(_QWORD **)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_presenter))[2];
  v3 = self;
  if (v2)
  {
    v4 = sub_22B0FAA58((uint64_t)v2);
    v2(v4);
    sub_22B0FAA68((uint64_t)v2);
  }
  -[TVSessionWatchDiscoveryView removeFromSuperview](self, sel_removeFromSuperview);

}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_startStandaloneButton);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI27TVSessionWatchDiscoveryView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI27TVSessionWatchDiscoveryView *result;

  result = (_TtC9SeymourUI27TVSessionWatchDiscoveryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_spinnerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_lookingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_checkLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_startStandaloneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_connectingView));
}

@end
