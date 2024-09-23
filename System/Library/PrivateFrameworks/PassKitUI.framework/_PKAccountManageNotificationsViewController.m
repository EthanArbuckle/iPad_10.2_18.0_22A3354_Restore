@implementation _PKAccountManageNotificationsViewController

- (_PKAccountManageNotificationsViewController)initWithConfiguration:(id)a3
{
  return (_PKAccountManageNotificationsViewController *)AccountManageNotificationsViewController.init(withConfiguration:)(a3);
}

- (_PKAccountManageNotificationsViewController)initWithCoder:(id)a3
{
  _PKAccountManageNotificationsViewController *result;

  result = (_PKAccountManageNotificationsViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  _PKAccountManageNotificationsViewController *v2;

  v2 = self;
  sub_19D299AF0(type metadata accessor for AccountManageNotificationsViewController, &OBJC_IVAR____PKAccountManageNotificationsViewController_hostingVC);

}

- (void)viewWillLayoutSubviews
{
  sub_19D299C74(self, (uint64_t)a2, type metadata accessor for AccountManageNotificationsViewController, &OBJC_IVAR____PKAccountManageNotificationsViewController_hostingVC);
}

- (_PKAccountManageNotificationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_19D29AA78((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____PKAccountManageNotificationsViewController_hostingVC));
}

@end
