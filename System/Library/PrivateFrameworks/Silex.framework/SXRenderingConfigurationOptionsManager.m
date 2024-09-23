@implementation SXRenderingConfigurationOptionsManager

- (SXRenderingConfigurationOptionsManager)initWithDocumentProvider:(id)a3 configurationProvider:(id)a4
{
  id v7;
  id v8;
  SXRenderingConfigurationOptionsManager *v9;
  SXRenderingConfigurationOptionsManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXRenderingConfigurationOptionsManager;
  v9 = -[SXRenderingConfigurationOptionsManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_documentProvider, a3);
    objc_storeStrong((id *)&v10->_configurationProvider, a4);
  }

  return v10;
}

- (SXHintsConfigurationOption)hints
{
  os_unfair_lock_s *p_lock;
  SXHintsConfigurationOption *v4;
  void *v5;
  SXHintsConfigurationOption *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_hints;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    -[SXRenderingConfigurationProvider configuration](self->_configurationProvider, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hints");
    v4 = (SXHintsConfigurationOption *)objc_claimAutoreleasedReturnValue();

    if (-[SXRenderingConfigurationOptionsManager validateConfigurationOption:](self, "validateConfigurationOption:", v4))
    {
      if (v4)
      {
LABEL_7:
        os_unfair_lock_lock_with_options();
        objc_storeStrong((id *)&self->_hints, v4);
        os_unfair_lock_unlock(p_lock);
        goto LABEL_8;
      }
    }
    else
    {

    }
    v4 = objc_alloc_init(SXDefaultHintsConfigurationOption);
    goto LABEL_7;
  }
LABEL_8:
  v6 = v4;

  return v6;
}

- (BOOL)validateConfigurationOption:(id)a3
{
  SXRenderingConfigurationOptionsManager *v3;
  SXDocumentProviding *documentProvider;
  id v5;
  void *v6;
  void *v7;

  v3 = self;
  documentProvider = self->_documentProvider;
  v5 = a3;
  -[SXDocumentProviding document](documentProvider, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[SXRenderingConfigurationOptionsManager validateConfigurationOption:documentSpecVersion:clientSpecVersion:](v3, "validateConfigurationOption:documentSpecVersion:clientSpecVersion:", v5, v7, CFSTR("1.28"));

  return (char)v3;
}

- (BOOL)validateConfigurationOption:(id)a3 documentSpecVersion:(id)a4 clientSpecVersion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v7, "minDocumentSpecVersion");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v7, "minDocumentSpecVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = SXSpecVersionCompare(v8, v12);

      if (v13 == -1)
        goto LABEL_11;
    }
    objc_msgSend(v7, "maxDocumentSpecVersion");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v7, "maxDocumentSpecVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = SXSpecVersionCompare(v8, v16);

      if (v17 == 1)
        goto LABEL_11;
    }
  }
  if (!v9)
  {
LABEL_12:
    v25 = 1;
    goto LABEL_13;
  }
  objc_msgSend(v7, "minClientSpecVersion");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v7, "minClientSpecVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = SXSpecVersionCompare(v8, v20);

    if (v21 == -1)
    {
LABEL_11:
      v25 = 0;
      goto LABEL_13;
    }
  }
  objc_msgSend(v7, "maxClientSpecVersion");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_12;
  v23 = (void *)v22;
  objc_msgSend(v7, "maxClientSpecVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = SXSpecVersionCompare(v9, v24) != 1;

LABEL_13:
  return v25;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXRenderingConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_hints, 0);
}

@end
