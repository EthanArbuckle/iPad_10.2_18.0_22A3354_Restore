@implementation RCVisibleEntitiesObserver

- (_TtC10VoiceMemos25RCVisibleEntitiesObserver)init
{
  _TtC10VoiceMemos25RCVisibleEntitiesObserver *result;

  result = (_TtC10VoiceMemos25RCVisibleEntitiesObserver *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.RCVisibleEntitiesObserver", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1000A3170((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos25RCVisibleEntitiesObserver_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos25RCVisibleEntitiesObserver____lazy_storage___recordingsFRC));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos25RCVisibleEntitiesObserver____lazy_storage___userFoldersFRC));
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  _TtC10VoiceMemos25RCVisibleEntitiesObserver *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];

  v13 = sub_100014E10(&qword_1001EAF18);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)v27 - v17;
  v19 = a3;
  swift_unknownObjectRetain(a4);
  v20 = self;
  v21 = a5;
  v22 = a7;
  _bridgeAnyObjectToAny(_:)(v27, a4);
  swift_unknownObjectRelease(a4);
  if (v21)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(v21);

    v23 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v18, 0, 1, v23);
  }
  else
  {
    v24 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v18, 1, 1, v24);
  }
  if (v22)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a7);

    v25 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v16, 0, 1, v25);
  }
  else
  {
    v26 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v16, 1, 1, v26);
  }
  sub_1000C693C(v19, (uint64_t)v27, (uint64_t)v18, a6, (uint64_t)v16);

  sub_1000C6CEC((uint64_t)v16);
  sub_1000C6CEC((uint64_t)v18);
  sub_10001B498(v27);
}

@end
