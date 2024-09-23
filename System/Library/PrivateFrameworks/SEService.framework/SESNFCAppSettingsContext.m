@implementation SESNFCAppSettingsContext

+ (id)contextWithBundleId:(id)a3 onChange:(id)a4
{
  id v5;
  id v6;
  SESNFCAppSettingsContext *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SESNFCAppSettingsContext initWithBundleId:onChange:]([SESNFCAppSettingsContext alloc], "initWithBundleId:onChange:", v6, v5);

  return v7;
}

- (SESNFCAppSettingsContext)initWithBundleId:(id)a3 onChange:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SESNFCAppSettingsContext *v10;
  SESNFCAppSettingsContext *v11;
  void *v12;
  id onChange;
  NSObject *v14;
  NSString *bundleId;
  SESNFCAppSettingsContext *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.seserviced.contactlessCredential.settings"));
  if (v9)
  {
    v19.receiver = self;
    v19.super_class = (Class)SESNFCAppSettingsContext;
    v10 = -[SESNFCAppSettingsContext init](&v19, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_bundleId, a3);
      v12 = _Block_copy(v8);
      onChange = v11->_onChange;
      v11->_onChange = v12;

      objc_storeStrong((id *)&v11->_ud, v9);
      v11->_lock._os_unfair_lock_opaque = 0;
      v11->_supportsTouchID = MGGetBoolAnswer();
      v11->_invalidated = 0;
      -[SESNFCAppSettingsContext readDefaultValues](v11, "readDefaultValues");
      -[SESNFCAppSettingsContext observeDefaults](v11, "observeDefaults");
      SESDefaultLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        bundleId = v11->_bundleId;
        *(_DWORD *)buf = 138412290;
        v21 = bundleId;
        _os_log_impl(&dword_20A048000, v14, OS_LOG_TYPE_DEBUG, "Successfully initialized app settings context for bundle ID %@", buf, 0xCu);
      }

    }
    self = v11;
    v16 = self;
  }
  else
  {
    SESDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A048000, v17, OS_LOG_TYPE_ERROR, "contextWithBundleId:onChange: unable to initialize ud", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)readDefaultValues
{
  id v3;
  NSString *bundleId;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  NSString *v10;
  NSString *v11;
  NSString *currentDefaultBundleId;
  void *v13;
  NSArray *v14;
  NSArray *defaultAppCandidates;
  id v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDC1540]);
  bundleId = self->_bundleId;
  v16 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", bundleId, 0, &v16);
  v6 = v16;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8)
  {
    -[NSUserDefaults stringForKey:](self->_ud, "stringForKey:", CFSTR("defaultAppIdentifier"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    currentDefaultBundleId = self->_currentDefaultBundleId;
    self->_currentDefaultBundleId = v11;

    -[NSUserDefaults arrayForKey:](self->_ud, "arrayForKey:", CFSTR("defaultAppCandidates"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    Transform();
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    defaultAppCandidates = self->_defaultAppCandidates;
    self->_defaultAppCandidates = v14;

    self->_shouldShowSECDefaultPane = -[NSUserDefaults BOOLForKey:](self->_ud, "BOOLForKey:", CFSTR("shouldShowSECPane"));
    self->_shouldShowHCETCCPane = -[NSUserDefaults BOOLForKey:](self->_ud, "BOOLForKey:", CFSTR("shouldShowContactlessPane"));
    self->_shouldShowSECTCCPane = -[NSUserDefaults BOOLForKey:](self->_ud, "BOOLForKey:", CFSTR("shouldShowSecureElementTcc"));
    self->_shouldShowHCETCCPane = -[NSUserDefaults BOOLForKey:](self->_ud, "BOOLForKey:", CFSTR("shouldShowContactlessTcc"));
    self->_isDomainAluminumEligible = -[NSUserDefaults BOOLForKey:](self->_ud, "BOOLForKey:", CFSTR("aluminumEligibility"));
    self->_isDomainChromiumEligible = -[NSUserDefaults BOOLForKey:](self->_ud, "BOOLForKey:", CFSTR("chromiumEligibility"));
    -[SESNFCAppSettingsContext reconcileWithRecord:](self, "reconcileWithRecord:", v5);

  }
  else
  {
    SESDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = self->_bundleId;
      *(_DWORD *)buf = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_20A048000, v9, OS_LOG_TYPE_ERROR, "Bundle ID %@ does not correspond to a record or error encountered %@", buf, 0x16u);
    }

    self->_doubleClickToggleVisibilityType = 2;
    *(_WORD *)&self->_shouldShowDefaultNFCAppPicker = 0;
    self->_isContactlessTCCServiceEligible = 0;
  }

}

SESDefaultNFCApplication *__45__SESNFCAppSettingsContext_readDefaultValues__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SESDefaultNFCApplication *v3;
  void *v4;
  void *v5;
  void *v6;
  SESDefaultNFCApplication *v7;

  v2 = a2;
  v3 = [SESDefaultNFCApplication alloc];
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bundleId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("displayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SESDefaultNFCApplication initWithBundleId:displayName:rawDomain:](v3, "initWithBundleId:displayName:rawDomain:", v4, v5, v6);
  return v7;
}

- (void)observeDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SESNFCAppSettingsContext ud](self, "ud");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("shouldShowSECPane"), 1, defaultSECContext);

  -[SESNFCAppSettingsContext ud](self, "ud");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("shouldShowContactlessPane"), 1, defaultHCEContext);

  -[SESNFCAppSettingsContext ud](self, "ud");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("shouldShowContactlessTcc"), 1, tccHCEContext);

  -[SESNFCAppSettingsContext ud](self, "ud");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("shouldShowSecureElementTcc"), 1, tccSECContext);

  -[SESNFCAppSettingsContext ud](self, "ud");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("defaultAppCandidates"), 1, defaultAppCandidatesChangedContext);

  -[SESNFCAppSettingsContext ud](self, "ud");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("defaultAppIdentifier"), 1, defaultAppChangedContext);

  -[SESNFCAppSettingsContext ud](self, "ud");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("aluminumEligibility"), 1, defaultAluminumEligbilityChangedContext);

  -[SESNFCAppSettingsContext ud](self, "ud");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, CFSTR("chromiumEligibility"), 1, defaultChromiumEligibilityChangedContext);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSString *v10;
  id v11;
  id v12;
  os_unfair_lock_s *p_lock;
  id v14;
  NSString *bundleId;
  void *v16;
  NSString *v17;
  NSString *v18;
  BOOL v19;
  NSObject *v20;
  NSString *v21;
  void *currentDefaultBundleId;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSArray *v29;
  NSArray *defaultAppCandidates;
  NSObject *v31;
  NSObject *v32;
  NSString *v33;
  objc_super v34;
  id v35;
  uint8_t buf[4];
  NSString *v37;
  __int16 v38;
  NSString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = (NSString *)a3;
  v11 = a4;
  v12 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v14 = objc_alloc(MEMORY[0x24BDC1540]);
  bundleId = self->_bundleId;
  v35 = 0;
  v16 = (void *)objc_msgSend(v14, "initWithBundleIdentifier:allowPlaceholder:error:", bundleId, 0, &v35);
  v17 = (NSString *)v35;
  v18 = v17;
  if (v16)
    v19 = v17 == 0;
  else
    v19 = 0;
  if (!v19)
  {
    SESDefaultLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_bundleId;
      *(_DWORD *)buf = 138412546;
      v37 = v21;
      v38 = 2112;
      v39 = v18;
      _os_log_impl(&dword_20A048000, v20, OS_LOG_TYPE_ERROR, "Bundle ID %@ does not correspond to a record or error encountered %@", buf, 0x16u);
    }

    self->_doubleClickToggleVisibilityType = 2;
    *(_WORD *)&self->_shouldShowDefaultNFCAppPicker = 0;
    self->_isContactlessTCCServiceEligible = 0;
    goto LABEL_63;
  }
  if ((void *)defaultSECContext == a6)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    currentDefaultBundleId = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self->_shouldShowSECDefaultPane = objc_msgSend(currentDefaultBundleId, "BOOLValue");
        goto LABEL_60;
      }
    }
    SESDefaultLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v10;
      _os_log_impl(&dword_20A048000, v23, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
    }

    self->_shouldShowSECDefaultPane = 0;
  }
  else if ((void *)defaultHCEContext == a6)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    currentDefaultBundleId = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self->_shouldShowHCEDefaultPane = objc_msgSend(currentDefaultBundleId, "BOOLValue");
        goto LABEL_60;
      }
    }
    SESDefaultLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v10;
      _os_log_impl(&dword_20A048000, v24, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
    }

    self->_shouldShowHCEDefaultPane = 0;
  }
  else
  {
    if ((void *)tccSECContext != a6)
    {
      if ((void *)tccHCEContext == a6)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        currentDefaultBundleId = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          SESDefaultLogObject();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v10;
            _os_log_impl(&dword_20A048000, v26, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
          }
          goto LABEL_72;
        }
        self->_shouldShowHCETCCPane = objc_msgSend(currentDefaultBundleId, "BOOLValue");
        goto LABEL_60;
      }
      if ((void *)defaultAppChangedContext != a6)
      {
        if ((void *)defaultAppCandidatesChangedContext == a6)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          currentDefaultBundleId = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            SESDefaultLogObject();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v10;
              _os_log_impl(&dword_20A048000, v26, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
            }
            goto LABEL_72;
          }
          Transform();
          v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
          defaultAppCandidates = self->_defaultAppCandidates;
          self->_defaultAppCandidates = v29;

        }
        else
        {
          if ((void *)defaultAluminumEligbilityChangedContext != a6)
          {
            if ((void *)defaultChromiumEligibilityChangedContext != a6)
            {
              v34.receiver = self;
              v34.super_class = (Class)SESNFCAppSettingsContext;
              -[SESNFCAppSettingsContext observeValueForKeyPath:ofObject:change:context:](&v34, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
              goto LABEL_63;
            }
            objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
            currentDefaultBundleId = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                self->_isDomainChromiumEligible = objc_msgSend(currentDefaultBundleId, "BOOLValue");
                goto LABEL_60;
              }
            }
            SESDefaultLogObject();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v10;
              _os_log_impl(&dword_20A048000, v26, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
            }
LABEL_72:

            goto LABEL_63;
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          currentDefaultBundleId = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            SESDefaultLogObject();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v10;
              _os_log_impl(&dword_20A048000, v26, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
            }
            goto LABEL_72;
          }
          self->_isDomainAluminumEligible = objc_msgSend(currentDefaultBundleId, "BOOLValue");
        }
