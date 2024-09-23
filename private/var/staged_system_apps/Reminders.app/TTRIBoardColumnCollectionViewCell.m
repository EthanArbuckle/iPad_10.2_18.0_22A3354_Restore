@implementation TTRIBoardColumnCollectionViewCell

- (_TtC9Reminders33TTRIBoardColumnCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders33TTRIBoardColumnCollectionViewCell *)sub_10011B1DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC9Reminders33TTRIBoardColumnCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders33TTRIBoardColumnCollectionViewCell *)sub_10011B718(v3, v4);
}

- (void)prepareForReuse
{
  uint64_t v2;
  _TtC9Reminders33TTRIBoardColumnCollectionViewCell *v3;

  v3 = self;
  sub_10011B8DC((uint64_t)v3, v2);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_dataSource));
  swift_release();
  swift_release();
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_dragAndDropController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_scrollingController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_collectionView));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_columnDraggingHandler);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v3;
  BOOL v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _TtC9Reminders33TTRIBoardColumnCollectionViewCell *v9;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_collectionView);
  if (v3)
    v4 = v3 == a3;
  else
    v4 = 0;
  if (v4)
  {
    v6 = a3;
    v9 = self;
    v7 = sub_10002A750(&qword_100646F60);
    v8 = sub_100023FEC(&qword_100646F68, &qword_100646F60, (uint64_t)&protocol conformance descriptor for PassthroughSubject<A, B>);
    Subject<>.send()(v7, v8);

  }
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC9Reminders33TTRIBoardColumnCollectionViewCell *v10;

  v7 = type metadata accessor for IndexPath(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10011D3C0((uint64_t)v9, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC9Reminders33TTRIBoardColumnCollectionViewCell *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1001223D0((uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  _TtC9Reminders33TTRIBoardColumnCollectionViewCell *v24;
  void (*v25)(char *, uint64_t);
  Class isa;
  uint64_t v28;
  _TtC9Reminders33TTRIBoardColumnCollectionViewCell *v29;

  v29 = self;
  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v28 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v28 - v19;
  __chkstk_darwin(v18);
  v22 = (char *)&v28 - v21;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v23 = a3;
  v24 = v29;
  sub_10011D970((uint64_t)v20, (uint64_t)v17, (uint64_t)v14, (uint64_t)v22);

  v25 = *(void (**)(char *, uint64_t))(v11 + 8);
  v25(v14, v10);
  v25(v17, v10);
  v25(v20, v10);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v25(v22, v10);
  return isa;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_10011DE24(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_100122544);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sub_10011DCEC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_10036CD18);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  sub_10011DCEC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_10036D114);
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return sub_10011DE24(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_100122808);
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  sub_10011DCEC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_10036D4E0);
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  id v7;
  _TtC9Reminders33TTRIBoardColumnCollectionViewCell *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_delegate);
  if (Strong)
  {
    v6 = Strong;
    v7 = a3;
    v8 = self;
    sub_10036D604();

    swift_unknownObjectRelease(v6);
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return sub_10011DE24(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_10012292C);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC9Reminders33TTRIBoardColumnCollectionViewCell *v13;
  void *v14;

  y = a5.y;
  x = a5.x;
  v10 = type metadata accessor for IndexPath(0);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v10);
  v12 = a3;
  v13 = self;
  v14 = (void *)sub_10011DEE4((uint64_t)v12, v11, x, y);

  swift_bridgeObjectRelease(v11);
  return v14;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  sub_10011E57C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id))sub_100122A98);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  uint64_t Strong;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  void (*v15)(id, id, uint64_t, uint64_t);
  id v16;
  id v17;
  _TtC9Reminders33TTRIBoardColumnCollectionViewCell *v18;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_delegate);
  if (Strong)
  {
    v11 = Strong;
    v12 = *(_QWORD *)(Strong + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_presenter + 8);
    ObjectType = swift_getObjectType(*(_QWORD *)(Strong + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_presenter), v10);
    v14 = *(_QWORD *)(v12 + 8);
    v15 = *(void (**)(id, id, uint64_t, uint64_t))(v14 + 744);
    v16 = a3;
    v17 = a4;
    swift_unknownObjectRetain(a5);
    v18 = self;
    v15(v17, a5, ObjectType, v14);

    swift_unknownObjectRelease(a5);
    swift_unknownObjectRelease(v11);
  }
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  sub_10011E57C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id))sub_100122CE4);
}

@end
