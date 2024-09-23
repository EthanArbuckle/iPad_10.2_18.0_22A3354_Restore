@implementation WOMirrorViewController

- (WOMirrorViewController)initWithDataLinkMonitor:(id)a3
{
  return (WOMirrorViewController *)sub_1003D1FEC(a3);
}

- (WOMirrorViewController)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  WOMirrorViewController *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR___WOMirrorViewController_idleTimerToken);
  *v4 = 0u;
  v4[1] = 0u;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___WOMirrorViewController____lazy_storage___canHostMapView) = 2;
  v5 = a3;

  result = (WOMirrorViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/MirrorViewController.swift", 37, 2, 41, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  WOMirrorViewController *v2;

  v2 = self;
  sub_1003D223C();

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidAppear:(BOOL)a3
{
  WOMirrorViewController *v4;

  v4 = self;
  sub_1003D2498(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  WOMirrorViewController *v4;

  v4 = self;
  sub_1003D2634(a3);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void (*v6)();
  uint64_t v7;
  WOMirrorViewController *v8;

  v6 = (void (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10079D5B0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)())sub_1003D4A54;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1003D2828(a3, v6, v7);
  sub_100022BA4((uint64_t)v6, v7);

}

- (void)showNotification:(id)a3
{
  void *v4;
  id v5;
  WOMirrorViewController *v6;

  v4 = *(void **)((char *)a3 + OBJC_IVAR___WOWorkoutNotification_bridgedNotification);
  v5 = a3;
  v6 = self;
  sub_1003D3B10(v4);

}

- (void)showTimeoutDialogWithDismissCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  WOMirrorViewController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10079D588, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1003D3640((uint64_t)sub_100106890, v5);

  swift_release(v5);
}

- (WOMirrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  WOMirrorViewController *result;

  v4 = a4;
  result = (WOMirrorViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.MirrorViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WOMirrorViewController_notificationCenter));
  sub_1000F996C((uint64_t)self + OBJC_IVAR___WOMirrorViewController_idleTimerToken);
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return 2;
}

@end
