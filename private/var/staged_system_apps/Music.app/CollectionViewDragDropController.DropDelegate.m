@implementation CollectionViewDragDropController.DropDelegate

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return sub_1002E1A30((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession);
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  uint64_t v7;
  _TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate *v8;

  v6 = a3;
  swift_unknownObjectRetain(a4, v7);
  v8 = self;
  sub_1002E41F8(a4);

  swift_unknownObjectRelease(a4);
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(id, char *);
  uint64_t v15;
  id v16;
  uint64_t v17;
  _TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate *v18;
  id v19;
  uint64_t v21;

  v9 = sub_100007E8C((uint64_t *)&unk_1011A3D50);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = *(uint64_t (**)(id, char *))((char *)&self->super.isa
                                             + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate);
  if (v14)
  {
    v15 = *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate];
    v16 = a3;
    swift_unknownObjectRetain(a4, v17);
    v18 = self;
    sub_100048AAC((uint64_t)v14, v15);
    v19 = (id)v14(a4, v11);
    sub_10004BA30((uint64_t)v14, v15);

    swift_unknownObjectRelease(a4);
  }
  else
  {
    v19 = objc_msgSend(objc_allocWithZone((Class)UICollectionViewDropProposal), "initWithDropOperation:", 0);
  }
  sub_10004FF60((uint64_t)v11, (uint64_t *)&unk_1011A3D50);
  return v19;
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  sub_1002E1CE4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA50, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA54);
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  sub_1002E1CE4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA50, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA54);
}

- (_TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate)init
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_class *v7;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onPerformDrop);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd);
  v7 = (objc_class *)type metadata accessor for CollectionViewDragDropController.DropDelegate();
  *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return -[CollectionViewDragDropController.DropDelegate init](&v9, "init");
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onPerformDrop), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onPerformDrop]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd]);
}

@end
