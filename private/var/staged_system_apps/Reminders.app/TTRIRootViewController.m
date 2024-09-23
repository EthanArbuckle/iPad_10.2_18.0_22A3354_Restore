@implementation TTRIRootViewController

- (void)splitViewControllerDidCollapse:(id)a3
{
  id v4;
  _TtC9Reminders22TTRIRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10000CD58(v4);

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC9Reminders22TTRIRootViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1000149D4(v8);

}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v6;
  _TtC9Reminders22TTRIRootViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_10000C740(v6, a4);

  return v8;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_100007870(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (SEL *)&selRef_becomeFirstResponder);
}

- (_TtC9Reminders22TTRIRootViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9Reminders22TTRIRootViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_pendingNavigateToRootPromise) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_activityItemsConfigurationProviding) = 0;
  v4 = a3;

  result = (_TtC9Reminders22TTRIRootViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIRootViewController.swift", 38, 2, 123, 0);
  __break(1u);
  return result;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue((*(id **)((char *)&self->super.super.super.super.isa
                                                                    + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_presenter))[14]);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_100007870(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, (SEL *)&selRef_resignFirstResponder);
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  _TtC9Reminders22TTRIRootViewController *v7;
  _TtC9Reminders22TTRIRootViewController *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _OWORD v17[2];
  __int128 v18;
  uint64_t v19;

  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v17);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v8 = self;
  }
  sub_10023C7F0((uint64_t)a3, (uint64_t)v17, &v18);

  sub_1000073A0((uint64_t)v17, &qword_100640E50);
  v9 = v19;
  if (!v19)
    return 0;
  v10 = sub_10001413C(&v18, v19);
  v11 = *(_QWORD *)(v9 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v11 + 16))(v14, v12);
  v15 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v14, v9);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
  sub_100027F10(&v18);
  return v15;
}

- (_TtC9Reminders22TTRIRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders22TTRIRootViewController *result;

  v4 = a4;
  result = (_TtC9Reminders22TTRIRootViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIRootViewController", 32, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders22TTRIRootViewController)initWithStyle:(int64_t)a3
{
  _TtC9Reminders22TTRIRootViewController *result;

  result = (_TtC9Reminders22TTRIRootViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIRootViewController", 32, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_mainNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_detailNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_ttrMainViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_pendingNavigateToRootPromise));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_activityItemsConfigurationProviding));
}

- (void)splitViewControllerDidExpand:(id)a3
{
  id v4;
  _TtC9Reminders22TTRIRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10023CF24(v4);

}

@end
