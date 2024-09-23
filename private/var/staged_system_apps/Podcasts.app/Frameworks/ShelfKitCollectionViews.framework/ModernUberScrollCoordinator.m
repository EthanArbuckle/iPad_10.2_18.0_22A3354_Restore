@implementation ModernUberScrollCoordinator

- (_TtC23ShelfKitCollectionViews27ModernUberScrollCoordinator)init
{
  _TtC23ShelfKitCollectionViews27ModernUberScrollCoordinator *result;

  result = (_TtC23ShelfKitCollectionViews27ModernUberScrollCoordinator *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.ModernUberScrollCoordinator", 51, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10DBC8((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27ModernUberScrollCoordinator_navigationBar);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27ModernUberScrollCoordinator_navigationItem);
  sub_1D618(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27ModernUberScrollCoordinator_statusBarStyleHandler), *(_QWORD *)&self->navigationBar[OBJC_IVAR____TtC23ShelfKitCollectionViews27ModernUberScrollCoordinator_statusBarStyleHandler]);
  sub_10DBC8((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27ModernUberScrollCoordinator_cell);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews27ModernUberScrollCoordinator____lazy_storage___scrollConfigurations));
}

@end
