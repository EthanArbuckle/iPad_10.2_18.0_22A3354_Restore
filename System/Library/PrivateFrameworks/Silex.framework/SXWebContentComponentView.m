@implementation SXWebContentComponentView

- (SXWebContentComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 containerViewController:(id)a7 configurationProvider:(id)a8 navigationManager:(id)a9 analyticsReporting:(id)a10 componentExposureMonitor:(id)a11 interactionManagerFactory:(id)a12 reachabilityProvider:(id)a13 resourceDataSource:(id)a14 loadingPolicyProvider:(id)a15 dataSourceProvider:(id)a16 layoutInvalidator:(id)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  SXWebContentComponentView *v26;
  SXWebContentComponentView *v27;
  uint64_t v28;
  SXWebContentComponentInteractionManager *interactionManager;
  uint64_t v30;
  UITapGestureRecognizer *tapGestureRecognizer;
  SWNavigationManager *navigationManager;
  id v33;
  void *v34;
  id obj;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v48;
  _QWORD v49[4];
  id v50;
  id location;
  objc_super v52;

  v48 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  obj = a7;
  v45 = a7;
  v44 = a8;
  v43 = a9;
  v42 = a10;
  v41 = a11;
  v25 = a12;
  v46 = a13;
  v40 = a14;
  v39 = a15;
  v38 = a16;
  v37 = a17;
  v52.receiver = self;
  v52.super_class = (Class)SXWebContentComponentView;
  v26 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](&v52, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_, v48, v22, v23, v24);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_containerViewController, obj);
    objc_storeStrong((id *)&v27->_configurationProvider, a8);
    objc_storeStrong((id *)&v27->_componentExposureMonitor, a11);
    objc_storeStrong((id *)&v27->_navigationManager, a9);
    objc_storeStrong((id *)&v27->_analyticsReporting, a10);
    objc_msgSend(v25, "interactionManagerForComponentView:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    interactionManager = v27->_interactionManager;
    v27->_interactionManager = (SXWebContentComponentInteractionManager *)v28;

    objc_storeStrong((id *)&v27->_reachabilityProvider, a13);
    objc_storeStrong((id *)&v27->_resourceDataSource, a14);
    objc_storeStrong((id *)&v27->_loadingPolicyProvider, a15);
    objc_storeStrong((id *)&v27->_dataSourceProvider, a16);
    objc_storeStrong((id *)&v27->_layoutInvalidator, a17);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v27, sel_handleTap_);
    tapGestureRecognizer = v27->_tapGestureRecognizer;
    v27->_tapGestureRecognizer = (UITapGestureRecognizer *)v30;

    objc_initWeak(&location, v27);
    navigationManager = v27->_navigationManager;
    v33 = objc_alloc(MEMORY[0x24BE907A8]);
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __348__SXWebContentComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_containerViewController_configurationProvider_navigationManager_analyticsReporting_componentExposureMonitor_interactionManagerFactory_reachabilityProvider_resourceDataSource_loadingPolicyProvider_dataSourceProvider_layoutInvalidator___block_invoke;
    v49[3] = &unk_24D68A5B0;
    objc_copyWeak(&v50, &location);
    v34 = (void *)objc_msgSend(v33, "initWithBlock:", v49);
    -[SWNavigationManager addObserver:](navigationManager, "addObserver:", v34);

    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
  }

  return v27;
}

void __348__SXWebContentComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_containerViewController_configurationProvider_navigationManager_analyticsReporting_componentExposureMonitor_interactionManagerFactory_reachabilityProvider_resourceDataSource_loadingPolicyProvider_dataSourceProvider_layoutInvalidator___block_invoke(id *a1, void *a2)
{
  id v3;
  SXWebContentLinkTapEvent *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  SXWebContentLinkTapEvent *v11;

  v3 = a2;
  v4 = [SXWebContentLinkTapEvent alloc];
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SXWebContentLinkTapEvent initWithIdentifier:destinationURL:](v4, "initWithIdentifier:destinationURL:", v8, v3);

  v9 = objc_loadWeakRetained(a1);
  objc_msgSend(v9, "analyticsReporting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportEvent:", v11);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXWebContentComponentView;
  -[SXWebContentComponentView layoutSubviews](&v3, sel_layoutSubviews);
  -[SXWebContentComponentView layout](self, "layout");
}

