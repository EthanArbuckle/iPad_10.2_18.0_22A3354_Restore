@implementation RulerHostingDelegate

- (id)rulerHostingView
{
  return (id)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit20RulerHostingDelegate_rulerHostView, a2);
}

- (BOOL)rulerHostWantsSharedRuler
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8PaperKit20RulerHostingDelegate_sharedRuler);
}

- (_TtC8PaperKit20RulerHostingDelegate)init
{
  _TtC8PaperKit20RulerHostingDelegate *result;

  result = (_TtC8PaperKit20RulerHostingDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