LABEL_60:

        -[SESNFCAppSettingsContext reconcileWithRecord:](self, "reconcileWithRecord:", v16);
        SESDefaultLogObject();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = self->_bundleId;
          *(_DWORD *)buf = 138412546;
          v37 = v10;
          v38 = 2112;
          v39 = v33;
          _os_log_impl(&dword_20A048000, v32, OS_LOG_TYPE_DEBUG, "Key %@ changed, firing on visibility change for bundle Id %@", buf, 0x16u);
        }

        (*((void (**)(void))self->_onChange + 2))();
        goto LABEL_63;
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          SESDefaultLogObject();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v10;
            _os_log_impl(&dword_20A048000, v28, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
          }

          goto LABEL_63;
        }
      }
      else
      {
        SESDefaultLogObject();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20A048000, v31, OS_LOG_TYPE_DEBUG, "Setting none as default app in Context", buf, 2u);
        }

      }
      currentDefaultBundleId = self->_currentDefaultBundleId;
      self->_currentDefaultBundleId = (NSString *)v27;
      goto LABEL_60;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    currentDefaultBundleId = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self->_shouldShowSECTCCPane = objc_msgSend(currentDefaultBundleId, "BOOLValue");
        goto LABEL_60;
      }
    }
    SESDefaultLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v10;
      _os_log_impl(&dword_20A048000, v25, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
    }

    self->_shouldShowSECTCCPane = 0;
  }
