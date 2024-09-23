@implementation PauseRingsViewController

- (_TtC10FitnessApp24PauseRingsViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC10FitnessApp24PauseRingsViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController_hostingController) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_QWORD *)v4 + 6) = 0;
  v5 = a3;

  result = (_TtC10FitnessApp24PauseRingsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/PauseRingsViewController.swift", 41, 2, 41, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC10FitnessApp24PauseRingsViewController *v2;

  v2 = self;
  sub_1003412F4();

}

- (_TtC10FitnessApp24PauseRingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp24PauseRingsViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp24PauseRingsViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.PauseRingsViewController", 35, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController_pauseRingsCoordinator));
  sub_1003417D4(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView), *(_QWORD *)&self->hostingController[OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView], *(_QWORD *)&self->pauseRingsCoordinator[OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView], *(_QWORD *)&self->shouldShowEditFlow[OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView], *(void **)&self->$__lazy_storage_$_pauseRingsView[OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView+ 5], *(_QWORD *)&self->$__lazy_storage_$_pauseRingsView[OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView+ 13], *(_QWORD *)&self->$__lazy_storage_$_pauseRingsView[OBJC_IVAR____TtC10FitnessApp24PauseRingsViewController____lazy_storage___pauseRingsView+ 21]);
}

@end
