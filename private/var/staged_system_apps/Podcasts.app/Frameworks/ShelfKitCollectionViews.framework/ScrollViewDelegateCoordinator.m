@implementation ScrollViewDelegateCoordinator

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_197044((uint64_t)v4);

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_197148((uint64_t)v4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_19724C((uint64_t)v4);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator *v7;

  v6 = a3;
  v7 = self;
  sub_197350((uint64_t)v6, a4);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_197474((uint64_t)v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  _TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator *v10;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = self;
  sub_197578((uint64_t)v9, (uint64_t)a5, x, y);

}

- (_TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator_scrollCoordinators) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ScrollViewDelegateCoordinator();
  return -[ScrollViewDelegateCoordinator init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator_scrollCoordinators));
}

@end
