@implementation BFFPasscodeCreationManager

- (BFFPasscodeCreationManager)init
{
  BFFPasscodeCreationManager *v2;
  BFFPasscodeCreationManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BFFPasscodeCreationManager;
  v2 = -[BFFPasscodeCreationManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BFFPasscodeCreationManager setPasscodeState:](v2, "setPasscodeState:", 0);
    -[BFFPasscodeCreationManager setConstraintFailedInstructions:](v3, "setConstraintFailedInstructions:", 0);
  }
  return v3;
}

+ (id)sharedPasscodeManager
{
  void *v2;
  BFFPasscodeCreationManager *v3;
  void *v4;

  v2 = (void *)sharedPasscodeManager_sharedPasscodeManager;
  if (!sharedPasscodeManager_sharedPasscodeManager)
  {
    v3 = objc_alloc_init(BFFPasscodeCreationManager);
    v4 = (void *)sharedPasscodeManager_sharedPasscodeManager;
    sharedPasscodeManager_sharedPasscodeManager = (uint64_t)v3;

    v2 = (void *)sharedPasscodeManager_sharedPasscodeManager;
  }
  return v2;
}

- (NSString)constraintInstructions
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasscodeRequired");

  if (v4)
  {
    -[BFFPasscodeCreationManager constraintFailedInstructions](self, "constraintFailedInstructions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[BFFPasscodeCreationManager constraintFailedInstructions](self, "constraintFailedInstructions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedDescriptionOfCurrentPasscodeConstraints");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (BOOL)isSimplePasscodeEntry
{
  _BOOL4 v3;

  v3 = -[BFFPasscodeCreationManager isNumericPasscodeEntry](self, "isNumericPasscodeEntry");
  if (v3)
    LOBYTE(v3) = -[BFFPasscodeCreationManager simplePasscodeEntryLength](self, "simplePasscodeEntryLength") > 0;
  return v3;
}

- (void)_applyPasscode
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214875000, v3, OS_LOG_TYPE_DEFAULT, "Setting a passcode...", buf, 2u);
  }

  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__BFFPasscodeCreationManager__applyPasscode__block_invoke;
  block[3] = &unk_24D2341B8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __44__BFFPasscodeCreationManager__applyPasscode__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  char v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "passcode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v4 = objc_msgSend(v2, "changePasscodeFrom:to:outError:", 0, v3, &v18);
  v5 = v18;

  if ((v4 & 1) == 0)
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v12 = 0;
        v13 = v5;
      }
      else if (v5)
      {
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "domain");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v5, "code"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 1;
      }
      else
      {
        v12 = 0;
        v13 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      _os_log_error_impl(&dword_214875000, v6, OS_LOG_TYPE_ERROR, "Failed to set the passcode with error %{public}@", buf, 0xCu);
      if (v12)
      {

      }
    }

  }
  v7 = objc_alloc_init(MEMORY[0x24BE858B8]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE858A0]), "initWithFeatureFlags:", v7);
  objc_msgSend(*(id *)(a1 + 32), "passcode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateCoreCDPStateControllerWithPasscode:", v9);

  objc_msgSend(*(id *)(a1 + 32), "_mainQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__BFFPasscodeCreationManager__applyPasscode__block_invoke_5;
  block[3] = &unk_24D2347B0;
  v17 = v4;
  block[4] = *(_QWORD *)(a1 + 32);
  v16 = v5;
  v11 = v5;
  dispatch_async(v10, block);

}

uint64_t __44__BFFPasscodeCreationManager__applyPasscode__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "saveDeviceUnlockPasscodeInputModes");

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject passcodeManager:didSetPasscodeWithSuccess:error:](v5, "passcodeManager:didSetPasscodeWithSuccess:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  else
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_214875000, v5, OS_LOG_TYPE_DEFAULT, "Failed to stash passcode token, delegate = %@", (uint8_t *)&v8, 0xCu);

    }
  }

  return objc_msgSend(*(id *)(a1 + 32), "setPasscodeState:", 4);
}

- (id)_mainQueue
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC9B8];
  return v2;
}

- (void)setPasscodeState:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v5 = -[BFFPasscodeCreationManager passcodeState](self, "passcodeState");
  self->_passcodeState = a3;
  -[BFFPasscodeCreationManager delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[BFFPasscodeCreationManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[BFFPasscodeCreationManager delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "passcodeManager:didTransitionFromState:toState:", self, v5, a3);

    }
  }
}

