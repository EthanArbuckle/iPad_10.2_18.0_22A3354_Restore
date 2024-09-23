@implementation PMSafariAutoFillStrongPasswordIntroductionViewController

+ (BOOL)shouldShowView
{
  swift_getObjCClassMetadata();
  return static PMSafariAutoFillStrongPasswordIntroductionViewController.shouldShowView.getter() & 1;
}

+ (BOOL)shouldShowViewsInMode:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static PMSafariAutoFillStrongPasswordIntroductionViewController.shouldShowViews(in:)(a3) & 1;
}

+ (BOOL)shouldShowLoginIntroduction
{
  swift_getObjCClassMetadata();
  return static PMSafariAutoFillStrongPasswordIntroductionViewController.shouldShowLoginIntroduction.getter() & 1;
}

+ (BOOL)shouldShowStrongPasswordIntroduction
{
  swift_getObjCClassMetadata();
  return static PMSafariAutoFillStrongPasswordIntroductionViewController.shouldShowStrongPasswordIntroduction.getter() & 1;
}

+ (BOOL)shouldShowICloudKeychainSyncingView
{
  id v2;
  unsigned __int8 v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_pm_defaults);
  v3 = objc_msgSend(v2, sel_BOOLForKey_, CFSTR("hasShownSafariAutoFillICloudKeychainSyncingView"));

  if ((v3 & 1) != 0)
    return 0;
  else
    return PMOnboardingIsICloudKeychainSyncingEnabled() ^ 1;
}

+ (BOOL)hasThirdPartyPasswordManagerEnabledAndPasswordsAppDisabledForAutoFill
{
  return _sSo56PMSafariAutoFillStrongPasswordIntroductionViewControllerC0E9ManagerUIE013hasThirdPartyei33EnabledAndPasswordsAppDisabledForbC0SbvgZ_0();
}

- (CGSize)contentSize
{
  PMSafariAutoFillStrongPasswordIntroductionViewController *v2;
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  v3 = -[PMSafariAutoFillStrongPasswordIntroductionViewController view](v2, sel_view);
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, sel_intrinsicContentSize);
    v8 = v7;
    v10 = v9;

    v4 = v8;
    v5 = v10;
  }
  else
  {
    __break(1u);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (int64_t)mode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___PMSafariAutoFillStrongPasswordIntroductionViewController_mode);
}

- (void)setMode:(int64_t)a3
{
  PMSafariAutoFillStrongPasswordIntroductionViewController *v4;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___PMSafariAutoFillStrongPasswordIntroductionViewController_mode) = (Class)a3;
  v4 = self;
  *((_BYTE *)&v4->super.super.super.isa + OBJC_IVAR___PMSafariAutoFillStrongPasswordIntroductionViewController_viewStyle) = sub_2436BBB74(a3);
  sub_2436B9890();

}

- (PMSafariAutoFillStrongPasswordIntroductionViewControllerDelegate)delegate
{
  return (PMSafariAutoFillStrongPasswordIntroductionViewControllerDelegate *)(id)MEMORY[0x2494FCAC0]((char *)self + OBJC_IVAR___PMSafariAutoFillStrongPasswordIntroductionViewController_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  PMSafariAutoFillStrongPasswordIntroductionViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_2436BBD08();

  swift_unknownObjectRelease();
}

- (PMSafariAutoFillStrongPasswordIntroductionViewController)initWithMode:(int64_t)a3
{
  return (PMSafariAutoFillStrongPasswordIntroductionViewController *)sub_2436B9A64(a3);
}

- (PMSafariAutoFillStrongPasswordIntroductionViewController)initWithCoder:(id)a3
{
  id v5;
  PMSafariAutoFillStrongPasswordIntroductionViewController *result;

  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (PMSafariAutoFillStrongPasswordIntroductionViewController *)sub_243850984();
  __break(1u);
  return result;
}

- (void)loadView
{
  PMSafariAutoFillStrongPasswordIntroductionViewController *v2;

  v2 = self;
  PMSafariAutoFillStrongPasswordIntroductionViewController.loadView()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  PMSafariAutoFillStrongPasswordIntroductionViewController *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PMSafariAutoFillStrongPasswordIntroductionViewController;
  v4 = self;
  -[PMSafariAutoFillStrongPasswordIntroductionViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  sub_2436BA1DC();

}

- (PMSafariAutoFillStrongPasswordIntroductionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PMSafariAutoFillStrongPasswordIntroductionViewController *result;

  v4 = a4;
  result = (PMSafariAutoFillStrongPasswordIntroductionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_243541D74((uint64_t)self + OBJC_IVAR___PMSafariAutoFillStrongPasswordIntroductionViewController_delegate);
  swift_release();
  swift_release();
  swift_release();
}

@end
