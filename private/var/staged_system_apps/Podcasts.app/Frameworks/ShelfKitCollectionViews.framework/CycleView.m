@implementation CycleView

- (_TtC23ShelfKitCollectionViews9CycleView)init
{
  objc_class *ObjectType;
  _TtC23ShelfKitCollectionViews9CycleView *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hiddenViews) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hostedViewSettings) = (Class)&_swiftEmptyDictionarySingleton;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_currentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_currentViewConstraints) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hostedViews) = (Class)&_swiftEmptyArrayStorage;
  v6.receiver = self;
  v6.super_class = ObjectType;
  v4 = -[CycleView initWithFrame:](&v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  -[CycleView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  return v4;
}

- (_TtC23ShelfKitCollectionViews9CycleView)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews9CycleView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hiddenViews) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hostedViewSettings) = (Class)&_swiftEmptyDictionarySingleton;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_currentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_currentViewConstraints) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews9CycleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/CycleView.swift", 39, 2, 75, 0);
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews9CycleView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews9CycleView *result;

  result = (_TtC23ShelfKitCollectionViews9CycleView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.CycleView", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hostedViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hiddenViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_hostedViewSettings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_currentView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews9CycleView_currentViewConstraints));
}

@end
