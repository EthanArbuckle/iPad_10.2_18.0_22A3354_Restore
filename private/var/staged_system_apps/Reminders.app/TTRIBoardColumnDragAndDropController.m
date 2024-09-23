@implementation TTRIBoardColumnDragAndDropController

- (_TtC9Reminders36TTRIBoardColumnDragAndDropController)init
{
  _TtC9Reminders36TTRIBoardColumnDragAndDropController *result;

  result = (_TtC9Reminders36TTRIBoardColumnDragAndDropController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIBoardColumnDragAndDropController", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_coordinator);
  sub_10001F544((uint64_t)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_columnID, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.ItemID);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_dataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_collectionView));
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t Strong;
  uint64_t v14;
  id v15;
  _TtC9Reminders36TTRIBoardColumnDragAndDropController *v16;
  _QWORD *v17;
  Class isa;
  uint64_t v20;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_coordinator);
  if (Strong)
  {
    v14 = Strong;
    v15 = a3;
    swift_unknownObjectRetain(a4);
    v16 = self;
    v17 = sub_1002F1064((uint64_t)v16, (uint64_t)v12, v14);

    swift_unknownObjectRelease(a4);
    swift_unknownObjectRelease(v14);
  }
  else
  {
    v17 = _swiftEmptyArrayStorage;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_100041E10();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  return isa;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  uint64_t Strong;
  uint64_t v8;
  id v9;
  _TtC9Reminders36TTRIBoardColumnDragAndDropController *v10;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_coordinator);
  if (Strong)
  {
    v8 = Strong;
    v9 = a3;
    swift_unknownObjectRetain(a4);
    v10 = self;
    sub_1002F1164(a4, v8);

    swift_unknownObjectRelease(a4);
    swift_unknownObjectRelease(v8);
  }
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t Strong;
  uint64_t v15;
  id v16;
  _TtC9Reminders36TTRIBoardColumnDragAndDropController *v17;
  _QWORD *v18;
  Class isa;
  uint64_t v21;

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_coordinator);
  if (Strong)
  {
    v15 = Strong;
    v16 = a3;
    swift_unknownObjectRetain(a4);
    v17 = self;
    v18 = sub_1002F1548((uint64_t)v17, a4, (uint64_t)v13, v15);

    swift_unknownObjectRelease(a4);
    swift_unknownObjectRelease(v15);
  }
  else
  {
    v18 = _swiftEmptyArrayStorage;
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_100041E10();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v18);
  return isa;
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  uint64_t Strong;
  uint64_t v8;
  id v9;
  _TtC9Reminders36TTRIBoardColumnDragAndDropController *v10;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_coordinator);
  if (Strong)
  {
    v8 = Strong;
    v9 = a3;
    swift_unknownObjectRetain(a4);
    v10 = self;
    sub_1003F4B78(a4);

    swift_unknownObjectRelease(a4);
    swift_unknownObjectRelease(v8);
  }
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  uint64_t Strong;
  uint64_t v8;
  id v9;
  _TtC9Reminders36TTRIBoardColumnDragAndDropController *v10;
  char v11;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_coordinator);
  if (Strong)
  {
    v8 = Strong;
    v9 = a3;
    swift_unknownObjectRetain(a4);
    v10 = self;
    v11 = sub_1002F16A4(a4, v8);

    swift_unknownObjectRelease(a4);
    swift_unknownObjectRelease(v8);
  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  sub_1002EF2E8((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1002EF624);
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t Strong;
  uint64_t v15;
  id v16;
  _TtC9Reminders36TTRIBoardColumnDragAndDropController *v17;
  id v18;
  uint64_t v20;

  v9 = sub_10002A750(&qword_100646950);
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
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_coordinator);
  if (Strong)
  {
    v15 = Strong;
    v16 = a3;
    swift_unknownObjectRetain(a4);
    v17 = self;
    v18 = sub_1002EFC1C((uint64_t)v17, (uint64_t)a4, (uint64_t)v11, v15);

    swift_unknownObjectRelease(a4);
    swift_unknownObjectRelease(v15);
  }
  else
  {
    v18 = objc_msgSend(objc_allocWithZone((Class)UICollectionViewDropProposal), "initWithDropOperation:", 0);
  }
  sub_1000073A0((uint64_t)v11, &qword_100646950);
  return v18;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  sub_1002EF2E8((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1002F0494);
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  uint64_t Strong;
  uint64_t v8;
  id v9;
  _TtC9Reminders36TTRIBoardColumnDragAndDropController *v10;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_coordinator);
  if (Strong)
  {
    v8 = Strong;
    v9 = a3;
    swift_unknownObjectRetain(a4);
    v10 = self;
    sub_1002F0774(a4, (uint64_t)v10, 0x6120646574697865, 0xEB00000000616572, 0, v8);

    swift_unknownObjectRelease(a4);
    swift_unknownObjectRelease(v8);
  }
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  uint64_t Strong;
  uint64_t v8;
  id v9;
  _TtC9Reminders36TTRIBoardColumnDragAndDropController *v10;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_coordinator);
  if (Strong)
  {
    v8 = Strong;
    v9 = a3;
    swift_unknownObjectRetain(a4);
    v10 = self;
    sub_1003F4DCC(a4);
    sub_1002F0774(a4, (uint64_t)v10, 0xD000000000000016, 0x80000001005735D0, 1, v8);

    swift_unknownObjectRelease(a4);
    swift_unknownObjectRelease(v8);
  }
}

@end
