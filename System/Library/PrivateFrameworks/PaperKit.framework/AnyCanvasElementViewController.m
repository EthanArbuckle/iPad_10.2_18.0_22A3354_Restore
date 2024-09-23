@implementation AnyCanvasElementViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC8PaperKit30AnyCanvasElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC8PaperKit30AnyCanvasElementViewController *)AnyCanvasElementViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit30AnyCanvasElementViewController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit30AnyCanvasElementViewController *)AnyCanvasElementViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit30AnyCanvasElementViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit30AnyCanvasElementViewController_toolPicker));
}

@end
