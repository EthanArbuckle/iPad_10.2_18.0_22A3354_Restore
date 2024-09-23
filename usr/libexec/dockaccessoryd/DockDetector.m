@implementation DockDetector

- (void)dealloc
{
  __IOHIDManager *v2;
  _TtC14dockaccessoryd12DockDetector *v3;
  void *v4;
  objc_super v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_hidManager);
  v3 = self;
  IOHIDManagerClose(v2, 0);
  v4 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_jarvisTimer);
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_jarvisTimer) = 0;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for DockDetector(0);
  -[DockDetector dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  v5 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_dockStatus;
  v6 = type metadata accessor for DockStatus(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_1000B1410(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_jarvisCallback), *(_QWORD *)&self->startupValidator[OBJC_IVAR____TtC14dockaccessoryd12DockDetector_jarvisCallback]);
}

- (_TtC14dockaccessoryd12DockDetector)init
{
  _TtC14dockaccessoryd12DockDetector *result;

  result = (_TtC14dockaccessoryd12DockDetector *)_swift_stdlib_reportUnimplementedInitializer("dockaccessoryd.DockDetector", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
