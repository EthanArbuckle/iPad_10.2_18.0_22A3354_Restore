@implementation SXDebugComponentView

- (SXDebugComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 invalidator:(id)a7
{
  id v13;
  SXDebugComponentView *v14;
  SXDebugComponentView *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SXDebugComponentView;
  v14 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](&v17, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_invalidator, a7);

  return v15;
}

- (void)loadComponent:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SXDebugComponentView;
  -[SXComponentView loadComponent:](&v9, sel_loadComponent_, a3);
  objc_msgSend(MEMORY[0x24BDF6950], "redColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDebugComponentView setBackgroundColor:](self, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  -[SXDebugComponentView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v6);

  -[SXDebugComponentView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", 1.0);

}

- (void)presentComponentWithChanges:(id)a3
{
  uint32_t v4;
  dispatch_time_t v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXDebugComponentView;
  -[SXComponentView presentComponentWithChanges:](&v7, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  v4 = arc4random_uniform(0xAu);
  v5 = dispatch_time(0, 1000000000 * v4);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SXDebugComponentView_presentComponentWithChanges___block_invoke;
  block[3] = &unk_24D6874A8;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
}

void __52__SXDebugComponentView_presentComponentWithChanges___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "invalidator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "component");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "invalidateComponent:suggestedSize:", v2, 0.0, 300.0);

}

- (SXLayoutInvalidator)invalidator
{
  return self->_invalidator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidator, 0);
}

@end
