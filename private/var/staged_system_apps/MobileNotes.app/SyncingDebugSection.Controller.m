@implementation SyncingDebugSection.Controller

- (_TtCV11MobileNotes19SyncingDebugSection10Controller)init
{
  _TtCV11MobileNotes19SyncingDebugSection10Controller *result;

  result = (_TtCV11MobileNotes19SyncingDebugSection10Controller *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.Controller", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (char *)self + OBJC_IVAR____TtCV11MobileNotes19SyncingDebugSection10Controller__object;
  v4 = sub_100012E18(&qword_1005D4C08);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa+ OBJC_IVAR____TtCV11MobileNotes19SyncingDebugSection10Controller_managedObjectContextObjectsDidChangeObservation), v5);
}

@end
