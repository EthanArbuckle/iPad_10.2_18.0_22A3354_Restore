@implementation DOCTrashOperation

- (NSString)actionNameForUndoing
{
  _TtC5Files17DOCTrashOperation *v2;
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
  _TtC5Files17DOCTrashOperation *v2;
  char *v3;

  v2 = self;
  v3 = sub_1002BE8C8();

  return v3;
}

- (id)operationForUndoing
{
  _TtC5Files17DOCTrashOperation *v2;
  char *v3;

  v2 = self;
  v3 = sub_1002BEA00();

  return v3;
}

- (void)registerUndo
{
  objc_msgSend(*(id *)&self->FPTrashOperation_opaque[OBJC_IVAR____TtC5Files17DOCTrashOperation_undoManager], "registerUndoOperationForSender:", self);
}

- (_TtC5Files17DOCTrashOperation)initWithItems:(id)a3
{
  _TtC5Files17DOCTrashOperation *result;

  result = (_TtC5Files17DOCTrashOperation *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCTrashOperation", 23, "init(items:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
