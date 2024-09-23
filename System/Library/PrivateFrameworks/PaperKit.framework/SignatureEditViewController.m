@implementation SignatureEditViewController

- (_TtC8PaperKit27SignatureEditViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8PaperKit27SignatureEditViewController *)SignatureEditViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit27SignatureEditViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  _TtC8PaperKit27SignatureEditViewController *result;

  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit27SignatureEditViewController_panelSize) = xmmword_1DDF35B40;
  v5 = OBJC_IVAR____TtC8PaperKit27SignatureEditViewController_navigationBar;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3A28]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit27SignatureEditViewController_completion);
  *v8 = UnknownCanvasElementView.flags.modify;
  v8[1] = 0;

  result = (_TtC8PaperKit27SignatureEditViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC8PaperKit27SignatureEditViewController *v2;

  v2 = self;
  SignatureEditViewController.viewDidLoad()();

}

- (void)addAction:(id)a3
{
  id v4;
  _TtC8PaperKit27SignatureEditViewController *v5;

  v4 = a3;
  v5 = self;
  specialized SignatureEditViewController.addAction(_:)();

}

- (void)doneAction:(id)a3
{
  id v4;
  _TtC8PaperKit27SignatureEditViewController *v5;

  v4 = a3;
  v5 = self;
  specialized SignatureEditViewController.doneAction(_:)();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27SignatureEditViewController_navigationBar));
  swift_release();
}

@end