- (void)configure
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *loadingIndicator;
  void *v5;
  void *v6;
  NFStateMachine *v7;
  NFStateMachine *stateMachine;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SXWebContentComponentView;
  -[SXComponentView configure](&v10, sel_configure);
  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v3;

  -[UIActivityIndicatorView startAnimating](self->_loadingIndicator, "startAnimating");
  -[SXComponentView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentView loadingIndicator](self, "loadingIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[SXWebContentComponentView configureViewController](self, "configureViewController");
  -[SXWebContentComponentView createStateMachine](self, "createStateMachine");
  v7 = (NFStateMachine *)objc_claimAutoreleasedReturnValue();
  stateMachine = self->_stateMachine;
  self->_stateMachine = v7;

  -[SXWebContentComponentView configurePresentationManager](self, "configurePresentationManager");
  -[SXWebContentComponentView configureErrorProvider](self, "configureErrorProvider");
  -[SXWebContentComponentView configureConfigurationProvider](self, "configureConfigurationProvider");
  -[SXWebContentComponentView stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activate");

}

- (void)loadComponent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SXWebContentComponentView;
  -[SXComponentView loadComponent:](&v12, sel_loadComponent_, a3);
  -[SXWebContentComponentView loadingIndicator](self, "loadingIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentView foregroundColor:](self, "foregroundColor:", objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  -[SXWebContentComponentView loadingPolicyProvider](self, "loadingPolicyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "loadingPolicy");

  if (v8 == 2)
  {
    -[SXWebContentComponentView stateMachine](self, "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "fireEventWithName:withContext:", CFSTR("disable"), 0);

  }
  else
  {
    -[SXWebContentComponentView loadWebContent](self, "loadWebContent");
    -[SXComponentView viewport](self, "viewport");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addViewportChangeListener:forOptions:", self, 8);

    -[SXWebContentComponentView configureComponentExposureMonitor](self, "configureComponentExposureMonitor");
  }
}

- (void)configureComponentExposureMonitor
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[SXWebContentComponentView componentExposureMonitor](self, "componentExposureMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__SXWebContentComponentView_configureComponentExposureMonitor__block_invoke;
  v7[3] = &unk_24D68A5D8;
  objc_copyWeak(&v8, &location);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __62__SXWebContentComponentView_configureComponentExposureMonitor__block_invoke_2;
  v5[3] = &unk_24D68A600;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "onExposureOf:then:when:", self, v7, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__SXWebContentComponentView_configureComponentExposureMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  SXWebContentComponentExposureEvent *v4;
  void *v5;
  SXWebContentComponentExposureEvent *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      v11 = WeakRetained;
      objc_msgSend(WeakRetained, "componentExposureEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = v11;
      if (v7)
      {
        objc_msgSend(v11, "componentExposureEvent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "determineEndDate");

        objc_msgSend(v11, "analyticsReporting");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentExposureEvent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reportEvent:", v10);

        objc_msgSend(v11, "setComponentExposureEvent:", 0);
        goto LABEL_7;
      }
    }
    else if (a2 == 1)
    {
      v11 = WeakRetained;
      v4 = [SXWebContentComponentExposureEvent alloc];
      objc_msgSend(v11, "component");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SXWebContentComponentExposureEvent initWithComponent:](v4, "initWithComponent:", v5);
      objc_msgSend(v11, "setComponentExposureEvent:", v6);

LABEL_7:
      WeakRetained = v11;
    }
  }

}

BOOL __62__SXWebContentComponentView_configureComponentExposureMonitor__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _BOOL8 v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "containerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationState") == 1;

  return v4;
}

