@implementation FlowRedirectionWrapperViewController

- (_TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController)initWithCoder:(id)a3
{
  _TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController *result;

  result = (_TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/FlowRedirectionWrapperViewController.swift", 66, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController *v2;

  v2 = self;
  sub_43AC4();

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController_child), "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController_child), "setPreferredContentSize:", a3.width, a3.height);
}

- (_TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.FlowRedirectionWrapperViewController", 60, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController_child));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController_customNextResponder));
}

@end
