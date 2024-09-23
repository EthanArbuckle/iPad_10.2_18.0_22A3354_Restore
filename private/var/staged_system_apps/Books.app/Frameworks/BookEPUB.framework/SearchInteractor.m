@implementation SearchInteractor

- (_TtC8BookEPUB16SearchInteractor)init
{
  _TtC8BookEPUB16SearchInteractor *result;

  result = (_TtC8BookEPUB16SearchInteractor *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.SearchInteractor", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB16SearchInteractor_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB16SearchInteractor_log;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookEPUB16SearchInteractor_dataManager));
}

@end
