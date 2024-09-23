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
  id v14;
  _TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate *v15;
  void (*v16)(id, char *, __n128);
  uint64_t v17;
  __n128 v18;
  Class isa;
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  swift_unknownObjectRetain(a4);
  v14 = a5;
  v15 = self;
  if ((objc_msgSend(v13, "isEditing") & 1) == 0)
  {
    v16 = *(void (**)(id, char *, __n128))((char *)&v15->super.isa
                                                    + OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider);
    if (v16)
    {
      v17 = *(_QWORD *)&v15->dragItemsProvider[OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider];
      v18 = swift_retain(v17);
      v16(a4, v12, v18);
      sub_5C198((uint64_t)v16, v17);
    }
  }

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  sub_4E684(0, (unint64_t *)&unk_14E4708, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  _TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate *v16;
  void (*v17)(id, char *, __n128);
  uint64_t v18;
  __n128 v19;
  Class isa;
  uint64_t v22;

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = a3;
  swift_unknownObjectRetain(a4);
  v15 = a5;
  v16 = self;
  if ((objc_msgSend(v14, "isEditing") & 1) == 0)
  {
    v17 = *(void (**)(id, char *, __n128))((char *)&v16->super.isa
                                                    + OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider);
    if (v17)
    {
      v18 = *(_QWORD *)&v16->dragItemsProvider[OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider];
      v19 = swift_retain(v18);
      v17(a4, v13, v19);
      sub_5C198((uint64_t)v17, v18);
    }
  }

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);

  sub_4E684(0, (unint64_t *)&unk_14E4708, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = sub_84D724(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  sub_84AFD4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionWillBegin, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E4, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E0);
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  sub_84AFD4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionDidEnd, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E4, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E0);
}

- (_TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate)init
{
  return (_TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate *)sub_84A79C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider, &OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionWillBegin, &OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionDidEnd, (uint64_t (*)(_QWORD))type metadata accessor for CollectionViewDragDropController.DragDelegate);
}

- (void).cxx_destruct
{
  sub_84A830((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider, (void (*)(_QWORD, _QWORD))sub_CD0E0, &OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionWillBegin, &OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionDidEnd);
}

@end
