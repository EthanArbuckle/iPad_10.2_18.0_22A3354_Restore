@implementation AEAClientConnection

- (void)dealloc
{
  void *v2;
  _TtC15assessmentagent19AEAClientConnection *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15assessmentagent19AEAClientConnection_publicationListener);
  v3 = self;
  objc_msgSend(v2, "invalidate");
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AEAClientConnection();
  -[AEAClientConnection dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  sub_10000B008((uint64_t)self + OBJC_IVAR____TtC15assessmentagent19AEAClientConnection_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15assessmentagent19AEAClientConnection_publicationListener));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC15assessmentagent19AEAClientConnection_xpcPrimitives));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15assessmentagent19AEAClientConnection_lifecycleEventHandlingProxy));
}

- (_TtC15assessmentagent19AEAClientConnection)init
{
  _TtC15assessmentagent19AEAClientConnection *result;

  result = (_TtC15assessmentagent19AEAClientConnection *)_swift_stdlib_reportUnimplementedInitializer("assessmentagent.AEAClientConnection", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC15assessmentagent19AEAClientConnection *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10000AD50(v7);

  return v9 & 1;
}

- (void)publishAssessmentState:(id)a3 withCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC15assessmentagent19AEAClientConnection *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100082038, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_100009B00(v8, (uint64_t)sub_10000B180, v7);

  swift_release(v7);
}

- (void)endPublications:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC15assessmentagent19AEAClientConnection *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100081FC0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100009EC0((uint64_t)sub_10000AC64, v5);

  swift_release(v5);
}

@end
