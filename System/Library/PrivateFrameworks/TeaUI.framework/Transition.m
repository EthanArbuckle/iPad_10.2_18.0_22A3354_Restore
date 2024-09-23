@implementation Transition

- (_TtC5TeaUI10Transition)init
{
  Transition.init()();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_7_70();
  OUTLINED_FUNCTION_7_70();
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5TeaUI10Transition_presentationControllerFactory));
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5TeaUI10Transition *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  Transition.animationController(forPresented:presenting:source:)();
  v13 = v12;

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC5TeaUI10Transition *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  Transition.animationController(forDismissed:)();
  v7 = v6;

  return v7;
}

- (id)interactionControllerForDismissal:(id)a3
{
  id v3;

  Transition.interactionControllerForDismissal(using:)();
  return v3;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  UIViewController *v8;
  id v9;
  UIViewController *v10;
  _TtC5TeaUI10Transition *v11;
  void *v12;

  v8 = (UIViewController *)a3;
  v9 = a4;
  v10 = (UIViewController *)a5;
  v11 = self;
  v12 = (void *)Transition.presentationController(forPresented:presenting:source:)(v8, (UIViewController_optional *)a4, v10);

  return v12;
}

@end
