@implementation ValueEditingViewController

- (_TtC8PaperKit26ValueEditingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized ValueEditingViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC8PaperKit26ValueEditingViewController *v2;

  v2 = self;
  ValueEditingViewController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ValueEditingViewController();
  v4 = v6.receiver;
  -[ValueEditingViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  LODWORD(v3) = *MEMORY[0x1E0DC45C0];
  v5 = ValueEditingViewController.stepper.getter();
  UIAccessibilityPostNotification(v3, v5);

}

- (void)didChangeStepperValue
{
  _TtC8PaperKit26ValueEditingViewController *v2;

  v2 = self;
  ValueEditingViewController.didChangeStepperValue()();

}

- (void)didStartChangingSliderValue
{
  @objc ValueEditingViewController.didStartChangingSliderValue()((char *)self, (uint64_t)a2, (SEL *)&selRef_valueEditingViewController_didStartChangingValue_);
}

- (void)didFinishChangingSliderValue
{
  @objc ValueEditingViewController.didStartChangingSliderValue()((char *)self, (uint64_t)a2, (SEL *)&selRef_valueEditingViewController_didFinishChangingValue_);
}

- (void)didChangeSliderValue
{
  _TtC8PaperKit26ValueEditingViewController *v2;

  v2 = self;
  ValueEditingViewController.didChangeSliderValue()();

}

- (_TtC8PaperKit26ValueEditingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8PaperKit26ValueEditingViewController *result;

  v4 = a4;
  result = (_TtC8PaperKit26ValueEditingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit26ValueEditingViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26ValueEditingViewController____lazy_storage___stepper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26ValueEditingViewController____lazy_storage___slider));
}

@end
