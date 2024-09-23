@implementation TextStyleViewController

- (_TtC8PaperKit23TextStyleViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC8PaperKit23TextStyleViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit23TextStyleViewController_contentViewMargin) = (Class)0x4028000000000000;
  *(_OWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC8PaperKit23TextStyleViewController_preferredPopoverSize) = xmmword_1DDF353E0;
  v4 = a3;

  result = (_TtC8PaperKit23TextStyleViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8PaperKit23TextStyleViewController *v2;

  v2 = self;
  TextStyleViewController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8PaperKit23TextStyleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8PaperKit23TextStyleViewController *result;

  v4 = a4;
  result = (_TtC8PaperKit23TextStyleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23TextStyleViewController_textStyleView));
}

@end
