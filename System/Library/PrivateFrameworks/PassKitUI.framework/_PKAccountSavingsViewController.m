@implementation _PKAccountSavingsViewController

- (_PKAccountSavingsViewController)initWithConfiguration:(id)a3
{
  return (_PKAccountSavingsViewController *)AccountSavingsViewController.init(withConfiguration:)(a3);
}

- (_PKAccountSavingsViewController)initWithCoder:(id)a3
{
  _PKAccountSavingsViewController *result;

  result = (_PKAccountSavingsViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  _PKAccountSavingsViewController *v2;

  v2 = self;
  sub_19D2975F8();

}

- (void)viewWillLayoutSubviews
{
  sub_19D299C74(self, (uint64_t)a2, type metadata accessor for AccountSavingsViewController, &OBJC_IVAR____PKAccountSavingsViewController_accountHostingVC);
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_19D298738(self, (uint64_t)a2, a3, type metadata accessor for AccountSavingsViewController, &OBJC_IVAR____PKAccountSavingsViewController_configuration, (void (*)(id, char *, char *, id, uint64_t))sub_19D29C8D0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_19D2987F8(self, (uint64_t)a2, a3, type metadata accessor for AccountSavingsViewController, &OBJC_IVAR____PKAccountSavingsViewController_configuration, 0);
}

- (_PKAccountSavingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_19D29AA78((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____PKAccountSavingsViewController_accountHostingVC));

}

@end
