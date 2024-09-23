@implementation SKSetupMacSetupClient

- (SKSetupMacSetupClient)init
{
  SKSetupMacSetupClient *v2;
  SKSetupMacSetupClient *v3;
  SKSetupMacSetupClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKSetupMacSetupClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupMacSetupClient);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)_activate
{
  objc_super v3;

  -[SKSetupMacSetupClient _prepareSteps](self, "_prepareSteps");
  v3.receiver = self;
  v3.super_class = (Class)SKSetupMacSetupClient;
  -[SKSetupBase _activate](&v3, sel__activate);
}

- (void)_prepareSteps
{
  SKStepBasicConfigClient *v3;
  _QWORD v4[6];

  v3 = objc_alloc_init(SKStepBasicConfigClient);
  -[SKStepBasicConfigClient setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepBasicConfigClient setSkMessaging:](v3, "setSkMessaging:", self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__SKSetupMacSetupClient__prepareSteps__block_invoke;
  v4[3] = &unk_24D22B140;
  v4[4] = self;
  v4[5] = v3;
  -[SKStepBasicConfigClient setSkCompletionHandler:](v3, "setSkCompletionHandler:", v4);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);

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
          -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:](self, "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:", 0, 1, 1, &__block_literal_global_2376);
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

uint64_t __38__SKSetupMacSetupClient__prepareSteps__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedStep:error:", *(_QWORD *)(a1 + 40), a2);
}

@end
