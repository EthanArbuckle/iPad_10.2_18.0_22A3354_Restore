@implementation ModalHostViewController

- (_TtC5TeaUI23ModalHostViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B169651C();
}

- (void)closeButtonPressedWithSender:(id)a3
{
  id v4;
  _TtC5TeaUI23ModalHostViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B1696624();

}

- (_TtC5TeaUI23ModalHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  ModalHostViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  void *v3;

  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI23ModalHostViewController_delegate);
  v3 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5TeaUI23ModalHostViewController_styler);

  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI23ModalHostViewController_viewController);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI23ModalHostViewController_closeButton);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI23ModalHostViewController_transitionEffectView);
  sub_1B16989EC((uint64_t)self + OBJC_IVAR____TtC5TeaUI23ModalHostViewController_session, &qword_1ED17C8B8, (void (*)(uint64_t))type metadata accessor for ModalViewSession);
  OUTLINED_FUNCTION_0_0();
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)viewDidLoad
{
  _TtC5TeaUI23ModalHostViewController *v2;

  v2 = self;
  ModalHostViewController.viewDidLoad()();

}

- (void)viewWillLayoutSubviews
{
  _TtC5TeaUI23ModalHostViewController *v2;

  v2 = self;
  ModalHostViewController.viewWillLayoutSubviews()();

}

- (void)viewDidLayoutSubviews
{
  _TtC5TeaUI23ModalHostViewController *v2;

  v2 = self;
  ModalHostViewController.viewDidLayoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5TeaUI23ModalHostViewController *v6;
  _TtC5TeaUI23ModalHostViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  ModalHostViewController.traitCollectionDidChange(_:)(v8);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5TeaUI23ModalHostViewController *v4;

  v4 = self;
  ModalHostViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5TeaUI23ModalHostViewController *v4;

  v4 = self;
  ModalHostViewController.viewDidDisappear(_:)(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC5TeaUI23ModalHostViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  ModalHostViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (NSArray)keyCommands
{
  _TtC5TeaUI23ModalHostViewController *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = ModalHostViewController.keyCommands.getter((uint64_t)v2);

  if (v3)
  {
    sub_1B13A1818(0, (unint64_t *)&qword_1ED1837A8);
    v4 = (void *)sub_1B16B9B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)dismissKeyCommand
{
  _TtC5TeaUI23ModalHostViewController *v2;

  v2 = self;
  sub_1B169803C();

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5TeaUI23ModalHostViewController *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = ModalHostViewController.animationController(forPresented:presenting:source:)();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC5TeaUI23ModalHostViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = ModalHostViewController.animationController(forDismissed:)();

  return v6;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC5TeaUI23ModalHostViewController *v5;

  v4 = a3;
  v5 = self;
  ModalHostViewController.presentationControllerDidDismiss(_:)((UIPresentationController)v5);

}

@end
