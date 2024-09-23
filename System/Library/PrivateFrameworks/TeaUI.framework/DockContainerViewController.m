@implementation DockContainerViewController

- (BOOL)shouldAutorotate
{
  _TtC5TeaUI27DockContainerViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = DockContainerViewController.shouldAutorotate.getter();

  return v3 & 1;
}

- (void)viewDidLayoutSubviews
{
  _TtC5TeaUI27DockContainerViewController *v2;

  v2 = self;
  DockContainerViewController.viewDidLayoutSubviews()();

}

- (UIViewController)childViewControllerForStatusBarStyle
{
  _TtC5TeaUI27DockContainerViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)DockContainerViewController.childForStatusBarStyle.getter();

  return (UIViewController *)v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)viewDidLoad
{
  _TtC5TeaUI27DockContainerViewController *v2;

  v2 = self;
  DockContainerViewController.viewDidLoad()();

}

- (_TtC5TeaUI27DockContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B15DEE38();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t (*v8)();
  uint64_t v9;
  id v10;
  _TtC5TeaUI27DockContainerViewController *v11;

  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1B15E0ED8;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  DockContainerViewController.present(_:animated:completion:)((uint64_t)v10, a4, (uint64_t)v8, v9);
  sub_1B13B9100((uint64_t)v8);

}

- (void)showViewController:(id)a3 sender:(id)a4
{
  sub_1B15DF310(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, _OWORD *))DockContainerViewController.show(_:sender:));
}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  sub_1B15DF310(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, _OWORD *))DockContainerViewController.showDetailViewController(_:sender:));
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC5TeaUI27DockContainerViewController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1B145624C;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  DockContainerViewController.dismiss(animated:completion:)(a3, v6, v7);
  sub_1B13B9100((uint64_t)v6);

}

- (void)dockedViewTapped
{
  _TtC5TeaUI27DockContainerViewController *v2;

  v2 = self;
  sub_1B15DF8C0();

}

- (void)dockedViewLongPressed
{
  _TtC5TeaUI27DockContainerViewController *v2;

  v2 = self;
  sub_1B15DF900();

}

- (_TtC5TeaUI27DockContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  DockContainerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI27DockContainerViewController_dockView);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI27DockContainerViewController____lazy_storage___dockHeightConstraint);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI27DockContainerViewController____lazy_storage___dockedView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI27DockContainerViewController____lazy_storage___expandedViewController));
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC5TeaUI27DockContainerViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = DockContainerViewController.animationController(forDismissed:)(v4);

  return v6;
}

- (BOOL)accessibilityPerformMagicTap
{
  _TtC5TeaUI27DockContainerViewController *v2;

  v2 = self;
  DockContainerViewController.accessibilityPerformMagicTap()();

  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

@end
