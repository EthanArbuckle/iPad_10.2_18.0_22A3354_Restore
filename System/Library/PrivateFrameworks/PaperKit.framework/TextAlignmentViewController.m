@implementation TextAlignmentViewController

- (void)viewDidLoad
{
  _TtC8PaperKit27TextAlignmentViewController *v2;

  v2 = self;
  TextAlignmentViewController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8PaperKit27TextAlignmentViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8PaperKit27TextAlignmentViewController *)TextAlignmentViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit27TextAlignmentViewController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit27TextAlignmentViewController *)TextAlignmentViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27TextAlignmentViewController_textAlignmentControl));
}

@end
