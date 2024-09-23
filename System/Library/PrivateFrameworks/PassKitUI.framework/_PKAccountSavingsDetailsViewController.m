@implementation _PKAccountSavingsDetailsViewController

- (_PKAccountSavingsDetailsViewController)initWithConfiguration:(id)a3 setNavigationIconVisible:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v5 = sub_19D2A2A84;
  }
  else
  {
    v6 = 0;
  }
  return (_PKAccountSavingsDetailsViewController *)AccountSavingsDetailsViewController.init(withConfiguration:setNavigationIconVisible:)(a3, v5, v6);
}

- (_PKAccountSavingsDetailsViewController)initWithCoder:(id)a3
{
  _PKAccountSavingsDetailsViewController *result;

  result = (_PKAccountSavingsDetailsViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  _PKAccountSavingsDetailsViewController *v2;

  v2 = self;
  sub_19D298070();

}

- (void)viewWillLayoutSubviews
{
  sub_19D299C74(self, (uint64_t)a2, type metadata accessor for AccountSavingsDetailsViewController, &OBJC_IVAR____PKAccountSavingsDetailsViewController_detailsHostingVC);
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_19D298738(self, (uint64_t)a2, a3, type metadata accessor for AccountSavingsDetailsViewController, &OBJC_IVAR____PKAccountSavingsDetailsViewController_configuration, (void (*)(id, char *, char *, id, uint64_t))sub_19D2A0734);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_19D2987F8(self, (uint64_t)a2, a3, type metadata accessor for AccountSavingsDetailsViewController, &OBJC_IVAR____PKAccountSavingsDetailsViewController_configuration, 1);
}

- (_PKAccountSavingsDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_19D29AA78((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____PKAccountSavingsDetailsViewController_detailsHostingVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____PKAccountSavingsDetailsViewController_configuration));
}

@end