LABEL_63:

  os_unfair_lock_unlock(p_lock);
}

SESDefaultNFCApplication *__75__SESNFCAppSettingsContext_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SESDefaultNFCApplication *v3;
  void *v4;
  void *v5;
  void *v6;
  SESDefaultNFCApplication *v7;
  NSObject *v8;
  __int16 v10[8];

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    SESDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 0;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_ERROR, "Non-dictionary candidate found", (uint8_t *)v10, 2u);
    }

    v7 = 0;
  }
  else
  {
    v3 = [SESDefaultNFCApplication alloc];
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("displayName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("domain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SESDefaultNFCApplication initWithBundleId:displayName:rawDomain:](v3, "initWithBundleId:displayName:rawDomain:", v4, v5, v6);

  }
  return v7;
}

- (void)reconcileWithRecord:(id)a3
{
  id v4;
  _BOOL4 v5;
  int64_t v6;
  void *v7;
  char v8;
  BOOL v9;
  int64_t v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSString *bundleId;
  _BOOL4 v23;
  unint64_t v24;
  int v25;
  NSString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SESNFCAppSettingsContext isDefaultAppEligibleForService:](self, "isDefaultAppEligibleForService:", 1);
  -[SESNFCAppSettingsContext isDefaultAppEligibleForService:](self, "isDefaultAppEligibleForService:", 0);
  if (-[NSString isEqualToString:](self->_bundleId, "isEqualToString:", CFSTR("com.apple.Passbook")))
  {
    self->_shouldShowDefaultNFCAppPicker = v5;
    self->_doubleClickToggleVisibilityType = -[SESNFCAppSettingsContext shouldShowDoubleButtonPressToggle](self, "shouldShowDoubleButtonPressToggle") ^ 1;
    *(_WORD *)&self->_isSecureElementTCCServiceEligible = 0;
  }
  else
  {
    v6 = +[TCCContext checkTCCAccessWithoutLoadingTo:for:](_TtC9SEService10TCCContext, "checkTCCAccessWithoutLoadingTo:for:", 0, self->_bundleId);
    objc_msgSend(v4, "entitlements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ses_isEntitled:", CFSTR("com.apple.developer.nfc.hce"));
    if (v6 == 2)
      v9 = 0;
    else
      v9 = v8;
    self->_isContactlessTCCServiceEligible = v9;

    v10 = +[TCCContext checkTCCAccessWithoutLoadingTo:for:](_TtC9SEService10TCCContext, "checkTCCAccessWithoutLoadingTo:for:", 1, self->_bundleId);
    objc_msgSend(v4, "entitlements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ses_isEntitled:", CFSTR("com.apple.developer.secure-element-credential"));
    if (v10 == 2)
      v13 = 0;
    else
      v13 = v12;
    self->_isSecureElementTCCServiceEligible = v13;

    objc_msgSend(v4, "entitlements");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "ses_isEntitled:", CFSTR("com.apple.developer.nfc.hce")))
    {
      objc_msgSend(v4, "entitlements");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "ses_isEntitled:", CFSTR("com.apple.developer.nfc.hce.default-contactless-app"));
      if (v6)
        v17 = 0;
      else
        v17 = v16;
      v18 = v17 & v5;

    }
    else
    {
      v18 = 0;
    }

    objc_msgSend(v4, "entitlements");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "ses_isEntitled:", CFSTR("com.apple.developer.secure-element-credential")))
    {
      objc_msgSend(v4, "entitlements");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ses_isEntitled:", CFSTR("com.apple.developer.secure-element-credential.default-contactless-app"));

    }
    SESDefaultLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      bundleId = self->_bundleId;
      v25 = 138412802;
      v26 = bundleId;
      v27 = 1024;
      v28 = v18;
      v29 = 1024;
      v30 = 0;
      _os_log_impl(&dword_20A048000, v21, OS_LOG_TYPE_DEBUG, "Bundle ID %@: isEligibleForDefaultHCE %d, isEligibleForDefaultSEC %d", (uint8_t *)&v25, 0x18u);
    }

    self->_shouldShowDefaultNFCAppPicker = v18;
    v23 = -[SESNFCAppSettingsContext shouldShowDoubleButtonPressToggle](self, "shouldShowDoubleButtonPressToggle");
    v24 = 2;
    if (v23)
      v24 = 0;
    self->_doubleClickToggleVisibilityType = v24;
  }

}

