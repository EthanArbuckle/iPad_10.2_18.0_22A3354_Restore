@implementation CRLTextInputLogger

- (_TtC8Freeform18CRLTextInputLogger)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform18CRLTextInputLogger_tracedResults) = (Class)_swiftEmptyDictionarySingleton;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform18CRLTextInputLogger_logIndent) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLTextInputLogger();
  return -[CRLTextInputLogger init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform18CRLTextInputLogger_tracedResults));
}

@end
