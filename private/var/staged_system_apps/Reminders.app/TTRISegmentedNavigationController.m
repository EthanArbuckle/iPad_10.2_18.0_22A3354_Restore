@implementation TTRISegmentedNavigationController

- (_TtC9Reminders33TTRISegmentedNavigationController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC9Reminders33TTRISegmentedNavigationController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_segmentedControl) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_palette) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_selectedTabID);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC9Reminders33TTRISegmentedNavigationController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRISegmentedNavigationController.swift", 49, 2, 57, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRISegmentedNavigationController();
  v2 = v3.receiver;
  -[TTRISegmentedNavigationController viewDidLoad](&v3, "viewDidLoad");
  sub_1002F5C20();
  objc_msgSend(v2, "setDelegate:", v2, v3.receiver, v3.super_class);

}

- (void)viewDidLayoutSubviews
{
  _TtC9Reminders33TTRISegmentedNavigationController *v2;

  v2 = self;
  sub_1002F6634();

}

- (_TtC9Reminders33TTRISegmentedNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC9Reminders33TTRISegmentedNavigationController *result;

  result = (_TtC9Reminders33TTRISegmentedNavigationController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRISegmentedNavigationController", 43, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders33TTRISegmentedNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC9Reminders33TTRISegmentedNavigationController *result;

  v3 = a3;
  result = (_TtC9Reminders33TTRISegmentedNavigationController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRISegmentedNavigationController", 43, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders33TTRISegmentedNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders33TTRISegmentedNavigationController *result;

  v4 = a4;
  result = (_TtC9Reminders33TTRISegmentedNavigationController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRISegmentedNavigationController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_segmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_palette));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_tabStateByID));
  swift_bridgeObjectRelease(*(_QWORD *)&self->segmentedControl[OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_selectedTabID]);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC9Reminders33TTRISegmentedNavigationController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1002F5FB8(v8);

}

@end