- (void)invalidate
{
  NSObject *v3;
  NSString *bundleId;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  SESDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    bundleId = self->_bundleId;
    v5 = 138412290;
    v6 = bundleId;
    _os_log_impl(&dword_20A048000, v3, OS_LOG_TYPE_DEBUG, "Invalidating app settings context for bundle ID %@", (uint8_t *)&v5, 0xCu);
  }

  -[SESNFCAppSettingsContext invalidateInternal](self, "invalidateInternal");
}

- (void)invalidateInternal
{
  os_unfair_lock_s *p_lock;
  id onChange;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    onChange = self->_onChange;
    self->_onChange = 0;

    -[SESNFCAppSettingsContext ud](self, "ud");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("shouldShowSECPane"));

    -[SESNFCAppSettingsContext ud](self, "ud");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("shouldShowContactlessPane"));

    -[SESNFCAppSettingsContext ud](self, "ud");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:forKeyPath:", self, CFSTR("shouldShowContactlessTcc"));

    -[SESNFCAppSettingsContext ud](self, "ud");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:forKeyPath:", self, CFSTR("shouldShowSecureElementTcc"));

    -[SESNFCAppSettingsContext ud](self, "ud");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:forKeyPath:", self, CFSTR("defaultAppCandidates"));

    -[SESNFCAppSettingsContext ud](self, "ud");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:forKeyPath:", self, CFSTR("defaultAppIdentifier"));

    -[SESNFCAppSettingsContext ud](self, "ud");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:forKeyPath:", self, CFSTR("aluminumEligibility"));

    -[SESNFCAppSettingsContext ud](self, "ud");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:forKeyPath:", self, CFSTR("chromiumEligibility"));

    self->_invalidated = 1;
    SESDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_20A048000, v13, OS_LOG_TYPE_DEBUG, "Successfully invalidated internally due to manual invalidation or dealloc", v14, 2u);
    }

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  NSObject *v3;
  NSString *bundleId;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  SESDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    bundleId = self->_bundleId;
    *(_DWORD *)buf = 138412290;
    v7 = bundleId;
    _os_log_impl(&dword_20A048000, v3, OS_LOG_TYPE_DEBUG, "Deallocating app settings context for bundle ID %@", buf, 0xCu);
  }

  -[SESNFCAppSettingsContext invalidateInternal](self, "invalidateInternal");
  v5.receiver = self;
  v5.super_class = (Class)SESNFCAppSettingsContext;
  -[SESNFCAppSettingsContext dealloc](&v5, sel_dealloc);
}

