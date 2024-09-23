@implementation CollectionViewDragDropController.DropDelegate

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return sub_84AD20((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_canHandleSession);
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  _TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_84D880(a4);

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
  _TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate *v17;
  id v18;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD540);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
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
                                             + OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidUpdate);
  if (v14)
  {
    v15 = *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidUpdate];
    v16 = a3;
    swift_unknownObjectRetain(a4);
    v17 = self;
    sub_A9DEC((uint64_t)v14, v15);
    v18 = (id)v14(a4, v11);
    sub_5C198((uint64_t)v14, v15);

    swift_unknownObjectRelease(a4);
  }
  else
  {
    v18 = objc_msgSend(objc_allocWithZone((Class)UICollectionViewDropProposal), "initWithDropOperation:", 0);
  }
  sub_56024((uint64_t)v11, (uint64_t *)&unk_14AD540);
  return v18;
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  sub_84AFD4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidExitOrEnd, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E4, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E0);
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  sub_84AFD4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidExitOrEnd, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E4, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E0);
}

- (_TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate)init
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_class *v7;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_canHandleSession);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onPerformDrop);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidUpdate);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidExitOrEnd);
  v7 = (objc_class *)type metadata accessor for CollectionViewDragDropController.DropDelegate();
  *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return -[CollectionViewDragDropController.DropDelegate init](&v9, "init");
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_canHandleSession), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_canHandleSession]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onPerformDrop), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onPerformDrop]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidUpdate), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidUpdate]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidExitOrEnd), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC16MusicApplication32CollectionViewDragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidExitOrEnd]);
}

@end
