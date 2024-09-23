@implementation SBExtendedDisplayProfileFactory

- (id)initWithDefaults:(void *)a3 delegate:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SBExtendedDisplayProfileFactory;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeWeak(a1 + 2, v7);
    }
  }

  return a1;
}

- (id)createProfile
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D97610], "sceneHostingProfileWithDelegate:builder:", a1, &__block_literal_global_333);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __48__SBExtendedDisplayProfileFactory_createProfile__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *MEMORY[0x1E0D97628];
  v4 = a2;
  +[FBSSceneSpecification specification](SBExternalDisplayApplicationSceneSpecification, "specification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPriorityLevel:sceneSpecification:", v2, v3);

  objc_msgSend(v4, "setMainLike:", 1);
  objc_msgSend(v4, "setCloningSupported:", 0);
  objc_msgSend(v4, "deriveWithIdentifier:", CFSTR("com.apple.springboard.shellui"));

}

- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4
{
  return -[SBExternalDisplayDefaults displaySupportsExtendedDisplayMode:](self->_defaults, "displaySupportsExtendedDisplayMode:", a4);
}

- (id)displayProfile:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4
{
  id v4;
  SBExtendedDisplayProfileFactoryRootSceneWindow *v5;

  v4 = a4;
  v5 = -[UIRootSceneWindow initWithDisplayConfiguration:]([SBExtendedDisplayProfileFactoryRootSceneWindow alloc], "initWithDisplayConfiguration:", v4);

  return v5;
}

- (void)displayProfile:(id)a3 modifyInitialSceneParameters:(id)a4
{
  SBExtendedDisplayProfileFactoryDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "extendedFactory:modifyInitialSceneParameters:", self, v6);

}

- (id)displayProfile:(id)a3 initialDisplayConfigurationRequestForDisplay:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;

  v5 = (objc_class *)MEMORY[0x1E0D23130];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  -[SBExternalDisplayDefaults displayModeSettingsForDisplay:](self->_defaults, "displayModeSettingsForDisplay:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA9D58], "withDisplay:useNativeSize:", v6, -[SBExternalDisplayDefaults chamois](self->_defaults, "chamois"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "overscanCompensation");
  objc_msgSend(v7, "setOverscanCompensation:", FBSDisplayOverscanCompensationForDisplayValue());
  objc_msgSend(v9, "logicalScaleForDisplayScale:", objc_msgSend(v8, "scale"));
  objc_msgSend(v7, "setLogicalScale:", v10, v10);
  -[SBExternalDisplayDefaults contentsScale](self->_defaults, "contentsScale");
  objc_msgSend(v7, "setPointScale:");

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
