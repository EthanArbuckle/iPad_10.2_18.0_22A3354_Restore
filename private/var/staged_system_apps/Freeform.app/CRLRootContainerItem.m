@implementation CRLRootContainerItem

- (_TtC8Freeform8CRLBoard)board
{
  return (_TtC8Freeform8CRLBoard *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform20CRLRootContainerItem_board);
}

- (void)setBoard:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform20CRLRootContainerItem_board, a3);
}

- (BOOL)isInBoard
{
  return 1;
}

- (BOOL)isSelectable
{
  return 0;
}

- (Class)layoutClass
{
  _TtC8Freeform20CRLRootContainerItem *v2;
  CKRecordID v3;
  Swift::String v4;
  Class result;

  v2 = self;
  sub_100757E04(&_mh_execute_header, (uint64_t)"layoutClass", 11, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLContainerItem.swift", 87, 2, 803, "Root container items should never asked to make a layout!", 57, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_100518FC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"Root container items should never asked to make a layout!");
  sub_100519194((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"layoutClass", 11, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLContainerItem.swift", 87, 2u, 803, (uint64_t)"Root container items should never asked to make a layout!", 57, 2u);
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v3, v4);
  result = (Class)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Freeform/CRLAssert.swift", 24, 2, 348, 0);
  __break(1u);
  return result;
}

- (CRLCanvasInfoGeometry)geometry
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  _TtC8Freeform20CRLRootContainerItem *v4;
  uint64_t v5;
  void *v6;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 288);
  v4 = self;
  v5 = swift_retain(v2);
  v6 = (void *)v3(v5);

  swift_release(v2);
  return (CRLCanvasInfoGeometry *)v6;
}

- (void)setGeometry:(id)a3
{
  id v4;
  _TtC8Freeform20CRLRootContainerItem *v5;
  CKRecordID v6;
  Swift::String v7;

  v4 = a3;
  v5 = self;
  sub_100757E04(&_mh_execute_header, (uint64_t)"geometry", 8, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLContainerItem.swift", 87, 2, 810, "Root container items should never asked to change their geometry!", 65, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_100518FC0((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"Root container items should never asked to change their geometry!");
  sub_100519194((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"geometry", 8, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLContainerItem.swift", 87, 2u, 810, (uint64_t)"Root container items should never asked to change their geometry!", 65, 2u);
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v6, v7);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Freeform/CRLAssert.swift", 24, 2, 348, 0);
  __break(1u);
}

- (_TtC8Freeform8CRLBoard)parentBoard
{
  return (_TtC8Freeform8CRLBoard *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform20CRLRootContainerItem_board);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform20CRLRootContainerItem_board);
}

@end
