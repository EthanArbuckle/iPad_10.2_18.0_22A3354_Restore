@implementation CRLPasteboardSourceContext

- (CRContext)sourceContext
{
  return (CRContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC8Freeform26CRLPasteboardSourceContext__sourceContext));
}

- (_TtC8Freeform17CRLBoardDataStore)sourceStore
{
  return (_TtC8Freeform17CRLBoardDataStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR____TtC8Freeform26CRLPasteboardSourceContext__store));
}

- (_TtC8Freeform26CRLPasteboardSourceContext)init
{
  _TtC8Freeform26CRLPasteboardSourceContext *result;

  result = (_TtC8Freeform26CRLPasteboardSourceContext *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLPasteboardSourceContext", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
