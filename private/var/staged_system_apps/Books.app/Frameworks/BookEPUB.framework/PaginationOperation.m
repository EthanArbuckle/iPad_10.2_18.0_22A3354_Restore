@implementation PaginationOperation

- (void)dealloc
{
  _TtC8BookEPUB19PaginationOperation *v2;

  v2 = self;
  PaginationOperation.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_release();
  sub_52128((uint64_t)self + OBJC_IVAR____TtC8BookEPUB19PaginationOperation_result, &qword_3BD8F8);
  sub_15713C((uint64_t)self + OBJC_IVAR____TtC8BookEPUB19PaginationOperation_parameters);
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB19PaginationOperation_annotationProviderService);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8BookEPUB19PaginationOperation_bookProviderService));
  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB19PaginationOperation_log;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8BookEPUB19PaginationOperation_operationID;
  v6 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (void)cancel
{
  id v2;
  NSString v3;
  NSString v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PaginationOperation(0);
  v2 = v5.receiver;
  -[PaginationOperation cancel](&v5, "cancel");
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "willChangeValueForKey:", v3, v5.receiver, v5.super_class);

  *((_BYTE *)v2 + OBJC_IVAR____TtC8BookEPUB19PaginationOperation__cancelled) = 1;
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "didChangeValueForKey:", v4);

  sub_150BCC((uint64_t)"FAILURE: #PaginationOperation Set to Cancel", 43, 2, (uint64_t (*)(__n128))&static os_signpost_type_t.end.getter, "#PaginationOperation: %s end event:%s");
}

- (BOOL)isCancelled
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8BookEPUB19PaginationOperation__cancelled);
}

- (BOOL)isExecuting
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8BookEPUB19PaginationOperation__executing);
}

- (BOOL)isFinished
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8BookEPUB19PaginationOperation__finished);
}

- (BOOL)isReady
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8BookEPUB19PaginationOperation__ready);
}

- (NSString)description
{
  id v2;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  Swift::String v10;
  void *object;
  uint64_t v12;
  NSString v13;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;

  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for PaginationOperation(0);
  v2 = v15.receiver;
  v3 = -[PaginationOperation description](&v15, "description");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v6 = v5;

  v16 = v4;
  v17 = v6;
  v7._countAndFlagsBits = 2108704;
  v7._object = (void *)0xE300000000000000;
  String.append(_:)(v7);
  v8 = type metadata accessor for UUID(0);
  v9 = sub_34284((unint64_t *)&qword_3B6870, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v10._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v8, v9);
  object = v10._object;
  String.append(_:)(v10);

  swift_bridgeObjectRelease(object);
  v12 = v17;
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  return (NSString *)v13;
}

- (_TtC8BookEPUB19PaginationOperation)init
{
  _TtC8BookEPUB19PaginationOperation *result;

  result = (_TtC8BookEPUB19PaginationOperation *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.PaginationOperation", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)start
{
  _TtC8BookEPUB19PaginationOperation *v2;

  v2 = self;
  PaginationOperation.start()();

}

- (void)main
{
  _TtC8BookEPUB19PaginationOperation *v2;

  v2 = self;
  PaginationOperation.main()();

}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC8BookEPUB19PaginationOperation *v16;
  uint64_t v17;

  v9 = sub_319AC((uint64_t *)&unk_3B8C50);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  v15 = a5;
  v16 = self;
  sub_157C5C((uint64_t)v11, (uint64_t)a5);

  sub_52128((uint64_t)v11, (uint64_t *)&unk_3B8C50);
}

- (void)navigationHandlerWebContentLoadFailed:(id)a3 reason:(id)a4
{
  id v6;
  _TtC8BookEPUB19PaginationOperation *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_15807C((uint64_t)a4);

}

- (void)navigationHandlerWillCancelCurrentNavigation:(id)a3
{
  id v4;
  _TtC8BookEPUB19PaginationOperation *v5;

  v4 = a3;
  v5 = self;
  sub_14B004((uint64_t)"navigationHandlerWillCancelCurrentNavigation", 44, 2);
  -[PaginationOperation cancel](v5, "cancel");

}

@end
