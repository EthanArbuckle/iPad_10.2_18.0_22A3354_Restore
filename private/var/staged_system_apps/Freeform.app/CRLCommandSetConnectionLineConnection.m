@implementation CRLCommandSetConnectionLineConnection

- (NSUUID)connectionLineID
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (NSUUID)connectedItemID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  Class isa;
  uint64_t v10;

  v3 = sub_1004B804C((uint64_t *)&unk_1013E1A50);
  __chkstk_darwin(v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1006950CC((uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_connectedItemID, (uint64_t)v5);
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSUUID *)isa;
}

- (int64_t)chirality
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_chirality);
}

- (CRLConnectionLinePathSource)pathSource
{
  return (CRLConnectionLinePathSource *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_pathSource));
}

- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)initWithConnectionLineID:(id)a3 connectedItemID:(id)a4 chirality:(int64_t)a5 pathSource:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  objc_class *v19;
  id v20;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v21;
  objc_super v23;

  v11 = sub_1004B804C((uint64_t *)&unk_1013E1A50);
  __chkstk_darwin(v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for UUID(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, v18, 1, v14);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))((char *)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_connectionLineID, v17, v14);
  sub_1006950CC((uint64_t)v13, (uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_connectedItemID);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_chirality) = (Class)a5;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_pathSource) = (Class)a6;
  v19 = (objc_class *)type metadata accessor for CRLCommandSetConnectionLineConnection(0);
  v23.receiver = self;
  v23.super_class = v19;
  v20 = a6;
  v21 = -[CRLCommand init](&v23, "init");
  sub_1004C1F2C((uint64_t)v13);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  return v21;
}

- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)initWithConnectionLine:(id)a3 connectedItem:(id)a4 chirality:(int64_t)a5 pathSource:(id)a6
{
  char *v9;
  id v10;
  id v11;

  v9 = (char *)a3;
  v10 = a4;
  v11 = a6;
  return (_TtC8Freeform37CRLCommandSetConnectionLineConnection *)sub_100A26410(v9, a4, a5, a6);
}

- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)initWithConnectionLine:(id)a3 connectedItem:(id)a4 chirality:(int64_t)a5
{
  char *v7;
  id v8;

  v7 = (char *)a3;
  v8 = a4;
  return (_TtC8Freeform37CRLCommandSetConnectionLineConnection *)sub_100A2665C(v7, a4, a5);
}

- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)init
{
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *result;

  result = (_TtC8Freeform37CRLCommandSetConnectionLineConnection *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetConnectionLineConnection", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_connectionLineID;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1004C1F2C((uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_connectedItemID);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_pathSource));
}

@end
