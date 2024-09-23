@implementation MapSnapshotter.Context

- (BOOL)isEqual:(id)a3
{
  _TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context *v5;
  uint64_t v6;
  _TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context *v7;
  BOOL v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_100029490((uint64_t)v10);

  sub_100015590((uint64_t)v10, &qword_10008BF30);
  return v8;
}

- (int64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context *v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  _OWORD v11[4];
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  Hasher.init()(v11, self, a2);
  v4 = type metadata accessor for UUID(0, v3);
  v5 = sub_10001B41C(&qword_10008CCE8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v6 = self;
  dispatch thunk of Hashable.hash(into:)(v11, v4, v5);
  v7 = type metadata accessor for WidgetFamily(0);
  v8 = sub_10001B41C(&qword_10008CCF0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of Hashable.hash(into:)(v11, v7, v8);
  v15 = v11[2];
  v16 = v11[3];
  v17 = v12;
  v13 = v11[0];
  v14 = v11[1];
  v9 = Hasher.finalize()();

  return v9;
}

- (_TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context)init
{
  _TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context *result;

  result = (_TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context *)_swift_stdlib_reportUnimplementedInitializer("GeneralMapsWidget.Context", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self
     + OBJC_IVAR____TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context_identifier;
  v4 = type metadata accessor for UUID(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtCC17GeneralMapsWidget14MapSnapshotterP33_D3522C9343D4C44065DB06BAD982882A7Context_family;
  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
