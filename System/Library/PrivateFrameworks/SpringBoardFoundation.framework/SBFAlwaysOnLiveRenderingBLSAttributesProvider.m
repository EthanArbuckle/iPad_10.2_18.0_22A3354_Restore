@implementation SBFAlwaysOnLiveRenderingBLSAttributesProvider

- (SBFAlwaysOnLiveRenderingBLSAttributesProvider)initWithProvider:(id)a3
{
  id v5;
  SBFAlwaysOnLiveRenderingBLSAttributesProvider *v6;
  SBFAlwaysOnLiveRenderingBLSAttributesProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFAlwaysOnLiveRenderingBLSAttributesProvider;
  v6 = -[SBFAlwaysOnLiveRenderingBLSAttributesProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_provider, a3);

  return v7;
}

- (SBFAlwaysOnLiveRenderingBLSAttributesProvider)initWithUIScene:(id)a3
{
  id v4;
  SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider *v5;
  SBFAlwaysOnLiveRenderingBLSAttributesProvider *v6;

  v4 = a3;
  v5 = -[SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider initWithUIScene:]([SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider alloc], "initWithUIScene:", v4);

  v6 = -[SBFAlwaysOnLiveRenderingBLSAttributesProvider initWithProvider:](self, "initWithProvider:", v5);
  return v6;
}

- (SBFAlwaysOnLiveRenderingBLSAttributesProvider)initWithFBSScene:(id)a3
{
  id v4;
  SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider *v5;
  SBFAlwaysOnLiveRenderingBLSAttributesProvider *v6;

  v4 = a3;
  v5 = -[SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider initWithFBSScene:]([SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider alloc], "initWithFBSScene:", v4);

  v6 = -[SBFAlwaysOnLiveRenderingBLSAttributesProvider initWithProvider:](self, "initWithProvider:", v5);
  return v6;
}

- (id)assertionAttributes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[SBFAlwaysOnLiveRenderingBLSAttributesProvider assertionAttributes](self->_provider, "assertionAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D00FC8], "ignoreWhenBacklightInactivates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0D00FC0], "timeoutAfterInterval:", 10.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v8);

    objc_msgSend(v5, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBLogLiveRendering();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBFAlwaysOnLiveRenderingBLSAttributesProvider assertionAttributes].cold.1(v10);

    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

- (void)assertionAttributes
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18AB69000, log, OS_LOG_TYPE_ERROR, "Invalid attributes.", v1, 2u);
}

@end