- (void)loadWebContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[SXComponentView component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SXComponentView component](self, "component");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      return;
    -[SXWebContentComponentView containerViewController](self, "containerViewController");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v25;
    v18 = v17;
    goto LABEL_8;
  }
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceForIdentifier:", v7);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "HTML");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SXWebContentComponentView loadingPolicyProvider](self, "loadingPolicyProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "loadingPolicy");

    if (v11 != 1)
    {
      -[SXWebContentComponentView resourceDataSource](self, "resourceDataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "baseURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "translateURL:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLByAppendingPathComponent:", &stru_24D68E0F8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[SXWebContentComponentView containerViewController](self, "containerViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "HTML");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loadHTMLString:baseURL:", v24, v15);

      goto LABEL_10;
    }
  }
  objc_msgSend(v25, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SXWebContentComponentView resourceDataSource](self, "resourceDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "translateURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXWebContentComponentView containerViewController](self, "containerViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v15;
LABEL_8:
    objc_msgSend(v16, "loadURL:", v18);
LABEL_10:

  }
}

- (void)configureViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SXWebContentComponentView containerViewController](self, "containerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingContentViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[SXWebContentComponentView containerViewController](self, "containerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addChildViewController:", v6);

  -[SXComponentView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentView containerViewController](self, "containerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v9);

  -[SXWebContentComponentView containerViewController](self, "containerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didMoveToParentViewController:", v11);

}

- (void)configurePresentationManager
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[SXWebContentComponentView containerViewController](self, "containerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__SXWebContentComponentView_configurePresentationManager__block_invoke;
  v10[3] = &unk_24D68A628;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "onPresentable:", v10);

  -[SXWebContentComponentView containerViewController](self, "containerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __57__SXWebContentComponentView_configurePresentationManager__block_invoke_2;
  v8[3] = &unk_24D6873B8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "onLoad:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __57__SXWebContentComponentView_configurePresentationManager__block_invoke(uint64_t a1, double a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  id v8;

  if (a2 != 1.79769313e308)
  {
    v3 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "documentColumnLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentScaleFactor");
    v7 = round(v6 * a2);

    v8 = objc_loadWeakRetained(v3);
    objc_msgSend(v8, "presentWithHeight:", v7);

  }
}

void __57__SXWebContentComponentView_configurePresentationManager__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "fireEventWithName:withContext:", CFSTR("reload"), 0);

}

- (void)configureErrorProvider
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[SXWebContentComponentView containerViewController](self, "containerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SXWebContentComponentView_configureErrorProvider__block_invoke;
  v5[3] = &unk_24D68A650;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "onError:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __51__SXWebContentComponentView_configureErrorProvider__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "fireEventWithName:withContext:", CFSTR("error"), 0);

  objc_msgSend(v8, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD1308]))
    goto LABEL_4;
  v7 = objc_msgSend(v8, "code");

  if (v7 == -1009)
  {
    objc_msgSend(WeakRetained, "reachabilityProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addReachabilityObserver:", WeakRetained);
LABEL_4:

  }
}

