@implementation SBLockScreenEmergencyDialerController

- (void)activateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SBLockScreenEmergencyDialerController_activateWithCompletion___block_invoke;
  v6[3] = &unk_1E8EC0598;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[SBUIEmergencyCallHostViewController requestEmergencyCallControllerWithCompletion:](SBLockScreenEmergencyCallViewController, "requestEmergencyCallControllerWithCompletion:", v6);

}

void __64__SBLockScreenEmergencyDialerController_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a2;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v6 + 16))
  {
    v8 = v4;
    if (v4)
    {
      *(_BYTE *)(v6 + 16) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:");
      v5 = v8;
    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) != 0);
      v5 = v8;
    }
  }

}

- (void)deactivate
{
  SBLockScreenEmergencyCallViewController *viewController;

  if (self->_active)
  {
    self->_active = 0;
    -[SBLockScreenEmergencyCallViewController setDelegate:](self->_viewController, "setDelegate:", 0);
    viewController = self->_viewController;
    self->_viewController = 0;

  }
}

- (void)dismissEmergencyCallViewController:(id)a3
{
  id WeakRetained;

  if (self->_active)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "emergencyDialer:willDeactivateWithError:", self, 0);

  }
}

- (void)emergencyCallViewController:(id)a3 didExitWithError:(id)a4
{
  SBLockScreenEmergencyDialerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  if (self->_active)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "emergencyDialer:willDeactivateWithError:", self, v6);

  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (UIViewController)viewController
{
  return &self->_viewController->super.super.super;
}

- (SBLockScreenEmergencyDialerDelegate)delegate
{
  return (SBLockScreenEmergencyDialerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
