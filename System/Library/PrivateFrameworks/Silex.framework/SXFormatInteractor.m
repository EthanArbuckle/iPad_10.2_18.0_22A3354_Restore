@implementation SXFormatInteractor

- (SXFormatInteractor)initWithLayoutCoordinator:(id)a3 layoutOptionsFactory:(id)a4 presentationAttributesProvider:(id)a5 subscriptionStatusProvider:(id)a6 debugLayoutOptionsProvider:(id)a7 newsletterSubscriptionStatusProvider:(id)a8 offerUpsellScenarioProvider:(id)a9 subscriptionActivationEligibilityProvider:(id)a10 renderingConfigurationProvider:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SXFormatInteractor *v23;
  SXFormatInteractor *v24;
  id obj;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v29 = a4;
  v28 = a5;
  v30 = a6;
  obj = a7;
  v18 = a7;
  v27 = a8;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v32.receiver = self;
  v32.super_class = (Class)SXFormatInteractor;
  v23 = -[SXFormatInteractor init](&v32, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_layoutCoordinator, a3);
    objc_storeStrong((id *)&v24->_layoutOptionsFactory, a4);
    objc_storeStrong((id *)&v24->_presentationAttributesProvider, a5);
    -[SXPresentationAttributesProvider addObserver:](v24->_presentationAttributesProvider, "addObserver:", v24);
    objc_storeStrong((id *)&v24->_subscriptionStatusProvider, a6);
    objc_msgSend(v30, "addObserver:", v24);
    objc_storeStrong((id *)&v24->_debugLayoutOptionsProvider, obj);
    objc_msgSend(v18, "addObserver:", v24);
    objc_storeStrong((id *)&v24->_newsletterSubscriptionStatusProvider, v27);
    objc_msgSend(v19, "addObserver:", v24);
    objc_storeStrong((id *)&v24->_offerUpsellScenarioProvider, a9);
    objc_msgSend(v20, "addObserver:", v24);
    objc_storeStrong((id *)&v24->_subscriptionActivationEligibilityProvider, a10);
    objc_msgSend(v21, "addObserver:", v24);
    objc_storeStrong((id *)&v24->_renderingConfigurationProvider, a11);
    objc_msgSend(v31, "setDelegate:", v24);
  }

  return v24;
}

- (void)updateWithPresentationEnvironment:(id)a3
{
  SXPresentationEnvironment **p_presentationEnvironment;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint8_t buf[16];

  p_presentationEnvironment = &self->_presentationEnvironment;
  v5 = a3;
  objc_storeWeak((id *)p_presentationEnvironment, v5);
  -[SXFormatInteractor presentationAttributesProvider](self, "presentationAttributesProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXFormatInteractor debugLayoutOptionsProvider](self, "debugLayoutOptionsProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewportSize");
  objc_msgSend(v8, "overrideViewportSize:");
  v10 = v9;
  v12 = v11;

  -[SXFormatInteractor debugLayoutOptionsProvider](self, "debugLayoutOptionsProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSizeCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "overrideContentSizeCategory:", v14);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXFormatInteractor debugLayoutOptionsProvider](self, "debugLayoutOptionsProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentScaleFactor");
  objc_msgSend(v15, "overrideContentScaleFactor:");
  v17 = v16;

  -[SXFormatInteractor debugLayoutOptionsProvider](self, "debugLayoutOptionsProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v18, "overrideViewingLocation:", objc_msgSend(v5, "viewingLocation"));

  -[SXFormatInteractor debugLayoutOptionsProvider](self, "debugLayoutOptionsProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor subscriptionStatusProvider](self, "subscriptionStatusProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v19, "overrideBundleSubscriptionStatus:", objc_msgSend(v20, "bundleSubscriptionStatus"));

  -[SXFormatInteractor debugLayoutOptionsProvider](self, "debugLayoutOptionsProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor subscriptionStatusProvider](self, "subscriptionStatusProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v21, "overrideChannelSubscriptionStatus:", objc_msgSend(v22, "channelSubscriptionStatus"));

  -[SXFormatInteractor debugLayoutOptionsProvider](self, "debugLayoutOptionsProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor newsletterSubscriptionStatusProvider](self, "newsletterSubscriptionStatusProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v23, "overrideNewsletterSubscriptionStatus:", objc_msgSend(v24, "newsletterSubscriptionStatus"));

  -[SXFormatInteractor debugLayoutOptionsProvider](self, "debugLayoutOptionsProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor offerUpsellScenarioProvider](self, "offerUpsellScenarioProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v25, "overrideOfferUpsellScenario:", objc_msgSend(v26, "offerUpsellScenario"));

  -[SXFormatInteractor debugLayoutOptionsProvider](self, "debugLayoutOptionsProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor subscriptionActivationEligibilityProvider](self, "subscriptionActivationEligibilityProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "overrideSubscriptionActivationEligibility:", objc_msgSend(v28, "eligibility"));

  -[SXFormatInteractor debugLayoutOptionsProvider](self, "debugLayoutOptionsProvider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor renderingConfigurationProvider](self, "renderingConfigurationProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "configuration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "conditionKeys");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "overrideConditionKeys:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXFormatInteractor layoutOptionsFactory](self, "layoutOptionsFactory");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  objc_msgSend(v5, "presentationTraitCollection");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v7, "testingConditionEnabled");
  LOBYTE(v32) = objc_msgSend(v5, "smartInvertColorsEnabled");

  LOBYTE(v49) = (_BYTE)v32;
  objc_msgSend(v35, "createLayoutOptionsWithViewportSize:safeAreaInsets:traitCollection:bundleSubscriptionStatus:channelSubscriptionStatus:contentSizeCategory:testing:viewingLocation:contentScaleFactor:newsletterSubscriptionStatus:offerUpsellScenario:subscriptionActivationEligibility:smartInvertColorsEnabled:conditionKeys:", v44, v53, v52, v55, v45, v54, v10, v12, v37, v39, v41, v43, v17, v51, v50,
    v29,
    v49,
    v34);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[SXFormatInteractor layoutCoordinator](self, "layoutCoordinator");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layoutWithOptions:", v46);

  }
  else
  {
    v48 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217023000, v48, OS_LOG_TYPE_DEFAULT, "Unable to start layout, no layout valid layout options", buf, 2u);
    }
  }

}