- (void)configureConfigurationProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  -[SXWebContentComponentView dataSourceProvider](self, "dataSourceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "NSDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourcesForReferences:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXWebContentComponentView configurationProvider](self, "configurationProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationForSize:dataSources:sourceURL:", v7, v10, 0.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXWebContentComponentView containerViewController](self, "containerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConfiguration:", v11);

  objc_initWeak(&location, self);
  -[SXWebContentComponentView configurationProvider](self, "configurationProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__SXWebContentComponentView_configureConfigurationProvider__block_invoke;
  v15[3] = &unk_24D68A678;
  objc_copyWeak(&v17, &location);
  v14 = v7;
  v16 = v14;
  objc_msgSend(v13, "onChange:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __59__SXWebContentComponentView_configureConfigurationProvider__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "configurationProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "contentFrame");
  v7 = v6;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "component");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationForSize:dataSources:sourceURL:", v10, v13, v7, v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained(v2);
  objc_msgSend(v14, "containerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConfiguration:", v16);

}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CGAffineTransform v30;
  objc_super v31;
  $EB925890EBEBD6850280D1FB85A9BD43 v32;

  var0 = a3.var0;
  v32 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SXWebContentComponentView;
  -[SXComponentView presentComponentWithChanges:](&v31, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  if (var0)
  {
    -[SXWebContentComponentView layout](self, "layout");
    -[SXWebContentComponentView reloadWebContent](self, "reloadWebContent");
  }
  -[SXWebContentComponentView invalidationPromise](self, "invalidationPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &v32, "{?=BBB}");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXWebContentComponentView invalidationPromise](self, "invalidationPromise");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resolve");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v6);

    -[SXWebContentComponentView setInvalidationPromise:](self, "setInvalidationPromise:", 0);
  }
  -[SXWebContentComponentView dataSourceProvider](self, "dataSourceProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSourceReferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "NSDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSourcesForReferences:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXComponentView documentColumnLayout](self, "documentColumnLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentScaleFactor");
  v16 = v15;

  -[SXWebContentComponentView containerViewController](self, "containerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scaleManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setScale:", v16);

  -[SXComponentView contentFrame](self, "contentFrame");
  v20 = v19;
  v22 = v21;
  CGAffineTransformMakeScale(&v30, 1.0 / v16, 1.0 / v16);
  v23 = v22 * v30.c + v30.a * v20;
  v24 = v22 * v30.d + v30.b * v20;
  -[SXWebContentComponentView configurationProvider](self, "configurationProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "URL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "configurationForSize:dataSources:sourceURL:", v13, v27, v23, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXWebContentComponentView containerViewController](self, "containerViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setConfiguration:", v28);

}

- (void)reloadWebContent
{
  id v2;
  id v3;

  -[SXWebContentComponentView stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("reload"), 0);

}

- (void)presentWithHeight:(double)a3
{
  double v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[6];
  CGRect v16;
  CGRect v17;

  -[SXComponentView contentFrame](self, "contentFrame");
  v5 = CGRectGetHeight(v16) - a3;
  if (v5 < 0.0)
    v5 = -v5;
  if (v5 >= 2.22044605e-16)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE6CF68]);
    -[SXWebContentComponentView setInvalidationPromise:](self, "setInvalidationPromise:", v7);

    -[SXWebContentComponentView invalidationPromise](self, "invalidationPromise");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "promise");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __47__SXWebContentComponentView_presentWithHeight___block_invoke;
    v15[3] = &unk_24D68A6A0;
    v15[4] = self;
    *(double *)&v15[5] = a3;
    v10 = (id)objc_msgSend(v9, "then:", v15);

    -[SXWebContentComponentView layoutInvalidator](self, "layoutInvalidator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView contentFrame](self, "contentFrame");
    v13 = (id)objc_msgSend(v11, "invalidateComponent:suggestedSize:", v12, CGRectGetWidth(v17), a3);

  }
  else
  {
    -[SXWebContentComponentView stateMachine](self, "stateMachine");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v14, "fireEventWithName:withContext:", CFSTR("present"), 0);

  }
}

uint64_t __47__SXWebContentComponentView_presentWithHeight___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __int16 v9;
  char v10;
  CGRect v11;

  v10 = 0;
  v9 = 0;
  objc_msgSend(a2, "getValue:", &v9);
  if (!(_BYTE)v9)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "contentFrame");
  v3 = CGRectGetHeight(v11) - *(double *)(a1 + 40);
  if (v3 < 0.0)
    v3 = -v3;
  if (v3 > 2.22044605e-16)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentWithHeight:");
  }
  else
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "layoutInvalidator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelPendingInvalidationForComponent:", v5);

    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "fireEventWithName:withContext:", CFSTR("present"), 0);

  }
  return 0;
}

