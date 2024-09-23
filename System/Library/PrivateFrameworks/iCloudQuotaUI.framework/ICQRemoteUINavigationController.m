@implementation ICQRemoteUINavigationController

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQRemoteUINavigationController;
  -[ICQRemoteUINavigationController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  if (-[ICQRemoteUINavigationController shouldSignalDelegateOnDismiss](self, "shouldSignalDelegateOnDismiss"))
  {
    -[ICQRemoteUINavigationController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_2554D7968))
    {
      -[ICQRemoteUINavigationController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0)
        return;
      -[ICQRemoteUINavigationController delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remoteUIControllerDidDismiss:", 0);
    }

  }
}

- (ICQRemoteUINavigationController)initWithRootViewController:(id)a3
{
  ICQRemoteUINavigationController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQRemoteUINavigationController;
  result = -[ICQRemoteUINavigationController initWithRootViewController:](&v4, sel_initWithRootViewController_, a3);
  if (result)
    result->_shouldSignalDelegateOnDismiss = 1;
  return result;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD block[5];
  id v19;
  BOOL v20;

  v6 = a4;
  v7 = +[ICQUIExtensionKitHelpers isExtensionKitProcess](ICQUIExtensionKitHelpers, "isExtensionKitProcess");
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
      -[ICQRemoteUINavigationController dismissViewControllerAnimated:completion:].cold.1(v8, v10, v11, v12, v13, v14, v15, v16);

    if (-[ICQRemoteUINavigationController didCompletePurchaseFlowWithSuccess](self, "didCompletePurchaseFlowWithSuccess"))
    {
      v17 = 0;
    }
    else
    {
      ICQCreateError();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[ICQUIRemoteExtensionEntry dismissRemoteViewControllerWithError:](ICQUIRemoteExtensionEntry, "dismissRemoteViewControllerWithError:", v17);
  }
  else
  {
    if (v9)
      -[ICQRemoteUINavigationController dismissViewControllerAnimated:completion:].cold.2(v8, v10, v11, v12, v13, v14, v15, v16);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__ICQRemoteUINavigationController_dismissViewControllerAnimated_completion___block_invoke;
    block[3] = &unk_24E3F3B90;
    v20 = a3;
    block[4] = self;
    v19 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v17 = v19;
  }

}

id __76__ICQRemoteUINavigationController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ICQRemoteUINavigationController;
  return objc_msgSendSuper2(&v4, sel_dismissViewControllerAnimated_completion_, v1, v2);
}

- (BOOL)shouldSignalDelegateOnDismiss
{
  return self->_shouldSignalDelegateOnDismiss;
}

- (void)setShouldSignalDelegateOnDismiss:(BOOL)a3
{
  self->_shouldSignalDelegateOnDismiss = a3;
}

- (BOOL)didCompletePurchaseFlowWithSuccess
{
  return self->_didCompletePurchaseFlowWithSuccess;
}

- (void)setDidCompletePurchaseFlowWithSuccess:(BOOL)a3
{
  self->_didCompletePurchaseFlowWithSuccess = a3;
}

- (void)dismissViewControllerAnimated:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21F2CC000, a1, a3, "Dismissing extension view controller", a5, a6, a7, a8, 0);
}

- (void)dismissViewControllerAnimated:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21F2CC000, a1, a3, "Dismissing remote view controller", a5, a6, a7, a8, 0);
}

@end
