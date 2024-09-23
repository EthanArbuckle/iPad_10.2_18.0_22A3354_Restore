@implementation DOCUnarchiveOperation

- (NSString)actionNameForUndoing
{
  _TtC5Files21DOCUnarchiveOperation *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100369474((uint64_t)v2);
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
  _TtC5Files21DOCUnarchiveOperation *v2;
  char *v3;

  v2 = self;
  v3 = sub_1003695E0();

  return v3;
}

- (id)operationForUndoing
{
  _TtC5Files21DOCUnarchiveOperation *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100369728();

  return v3;
}

- (void)registerUndo
{
  objc_msgSend(*(id *)&self->FPUnarchiveOperation_opaque[OBJC_IVAR____TtC5Files21DOCUnarchiveOperation_undoManager], "registerUndoOperationForSender:", self);
}

- (_TtC5Files21DOCUnarchiveOperation)initWithItem:(id)a3 destinationFolder:(id)a4
{
  id v5;
  id v6;
  _TtC5Files21DOCUnarchiveOperation *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC5Files21DOCUnarchiveOperation *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCUnarchiveOperation", 27, "init(item:destinationFolder:)", 29, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
