@implementation PromiseCardViewController

- (_TtC5TeaUI25PromiseCardViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B14EEFD8();
}

- (void)viewDidLoad
{
  _TtC5TeaUI25PromiseCardViewController *v2;

  v2 = self;
  PromiseCardViewController.viewDidLoad()();

}

- (_TtC5TeaUI25PromiseCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  PromiseCardViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1B14EFE3C(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_viewControllerState), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_viewControllerState), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_viewControllerState), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_viewControllerState), *(uint64_t *)((char *)&self->super._view + OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_viewControllerState));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_activityIndicatorView));
}

@end
