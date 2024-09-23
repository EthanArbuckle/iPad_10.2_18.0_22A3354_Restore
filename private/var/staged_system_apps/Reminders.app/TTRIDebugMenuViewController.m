@implementation TTRIDebugMenuViewController

- (_TtC9Reminders27TTRIDebugMenuViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders27TTRIDebugMenuViewController *)sub_1000DC268(v3, v4);
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders27TTRIDebugMenuViewController *v3;

  v3 = self;
  sub_1000DC3C4((uint64_t)v3, v2);

}

- (UITableView)tableView
{
  return (UITableView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController_tableView);
}

- (void)setTableView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController_tableView, a3);
}

- (void)didTapDone:(id)a3
{
  _QWORD *v5;
  uint64_t Strong;
  id v7;
  _TtC9Reminders27TTRIDebugMenuViewController *v8;
  id v9;

  v5 = sub_10001413C(*(_QWORD **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController_eventHandler)+ 6, (*(_QWORD **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController_eventHandler))[9]);
  Strong = swift_unknownObjectWeakLoadStrong(*v5 + 16);
  if (Strong)
  {
    v9 = (id)Strong;
    v7 = a3;
    v8 = self;
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (_TtC9Reminders27TTRIDebugMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders27TTRIDebugMenuViewController *result;

  v4 = a4;
  result = (_TtC9Reminders27TTRIDebugMenuViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIDebugMenuViewController", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController_tableView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController_tableDataController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController____lazy_storage___deferredUpdateAction));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController_eventHandler));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController____lazy_storage___nukeCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController____lazy_storage___populateCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController____lazy_storage___animationSlowModeCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController____lazy_storage___pencilAutoCommitDelayCell));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController____lazy_storage___suggestedAttributeModelCells));
}

@end
