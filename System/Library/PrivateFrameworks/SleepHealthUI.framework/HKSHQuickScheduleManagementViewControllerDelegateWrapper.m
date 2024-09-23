@implementation HKSHQuickScheduleManagementViewControllerDelegateWrapper

- (void)quickScheduleManagementViewController:(id)a3 didSave:(id)a4
{
  HKSHQuickScheduleManagementViewControllerDelegate **p_wrappedDelegate;
  id v6;
  id v7;
  id WeakRetained;

  p_wrappedDelegate = &self->_wrappedDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_wrappedDelegate);
  v7 = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "quickScheduleManagementViewController:didSave:", v7, v6);

}

- (void)quickScheduleManagementViewControllerDidCancel:(id)a3
{
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedDelegate);
  v4 = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "quickScheduleManagementViewControllerDidCancel:", v4);

}

- (void)quickScheduleManagementViewController:(id)a3 shouldPresent:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;
  id v9;

  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_wrappedDelegate);
    v8 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v7, "quickScheduleManagementViewController:shouldPresent:", v8, v9);

  }
}

- (void)quickScheduleManagementViewControllerWillSave:(id)a3
{
  HKSHQuickScheduleManagementViewControllerDelegate **p_wrappedDelegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  p_wrappedDelegate = &self->_wrappedDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_wrappedDelegate);
    v7 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v8, "quickScheduleManagementViewControllerWillSave:", v7);

  }
}

- (HKSHQuickScheduleManagementViewControllerDelegate)wrappedDelegate
{
  return (HKSHQuickScheduleManagementViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_wrappedDelegate);
}

- (void)setWrappedDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wrappedDelegate, a3);
}

- (HKSHQuickScheduleManagementViewController)viewController
{
  return (HKSHQuickScheduleManagementViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_wrappedDelegate);
}

@end
