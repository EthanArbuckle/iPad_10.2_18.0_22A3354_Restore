@implementation SnapshotViewController

- (_TtC8BookEPUB22SnapshotViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1795B4();
}

- (void)viewDidLoad
{
  _TtC8BookEPUB22SnapshotViewController *v2;

  v2 = self;
  sub_17869C();

}

- (_TtC8BookEPUB22SnapshotViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8BookEPUB22SnapshotViewController *result;

  v4 = a4;
  result = (_TtC8BookEPUB22SnapshotViewController *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.SnapshotViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB22SnapshotViewController_snapshotView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8BookEPUB22SnapshotViewController_viewController);
  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB22SnapshotViewController_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
