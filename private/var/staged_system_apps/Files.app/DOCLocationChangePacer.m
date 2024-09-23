@implementation DOCLocationChangePacer

- (_TtC5Files22DOCLocationChangePacer)initWithHierarchyController:(id)a3
{
  _QWORD *v4;
  objc_class *v5;
  _TtC5Files22DOCLocationChangePacer *v6;
  objc_class *v7;
  _TtC5Files22DOCLocationChangePacer *v8;
  objc_super v10;

  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCLocationChangePacer_pendingLocationChange);
  *v4 = 0;
  v4[1] = 0;
  v5 = (objc_class *)a3;
  v6 = self;
  Date.init()(v6);
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC5Files22DOCLocationChangePacer_hierarchyController) = v5;
  v7 = v5;

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for DOCLocationChangePacer(0);
  v8 = -[DOCLocationChangePacer init](&v10, "init");

  return v8;
}

- (void)performPendingLocationChange
{
  _TtC5Files22DOCLocationChangePacer *v2;

  v2 = self;
  sub_1004BBE98();

}

- (_TtC5Files22DOCLocationChangePacer)init
{
  _TtC5Files22DOCLocationChangePacer *result;

  result = (_TtC5Files22DOCLocationChangePacer *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCLocationChangePacer", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100146170(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCLocationChangePacer_pendingLocationChange), *(void **)&self->hierarchyController[OBJC_IVAR____TtC5Files22DOCLocationChangePacer_pendingLocationChange]);
  v3 = (char *)self + OBJC_IVAR____TtC5Files22DOCLocationChangePacer_timestampOfLastLocationChangeAttempt;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