- (id)createStateMachine
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  -[SXWebContentComponentView createLoadingState](self, "createLoadingState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentView createPresentationState](self, "createPresentationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentView createErrorState](self, "createErrorState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentView createDisabledState](self, "createDisabledState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE6CF88]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v3, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:transitionFromStates:toState:", CFSTR("present"), v7, v4);

  v9 = objc_alloc(MEMORY[0x24BE6CF88]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v3, v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:transitionFromStates:toState:", CFSTR("error"), v10, v5);

  v12 = objc_alloc(MEMORY[0x24BE6CF88]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:transitionFromStates:toState:", CFSTR("reload"), v13, v3);

  v15 = objc_alloc(MEMORY[0x24BE6CF88]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v3, v4, v5, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:transitionFromStates:toState:", CFSTR("disable"), v16, v20);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF80]), "initWithState:withOwner:", v3, self);
  objc_msgSend(v18, "addState:", v4);
  objc_msgSend(v18, "addState:", v5);
  objc_msgSend(v18, "addState:", v20);
  objc_msgSend(v18, "addEvent:", v8);
  objc_msgSend(v18, "addEvent:", v11);
  objc_msgSend(v18, "addEvent:", v14);
  objc_msgSend(v18, "addEvent:", v17);

  return v18;
}

- (id)createLoadingState
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("loading"));
  v3 = (id)objc_msgSend(v2, "onWillEnter:", &__block_literal_global_41);
  v4 = (id)objc_msgSend(v2, "onWillExit:", &__block_literal_global_40);
  return v2;
}

void __47__SXWebContentComponentView_createLoadingState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "containerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentationState:", 2);

  objc_msgSend(v3, "loadingIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startAnimating");

  objc_msgSend(v3, "layoutInvalidator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mightInvalidateComponent:", v7);
}

void __47__SXWebContentComponentView_createLoadingState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "loadingIndicator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");

}

- (id)createPresentationState
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("presentationState"));
  v3 = (id)objc_msgSend(v2, "onWillEnter:", &__block_literal_global_43);
  v4 = (id)objc_msgSend(v2, "onWillExit:", &__block_literal_global_45_0);
  return v2;
}

void __52__SXWebContentComponentView_createPresentationState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(v3, "containerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentationState:", 1);

  objc_msgSend(v3, "componentExposureMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conditionsChanged");

  v7 = (void *)MEMORY[0x24BDF6F90];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__SXWebContentComponentView_createPresentationState__block_invoke_2;
  v9[3] = &unk_24D6874A8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "animateWithDuration:animations:", v9, 0.15);

}

void __52__SXWebContentComponentView_createPresentationState__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "containerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 0);

}

void __52__SXWebContentComponentView_createPresentationState__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDF6F90];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__SXWebContentComponentView_createPresentationState__block_invoke_4;
  v6[3] = &unk_24D6874A8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.15);

}

void __52__SXWebContentComponentView_createPresentationState__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "containerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (id)createErrorState
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("error"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SXWebContentComponentView_createErrorState__block_invoke;
  v7[3] = &unk_24D68A768;
  v7[4] = self;
  v4 = (id)objc_msgSend(v3, "onWillEnter:", v7);
  v5 = (id)objc_msgSend(v3, "onWillExit:", &__block_literal_global_49_0);
  return v3;
}

void __45__SXWebContentComponentView_createErrorState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "containerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentationState:", 2);

  objc_msgSend(v22, "errorLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v22, "setErrorLabel:", v7);

    objc_msgSend(v22, "errorLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SXBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SXTapToRetry"), &stru_24D68E0F8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v10);

    objc_msgSend(v22, "errorLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfLines:", 2);

    objc_msgSend(v22, "errorLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextAlignment:", 1);

    objc_msgSend(v22, "errorLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeToFit");

    objc_msgSend(v22, "errorLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "foregroundColor:", objc_msgSend(v15, "userInterfaceStyle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v16);

    objc_msgSend(v22, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

  }
  objc_msgSend(v22, "layoutErrorView");
  objc_msgSend(v22, "tapGestureRecognizer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addGestureRecognizer:", v19);

  objc_msgSend(v22, "layoutInvalidator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "component");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cancelPendingInvalidationForComponent:", v21);

}