- (void)layoutCoordinator:(id)a3 willLayoutWithParameters:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v17 = a4;
  -[SXFormatInteractor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SXFormatInteractor delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interactor:willLayoutWithOptions:", self, v8);

  }
  v9 = -[SXFormatInteractor requestedContentHiding](self, "requestedContentHiding");
  v10 = v17;
  if (!v9)
  {
    v11 = objc_msgSend(v17, "layoutType");
    v10 = v17;
    if (v11 == 1)
    {
      objc_msgSend(v17, "expectedDuration");
      v10 = v17;
      if (v12 != -1.0)
      {
        objc_msgSend(v17, "expectedDuration");
        v10 = v17;
        if (v13 > 0.175)
        {
          -[SXFormatInteractor delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_respondsToSelector();

          if ((v15 & 1) != 0)
          {
            -[SXFormatInteractor delegate](self, "delegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "hideContentsForLayoutWithInteractor:", self);

          }
          -[SXFormatInteractor setRequestedContentHiding:](self, "setRequestedContentHiding:", 1);
          v10 = v17;
        }
      }
    }
  }

}

- (void)layoutCoordinator:(id)a3 cancelledLayoutWithOptions:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  -[SXFormatInteractor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SXFormatInteractor delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interactor:cancelledLayoutWithOptions:", self, v11);

  }
  if (-[SXFormatInteractor requestedContentHiding](self, "requestedContentHiding"))
  {
    -[SXFormatInteractor delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[SXFormatInteractor delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayContentsAfterLayoutWithInteractor:", self);

    }
    -[SXFormatInteractor setRequestedContentHiding:](self, "setRequestedContentHiding:", 0);
  }

}

- (void)layoutCoordinator:(id)a3 willIntegrateBlueprint:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[SXFormatInteractor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SXFormatInteractor delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interactor:willIntegrateBlueprint:", self, v8);

  }
}

- (void)layoutCoordinator:(id)a3 didIntegrateBlueprint:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  -[SXFormatInteractor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SXFormatInteractor delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interactor:didIntegrateBlueprint:", self, v11);

  }
  if (-[SXFormatInteractor requestedContentHiding](self, "requestedContentHiding"))
  {
    -[SXFormatInteractor delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[SXFormatInteractor delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayContentsAfterLayoutWithInteractor:", self);

    }
    -[SXFormatInteractor setRequestedContentHiding:](self, "setRequestedContentHiding:", 0);
  }

}

- (void)presentationAttributesDidChangeFrom:(id)a3 toAttributes:(id)a4
{
  id v5;

  -[SXFormatInteractor presentationEnvironment](self, "presentationEnvironment", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor updateWithPresentationEnvironment:](self, "updateWithPresentationEnvironment:", v5);

}

