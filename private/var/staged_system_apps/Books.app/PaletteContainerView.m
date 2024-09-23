@implementation PaletteContainerView

- (void)layoutSubviews
{
  _TtC5Books20PaletteContainerView *v2;

  v2 = self;
  sub_10001CD2C();

}

- (NSArray)interactions
{
  void *v2;
  _TtC5Books20PaletteContainerView *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books20PaletteContainerView_containerView);
  v3 = self;
  v4 = objc_msgSend(v2, "interactions");
  v5 = sub_10004CFD4((uint64_t *)&unk_1009D7C10);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (_TtC5Books20PaletteContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100259A14();
}

- (void)addInteraction:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books20PaletteContainerView_containerView), "addInteraction:", a3);
}

- (void)removeInteraction:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books20PaletteContainerView_containerView), "removeInteraction:", a3);
}

- (void)setInteractions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _TtC5Books20PaletteContainerView *v8;
  Class isa;

  v5 = sub_10004CFD4((uint64_t *)&unk_1009D7C10);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books20PaletteContainerView_containerView);
  v8 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  objc_msgSend(v7, "setInteractions:", isa);

}

- (_TtC5Books20PaletteContainerView)initWithFrame:(CGRect)a3
{
  _TtC5Books20PaletteContainerView *result;

  result = (_TtC5Books20PaletteContainerView *)_swift_stdlib_reportUnimplementedInitializer("Books.PaletteContainerView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books20PaletteContainerView____lazy_storage___separator));
}

@end
