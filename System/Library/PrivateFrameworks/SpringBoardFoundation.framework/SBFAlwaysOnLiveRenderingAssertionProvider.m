@implementation SBFAlwaysOnLiveRenderingAssertionProvider

- (SBFAlwaysOnLiveRenderingAssertionProvider)init
{
  SBFAlwaysOnLiveRenderingAssertionProvider *v2;
  SBFAlwaysOnLiveRenderingBLSAssertionProvider *v3;
  SBFAlwaysOnLiveRenderingBLSAssertionProvider *assertionProvider;
  SBFAlwaysOnLiveRenderingAssertionWeakCollection *v5;
  SBFAlwaysOnLiveRenderingAssertionWeakCollection *assertions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFAlwaysOnLiveRenderingAssertionProvider;
  v2 = -[SBFAlwaysOnLiveRenderingAssertionProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBFAlwaysOnLiveRenderingBLSAssertionProvider);
    assertionProvider = v2->_assertionProvider;
    v2->_assertionProvider = v3;

    v5 = objc_alloc_init(SBFAlwaysOnLiveRenderingAssertionWeakCollection);
    assertions = v2->_assertions;
    v2->_assertions = v5;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_7);
  return (id)sharedInstance_sharedInstance;
}

void __59__SBFAlwaysOnLiveRenderingAssertionProvider_sharedInstance__block_invoke()
{
  SBFAlwaysOnLiveRenderingAssertionProvider *v0;
  void *v1;

  v0 = objc_alloc_init(SBFAlwaysOnLiveRenderingAssertionProvider);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (BLSBacklightStateObservable)backlight
{
  BLSBacklightStateObservable *backlight;

  backlight = self->_backlight;
  if (backlight)
    return backlight;
  objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
  return (BLSBacklightStateObservable *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)acquireLiveRenderingAssertionForUIScene:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SBFAlwaysOnLiveRenderingBLSAttributesProvider *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "_sceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBFAlwaysOnLiveRenderingBLSAttributesProvider initWithUIScene:]([SBFAlwaysOnLiveRenderingBLSAttributesProvider alloc], "initWithUIScene:", v7);
  -[SBFAlwaysOnLiveRenderingAssertionProvider _acquireLiveRenderingAssertionForScene:identifier:reason:attributes:](self, "_acquireLiveRenderingAssertionForScene:identifier:reason:attributes:", v7, v8, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)acquireLiveRenderingAssertionForFBSScene:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SBFAlwaysOnLiveRenderingBLSAttributesProvider *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBFAlwaysOnLiveRenderingBLSAttributesProvider initWithFBSScene:]([SBFAlwaysOnLiveRenderingBLSAttributesProvider alloc], "initWithFBSScene:", v7);
  -[SBFAlwaysOnLiveRenderingAssertionProvider _acquireLiveRenderingAssertionForScene:identifier:reason:attributes:](self, "_acquireLiveRenderingAssertionForScene:identifier:reason:attributes:", v7, v8, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_acquireLiveRenderingAssertionForScene:(id)a3 identifier:(id)a4 reason:(id)a5 attributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  SBFAlwaysOnLiveRenderingAssertionManager *v15;
  NSObject *v16;
  SBFAlwaysOnLiveRenderingAssertionManager *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  -[SBFAlwaysOnLiveRenderingAssertionProvider _assertionManagerForScene:](self, "_assertionManagerForScene:", v10);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (SBFAlwaysOnLiveRenderingAssertionManager *)v14;
    SBLogLiveRendering();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[SBFAlwaysOnLiveRenderingAssertionProvider _acquireLiveRenderingAssertionForScene:identifier:reason:attributes:].cold.2();

  }
  else
  {
    v17 = [SBFAlwaysOnLiveRenderingAssertionManager alloc];
    -[SBFAlwaysOnLiveRenderingAssertionProvider backlight](self, "backlight");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFAlwaysOnLiveRenderingAssertionProvider assertionProvider](self, "assertionProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBFAlwaysOnLiveRenderingAssertionManager initWithBacklight:assertionProvider:attributesProvider:](v17, "initWithBacklight:assertionProvider:attributesProvider:", v18, v19, v12);

    SBLogLiveRendering();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[SBFAlwaysOnLiveRenderingAssertionProvider _acquireLiveRenderingAssertionForScene:identifier:reason:attributes:].cold.1();

    -[SBFAlwaysOnLiveRenderingAssertionProvider _setAssertionManager:forScene:](self, "_setAssertionManager:forScene:", v15, v10);
  }
  -[SBFAlwaysOnLiveRenderingAssertionManager acquireLiveRenderingAssertionWithReason:](v15, "acquireLiveRenderingAssertionWithReason:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFAlwaysOnLiveRenderingAssertionWeakCollection addAssertion:](self->_assertions, "addAssertion:", v21);
  return v21;
}

- (void)invalidateAllAssertions
{
  -[SBFAlwaysOnLiveRenderingAssertionWeakCollection invalidateAll](self->_assertions, "invalidateAll");
  -[SBFAlwaysOnLiveRenderingAssertionWeakCollection removeAll](self->_assertions, "removeAll");
}

- (void)_setAssertionManager:(id)a3 forScene:(id)a4
{
  objc_setAssociatedObject(a4, (const void *)SBFAlwaysOnLiveRenderingSceneAssertionManagerKey, a3, (void *)1);
}

- (id)_assertionManagerForScene:(id)a3
{
  return objc_getAssociatedObject(a3, (const void *)SBFAlwaysOnLiveRenderingSceneAssertionManagerKey);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; activeCount:%d"),
    v5,
    self,
    -[SBFAlwaysOnLiveRenderingAssertionWeakCollection count](self->_assertions, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setBacklight:(id)a3
{
  objc_storeStrong((id *)&self->_backlight, a3);
}

- (SBFAlwaysOnLiveRenderingBLSAssertionProvider)assertionProvider
{
  return self->_assertionProvider;
}

- (void)setAssertionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_assertionProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionProvider, 0);
  objc_storeStrong((id *)&self->_backlight, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

- (void)_acquireLiveRenderingAssertionForScene:identifier:reason:attributes:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_18AB69000, v2, v3, "Created <%@; %p> for scene: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)_acquireLiveRenderingAssertionForScene:identifier:reason:attributes:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_18AB69000, v2, v3, "Reusing <%@; %p> for scene: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

@end
