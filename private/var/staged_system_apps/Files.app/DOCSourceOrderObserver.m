@implementation DOCSourceOrderObserver

- (void)dealloc
{
  _TtC5Files22DOCSourceOrderObserver *v2;

  v2 = self;
  DOCSourceOrderObserver.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->sourceObserver[OBJC_IVAR____TtC5Files22DOCSourceOrderObserver_updateBlock]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCSourceOrderObserver_strategy));
}

- (_TtC5Files22DOCSourceOrderObserver)init
{
  _TtC5Files22DOCSourceOrderObserver *result;

  result = (_TtC5Files22DOCSourceOrderObserver *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCSourceOrderObserver", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
