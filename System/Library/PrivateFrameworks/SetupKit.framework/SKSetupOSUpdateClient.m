@implementation SKSetupOSUpdateClient

- (SKSetupOSUpdateClient)init
{
  SKSetupOSUpdateClient *v2;
  SKSetupOSUpdateClient *v3;
  SKSetupOSUpdateClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKSetupOSUpdateClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupOSUpdateClient);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)_activate
{
  objc_super v3;

  -[SKSetupOSUpdateClient _prepareSteps](self, "_prepareSteps");
  v3.receiver = self;
  v3.super_class = (Class)SKSetupOSUpdateClient;
  -[SKSetupBase _activate](&v3, sel__activate);
}

- (void)_prepareSteps
{
  SKStepWiFiSetupClientLegacy *v3;
  _QWORD v4[6];

  v3 = objc_alloc_init(SKStepWiFiSetupClientLegacy);
  -[SKStepWiFiSetupClientLegacy setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepWiFiSetupClientLegacy setSkMessaging:](v3, "setSkMessaging:", self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__SKSetupOSUpdateClient__prepareSteps__block_invoke;
  v4[3] = &unk_24D22B140;
  v4[4] = self;
  v4[5] = v3;
  -[SKStepWiFiSetupClientLegacy setSkCompletionHandler:](v3, "setSkCompletionHandler:", v4);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);

}

- (void)_run
{
  uint64_t runState;
  int v4;
  int v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      runState = self->super._runState;
      switch((int)runState)
      {
        case 11:
          -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:](self, "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:", 0, 1, 1, &__block_literal_global_2339);
          v4 = self->super._runState;
          goto LABEL_10;
        case 12:
          v5 = -[SKConnection state](self->super._skCnx, "state");
          v4 = self->super._runState;
          if (v5 != 1)
            goto LABEL_13;
          goto LABEL_10;
        case 13:
          v6 = -[SKSetupBase _runSteps](self, "_runSteps");
          v4 = self->super._runState;
          if (!v6)
            goto LABEL_13;
LABEL_10:
          ++v4;
          break;
        case 14:
          -[SKSetupBase _completeWithError:](self, "_completeWithError:", 0);
          v4 = self->super._runState;
          goto LABEL_13;
        default:
          if ((_DWORD)runState)
            return;
          v4 = 11;
          break;
      }
      self->super._runState = v4;
LABEL_13:
      if (v4 == (_DWORD)runState)
        break;
      if (sCUOSLogCreateOnce_logger_2340 != -1)
        dispatch_once(&sCUOSLogCreateOnce_logger_2340, &__block_literal_global_10);
      v7 = sCUOSLogHandle_logger_2341;
      if (os_log_type_enabled((os_log_t)sCUOSLogHandle_logger_2341, OS_LOG_TYPE_DEFAULT))
      {
        if (((0x78FFu >> runState) & 1) != 0)
        {
          v8 = off_24D22AEF8[runState];
        }
        else if ((int)runState <= 9)
        {
          v8 = "?";
        }
        else
        {
          v8 = "User";
        }
        v9 = self->super._runState;
        if (v9 < 0xF && ((0x78FFu >> v9) & 1) != 0)
        {
          v10 = off_24D22AEF8[v9];
        }
        else if ((int)v9 <= 9)
        {
          v10 = "?";
        }
        else
        {
          v10 = "User";
        }
        *(_DWORD *)buf = 136315394;
        v12 = v8;
        v13 = 2080;
        v14 = v10;
        _os_log_impl(&dword_2147EE000, v7, OS_LOG_TYPE_DEFAULT, "State: %s -> %s", buf, 0x16u);
      }
    }
  }
}

uint64_t __38__SKSetupOSUpdateClient__prepareSteps__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedStep:error:", *(_QWORD *)(a1 + 40), a2);
}

@end