- (void)transitionToNextPasscodeStateForInput:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = -[BFFPasscodeCreationManager passcodeState](self, "passcodeState");
  switch(v5)
  {
    case 0uLL:
    case 3uLL:
      if (!objc_msgSend(v4, "length"))
      {
        v8 = 0;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v7 = objc_msgSend(v6, "passcode:meetsCurrentConstraintsOutError:", v4, &v18);
      v8 = v18;

      if (!v7)
      {
        if (v8)
        {
          objc_msgSend(v8, "domain");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE63B70]);

          if (v15)
          {
            objc_msgSend(v8, "localizedDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[BFFPasscodeCreationManager setConstraintFailedInstructions:](self, "setConstraintFailedInstructions:", v16);
LABEL_17:

            goto LABEL_18;
          }
        }
LABEL_16:
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedDescriptionOfCurrentPasscodeConstraints");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BFFPasscodeCreationManager setConstraintFailedInstructions:](self, "setConstraintFailedInstructions:", v17);

        goto LABEL_17;
      }
      -[BFFPasscodeCreationManager setPasscode:](self, "setPasscode:", v4);
      -[BFFPasscodeCreationManager isSimplePasscodeEntry](self, "isSimplePasscodeEntry");
      -[BFFPasscodeCreationManager passcode](self, "passcode");
      if (SecPasswordIsPasswordWeak2())
        v5 = 1;
      else
        v5 = 2;

LABEL_19:
      -[BFFPasscodeCreationManager setPasscodeState:](self, "setPasscodeState:", v5);
LABEL_20:

      return;
    case 1uLL:
    case 4uLL:
      goto LABEL_19;
    case 2uLL:
      -[BFFPasscodeCreationManager passcode](self, "passcode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v4);

      if (!v10)
      {
        v5 = 3;
        goto LABEL_19;
      }
      -[BFFPasscodeCreationManager delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[BFFPasscodeCreationManager delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "passcodeManagerWillSetPasscode:", self);

      }
      -[BFFPasscodeCreationManager _applyPasscode](self, "_applyPasscode");
      goto LABEL_20;
    default:
LABEL_18:
      v5 = 0;
      goto LABEL_19;
  }
}

- (void)acceptWeakPasscode:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  if (a3)
  {
    v5 = 2;
  }
  else
  {
    -[BFFPasscodeCreationManager setPasscode:](self, "setPasscode:", 0);
    v5 = 0;
  }
  -[BFFPasscodeCreationManager setPasscodeState:](self, "setPasscodeState:", v5);
  -[BFFPasscodeCreationManager setAcceptedWeakPasscode:](self, "setAcceptedWeakPasscode:", v3);
}

- (void)reset
{
  -[BFFPasscodeCreationManager setPasscode:](self, "setPasscode:", 0);
  -[BFFPasscodeCreationManager setAcceptedWeakPasscode:](self, "setAcceptedWeakPasscode:", 0);
  -[BFFPasscodeCreationManager setPasscodeState:](self, "setPasscodeState:", 0);
  -[BFFPasscodeCreationManager setConstraintFailedInstructions:](self, "setConstraintFailedInstructions:", 0);
}

- (unint64_t)passcodeState
{
  return self->_passcodeState;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BFFPasscodeCreationDelegate)delegate
{
  return (BFFPasscodeCreationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isNumericPasscodeEntry
{
  return self->_numericPasscodeEntry;
}

- (void)setNumericPasscodeEntry:(BOOL)a3
{
  self->_numericPasscodeEntry = a3;
}

- (int64_t)simplePasscodeEntryLength
{
  return self->_simplePasscodeEntryLength;
}

- (void)setSimplePasscodeEntryLength:(int64_t)a3
{
  self->_simplePasscodeEntryLength = a3;
}

- (BOOL)acceptedWeakPasscode
{
  return self->_acceptedWeakPasscode;
}

- (void)setAcceptedWeakPasscode:(BOOL)a3
{
  self->_acceptedWeakPasscode = a3;
}

- (NSString)constraintFailedInstructions
{
  return self->_constraintFailedInstructions;
}

- (void)setConstraintFailedInstructions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintFailedInstructions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
