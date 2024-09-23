@implementation DOCUntrashOperation

- (NSString)actionNameForUndoing
{
  _TtC5Files19DOCUntrashOperation *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1002983D0((uint64_t)v2);
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
  _TtC5Files19DOCUntrashOperation *v2;
  char *v3;

  v2 = self;
  v3 = sub_10029873C();

  return v3;
}

- (id)operationForUndoing
{
  _TtC5Files19DOCUntrashOperation *v2;
  char *v3;

  v2 = self;
  v3 = sub_10029887C();

  return v3;
}

- (void)registerUndo
{
  objc_msgSend(*(id *)&self->FPUntrashOperation_opaque[OBJC_IVAR____TtC5Files19DOCUntrashOperation_undoManager], "registerUndoOperationForSender:", self);
}

- (_TtC5Files19DOCUntrashOperation)initWithItems:(id)a3 restoreDirectory:(id)a4
{
  id v4;
  _TtC5Files19DOCUntrashOperation *result;

  v4 = a4;
  result = (_TtC5Files19DOCUntrashOperation *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCUntrashOperation", 25, "init(items:restoreDirectory:)", 29, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
