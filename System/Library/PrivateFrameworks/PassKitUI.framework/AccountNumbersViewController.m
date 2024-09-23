@implementation AccountNumbersViewController

- (_TtC9PassKitUI28AccountNumbersViewController)initWithConfiguration:(id)a3
{
  return (_TtC9PassKitUI28AccountNumbersViewController *)AccountNumbersViewController.init(withConfiguration:)(a3);
}

- (_TtC9PassKitUI28AccountNumbersViewController)initWithCoder:(id)a3
{
  _TtC9PassKitUI28AccountNumbersViewController *result;

  result = (_TtC9PassKitUI28AccountNumbersViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC9PassKitUI28AccountNumbersViewController *v2;

  v2 = self;
  sub_19D299AF0(type metadata accessor for AccountNumbersViewController, &OBJC_IVAR____TtC9PassKitUI28AccountNumbersViewController_accountNumbersVC);

}

- (void)viewWillLayoutSubviews
{
  sub_19D299C74(self, (uint64_t)a2, type metadata accessor for AccountNumbersViewController, &OBJC_IVAR____TtC9PassKitUI28AccountNumbersViewController_accountNumbersVC);
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (_TtC9PassKitUI28AccountNumbersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_19D29AA78((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI28AccountNumbersViewController_accountNumbersVC));
}

@end
