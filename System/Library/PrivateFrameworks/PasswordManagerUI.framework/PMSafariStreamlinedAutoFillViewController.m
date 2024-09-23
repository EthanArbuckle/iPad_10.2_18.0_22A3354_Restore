@implementation PMSafariStreamlinedAutoFillViewController

- (PMSafariStreamlinedAutoFillViewControllerDelegate)delegate
{
  return (PMSafariStreamlinedAutoFillViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PMSafariStreamlinedAutoFillViewController_delegate) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  PMSafariStreamlinedAutoFillViewController *v2;

  v2 = self;
  PMSafariStreamlinedAutoFillViewController.viewDidLoad()();

}

- (PMSafariStreamlinedAutoFillViewController)initWithSavedAccountMatch:(id)a3 host:(id)a4
{
  return (PMSafariStreamlinedAutoFillViewController *)sub_2435AA150((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_2435AB6D0);
}

- (PMSafariStreamlinedAutoFillViewController)initWithCredentialIdentity:(id)a3 host:(id)a4
{
  return (PMSafariStreamlinedAutoFillViewController *)sub_2435AA150((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_2435AB79C);
}

- (PMSafariStreamlinedAutoFillViewController)initWithCoder:(id)a3
{
  id v4;
  PMSafariStreamlinedAutoFillViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PMSafariStreamlinedAutoFillViewController_delegate) = 0;
  v4 = a3;

  result = (PMSafariStreamlinedAutoFillViewController *)sub_243850984();
  __break(1u);
  return result;
}

- (PMSafariStreamlinedAutoFillViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PMSafariStreamlinedAutoFillViewController *result;

  v4 = a4;
  result = (PMSafariStreamlinedAutoFillViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PMSafariStreamlinedAutoFillViewController_savedAccountMatch));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PMSafariStreamlinedAutoFillViewController_credentialIdentity));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
