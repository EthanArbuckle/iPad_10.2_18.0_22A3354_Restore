@implementation HKSHQuickScheduleManagementViewControllerInternal

- (HKSHQuickScheduleManagementViewControllerDelegateInternal)sleepDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  return (HKSHQuickScheduleManagementViewControllerDelegateInternal *)(id)MEMORY[0x1AF4203E0](v2);
}

- (void)setSleepDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (HKSHQuickScheduleManagementViewControllerInternal)initWithSleepStore:(id)a3 provenanceSource:(id)a4
{
  return (HKSHQuickScheduleManagementViewControllerInternal *)QuickScheduleManagementViewController.init(sleepStore:provenanceSource:)(a3, a4);
}

- (void)viewDidAppear:(BOOL)a3
{
  HKSHQuickScheduleManagementViewControllerInternal *v4;

  v4 = self;
  sub_1A9CCA7D4(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (HKSHQuickScheduleManagementViewControllerInternal)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  HKSHQuickScheduleManagementViewControllerInternal *result;

  result = (HKSHQuickScheduleManagementViewControllerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HKSHQuickScheduleManagementViewControllerInternal)initWithRootViewController:(id)a3
{
  id v3;
  HKSHQuickScheduleManagementViewControllerInternal *result;

  v3 = a3;
  result = (HKSHQuickScheduleManagementViewControllerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HKSHQuickScheduleManagementViewControllerInternal)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  HKSHQuickScheduleManagementViewControllerInternal *result;

  v4 = a4;
  result = (HKSHQuickScheduleManagementViewControllerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore));
  sub_1A9B94894((uint64_t)self + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_provenanceSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider));
  v3 = (char *)self + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_gregorianCalendar;
  v4 = sub_1A9CE6444();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_release();
}

- (void)cancelWithAnimated:(BOOL)a3
{
  HKSHQuickScheduleManagementViewControllerInternal *v4;

  v4 = self;
  sub_1A9CCACB4(a3);

}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  HKSHQuickScheduleManagementViewControllerInternal *v5;

  swift_unknownObjectRetain();
  v5 = self;
  QuickScheduleManagementViewController.featureAvailabilityProvidingDidUpdateOnboardingCompletion(_:)((uint64_t)a3);
  swift_unknownObjectRelease();

}

@end
