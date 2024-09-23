@implementation DOCArchiveOperation

- (NSString)actionNameForUndoing
{
  _TtC5Files19DOCArchiveOperation *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10031AAFC((uint64_t)v2);
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (id)operationForRedoing
{
  _TtC5Files19DOCArchiveOperation *v2;
  char *v3;

  v2 = self;
  v3 = sub_10031ADEC();

  return v3;
}

- (id)operationForUndoing
{
  _TtC5Files19DOCArchiveOperation *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_10031AF34();

  return v3;
}

- (void)registerUndo
{
  objc_msgSend(*(id *)&self->FPArchiveOperation_opaque[OBJC_IVAR____TtC5Files19DOCArchiveOperation_undoManager], "registerUndoOperationForSender:", self);
}

- (_TtC5Files19DOCArchiveOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
  id v4;
  _TtC5Files19DOCArchiveOperation *result;

  v4 = a4;
  result = (_TtC5Files19DOCArchiveOperation *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCArchiveOperation", 25, "init(items:destinationFolder:)", 30, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->FPArchiveOperation_opaque[OBJC_IVAR____TtC5Files19DOCArchiveOperation_items]);

  sub_100087534(*(_QWORD *)&self->FPArchiveOperation_opaque[OBJC_IVAR____TtC5Files19DOCArchiveOperation_progressHandler], *(_QWORD *)&self->items[OBJC_IVAR____TtC5Files19DOCArchiveOperation_progressHandler]);
}

@end
