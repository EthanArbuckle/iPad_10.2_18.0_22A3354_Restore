@implementation SKSetupSIMTransferClient

- (SKSetupSIMTransferClient)init
{
  SKSetupSIMTransferClient *v2;
  SKSetupSIMTransferClient *v3;
  SKSetupSIMTransferClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKSetupSIMTransferClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupSIMTransferClient);
  v3 = v2;
  if (v2)
  {
    v2->super._bluetoothUseCase = 258;
    v4 = v2;
  }

  return v3;
}

- (void)_run
{
  int runState;
  int v4;
  int v5;
  int var0;

  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      runState = self->super._runState;
      if (runState <= 11)
        break;
      if (runState == 12)
      {
        v5 = -[SKConnection state](self->super._skCnx, "state");
        v4 = self->super._runState;
        if (v5 != 1)
          goto LABEL_14;
        ++v4;
        goto LABEL_13;
      }
      if (runState != 13)
        return;
      -[SKSetupBase _completeWithError:](self, "_completeWithError:", 0);
      v4 = self->super._runState;
LABEL_14:
      if (v4 == runState)
        return;
      var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    if (runState)
    {
      if (runState != 11)
        return;
      -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:](self, "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:", 0, 1, 1, &__block_literal_global_365);
      v4 = self->super._runState + 1;
    }
    else
    {
      v4 = 11;
    }
LABEL_13:
    self->super._runState = v4;
    goto LABEL_14;
  }
}

@end
