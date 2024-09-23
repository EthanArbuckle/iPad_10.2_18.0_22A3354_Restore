@implementation ZStackContainerViewController

- (_TtC14WidgetRenderer29ZStackContainerViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ZStackContainerViewController();
  return -[ZStackContainerViewController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC14WidgetRenderer29ZStackContainerViewController)initWithCoder:(id)a3
{
  _TtC14WidgetRenderer29ZStackContainerViewController *result;

  result = (_TtC14WidgetRenderer29ZStackContainerViewController *)sub_24A55985C();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3;
  _TtC14WidgetRenderer29ZStackContainerViewController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)type metadata accessor for TouchPassThroughView());
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  -[ZStackContainerViewController setView:](v4, sel_setView_, v5);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (id)_childViewControllersForAlwaysOnTimelines
{
  _TtC14WidgetRenderer29ZStackContainerViewController *v2;
  id v3;
  unint64_t v4;
  void *v5;

  v2 = self;
  v3 = -[ZStackContainerViewController childViewControllers](v2, sel_childViewControllers);
  sub_24A50F674(0, &qword_2544D45D0);
  v4 = sub_24A5593C4();

  sub_24A5172B0(v4);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D4678);
  v5 = (void *)sub_24A5593B8();
  swift_bridgeObjectRelease();
  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (_TtC14WidgetRenderer29ZStackContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC14WidgetRenderer29ZStackContainerViewController *result;

  v4 = a4;
  result = (_TtC14WidgetRenderer29ZStackContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
