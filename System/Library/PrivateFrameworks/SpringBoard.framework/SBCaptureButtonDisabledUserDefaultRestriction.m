@implementation SBCaptureButtonDisabledUserDefaultRestriction

- (SBCaptureButtonDisabledUserDefaultRestriction)initWithCoordinator:(id)a3
{
  id v4;
  SBCaptureButtonDisabledUserDefaultRestriction *v5;
  void *v6;
  uint64_t v7;
  SBCaptureButtonDefaults *captureButtonDefaults;
  SBCaptureButtonDefaults *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBCaptureButtonDisabledUserDefaultRestriction;
  v5 = -[SBCaptureButtonInternalRestrictionGlue initWithCoordinator:](&v21, sel_initWithCoordinator_, v4);
  if (v5)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "captureButtonDefaults");
    v7 = objc_claimAutoreleasedReturnValue();
    captureButtonDefaults = v5->_captureButtonDefaults;
    v5->_captureButtonDefaults = (SBCaptureButtonDefaults *)v7;

    objc_initWeak(&location, v5);
    v9 = v5->_captureButtonDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableCaptureButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __69__SBCaptureButtonDisabledUserDefaultRestriction_initWithCoordinator___block_invoke;
    v18 = &unk_1E8E9DF28;
    objc_copyWeak(&v19, &location);
    v13 = (id)-[SBCaptureButtonDefaults observeDefault:onQueue:withBlock:](v9, "observeDefault:onQueue:withBlock:", v10, v11, &v15);

    -[SBCaptureButtonDisabledUserDefaultRestriction _evaluateCaptureButtonDisablement](v5, "_evaluateCaptureButtonDisablement", v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __69__SBCaptureButtonDisabledUserDefaultRestriction_initWithCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_evaluateCaptureButtonDisablement");
    WeakRetained = v2;
  }

}

- (void)_evaluateCaptureButtonDisablement
{
  if (-[SBCaptureButtonDefaults disableCaptureButton](self->_captureButtonDefaults, "disableCaptureButton"))-[SBCaptureButtonInternalRestrictionGlue acquireRestriction:](self, "acquireRestriction:", CFSTR("disabled by UserDefault"));
  else
    -[SBCaptureButtonInternalRestrictionGlue relinquishRestriction](self, "relinquishRestriction");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureButtonDefaults, 0);
}

@end
