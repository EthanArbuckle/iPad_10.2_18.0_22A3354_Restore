@implementation PKPaymentSetupAssistantDelegateProxy

- (PKPaymentSetupAssistantDelegateProxy)initWithDelegate:(id)a3 provisioningController:(id)a4
{
  id v6;
  id v7;
  PKPaymentSetupAssistantDelegateProxy *v8;
  PKPaymentSetupAssistantDelegateProxy *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupAssistantDelegateProxy;
  v8 = -[PKPaymentSetupAssistantDelegateProxy init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_provisioningController, a4);
    -[PKPaymentSetupAssistantDelegateProxy _setExternalDelegate:](v9, "_setExternalDelegate:", v6);
  }

  return v9;
}

- (void)_setExternalDelegate:(id)a3
{
  PKPaymentSetupViewControllerDelegate *v6;
  PKPaymentSetupViewControllerDelegate *externalDelegate;
  PKPaymentSetupViewControllerDelegate *object;

  v6 = (PKPaymentSetupViewControllerDelegate *)a3;
  externalDelegate = self->_externalDelegate;
  if (externalDelegate != v6)
  {
    object = v6;
    if (externalDelegate)
    {
      objc_setAssociatedObject(externalDelegate, a2, 0, (void *)1);
      v6 = object;
    }
    if (v6)
      objc_setAssociatedObject(object, a2, self, (void *)1);
    objc_storeStrong((id *)&self->_externalDelegate, a3);
    v6 = object;
  }

}

- (void)viewControllerDidBeginSetupFlow:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  self->_didTerminateSetupFlow = 0;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v11, 0x20u);

  }
  -[PKPaymentProvisioningController noteProvisioningUserInterfaceDidAppear](self->_provisioningController, "noteProvisioningUserInterfaceDidAppear");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentSetupViewControllerDelegate viewControllerDidBeginSetupFlow:](self->_externalDelegate, "viewControllerDidBeginSetupFlow:", v5);

}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v5;
  _BOOL4 didTerminateSetupFlow;
  NSObject *v7;
  _BOOL4 v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  didTerminateSetupFlow = self->_didTerminateSetupFlow;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (didTerminateSetupFlow)
  {
    if (v8)
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "%@ - %@ - Called twice by: %@", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    if (v8)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v17, 0x20u);

    }
    self->_didTerminateSetupFlow = 1;
    -[PKPaymentProvisioningController noteProvisioningUserInterfaceDidDisappear](self->_provisioningController, "noteProvisioningUserInterfaceDidDisappear");
    -[PKPaymentSetupViewControllerDelegate viewControllerDidTerminateSetupFlow:](self->_externalDelegate, "viewControllerDidTerminateSetupFlow:", v5);
  }

}

- (void)viewController:(id)a3 didShowProvisioningError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v13, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentSetupViewControllerDelegate viewController:didShowProvisioningError:](self->_externalDelegate, "viewController:didShowProvisioningError:", v7, v8);

}

- (void)viewControllerDidShowEligibilityIssue:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v10, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentSetupViewControllerDelegate viewControllerDidShowEligibilityIssue:](self->_externalDelegate, "viewControllerDidShowEligibilityIssue:", v5);

}

- (void)viewController:(id)a3 requestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  PKPaymentSetupViewControllerDelegate *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v17, 0x16u);

  }
  v16 = self->_externalDelegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentSetupViewControllerDelegate viewController:requestPasscodeUpgradeForPasscodeUpgradeFlowController:completion:](v16, "viewController:requestPasscodeUpgradeForPasscodeUpgradeFlowController:completion:", v9, v10, v11);

}

- (void)viewController:(id)a3 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 withShouldContinue:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  PKPaymentSetupViewControllerDelegate *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v7 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v16;
    v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v19, 0x16u);

  }
  v18 = self->_externalDelegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentSetupViewControllerDelegate viewController:didExitPasscodeUpgradeForPasscodeUpgradeFlowController:withShouldContinue:error:](v18, "viewController:didExitPasscodeUpgradeForPasscodeUpgradeFlowController:withShouldContinue:error:", v11, v12, v7, v13);

}

- (void)viewControllerDidFinishChangingPasscodeComplex:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)viewControllerDidFailToChangePasscodeComplex:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)viewController:(id)a3 requestPasscodeUpgradeWithCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  PKPaymentSetupViewControllerDelegate *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v14, 0x16u);

  }
  v13 = self->_externalDelegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentSetupViewControllerDelegate viewController:requestPasscodeUpgradeWithCompletion:](v13, "viewController:requestPasscodeUpgradeWithCompletion:", v7, v8);

}

- (void)viewController:(id)a3 didExitPasscodeUpgradeWithShouldContinue:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  PKPaymentSetupViewControllerDelegate *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v13;
    v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v16, 0x16u);

  }
  v15 = self->_externalDelegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentSetupViewControllerDelegate viewController:didExitPasscodeUpgradeWithShouldContinue:error:](v15, "viewController:didExitPasscodeUpgradeWithShouldContinue:error:", v9, v6, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDelegate, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
