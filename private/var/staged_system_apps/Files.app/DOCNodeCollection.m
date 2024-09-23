@implementation DOCNodeCollection

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4;
  _TtC5Files17DOCNodeCollection *v5;

  v4 = a3;
  v5 = self;
  DOCNodeCollection.data(forCollectionShouldBeReloaded:)(v4);

}

- (BOOL)isGathering
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____TtC5Files17DOCNodeCollection_isGathering;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files17DOCNodeCollection_isGathering, v4, 0, 0);
  return *v2;
}

- (void)collectionDidFinishGathering:(id)a3
{
  id v4;
  _TtC5Files17DOCNodeCollection *v5;

  v4 = a3;
  v5 = self;
  sub_1000188A4(0xD000000000000020, 0x80000001005128D0);

}

- (void)setIsGathering:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR____TtC5Files17DOCNodeCollection_isGathering;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files17DOCNodeCollection_isGathering, v5, 1, 0);
  *v4 = a3;
}

- (_TtC5Files17DOCNodeCollection)init
{
  _TtC5Files17DOCNodeCollection *result;

  result = (_TtC5Files17DOCNodeCollection *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCNodeCollection", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->logPrefix[OBJC_IVAR____TtC5Files17DOCNodeCollection_logPrefix]);
  sub_100008A60(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC5Files17DOCNodeCollection_type), *(_QWORD *)&self->logPrefix[OBJC_IVAR____TtC5Files17DOCNodeCollection_type], self->logPrefix[OBJC_IVAR____TtC5Files17DOCNodeCollection_type + 8]);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files17DOCNodeCollection_delegate);

}

- (void)collection:(id)a3 didEncounterError:(id)a4
{
  id v6;
  _TtC5Files17DOCNodeCollection *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_10016400C((uint64_t)v8);

}

- (void)collection:(id)a3 didUpdateObservedItem:(id)a4
{
  id v6;
  id v7;
  _TtC5Files17DOCNodeCollection *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  DOCNodeCollection.collection(_:didUpdateObservedItem:)(v6, v7);

}

- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _TtC5Files17DOCNodeCollection *v18;

  v11 = sub_10004F2F0(0, (unint64_t *)&qword_1006419B0, FPItem_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v13 = sub_10004F2F0(0, (unint64_t *)&unk_1006428C0, FPItemID_ptr);
  v14 = sub_100164FF4();
  v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v13, v11, v14);
  v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, v13);
  v17 = a3;
  v18 = self;
  sub_10016438C(v12, v15, v16);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v16);
}

@end
