@implementation ICMoveDataSource

- (ICMoveDataSource)initWithCollectionView:(id)a3 sourceObjectIds:(id)a4
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1000163BC(0, (unint64_t *)&qword_1005D2500, NSManagedObjectID_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v6);
  return (ICMoveDataSource *)sub_1002F22A0(a3, v7);
}

- (ICMoveDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 indexer:(id)a5
{
  void *v7;
  id v8;
  id v9;
  ICMoveDataSource *result;

  v7 = _Block_copy(a4);
  v8 = a3;
  v9 = a5;
  _Block_release(v7);
  result = (ICMoveDataSource *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.MoveDataSource", 26, "init(collectionView:cellProvider:indexer:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->ICCoreDataDataSource_opaque[OBJC_IVAR___ICMoveDataSource_accountsChangeObservation]);
  sub_100012DDC((uint64_t)&self->ICCoreDataDataSource_opaque[OBJC_IVAR___ICMoveDataSource____lazy_storage___accountsChangePublisher], &qword_1005D1C50);
}

@end