- (id)getDefaultNFCApplication
{
  NSArray *defaultAppCandidates;
  void *v3;
  NSObject *v4;
  _QWORD v6[5];
  uint8_t buf[16];

  if (self->_currentDefaultBundleId)
  {
    defaultAppCandidates = self->_defaultAppCandidates;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__SESNFCAppSettingsContext_getDefaultNFCApplication__block_invoke;
    v6[3] = &unk_24C2BCFF0;
    v6[4] = self;
    -[NSArray find:](defaultAppCandidates, "find:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A048000, v4, OS_LOG_TYPE_INFO, "No default app found in user defaults", buf, 2u);
    }

    v3 = 0;
  }
  return v3;
}

uint64_t __52__SESNFCAppSettingsContext_getDefaultNFCApplication__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

  return v4;
}

- (void)setDefaultNFCApplication:(id)a3
{
  id v5;
  NSArray *defaultAppCandidates;
  id v7;
  void *v8;
  NSUserDefaults *ud;
  void *v10;
  NSUserDefaults *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  defaultAppCandidates = self->_defaultAppCandidates;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __53__SESNFCAppSettingsContext_setDefaultNFCApplication___block_invoke;
  v17[3] = &unk_24C2BCFF0;
  v7 = v5;
  v18 = v7;
  -[NSArray find:](defaultAppCandidates, "find:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSUserDefaults setValue:forKey:](self->_ud, "setValue:forKey:", v7, CFSTR("defaultAppIdentifier"));
    ud = self->_ud;
    objc_msgSend(v8, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setValue:forKey:](ud, "setValue:forKey:", v10, CFSTR("domain"));

    v11 = self->_ud;
    objc_msgSend(v8, "localizedDisplayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setValue:forKey:](v11, "setValue:forKey:", v12, CFSTR("defaultAppLocalizedName"));

    objc_storeStrong((id *)&self->_currentDefaultBundleId, a3);
    SESDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      v14 = "Successfully set %@ as default app";
      v15 = v13;
      v16 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_20A048000, v15, v16, v14, buf, 0xCu);
    }
  }
  else
  {
    SESDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      v14 = "Bundle Id %@ is not a valid candidate";
      v15 = v13;
      v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }

}

