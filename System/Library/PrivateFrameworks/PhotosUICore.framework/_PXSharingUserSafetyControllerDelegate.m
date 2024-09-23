@implementation _PXSharingUserSafetyControllerDelegate

- (void)configureAction:(id)a3
{
  void *v4;
  id action;

  v4 = _Block_copy(a3);
  action = self->_action;
  self->_action = v4;

}

- (void)didConfirmForInterventionViewController:(id)a3
{
  void *v4;
  void (**v5)(id, uint64_t);

  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  -[_PXSharingUserSafetyControllerDelegate action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_PXSharingUserSafetyControllerDelegate action](self, "action");
    v5 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 1);

  }
}

- (void)didRejectForInterventionViewController:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD);

  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  -[_PXSharingUserSafetyControllerDelegate action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_PXSharingUserSafetyControllerDelegate action](self, "action");
    v5 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0);

  }
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
}

@end
