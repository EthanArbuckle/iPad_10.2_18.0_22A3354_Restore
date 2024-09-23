@implementation SBSwitcherLayoutCalculationsCache

- (SBSwitcherLayoutCalculationsCache)init
{
  SBSwitcherLayoutCalculationsCache *v2;
  SBSwitcherLayoutCalculationsCache *v3;
  NSDictionary *cachedLayoutCalculationsByKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSwitcherLayoutCalculationsCache;
  v2 = -[SBSwitcherLayoutCalculationsCache init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    cachedLayoutCalculationsByKey = v2->_cachedLayoutCalculationsByKey;
    v2->_cachedLayoutCalculationsByKey = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v3;
}

- (CGRect)frameForKey:(id)a3 validityToken:(id)a4 fallback:(id)a5
{
  id v8;
  double (**v9)(_QWORD);
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  id v26;
  uint64_t v27;
  CGRect result;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (double (**)(_QWORD))a5;
  -[SBSwitcherLayoutCalculationsCache rebuildIfNecessaryForValidityToken:](self, "rebuildIfNecessaryForValidityToken:", a4);
  -[NSDictionary objectForKey:](self->_cachedLayoutCalculationsByKey, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "frame");
  }
  else
  {
    SBLogAppSwitcher();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = v8;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "Cache didn't have layoutCalculations for key %@", (uint8_t *)&v25, 0xCu);
    }

    v12 = v9[2](v9);
  }
  v17 = v12;
  v18 = v13;
  v19 = v14;
  v20 = v15;

  v21 = v17;
  v22 = v18;
  v23 = v19;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)scaleForKey:(id)a3 validityToken:(id)a4 fallback:(id)a5
{
  id v8;
  double (**v9)(_QWORD);
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;
  double v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (double (**)(_QWORD))a5;
  -[SBSwitcherLayoutCalculationsCache rebuildIfNecessaryForValidityToken:](self, "rebuildIfNecessaryForValidityToken:", a4);
  -[NSDictionary objectForKey:](self->_cachedLayoutCalculationsByKey, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "scale");
  }
  else
  {
    SBLogAppSwitcher();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "Cache didn't have layoutCalculations for key %@", (uint8_t *)&v16, 0xCu);
    }

    v12 = v9[2](v9);
  }
  v14 = v12;

  return v14;
}

- (void)rebuildIfNecessaryForValidityToken:(id)a3
{
  void *v6;
  NSDictionary *v7;
  NSDictionary *cachedLayoutCalculationsByKey;
  void *v9;
  id v10;

  v10 = a3;
  if (!-[SBSwitcherLayoutCalculationsCacheValidityToken isEqual:](self->_validityToken, "isEqual:"))
  {
    -[SBSwitcherLayoutCalculationsCache delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherLayoutCalculationsCache.m"), 54, CFSTR("Must have set delegate by now"));

    }
    objc_msgSend(v6, "buildLayoutCalculationsForCache:", self);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    cachedLayoutCalculationsByKey = self->_cachedLayoutCalculationsByKey;
    self->_cachedLayoutCalculationsByKey = v7;

    objc_storeStrong((id *)&self->_validityToken, a3);
  }

}

- (SBSwitcherLayoutCalculationsCacheDelegate)delegate
{
  return (SBSwitcherLayoutCalculationsCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBSwitcherLayoutCalculationsCacheValidityToken)validityToken
{
  return self->_validityToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validityToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedLayoutCalculationsByKey, 0);
}

@end
