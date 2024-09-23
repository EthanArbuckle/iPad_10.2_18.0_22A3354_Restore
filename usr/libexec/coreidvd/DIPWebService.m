@implementation DIPWebService

- (void)dealloc
{
  uint64_t v2;
  void *v3;
  _TtC8coreidvd13DIPWebService *v4;
  objc_super v5;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd13DIPWebService_httpSession);
  v3 = *(void **)(v2 + 16);
  v4 = self;
  swift_retain(v2);
  objc_msgSend(v3, "invalidateAndCancel");
  objc_msgSend(*(id *)(v2 + 24), "invalidateAndCancel");
  swift_release(v2);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for DIPWebService();
  -[DIPWebService dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->conversation[OBJC_IVAR____TtC8coreidvd13DIPWebService_conversation]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd13DIPWebService_httpSession));
}

- (_TtC8coreidvd13DIPWebService)init
{
  _TtC8coreidvd13DIPWebService *result;

  result = (_TtC8coreidvd13DIPWebService *)_swift_stdlib_reportUnimplementedInitializer("coreidvd.DIPWebService", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
