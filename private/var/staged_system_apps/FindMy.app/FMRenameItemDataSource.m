@implementation FMRenameItemDataSource

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8;
  _TtC6FindMy22FMRenameItemDataSource *v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;

  v8 = a3;
  v9 = self;
  sub_1000DBAF0(a4, a5);
  v11 = v10;

  if (v11)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v8;
  _TtC6FindMy22FMRenameItemDataSource *v9;

  v8 = a3;
  v9 = self;
  sub_1000DBC50(a4, a5);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  id v7;
  _TtC6FindMy22FMRenameItemDataSource *v8;
  int64_t v9;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy22FMRenameItemDataSource_beaconRoles);
  if (!((unint64_t)v3 >> 62))
    return *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3 < 0)
    v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy22FMRenameItemDataSource_beaconRoles);
  else
    v6 = v3 & 0xFFFFFFFFFFFFFF8;
  v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain(v3);
  v9 = _CocoaArrayWrapper.endIndex.getter(v6);

  swift_bridgeObjectRelease(v3);
  return v9;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  _TtC6FindMy22FMRenameItemDataSource *v10;
  id v11;
  id v12;
  uint64_t v13;
  int64_t v14;
  id v16;
  _TtC6FindMy22FMRenameItemDataSource *v17;
  uint64_t v18;

  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy22FMRenameItemDataSource_beaconRoles);
  if ((v7 & 0xC000000000000001) == 0)
  {
    if (a4 < 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
    {
      v8 = *(void **)(v7 + 8 * a4 + 32);
      v9 = a3;
      v10 = self;
      v11 = v8;
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_11;
  }
  v16 = a3;
  v17 = self;
  swift_bridgeObjectRetain(v7);
  v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a4, v7);
  swift_bridgeObjectRelease(v7);
LABEL_5:
  v12 = objc_msgSend(v11, "roles");

  v13 = sub_100006C5C(0, (unint64_t *)&unk_1005D5390, SPBeaconRole_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v13);

  if (!((unint64_t)v7 >> 62))
  {
    v14 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);

    goto LABEL_7;
  }
LABEL_11:
  if (v7 < 0)
    v18 = v7;
  else
    v18 = v7 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v7);
  v14 = _CocoaArrayWrapper.endIndex.getter(v18);

  swift_bridgeObjectRelease(v7);
LABEL_7:
  swift_bridgeObjectRelease(v7);
  return v14;
}

- (_TtC6FindMy22FMRenameItemDataSource)init
{
  _TtC6FindMy22FMRenameItemDataSource *result;

  result = (_TtC6FindMy22FMRenameItemDataSource *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMRenameItemDataSource", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMRenameItemDataSource_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy22FMRenameItemDataSource_item;
  v4 = type metadata accessor for FMIPItem(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC6FindMy22FMRenameItemDataSource_beaconRoles));
}

@end
