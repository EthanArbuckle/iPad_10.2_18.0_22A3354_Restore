@implementation SBAmbientMainDisplayController

- (SBAmbientMainDisplayController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAmbientPresentationController_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAmbientMainDisplayController.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[SBAmbientMainDisplayController init]",
    v5);

  return 0;
}

- (SBAmbientMainDisplayController)initWithAmbientPresentationController:(id)a3
{
  id v4;
  SBAmbientMainDisplayController *v5;
  SBAmbientMainDisplayController *v6;
  BrightnessSystemClient *v7;
  BrightnessSystemClient *brightnessSystemClient;
  void *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_queue *brightnessSystemQueue;
  uint64_t v13;
  SBBacklightController *backlightController;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBAmbientMainDisplayController;
  v5 = -[SBAmbientMainDisplayController init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_ambientPresentationController, v4);
    objc_msgSend(v4, "addObserver:", v6);
    v7 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E0D15710]);
    brightnessSystemClient = v6->_brightnessSystemClient;
    v6->_brightnessSystemClient = v7;

    objc_msgSend(MEMORY[0x1E0D01760], "serial");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceClass:", 25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSDispatchQueueCreate();
    brightnessSystemQueue = v6->_brightnessSystemQueue;
    v6->_brightnessSystemQueue = (OS_dispatch_queue *)v11;

    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    backlightController = v6->_backlightController;
    v6->_backlightController = (SBBacklightController *)v13;

    -[SBBacklightController addObserver:](v6->_backlightController, "addObserver:", v6);
    v6->_ambientPresented = objc_msgSend(v4, "isPresented");
    v6->_backlightState = -[SBBacklightController backlightState](v6->_backlightController, "backlightState");
    -[SBAmbientMainDisplayController _updateCoreBrightnessAmbientModeForce:](v6, "_updateCoreBrightnessAmbientModeForce:", 1);
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_ambientPresentationController);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  -[SBBacklightController removeObserver:](self->_backlightController, "removeObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)SBAmbientMainDisplayController;
  -[SBAmbientMainDisplayController dealloc](&v4, sel_dealloc);
}

- (void)ambientPresentationController:(id)a3 didUpdatePresented:(BOOL)a4
{
  if (self->_ambientPresented != a4)
  {
    self->_ambientPresented = a4;
    -[SBAmbientMainDisplayController _updateCoreBrightnessAmbientMode](self, "_updateCoreBrightnessAmbientMode", a3);
  }
}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  if (self->_backlightState != a4)
  {
    self->_backlightState = a4;
    -[SBAmbientMainDisplayController _updateCoreBrightnessAmbientMode](self, "_updateCoreBrightnessAmbientMode", a3);
  }
}

- (BOOL)_shouldEnableCoreBrightnessAmbientMode
{
  if (!self->_ambientPresented)
    return 0;
  if (self->_isCoreBrightnessAmbientModeEnabled)
    return 1;
  return SBBacklightStateIsActive(self->_backlightState);
}

- (void)_updateCoreBrightnessAmbientMode
{
  -[SBAmbientMainDisplayController _updateCoreBrightnessAmbientModeForce:](self, "_updateCoreBrightnessAmbientModeForce:", 0);
}

- (void)_updateCoreBrightnessAmbientModeForce:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  NSObject *brightnessSystemQueue;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  v5 = -[SBAmbientMainDisplayController _shouldEnableCoreBrightnessAmbientMode](self, "_shouldEnableCoreBrightnessAmbientMode");
  if (self->_isCoreBrightnessAmbientModeEnabled != v5 || v3)
  {
    self->_isCoreBrightnessAmbientModeEnabled = v5;
    brightnessSystemQueue = self->_brightnessSystemQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__SBAmbientMainDisplayController__updateCoreBrightnessAmbientModeForce___block_invoke;
    v8[3] = &unk_1E8E9F508;
    v9 = v5;
    v8[4] = self;
    dispatch_async(brightnessSystemQueue, v8);
  }
}

void __72__SBAmbientMainDisplayController__updateCoreBrightnessAmbientModeForce___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogAmbientPresentation();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned __int8 *)(v4 + 40);
    SBBacklightStateDescription(*(_QWORD *)(v4 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109634;
    v9[1] = v3;
    v10 = 1024;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Setting CoreBrightness Ambient mode to %{BOOL}u [ presented : %{BOOL}d ; backlight : '%{public}@' ]",
      (uint8_t *)v9,
      0x18u);

  }
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v8, CFSTR("DominoStateUpdate"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessSystemQueue, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_destroyWeak((id *)&self->_ambientPresentationController);
}

@end
