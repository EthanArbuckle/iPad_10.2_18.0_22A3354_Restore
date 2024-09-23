@implementation SKSetupFieldDiagnosticsClient

- (SKSetupFieldDiagnosticsClient)init
{
  SKSetupFieldDiagnosticsClient *v2;
  SKSetupFieldDiagnosticsClient *v3;
  SKSetupFieldDiagnosticsClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKSetupFieldDiagnosticsClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupFieldDiagnosticsClient);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)_activate
{
  objc_super v3;

  -[SKSetupFieldDiagnosticsClient _prepareSteps](self, "_prepareSteps");
  v3.receiver = self;
  v3.super_class = (Class)SKSetupFieldDiagnosticsClient;
  -[SKSetupBase _activate](&v3, sel__activate);
}

- (void)_prepareSteps
{
  SKStepBasicConfigClient *v3;
  uint64_t v4;
  SKStepWiFiSetupClientLegacy *v5;
  _QWORD v6[6];
  _QWORD v7[6];

  v3 = objc_alloc_init(SKStepBasicConfigClient);
  -[SKStepBasicConfigClient setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepBasicConfigClient setSkMessaging:](v3, "setSkMessaging:", self);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke;
  v7[3] = &unk_24D22B140;
  v7[4] = self;
  v7[5] = v3;
  -[SKStepBasicConfigClient setSkCompletionHandler:](v3, "setSkCompletionHandler:", v7);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);

  v5 = objc_alloc_init(SKStepWiFiSetupClientLegacy);
  -[SKStepWiFiSetupClientLegacy setDispatchQueue:](v5, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepWiFiSetupClientLegacy setSkMessaging:](v5, "setSkMessaging:", self);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke_2;
  v6[3] = &unk_24D22B140;
  v6[4] = self;
  v6[5] = v5;
  -[SKStepWiFiSetupClientLegacy setSkCompletionHandler:](v5, "setSkCompletionHandler:", v6);
  -[SKSetupBase _addStep:](self, "_addStep:", v5);

}

- (void)_run
{
  int runState;
  int v4;
  int v5;
  _BOOL4 v6;
  int var0;

  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      runState = self->super._runState;
      switch(runState)
      {
        case 11:
          -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:](self, "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:", 0, 1, 1, &__block_literal_global_39);
          v4 = self->super._runState + 1;
          break;
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
          if (runState)
            return;
          v4 = 11;
          break;
      }
      self->super._runState = v4;
LABEL_13:
      if (v4 == runState)
        break;
      var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
}

uint64_t __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedStep:error:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedStep:error:", *(_QWORD *)(a1 + 40), a2);
}

@end
