@implementation RDGroceryOperationQueue

- (id)waiterID
{
  return String._bridgeToObjectiveC()();
}

- (_TtC7remindd23RDGroceryOperationQueue)init
{
  _TtC7remindd23RDGroceryOperationQueue *result;

  result = (_TtC7remindd23RDGroceryOperationQueue *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDGroceryOperationQueue", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7remindd23RDGroceryOperationQueue_cancellables));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7remindd23RDGroceryOperationQueue_osTransaction));
}

@end
