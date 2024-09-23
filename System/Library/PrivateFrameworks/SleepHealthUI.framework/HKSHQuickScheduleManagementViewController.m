@implementation HKSHQuickScheduleManagementViewController

- (HKSHQuickScheduleManagementViewController)initWithSleepStore:(id)a3
{
  id v4;
  HKSHQuickScheduleManagementViewController *v5;
  HKSHQuickScheduleManagementViewControllerInternal *v6;
  uint64_t v7;
  HKSHQuickScheduleManagementViewControllerInternal *internalViewController;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSHQuickScheduleManagementViewController;
  v5 = -[HKSHQuickScheduleManagementViewController init](&v10, sel_init);
  if (v5)
  {
    v6 = [HKSHQuickScheduleManagementViewControllerInternal alloc];
    v7 = -[HKSHQuickScheduleManagementViewControllerInternal initWithSleepStore:provenanceSource:](v6, "initWithSleepStore:provenanceSource:", v4, *MEMORY[0x1E0DA8318]);
    internalViewController = v5->_internalViewController;
    v5->_internalViewController = (HKSHQuickScheduleManagementViewControllerInternal *)v7;

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKSHQuickScheduleManagementViewController;
  -[HKSHQuickScheduleManagementViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[HKSHQuickScheduleManagementViewController addChildViewController:](self, "addChildViewController:", self->_internalViewController);
  -[HKSHQuickScheduleManagementViewControllerInternal view](self->_internalViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSHQuickScheduleManagementViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "setFrame:");

  -[HKSHQuickScheduleManagementViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSHQuickScheduleManagementViewControllerInternal view](self->_internalViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[HKSHQuickScheduleManagementViewControllerInternal didMoveToParentViewController:](self->_internalViewController, "didMoveToParentViewController:", self);
}

- (void)setSleepDelegate:(id)a3
{
  id v4;
  HKSHQuickScheduleManagementViewControllerDelegateWrapper *v5;
  HKSHQuickScheduleManagementViewControllerDelegateWrapper *delegateWrapper;

  v4 = a3;
  v5 = objc_alloc_init(HKSHQuickScheduleManagementViewControllerDelegateWrapper);
  delegateWrapper = self->_delegateWrapper;
  self->_delegateWrapper = v5;

  -[HKSHQuickScheduleManagementViewControllerDelegateWrapper setWrappedDelegate:](self->_delegateWrapper, "setWrappedDelegate:", v4);
  -[HKSHQuickScheduleManagementViewControllerDelegateWrapper setViewController:](self->_delegateWrapper, "setViewController:", self);
  -[HKSHQuickScheduleManagementViewControllerInternal setSleepDelegate:](self->_internalViewController, "setSleepDelegate:", self->_delegateWrapper);
}

- (HKSHQuickScheduleManagementViewControllerDelegate)sleepDelegate
{
  return -[HKSHQuickScheduleManagementViewControllerDelegateWrapper wrappedDelegate](self->_delegateWrapper, "wrappedDelegate");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateWrapper, 0);
  objc_storeStrong((id *)&self->_internalViewController, 0);
}

@end