- (void)bundleSubscriptionStatusDidChangeFromStatus:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_217023000, v4, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in bundle subscription status", v6, 2u);
  }
  -[SXFormatInteractor presentationEnvironment](self, "presentationEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor updateWithPresentationEnvironment:](self, "updateWithPresentationEnvironment:", v5);

}

- (void)channelSubscriptionStatusDidChangeFromStatus:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_217023000, v4, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in channel subscription status", v6, 2u);
  }
  -[SXFormatInteractor presentationEnvironment](self, "presentationEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor updateWithPresentationEnvironment:](self, "updateWithPresentationEnvironment:", v5);

}

- (void)debugLayoutOptionsDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_217023000, v4, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in debug layout options", v6, 2u);
  }
  -[SXFormatInteractor presentationEnvironment](self, "presentationEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor updateWithPresentationEnvironment:](self, "updateWithPresentationEnvironment:", v5);

}

- (void)newsletterSubscriptionStatusDidChangeFromStatus:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_217023000, v4, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in newsletter subscription status", v6, 2u);
  }
  -[SXFormatInteractor presentationEnvironment](self, "presentationEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor updateWithPresentationEnvironment:](self, "updateWithPresentationEnvironment:", v5);

}

- (void)offerUpsellScenarioDidChangeFromScenario:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_217023000, v4, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in offer upsell scenario", v6, 2u);
  }
  -[SXFormatInteractor presentationEnvironment](self, "presentationEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor updateWithPresentationEnvironment:](self, "updateWithPresentationEnvironment:", v5);

}

- (void)subscriptionActivationEligibilityDidChangeFromEligibility:(int64_t)a3 to:(int64_t)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v5 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_217023000, v5, OS_LOG_TYPE_DEFAULT, "Received callback in response to change in subscription activation eligibility", v7, 2u);
  }
  -[SXFormatInteractor presentationEnvironment](self, "presentationEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFormatInteractor updateWithPresentationEnvironment:](self, "updateWithPresentationEnvironment:", v6);

}

- (SXFormatInteractorDelegate)delegate
{
  return (SXFormatInteractorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SXLayoutCoordinator)layoutCoordinator
{
  return self->_layoutCoordinator;
}

- (SXLayoutOptionsFactory)layoutOptionsFactory
{
  return self->_layoutOptionsFactory;
}

- (SXPresentationAttributesProvider)presentationAttributesProvider
{
  return self->_presentationAttributesProvider;
}

- (SXSubscriptionStatusProviding)subscriptionStatusProvider
{
  return self->_subscriptionStatusProvider;
}

- (SXPresentationEnvironment)presentationEnvironment
{
  return (SXPresentationEnvironment *)objc_loadWeakRetained((id *)&self->_presentationEnvironment);
}

- (void)setPresentationEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_presentationEnvironment, a3);
}

- (SXDebugLayoutOptionsProviding)debugLayoutOptionsProvider
{
  return self->_debugLayoutOptionsProvider;
}

- (SXNewsletterSubscriptionStatusProviding)newsletterSubscriptionStatusProvider
{
  return self->_newsletterSubscriptionStatusProvider;
}

- (SXOfferUpsellScenarioProviding)offerUpsellScenarioProvider
{
  return self->_offerUpsellScenarioProvider;
}

- (SXSubscriptionActivationEligibilityProviding)subscriptionActivationEligibilityProvider
{
  return self->_subscriptionActivationEligibilityProvider;
}

- (SXRenderingConfigurationProvider)renderingConfigurationProvider
{
  return self->_renderingConfigurationProvider;
}

- (BOOL)requestedContentHiding
{
  return self->_requestedContentHiding;
}

- (void)setRequestedContentHiding:(BOOL)a3
{
  self->_requestedContentHiding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_subscriptionActivationEligibilityProvider, 0);
  objc_storeStrong((id *)&self->_offerUpsellScenarioProvider, 0);
  objc_storeStrong((id *)&self->_newsletterSubscriptionStatusProvider, 0);
  objc_storeStrong((id *)&self->_debugLayoutOptionsProvider, 0);
  objc_destroyWeak((id *)&self->_presentationEnvironment);
  objc_storeStrong((id *)&self->_subscriptionStatusProvider, 0);
  objc_storeStrong((id *)&self->_presentationAttributesProvider, 0);
  objc_storeStrong((id *)&self->_layoutOptionsFactory, 0);
  objc_storeStrong((id *)&self->_layoutCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
