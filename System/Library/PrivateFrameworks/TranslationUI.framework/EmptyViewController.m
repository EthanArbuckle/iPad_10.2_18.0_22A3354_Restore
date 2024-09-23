@implementation EmptyViewController

- (_TtC13TranslationUI19EmptyViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmptyViewController();
  return -[EmptyViewController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC13TranslationUI19EmptyViewController)initWithCoder:(id)a3
{
  _TtC13TranslationUI19EmptyViewController *result;

  result = (_TtC13TranslationUI19EmptyViewController *)sub_1D2D9E394();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3;
  _TtC13TranslationUI19EmptyViewController *v4;
  id v5;

  v3 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v4 = self;
  v5 = objc_msgSend(v3, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  -[EmptyViewController setView:](v4, sel_setView_, v5);

}

- (_TtC13TranslationUI19EmptyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13TranslationUI19EmptyViewController *result;

  v4 = a4;
  result = (_TtC13TranslationUI19EmptyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
