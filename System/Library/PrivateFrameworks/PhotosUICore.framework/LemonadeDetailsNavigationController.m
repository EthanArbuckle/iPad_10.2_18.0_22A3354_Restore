@implementation LemonadeDetailsNavigationController

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)-[LemonadeDetailsNavigationController topViewController](self, sel_topViewController);
}

- (void)viewDidLoad
{
  id v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LemonadeDetailsNavigationController();
  v2 = v7.receiver;
  -[LemonadeDetailsNavigationController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (void *)objc_opt_self();
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C4360);
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance, v7.receiver, v7.super_class);
  objc_msgSend(v4, sel_simulatedDetailsViewLoadingDelay);
  v6 = v5;

  objc_msgSend(v3, sel_sleepForTimeInterval_, v6);
}

- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LemonadeDetailsNavigationController();
  return -[LemonadeDetailsNavigationController initWithNavigationBarClass:toolbarClass:](&v7, sel_initWithNavigationBarClass_toolbarClass_, a3, a4);
}

- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithRootViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LemonadeDetailsNavigationController();
  return -[LemonadeDetailsNavigationController initWithRootViewController:](&v5, sel_initWithRootViewController_, a3);
}

- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController *v9;
  objc_super v11;

  if (a3)
  {
    sub_1A7AE3764();
    v6 = a4;
    v7 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for LemonadeDetailsNavigationController();
  v9 = -[LemonadeDetailsNavigationController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController)initWithCoder:(id)a3
{
  return (_TtC12PhotosUICoreP33_5A77AA35E7CED42F2D112515D5FBA02135LemonadeDetailsNavigationController *)sub_1A6DDE818(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for LemonadeDetailsNavigationController);
}

@end
