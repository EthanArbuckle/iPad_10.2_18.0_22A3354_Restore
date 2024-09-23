@implementation PMSafariStreamlinedStrongPasswordViewController

- (PMSafariStreamlinedStrongPasswordViewControllerDelegate)delegate
{
  return (PMSafariStreamlinedStrongPasswordViewControllerDelegate *)(id)MEMORY[0x2494FCAC0]((char *)self + OBJC_IVAR___PMSafariStreamlinedStrongPasswordViewController_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSString)domain
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setDomain:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_243850264();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___PMSafariStreamlinedStrongPasswordViewController_domain);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  PMSafariStreamlinedStrongPasswordViewController *v2;

  v2 = self;
  PMSafariStreamlinedStrongPasswordViewController.viewDidLoad()();

}

- (PMSafariStreamlinedStrongPasswordViewController)initWithDomain:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  objc_super v9;

  v4 = sub_243850264();
  v6 = v5;
  swift_unknownObjectWeakInit();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___PMSafariStreamlinedStrongPasswordViewController_domain);
  *v7 = v4;
  v7[1] = v6;
  v9.receiver = self;
  v9.super_class = (Class)PMSafariStreamlinedStrongPasswordViewController;
  return -[PMSafariStreamlinedStrongPasswordViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
}

- (PMSafariStreamlinedStrongPasswordViewController)initWithCoder:(id)a3
{
  id v5;
  PMSafariStreamlinedStrongPasswordViewController *result;

  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (PMSafariStreamlinedStrongPasswordViewController *)sub_243850984();
  __break(1u);
  return result;
}

- (PMSafariStreamlinedStrongPasswordViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PMSafariStreamlinedStrongPasswordViewController *result;

  v4 = a4;
  result = (PMSafariStreamlinedStrongPasswordViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_243541D74((uint64_t)self + OBJC_IVAR___PMSafariStreamlinedStrongPasswordViewController_delegate);
  swift_bridgeObjectRelease();
}

@end
