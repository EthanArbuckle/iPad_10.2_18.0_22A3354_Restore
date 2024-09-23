@implementation ToastContainerView

- (_TtC5Books18ToastContainerView)init
{
  return (_TtC5Books18ToastContainerView *)sub_1003DB818();
}

- (_TtC5Books18ToastContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003DC2C4();
}

- (void)addInteraction:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ToastContainerView_containerView), "addInteraction:", a3);
}

- (void)removeInteraction:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ToastContainerView_containerView), "removeInteraction:", a3);
}

- (NSArray)interactions
{
  void *v2;
  _TtC5Books18ToastContainerView *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ToastContainerView_containerView);
  v3 = self;
  v4 = objc_msgSend(v2, "interactions");
  v5 = sub_10004CFD4((uint64_t *)&unk_1009D7C10);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)setInteractions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _TtC5Books18ToastContainerView *v8;
  Class isa;

  v5 = sub_10004CFD4((uint64_t *)&unk_1009D7C10);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ToastContainerView_containerView);
  v8 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v7, "setInteractions:", isa, swift_bridgeObjectRelease(v6).n128_f64[0]);

}

- (_TtC5Books18ToastContainerView)initWithFrame:(CGRect)a3
{
  _TtC5Books18ToastContainerView *result;

  result = (_TtC5Books18ToastContainerView *)_swift_stdlib_reportUnimplementedInitializer("Books.ToastContainerView", 24, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->containerView[OBJC_IVAR____TtC5Books18ToastContainerView_backgroundLayerGroupName]);
}

@end
