@implementation DOCPromptHeaderView

- (NSString)promptText
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->promptText[OBJC_IVAR____TtC5Files19DOCPromptHeaderView_promptText];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC5Files19DOCPromptHeaderView)initWithFrame:(CGRect)a3
{
  _TtC5Files19DOCPromptHeaderView *result;

  result = (_TtC5Files19DOCPromptHeaderView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCPromptHeaderView", 25, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->promptText[OBJC_IVAR____TtC5Files19DOCPromptHeaderView_promptText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->promptText[OBJC_IVAR____TtC5Files19DOCPromptHeaderView_glyphName]);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCPromptHeaderView____lazy_storage___promptLabel));
}

@end