void __45__SXWebContentComponentView_createErrorState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "errorLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(v3, "setErrorLabel:", 0);
  objc_msgSend(v3, "tapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", v5);

}

- (id)createDisabledState
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("disabled"));
}

- (void)layout
{
  -[SXWebContentComponentView layoutLoadingIndicator](self, "layoutLoadingIndicator");
  -[SXWebContentComponentView layoutErrorView](self, "layoutErrorView");
  -[SXWebContentComponentView layoutWebView](self, "layoutWebView");
  -[SXWebContentComponentView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)layoutLoadingIndicator
{
  double MidX;
  id v4;
  CGRect v5;
  CGRect v6;

  -[SXWebContentComponentView loadingIndicator](self, "loadingIndicator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentFrame](self, "contentFrame");
  MidX = CGRectGetMidX(v5);
  -[SXComponentView contentFrame](self, "contentFrame");
  objc_msgSend(v4, "setCenter:", MidX, CGRectGetMidY(v6));

}

- (void)layoutWebView
{
  void *v3;
  id v4;

  -[SXWebContentComponentView containerViewController](self, "containerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentFrame](self, "contentFrame");
  objc_msgSend(v3, "setFrame:");

}

- (void)layoutErrorView
{
  double MidX;
  id v4;
  CGRect v5;
  CGRect v6;

  -[SXWebContentComponentView errorLabel](self, "errorLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentFrame](self, "contentFrame");
  MidX = CGRectGetMidX(v5);
  -[SXComponentView contentFrame](self, "contentFrame");
  objc_msgSend(v4, "setCenter:", MidX, CGRectGetMidY(v6));

}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[SXComponentView viewport](self, "viewport", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "appearState");

  if (v6 == 2)
  {
    -[SXWebContentComponentView containerViewController](self, "containerViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "refresh");

  }
}

- (void)reachabilityChanged:(BOOL)a3
{
  id v4;

  if (a3)
  {
    -[SXWebContentComponentView loadWebContent](self, "loadWebContent");
    -[SXWebContentComponentView reachabilityProvider](self, "reachabilityProvider");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeReachabilityObserver:", self);

  }
}

- (id)foregroundColor:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentStyleForComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_luminance");
    if (v8 > 0.7)
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (SXAnalyticsReporting)analyticsReporting
{
  return self->_analyticsReporting;
}

- (SWContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (SXWebContentConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (SXWebContentComponentInteractionManager)interactionManager
{
  return self->_interactionManager;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (SXResourceDataSource)resourceDataSource
{
  return self->_resourceDataSource;
}

- (SWLoadingPolicyProvider)loadingPolicyProvider
{
  return self->_loadingPolicyProvider;
}

- (SXLayoutInvalidator)layoutInvalidator
{
  return self->_layoutInvalidator;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorLabel, a3);
}

- (NFPendingPromise)invalidationPromise
{
  return self->_invalidationPromise;
}

- (void)setInvalidationPromise:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationPromise, a3);
}

- (SXComponentExposureMonitor)componentExposureMonitor
{
  return self->_componentExposureMonitor;
}

- (SXWebContentComponentExposureEvent)componentExposureEvent
{
  return self->_componentExposureEvent;
}

- (void)setComponentExposureEvent:(id)a3
{
  objc_storeStrong((id *)&self->_componentExposureEvent, a3);
}

- (SXWebContentDataSourceProviding)dataSourceProvider
{
  return self->_dataSourceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceProvider, 0);
  objc_storeStrong((id *)&self->_componentExposureEvent, 0);
  objc_storeStrong((id *)&self->_componentExposureMonitor, 0);
  objc_storeStrong((id *)&self->_invalidationPromise, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_layoutInvalidator, 0);
  objc_storeStrong((id *)&self->_loadingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSource, 0);
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_interactionManager, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_analyticsReporting, 0);
}

@end
