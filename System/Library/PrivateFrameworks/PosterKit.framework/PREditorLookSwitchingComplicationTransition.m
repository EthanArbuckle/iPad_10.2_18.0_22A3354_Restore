@implementation PREditorLookSwitchingComplicationTransition

- (PREditorLookSwitchingComplicationTransition)initWithFromVibrancyConfiguration:(id)a3 toVibrancyConfiguration:(id)a4 viewController:(id)a5 cachingVibrancyTransitionProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PREditorLookSwitchingComplicationTransition *v15;
  PREditorLookSwitchingComplicationTransition *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PREditorLookSwitchingComplicationTransition;
  v15 = -[PREditorLookSwitchingComplicationTransition init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromVibrancyConfiguration, a3);
    objc_storeStrong((id *)&v16->_toVibrancyConfiguration, a4);
    objc_storeWeak((id *)&v16->_viewController, v13);
    objc_storeStrong((id *)&v16->_cachingVibrancyTransitionProvider, a6);
  }

  return v16;
}

- (void)updateInteractiveTransition:(double)a3
{
  void *v5;
  BOOL v6;
  CSCachingVibrancyTransitionProvider *cachingVibrancyTransitionProvider;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[BSUIVibrancyConfiguration color](self->_fromVibrancyConfiguration, "color");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration color](self->_toVibrancyConfiguration, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6 || -[BSUIVibrancyConfiguration effectType](self->_fromVibrancyConfiguration, "effectType") == 3)
  {
    cachingVibrancyTransitionProvider = self->_cachingVibrancyTransitionProvider;
    -[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self->_fromVibrancyConfiguration, "alternativeVibrancyEffectLUT");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self->_toVibrancyConfiguration, "alternativeVibrancyEffectLUT");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lutIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCachingVibrancyTransitionProvider vibrancyLUTWithStartingLUT:transitionProgress:toIdentifier:](cachingVibrancyTransitionProvider, "vibrancyLUTWithStartingLUT:transitionProgress:toIdentifier:", v8, v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)-[BSUIVibrancyConfiguration copyWithBlendAmount:blendConfiguration:alternativeVibrancyEffectLUT:](self->_fromVibrancyConfiguration, "copyWithBlendAmount:blendConfiguration:alternativeVibrancyEffectLUT:", self->_toVibrancyConfiguration, v11, a3);
    -[PREditorLookSwitchingComplicationTransition viewController](self, "viewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setVibrancyConfiguration:", v12);

  }
}

- (void)finishInteractiveTransition
{
  id v3;

  -[PREditorLookSwitchingComplicationTransition viewController](self, "viewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setVibrancyConfiguration:", self->_toVibrancyConfiguration);

}

- (void)cancelInteractiveTransition
{
  id v3;

  -[PREditorLookSwitchingComplicationTransition viewController](self, "viewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setVibrancyConfiguration:", self->_fromVibrancyConfiguration);

}

- (BSUIVibrancyConfiguration)fromVibrancyConfiguration
{
  return self->_fromVibrancyConfiguration;
}

- (void)setFromVibrancyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_fromVibrancyConfiguration, a3);
}

- (BSUIVibrancyConfiguration)toVibrancyConfiguration
{
  return self->_toVibrancyConfiguration;
}

- (void)setToVibrancyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_toVibrancyConfiguration, a3);
}

- (PREditorRootViewController)viewController
{
  return (PREditorRootViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (CSCachingVibrancyTransitionProvider)cachingVibrancyTransitionProvider
{
  return self->_cachingVibrancyTransitionProvider;
}

- (void)setCachingVibrancyTransitionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cachingVibrancyTransitionProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachingVibrancyTransitionProvider, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_toVibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_fromVibrancyConfiguration, 0);
}

@end