uint64_t __53__SESNFCAppSettingsContext_setDefaultNFCApplication___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)isDoubleClickEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_ud, "BOOLForKey:", CFSTR("doubleClickEnabled"));
}

- (void)setDoubleClickEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSString *bundleId;
  _DWORD v7[2];
  __int16 v8;
  NSString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  -[NSUserDefaults setBool:forKey:](self->_ud, "setBool:forKey:", a3, CFSTR("doubleClickEnabled"));
  SESDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    bundleId = self->_bundleId;
    v7[0] = 67109378;
    v7[1] = v3;
    v8 = 2112;
    v9 = bundleId;
    _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_DEBUG, "Successfully set double click enabled %d from bundle Id %@", (uint8_t *)v7, 0x12u);
  }

}

- (id)alertMessageForDefaultAppChangeTo:(id)a3
{
  id v4;
  NSString *currentDefaultBundleId;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  currentDefaultBundleId = self->_currentDefaultBundleId;
  if (currentDefaultBundleId && !-[NSString isEqualToString:](currentDefaultBundleId, "isEqualToString:", v4))
  {
    v6 = (void *)objc_opt_new();
    if (self->_supportsTouchID)
      +[SESSettingsLocalizedStringFactory touchIDAlertMessagePrefix](_TtC9SEService33SESSettingsLocalizedStringFactory, "touchIDAlertMessagePrefix");
    else
      +[SESSettingsLocalizedStringFactory nonTouchIDAlertMessagePrefix](_TtC9SEService33SESSettingsLocalizedStringFactory, "nonTouchIDAlertMessagePrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v8);

    if (-[NSString isEqualToString:](self->_currentDefaultBundleId, "isEqualToString:", CFSTR("com.apple.Passbook")))
    {
      +[SESSettingsLocalizedStringFactory passbookDefaultAlertMessage](_TtC9SEService33SESSettingsLocalizedStringFactory, "passbookDefaultAlertMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v9);
    }
    else
    {
      +[SESSettingsLocalizedStringFactory thirdPartyDefaultAlertMessage](_TtC9SEService33SESSettingsLocalizedStringFactory, "thirdPartyDefaultAlertMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SESNFCAppSettingsContext localizedAppNameForBundleId:](self, "localizedAppNameForBundleId:", self->_currentDefaultBundleId);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v10, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v11);

    }
    if (-[SESNFCAppSettingsContext isExpressModeEnabled](self, "isExpressModeEnabled"))
    {
      +[SESSettingsLocalizedStringFactory expressModeDefaultAlertMessagePostfix](_TtC9SEService33SESSettingsLocalizedStringFactory, "expressModeDefaultAlertMessagePostfix");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v12);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isExpressModeEnabled
{
  uint32_t v2;
  uint32_t v3;
  NSObject *v4;
  const char *v5;
  uint32_t state;
  NSObject *v7;
  _BOOL4 v8;
  uint32_t v9;
  uint32_t v10;
  NSObject *v11;
  uint64_t v13;
  int out_token;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  out_token = 0;
  v2 = notify_register_check("com.apple.stockholm.express.state", &out_token);
  if (v2)
  {
    v3 = v2;
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v3;
      v5 = "notify_register_check failed with status %d";
LABEL_7:
      _os_log_impl(&dword_20A048000, v4, OS_LOG_TYPE_ERROR, v5, buf, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v13 = 0;
  state = notify_get_state(out_token, &v13);
  SESDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (state)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = state;
      v5 = "notify_get_state failed with status %d";
      goto LABEL_7;
    }
LABEL_8:

    LOBYTE(v8) = 0;
    return v8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v13;
    _os_log_impl(&dword_20A048000, v4, OS_LOG_TYPE_DEBUG, "Raw Express State 0x%llx", buf, 0xCu);
  }

  v9 = notify_cancel(out_token);
  if (v9)
  {
    v10 = v9;
    SESDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v10;
      _os_log_impl(&dword_20A048000, v11, OS_LOG_TYPE_ERROR, "notify_cancel failed with status %d", buf, 8u);
    }

  }
  return (v13 >> 1) & 1;
}

- (id)localizedAppNameForBundleId:(id)a3
{
  id v4;
  NSArray *defaultAppCandidates;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  defaultAppCandidates = self->_defaultAppCandidates;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__SESNFCAppSettingsContext_localizedAppNameForBundleId___block_invoke;
  v10[3] = &unk_24C2BCFF0;
  v11 = v4;
  v6 = v4;
  -[NSArray find:](defaultAppCandidates, "find:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __56__SESNFCAppSettingsContext_localizedAppNameForBundleId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)isDefaultAppEligibleForService:(unint64_t)a3
{
  int domain_answer;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  int v12;
  _BOOL4 v14;
  NSObject *v15;
  NSString *bundleId;
  NSObject *v17;
  NSString *v18;
  NSObject *v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  _BYTE v23[10];
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    v6 = domain_answer;
    SESDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v6;
      v8 = "Default Contactless App Configurable returned error code %d";
      v9 = v7;
      v10 = OS_LOG_TYPE_DEBUG;
LABEL_7:
      _os_log_impl(&dword_20A048000, v9, v10, v8, buf, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v11 = os_eligibility_get_domain_answer();
  if (v11)
  {
    v12 = v11;
    SESDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v12;
      v8 = "Default Contactless App Usable returned error code %d";
      v9 = v7;
      v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  v14 = -[SESNFCAppSettingsContext existsDefaultAppCandidatesForService:](self, "existsDefaultAppCandidatesForService:", a3);
  SESDefaultLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    bundleId = self->_bundleId;
    *(_DWORD *)buf = 138412546;
    v21 = (unint64_t)bundleId;
    v22 = 1024;
    *(_DWORD *)v23 = v14;
    _os_log_impl(&dword_20A048000, v15, OS_LOG_TYPE_DEBUG, "Bundle ID %@: exists valid candidates %d", buf, 0x12u);
  }

  if (-[NSString isEqualToString:](self->_bundleId, "isEqualToString:", CFSTR("com.apple.Passbook")))
  {
    SESDefaultLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v21 = a3;
      v22 = 1024;
      *(_DWORD *)v23 = 0;
      *(_WORD *)&v23[4] = 1024;
      *(_DWORD *)&v23[6] = 0;
      _os_log_impl(&dword_20A048000, v19, OS_LOG_TYPE_DEBUG, "Passbook - Service %lu: full pane: %d, limited pane %d", buf, 0x18u);
    }

  }
  else
  {
    SESDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = self->_bundleId;
      *(_DWORD *)buf = 138413058;
      v21 = (unint64_t)v18;
      v22 = 2048;
      *(_QWORD *)v23 = a3;
      *(_WORD *)&v23[8] = 1024;
      v24 = 0;
      v25 = 1024;
      v26 = 0;
      _os_log_impl(&dword_20A048000, v17, OS_LOG_TYPE_DEBUG, "Bundle Id %@ - Service %lu: full pane: %d, limited pane %d", buf, 0x22u);
    }

  }
  return 0;
}

- (BOOL)isDefaultAppTheOnlyCandidate
{
  void *v3;
  void *v4;
  char v5;

  if (-[NSArray count](self->_defaultAppCandidates, "count") != 1)
    return 0;
  -[NSArray objectAtIndexedSubscript:](self->_defaultAppCandidates, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", self->_currentDefaultBundleId);

  return v5;
}

- (BOOL)existsDefaultAppCandidatesForService:(unint64_t)a3
{
  NSObject *v3;
  NSArray *defaultAppCandidates;
  char v5;
  NSObject *v6;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[16];

  if (a3 == 1)
  {
    v3 = &unk_24C2CB740;
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = &unk_24C2CB758;
LABEL_5:
    defaultAppCandidates = self->_defaultAppCandidates;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __65__SESNFCAppSettingsContext_existsDefaultAppCandidatesForService___block_invoke;
    v8[3] = &unk_24C2BCFF0;
    v9 = v3;
    v5 = -[NSArray contains:](defaultAppCandidates, "contains:", v8);
    v6 = v9;
    goto LABEL_9;
  }
  SESDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A048000, v6, OS_LOG_TYPE_ERROR, "Service does not exist", buf, 2u);
  }
  v5 = 0;
LABEL_9:

  return v5;
}

uint64_t __65__SESNFCAppSettingsContext_existsDefaultAppCandidatesForService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)isDefaultApp
{
  return -[NSString isEqualToString:](self->_bundleId, "isEqualToString:", self->_currentDefaultBundleId);
}

- (BOOL)isPassbookDefault
{
  return -[NSString isEqualToString:](self->_currentDefaultBundleId, "isEqualToString:", CFSTR("com.apple.Passbook"));
}

- (BOOL)shouldShowDoubleButtonPressToggle
{
  if (-[NSString isEqualToString:](self->_bundleId, "isEqualToString:", CFSTR("com.apple.Passbook")))
    return -[SESNFCAppSettingsContext isPassbookDefault](self, "isPassbookDefault");
  if (self->_shouldShowDefaultNFCAppPicker)
    return -[NSString isEqualToString:](self->_currentDefaultBundleId, "isEqualToString:", self->_bundleId);
  return 0;
}

- (BOOL)isApplicationInstalledOrPlaceholder:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v9);
  v5 = v9;
  if (v5)
  {
    SESDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_20A048000, v6, OS_LOG_TYPE_ERROR, "Error %@ encountered when checking if %@ is installed", buf, 0x16u);
    }

    v7 = 0;
  }
  else
  {
    v7 = v4 != 0;
  }

  return v7;
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)shouldShowDefaultNFCAppPicker
{
  return self->_shouldShowDefaultNFCAppPicker;
}

- (BOOL)isSecureElementTCCServiceEligible
{
  return self->_isSecureElementTCCServiceEligible;
}

- (BOOL)isContactlessTCCServiceEligible
{
  return self->_isContactlessTCCServiceEligible;
}

- (unint64_t)doubleClickToggleVisibilityType
{
  return self->_doubleClickToggleVisibilityType;
}

- (NSArray)defaultAppCandidates
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSUserDefaults)ud
{
  return self->_ud;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ud, 0);
  objc_storeStrong((id *)&self->_defaultAppCandidates, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_currentDefaultBundleId, 0);
  objc_storeStrong(&self->_onChange, 0);
}

@end
