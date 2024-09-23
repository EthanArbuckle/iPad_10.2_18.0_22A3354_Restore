@implementation TSCardContainerController

- (void)viewDidLayoutSubviews
{
  TSCardContainerController *v2;

  v2 = self;
  CardContainerController.viewDidLayoutSubviews()();

}

- (UIViewController)childViewControllerForStatusBarStyle
{
  TSCardContainerController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B13D7D0C();

  return (UIViewController *)v3;
}

- (void)viewWillLayoutSubviews
{
  TSCardContainerController *v2;

  v2 = self;
  CardContainerController.viewWillLayoutSubviews()();

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewSafeAreaInsetsDidChange
{
  TSCardContainerController *v2;

  v2 = self;
  CardContainerController.viewSafeAreaInsetsDidChange()();

}

- (void)viewLayoutMarginsDidChange
{
  TSCardContainerController *v2;

  v2 = self;
  CardContainerController.viewLayoutMarginsDidChange()();

}

- (void)viewWillAppear:(BOOL)a3
{
  TSCardContainerController *v4;

  v4 = self;
  CardContainerController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  TSCardContainerController *v4;

  v4 = self;
  CardContainerController.viewDidAppear(_:)(a3);

}

- (void)viewDidLoad
{
  TSCardContainerController *v2;

  v2 = self;
  CardContainerController.viewDidLoad()();

}

- (TSCardContainerController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  CardContainerController.init(coder:)();
}

- (TSCardContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  CardContainerController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  sub_1B13C076C((uint64_t)self + OBJC_IVAR___TSCardContainerController_delegate);
  swift_release();
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSCardContainerController_rootViewController);
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSCardContainerController_dimmingColor);
  v3 = (char *)self + OBJC_IVAR___TSCardContainerController_cardItemStack;
  OUTLINED_FUNCTION_41_1(v4, (unint64_t *)&qword_1ED17A600, (uint64_t (*)(uint64_t))type metadata accessor for CardContainerController.CardItem, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DB4A68]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSCardContainerController_dimmingView);
  swift_release();
}

- (void)viewWillDisappear:(BOOL)a3
{
  TSCardContainerController *v4;

  v4 = self;
  CardContainerController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  TSCardContainerController *v4;

  v4 = self;
  CardContainerController.viewDidDisappear(_:)(a3);

}

- (void)collapseCards:(id)a3
{
  void *v4;
  uint64_t (*v5)();
  TSCardContainerController *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = sub_1B14CA87C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  CardContainerController.collapseCards(completion:)();
  sub_1B13B9100((uint64_t)v5);

}

- (void)expandCards:(id)a3
{
  void *v4;
  uint64_t (*v5)();
  TSCardContainerController *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = sub_1B1456244;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  CardContainerController.expandCards(completion:)();
  sub_1B13B9100((uint64_t)v5);

}

- (void)pushCardWithViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v7;
  id v8;
  TSCardContainerController *v9;

  v7 = _Block_copy(a5);
  if (v7)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v7;
    v7 = sub_1B145E320;
  }
  v8 = a3;
  v9 = self;
  CardContainerController.pushCard(_:animated:completion:)();
  sub_1B13B9100((uint64_t)v7);

}

- (void)popCards
{
  TSCardContainerController *v2;

  v2 = self;
  CardContainerController.popCards()();

}

- (BOOL)accessibilityPerformEscape
{
  TSCardContainerController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = CardContainerController.accessibilityPerformEscape()();

  return v3;
}

@end
