@implementation PresentmentSessionProxy

- (void)dealloc
{
  _TtC7idcredd23PresentmentSessionProxy *v2;

  v2 = self;
  sub_100041714();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7idcredd23PresentmentSessionProxy_jetsamTransaction), a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7idcredd23PresentmentSessionProxy_connection);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7idcredd23PresentmentSessionProxy_dataContainer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7idcredd23PresentmentSessionProxy_partitions));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7idcredd23PresentmentSessionProxy_flow));
}

- (void)configureWithPartitions:(id)a3 presentmentType:(unint64_t)a4 options:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  _TtC7idcredd23PresentmentSessionProxy *v13;

  v10 = _Block_copy(a6);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  _Block_copy(v10);
  v12 = a5;
  v13 = self;
  sub_100043F90(v11, a4, a5, (uint64_t)v13, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease(v11);
}

- (void)generateTransportKeyForSpecification:(unint64_t)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7idcredd23PresentmentSessionProxy *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100168E70, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100168E98, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001759A0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100168EC0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100174E88;
  v14[5] = v13;
  v15 = self;
  v16 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100174E90, (uint64_t)v14);
  swift_release(v16);
}

- (void)interpretRequest:(DCPresentmentRequest *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  DCPresentmentRequest *v15;
  _TtC7idcredd23PresentmentSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100168DF8, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100168E20, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100175978;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100168E48, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100175980;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100174E70, (uint64_t)v14);
  swift_release(v17);
}

- (void)buildResponseForSelection:(DCPresentmentSelection *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  DCPresentmentSelection *v15;
  _TtC7idcredd23PresentmentSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100168D80, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100168DA8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100175958;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100168DD0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100175960;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100175968, (uint64_t)v14);
  swift_release(v17);
}

- (void)buildCredentialResponseForSelection:(DCPresentmentSelection *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  DCPresentmentSelection *v15;
  _TtC7idcredd23PresentmentSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100168D08, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100168D30, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100175938;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100168D58, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100175940;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100175948, (uint64_t)v14);
  swift_release(v17);
}

- (void)buildErrorResponseWithStatus:(unint64_t)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7idcredd23PresentmentSessionProxy *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100168C90, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100168CB8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100175918;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100168CE0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100175920;
  v14[5] = v13;
  v15 = self;
  v16 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100174E50, (uint64_t)v14);
  swift_release(v16);
}

- (_TtC7idcredd23PresentmentSessionProxy)init
{
  _TtC7idcredd23PresentmentSessionProxy *result;

  result = (_TtC7idcredd23PresentmentSessionProxy *)_swift_stdlib_reportUnimplementedInitializer("idcredd.PresentmentSessionProxy", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
