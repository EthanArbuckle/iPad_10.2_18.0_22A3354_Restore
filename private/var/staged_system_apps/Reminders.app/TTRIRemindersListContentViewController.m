@implementation TTRIRemindersListContentViewController

- (_TtC9Reminders38TTRIRemindersListContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002D9440();
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC9Reminders38TTRIRemindersListContentViewController *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = self;
  v5 = sub_1002C26B0();
  v6 = *(Class *)((char *)&v5->isa + qword_10065D8E0);
  if (v6)
  {
    v7 = v6;
    sub_1002BB8C4();

    v5 = v7;
  }

  v8.receiver = v4;
  v8.super_class = ObjectType;
  -[TTRIRemindersListContentViewController dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_scrollingController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController____lazy_storage___treeView));
  swift_release();
  swift_release();
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_contextMenuOriginatorItem, (uint64_t *)&unk_100640EB0);
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_firstVisibleItemToRestore, (uint64_t *)&unk_100640EB0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_internalFocusedCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController____lazy_storage___completedTasksRotor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController____lazy_storage___incompleteTasksRotor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController____lazy_storage___overdueTasksRotor));
}

- (void)loadView
{
  _TtC9Reminders38TTRIRemindersListContentViewController *v2;
  NSObject *v3;
  id v4;
  id v5;

  v2 = self;
  v3 = sub_1002C26B0();
  -[TTRIRemindersListContentViewController setView:](v2, "setView:", v3);

  v4 = -[TTRIRemindersListContentViewController view](v2, "view");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders38TTRIRemindersListContentViewController *v3;

  v3 = self;
  sub_1002C2A2C((uint64_t)v3, v2);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _TtC9Reminders38TTRIRemindersListContentViewController *v6;

  v4 = a4;
  v6 = self;
  sub_1002C3ED0(a3, v4);

}

- (void)viewDidLayoutSubviews
{
  _TtC9Reminders38TTRIRemindersListContentViewController *v2;

  v2 = self;
  sub_1002C4258();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC9Reminders38TTRIRemindersListContentViewController *v4;

  v4 = self;
  sub_1002C44B8(a3, (uint64_t)v4);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9Reminders38TTRIRemindersListContentViewController *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v6, "nextFocusedView");
  if (v9)
  {
    v10 = v9;
    v11 = type metadata accessor for TTRIRemindersListReminderCell(0);
    v9 = (id)swift_dynamicCastClass(v10, v11);
    if (!v9)
    {

      v9 = 0;
    }
  }
  v12 = *(Class *)((char *)&v8->super.super.super.isa
                 + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_internalFocusedCell);
  *(Class *)((char *)&v8->super.super.super.isa
           + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_internalFocusedCell) = (Class)v9;

}

- (_TtC9Reminders38TTRIRemindersListContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders38TTRIRemindersListContentViewController *result;

  v4 = a4;
  result = (_TtC9Reminders38TTRIRemindersListContentViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIRemindersListContentViewController", 48, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)hoverInteraction:(id)a3 didBeginHoverAndHoldAtLocation:(CGPoint)a4 elevation:(double)a5
{
  double y;
  double x;
  id v8;
  _TtC9Reminders38TTRIRemindersListContentViewController *v9;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v9 = self;
  sub_1002D9CA4(v8, x, y);

}

- (void)hoverInteractionDidEndHoverAndHold:(id)a3
{
  id v4;
  _TtC9Reminders38TTRIRemindersListContentViewController *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_10008A224();
  v6 = 1;
  PassthroughSubject.send(_:)(&v6);

}

@end
