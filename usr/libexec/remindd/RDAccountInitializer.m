@implementation RDAccountInitializer

+ (NSString)DidCompleteInitializeAllAccountsNotification
{
  if (qword_1008373B0 != -1)
    swift_once(&qword_1008373B0, sub_1003AAB88);
  return (NSString *)(id)qword_100871EC0;
}

- (_TtC7remindd20RDAccountInitializer)init
{
  _TtC7remindd20RDAccountInitializer *result;

  result = (_TtC7remindd20RDAccountInitializer *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDAccountInitializer", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7remindd20RDAccountInitializer_userDefaults));
}

@end
