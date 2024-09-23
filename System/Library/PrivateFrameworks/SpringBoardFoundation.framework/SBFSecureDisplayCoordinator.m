@implementation SBFSecureDisplayCoordinator

- (BOOL)inSecureMode
{
  return self->_inSecureMode;
}

- (void)setSecureMode:(BOOL)a3
{
  -[SBFSecureDisplayCoordinator setSecureMode:postNotification:](self, "setSecureMode:postNotification:", a3, 1);
}

- (void)setSecureMode:(BOOL)a3 postNotification:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  __CFString **v10;
  void *v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD v18[5];
  BOOL v19;
  BOOL v20;
  uint8_t buf[16];

  if (self->_inSecureMode == a3)
    return;
  v4 = a4;
  v5 = a3;
  self->_inSecureMode = a3;
  SBLogAuthenticationController();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AB69000, v7, OS_LOG_TYPE_DEFAULT, "Enabling secure display mode.", buf, 2u);
    }

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("SBDeviceWillEnableDisplaySecureModeNotification"), self);

    }
    v10 = (__CFString **)MEMORY[0x1E0CEC280];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AB69000, v7, OS_LOG_TYPE_DEFAULT, "Disabling secure display mode.", buf, 2u);
    }

    if (!v4)
      goto LABEL_13;
    v10 = SBDeviceWillDisableDisplaySecureModeNotification;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", *v10, self);

LABEL_13:
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__SBFSecureDisplayCoordinator_setSecureMode_postNotification___block_invoke;
  v18[3] = &unk_1E200E1B0;
  v18[4] = self;
  v19 = v5;
  v20 = v4;
  v13 = (void (**)(_QWORD))MEMORY[0x18D774178](v18);
  v14 = v13;
  if (v5)
  {
    v15 = (void *)MEMORY[0x1E0CD28B0];
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __62__SBFSecureDisplayCoordinator_setSecureMode_postNotification___block_invoke_2;
    v16[3] = &unk_1E200ED00;
    v17 = v13;
    objc_msgSend(v15, "bs_performAfterSynchronizedCommit:", v16);

  }
  else
  {
    v13[2](v13);
  }

}

void __62__SBFSecureDisplayCoordinator_setSecureMode_postNotification___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  __CFString **v7;
  int v8;
  int v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8) != *(unsigned __int8 *)(a1 + 40))
  {
    SBLogAuthenticationController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(unsigned __int8 *)(a1 + 40);
      v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
      v11[0] = 67109376;
      v11[1] = v8;
      v12 = 1024;
      v13 = v9;
      _os_log_impl(&dword_18AB69000, v6, OS_LOG_TYPE_DEFAULT, "Not changing secure mode to %{BOOL}u because the expected state is now %{BOOL}u", (uint8_t *)v11, 0xEu);
    }
    goto LABEL_15;
  }
  BKSDisplaySetSecureMode();
  v2 = *(unsigned __int8 *)(a1 + 40);
  SBLogAuthenticationController();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v4)
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_DEFAULT, "Disabled secure display mode.", (uint8_t *)v11, 2u);
    }

    if (*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("SBDeviceDidDisableDisplaySecureModeNotification"), *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = (__CFString **)MEMORY[0x1E0CEC278];
    goto LABEL_14;
  }
  if (v4)
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_DEFAULT, "Enabled secure display mode.", (uint8_t *)v11, 2u);
  }

  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = SBDeviceDidEnableDisplaySecureModeNotification;
LABEL_14:
    -[NSObject postNotificationName:object:](v5, "postNotificationName:object:", *v7, *(_QWORD *)(a1 + 32));
LABEL_15:

  }
}

uint64_t __62__SBFSecureDisplayCoordinator_setSecureMode_postNotification___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
