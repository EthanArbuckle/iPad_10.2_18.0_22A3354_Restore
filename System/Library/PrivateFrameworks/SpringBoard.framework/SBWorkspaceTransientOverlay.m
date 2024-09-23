@implementation SBWorkspaceTransientOverlay

- (SBWorkspaceTransientOverlay)initWithViewController:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  SBWorkspaceTransientOverlay *v10;
  objc_super v12;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%p"), v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)SBWorkspaceTransientOverlay;
  v10 = -[SBWorkspaceEntity initWithIdentifier:displayChangeSettings:](&v12, sel_initWithIdentifier_displayChangeSettings_, v9, 0);

  if (v10)
    objc_storeStrong((id *)&v10->_viewController, a3);

  return v10;
}

- (id)_generator
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  v3 = (void *)objc_opt_class();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__SBWorkspaceTransientOverlay__generator__block_invoke;
  v7[3] = &unk_1E8EB8BC0;
  objc_copyWeak(v8, &location);
  v8[1] = v3;
  v4 = (void *)MEMORY[0x1D17E5550](v7);
  v5 = (void *)MEMORY[0x1D17E5550]();

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

id __41__SBWorkspaceTransientOverlay__generator__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v3 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithViewController:", WeakRetained[5]);
  else
    v3 = 0;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBWorkspaceTransientOverlay;
  v4 = -[SBWorkspaceEntity copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 5, self->_viewController);
  return v5;
}

- (SBTransientOverlayViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
