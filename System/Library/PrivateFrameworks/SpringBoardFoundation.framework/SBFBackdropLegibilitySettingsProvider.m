@implementation SBFBackdropLegibilitySettingsProvider

- (SBFBackdropLegibilitySettingsProvider)initWithBackdropView:(id)a3
{
  id v5;
  SBFBackdropLegibilitySettingsProvider *v6;
  SBFBackdropLegibilitySettingsProvider *v7;
  _UILegibilitySettings *legibilitySettings;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFBackdropLegibilitySettingsProvider;
  v6 = -[SBFBackdropLegibilitySettingsProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backdropView, a3);
    legibilitySettings = v7->_legibilitySettings;
    v7->_legibilitySettings = 0;

    objc_storeWeak((id *)&v7->_delegate, 0);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFBackdropLegibilitySettingsProvider setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBFBackdropLegibilitySettingsProvider;
  -[SBFBackdropLegibilitySettingsProvider dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  _UIBackdropView *backdropView;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    backdropView = self->_backdropView;
    if (obj)
    {
      -[_UIBackdropView addObserver:](backdropView, "addObserver:", self);
      -[SBFBackdropLegibilitySettingsProvider backdropViewDidChange:](self, "backdropViewDidChange:", self->_backdropView);
    }
    else
    {
      -[_UIBackdropView removeObserver:](backdropView, "removeObserver:", self);
    }
    v5 = obj;
  }

}

- (void)backdropViewDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _UILegibilitySettings *v7;
  _UILegibilitySettings *legibilitySettings;
  id WeakRetained;
  id v10;

  objc_msgSend(a3, "inputSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorSettings");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEADE8]);
    objc_msgSend(v10, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (_UILegibilitySettings *)objc_msgSend(v5, "initWithContentColor:", v6);
    legibilitySettings = self->_legibilitySettings;
    self->_legibilitySettings = v7;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "providerLegibilitySettingsChanged:", self);

  }
}

- (SBFLegibilitySettingsProviderDelegate)delegate
{
  return (SBFLegibilitySettingsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
