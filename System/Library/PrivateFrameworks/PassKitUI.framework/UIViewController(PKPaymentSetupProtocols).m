@implementation UIViewController(PKPaymentSetupProtocols)

- (uint64_t)pk_paymentSetupSetHideSetupLaterButton:()PKPaymentSetupProtocols
{
  uint64_t result;

  result = objc_msgSend(a1, "conformsToProtocol:", &unk_1EE5439E0);
  if ((_DWORD)result)
    return objc_msgSend(a1, "setHideSetupLaterButton:", a3);
  return result;
}

- (void)pk_paymentSetupPreflight:()PKPaymentSetupProtocols
{
  void (**v4)(id, uint64_t);

  v4 = a3;
  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EE53E760))
    objc_msgSend(a1, "preflightWithCompletion:", v4);
  else
    v4[2](v4, 1);

}

- (uint64_t)pk_presentViewController:()PKPaymentSetupProtocols animated:popToViewControllerAfterPresentation:completion:
{
  return objc_msgSend(a1, "_pk_presentViewController:animated:transition:popToViewControllerAfterPresentation:completion:", a3, a4, 0, a5, a6);
}

- (uint64_t)pk_presentViewController:()PKPaymentSetupProtocols transition:popToViewControllerAfterPresentation:completion:
{
  return objc_msgSend(a1, "_pk_presentViewController:animated:transition:popToViewControllerAfterPresentation:completion:", a3, 1, a4, a5, a6);
}

- (void)_pk_presentViewController:()PKPaymentSetupProtocols animated:transition:popToViewControllerAfterPresentation:completion:
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  int v26;
  char v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD aBlock[4];
  id v31;
  uint64_t v32;
  id v33;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __139__UIViewController_PKPaymentSetupProtocols___pk_presentViewController_animated_transition_popToViewControllerAfterPresentation_completion___block_invoke;
  aBlock[3] = &unk_1E3E65388;
  v31 = v13;
  v32 = a1;
  v33 = v14;
  v16 = v14;
  v17 = v13;
  v18 = _Block_copy(aBlock);
  v19 = dispatch_group_create();
  dispatch_group_enter(v19);
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __139__UIViewController_PKPaymentSetupProtocols___pk_presentViewController_animated_transition_popToViewControllerAfterPresentation_completion___block_invoke_2;
  v28[3] = &unk_1E3E62288;
  v29 = v19;
  v20 = v19;
  objc_msgSend(v12, "pk_paymentSetupPreflight:", v28);
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __139__UIViewController_PKPaymentSetupProtocols___pk_presentViewController_animated_transition_popToViewControllerAfterPresentation_completion___block_invoke_3;
  v23[3] = &unk_1E3E67BF8;
  v27 = a4;
  v26 = a5;
  v23[4] = a1;
  v24 = v12;
  v25 = v18;
  v21 = v18;
  v22 = v12;
  dispatch_group_notify(v20, MEMORY[0x1E0C80D38], v23);

}

@end
