@implementation CollectionViewDragDropController.DragDelegate

- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  return 0;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  _TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate *v15;
  uint64_t (*v16)(id, char *, __n128);
  uint64_t v17;
  __n128 v18;
  _QWORD *v19;
  Class isa;
  uint64_t v22;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  swift_unknownObjectRetain(a4, v14);
  v15 = self;
  if ((objc_msgSend(v13, "isEditing") & 1) != 0
    || (v16 = *(uint64_t (**)(id, char *, __n128))((char *)&v15->super.isa
                                                           + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider)) == 0)
  {
    v19 = _swiftEmptyArrayStorage;
  }
  else
  {
    v17 = *(_QWORD *)&v15->dragItemsProvider[OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider];
    v18 = swift_retain();
    v19 = (_QWORD *)v16(a4, v12, v18);
    sub_10004BA30((uint64_t)v16, v17);
  }

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_10004A07C(0, (unint64_t *)&unk_1011AB310, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  return isa;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  _TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate *v16;
  uint64_t (*v17)(id, char *, __n128);
  uint64_t v18;
  __n128 v19;
  _QWORD *v20;
  Class isa;
  uint64_t v23;

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = a3;
  swift_unknownObjectRetain(a4, v15);
  v16 = self;
  if ((objc_msgSend(v14, "isEditing") & 1) != 0
    || (v17 = *(uint64_t (**)(id, char *, __n128))((char *)&v16->super.isa
                                                           + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider)) == 0)
  {
    v20 = _swiftEmptyArrayStorage;
  }
  else
  {
    v18 = *(_QWORD *)&v16->dragItemsProvider[OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider];
    v19 = swift_retain();
    v20 = (_QWORD *)v17(a4, v13, v19);
    sub_10004BA30((uint64_t)v17, v18);
  }

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_10004A07C(0, (unint64_t *)&unk_1011AB310, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v20);
  return isa;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1002E409C(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  sub_1002E1CE4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionWillBegin, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA50, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA54);
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  sub_1002E1CE4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionDidEnd, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA50, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA54);
}

- (_TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate)init
{
  return (_TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate *)sub_1002E1490((char *)self, (uint64_t)a2, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionWillBegin, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionDidEnd, (uint64_t (*)(_QWORD))type metadata accessor for CollectionViewDragDropController.DragDelegate);
}

- (void).cxx_destruct
{
  sub_1002E1524((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider, (void (*)(_QWORD, _QWORD))sub_10004BA54, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionWillBegin, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionDidEnd);
}

@end
