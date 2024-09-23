@implementation CompositeCollectionViewController

- (void)dealloc
{
  _TtC12NowPlayingUI33CompositeCollectionViewController *v2;

  v2 = self;
  sub_164FC();
}

- (void).cxx_destruct
{
  sub_1EC0C((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI33CompositeCollectionViewController_scrollViewDelegate);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI33CompositeCollectionViewController_countData));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI33CompositeCollectionViewController_componentGroups));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI33CompositeCollectionViewController_collectionView));
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC12NowPlayingUI33CompositeCollectionViewController *v6;

  v6 = self;
  sub_16864(a3, a4);

}

- (void)viewDidLayoutSubviews
{
  _TtC12NowPlayingUI33CompositeCollectionViewController *v2;

  v2 = self;
  sub_169E4();

}

- (void)viewDidLoad
{
  _TtC12NowPlayingUI33CompositeCollectionViewController *v2;

  v2 = self;
  sub_18E98();

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _TtC12NowPlayingUI33CompositeCollectionViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_19434((uint64_t)v6, a4);

  swift_unknownObjectRelease(a4);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC12NowPlayingUI33CompositeCollectionViewController *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B714();

  return (int64_t)v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC12NowPlayingUI33CompositeCollectionViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1987C((uint64_t)v6, a4);

  return (int64_t)v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12NowPlayingUI33CompositeCollectionViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1B7E0((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC12NowPlayingUI33CompositeCollectionViewController *v17;
  void *v18;
  __n128 v19;
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  v18 = (void *)sub_1BC48(v13, v15, (uint64_t)v12);

  v19 = swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return v18;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return sub_19CCC(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1C10C);
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC12NowPlayingUI33CompositeCollectionViewController *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v19 - v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  sub_1C414((uint64_t)v15, (uint64_t)v13);

  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  v18(v15, v9);
}

- (BOOL)_collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  return sub_19CCC(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1C954);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_19E6C(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_shouldHighlightItemAtIndexPath_);
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  sub_19D98(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_didHighlightItemAtIndexPath_);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_19CCC(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1CC98);
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  sub_19D98(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_didUnhighlightItemAtIndexPath_);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sub_19F3C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_1D2DC);
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return sub_19E6C(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_shouldDeselectItemAtIndexPath_);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  sub_19F3C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_1D94C);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1A00C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (SEL *)&selRef_collectionView_willDisplayCell_forItemAtIndexPath_);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1A00C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (SEL *)&selRef_collectionView_didEndDisplayingCell_forItemAtIndexPath_);
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  sub_1A0F4(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_prefetchItemsAtIndexPaths_);
}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  sub_1A0F4(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_cancelPrefetchingForItemsAtIndexPaths_);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  _TtC12NowPlayingUI33CompositeCollectionViewController *v20;
  void (*v21)(objc_class *, uint64_t);
  Class isa;
  uint64_t v24;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (objc_class *)((char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v24 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v24 - v17;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = a3;
  v20 = self;
  sub_1A16C((uint64_t)v19, v16, v13, (uint64_t)v18);

  v21 = *(void (**)(objc_class *, uint64_t))(v10 + 8);
  v21(v13, v9);
  v21((objc_class *)v16, v9);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v21((objc_class *)v18, v9);
  return isa;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *Strong;
  void *v6;
  id v7;
  _TtC12NowPlayingUI33CompositeCollectionViewController *v8;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC12NowPlayingUI33CompositeCollectionViewController_scrollViewDelegate, a2);
  if (Strong)
  {
    v6 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "scrollViewDidScroll:") & 1) != 0)
    {
      v7 = a3;
      v8 = self;
      objc_msgSend(v6, "scrollViewDidScroll:", v7);

    }
    swift_unknownObjectRelease(v6);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  void *Strong;
  void *v11;
  id v12;
  _TtC12NowPlayingUI33CompositeCollectionViewController *v13;

  y = a4.y;
  x = a4.x;
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC12NowPlayingUI33CompositeCollectionViewController_scrollViewDelegate, a2);
  if (Strong)
  {
    v11 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "scrollViewWillEndDragging:withVelocity:targetContentOffset:") & 1) != 0)
    {
      v12 = a3;
      v13 = self;
      objc_msgSend(v11, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);

    }
    swift_unknownObjectRelease(v11);
  }
}

- (_TtC12NowPlayingUI33CompositeCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC12NowPlayingUI33CompositeCollectionViewController *)sub_1AE34(v5, v7, a4);
}

- (_TtC12NowPlayingUI33CompositeCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC12NowPlayingUI33CompositeCollectionViewController *)sub_1AFC0(a3);
}

@end
