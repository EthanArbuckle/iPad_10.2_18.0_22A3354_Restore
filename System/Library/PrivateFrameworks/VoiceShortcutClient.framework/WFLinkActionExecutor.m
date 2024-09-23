@implementation WFLinkActionExecutor

- (WFLinkActionExecutor)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 source:(unsigned __int16)a7 error:(id *)a8
{
  return -[WFLinkActionExecutor initWithLinkAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:source:sourceOverride:error:](self, "initWithLinkAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:source:sourceOverride:error:", a3, a4, a5, a6, a7, 0, a8);
}

- (WFLinkActionExecutor)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 source:(unsigned __int16)a7 sourceOverride:(id)a8 error:(id *)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  WFLinkActionExecutor *v21;
  WFLinkActionExecutor *v22;
  uint64_t v23;
  NSString *appBundleIdentifier;
  uint64_t v25;
  NSString *extensionBundleIdentifier;
  uint64_t v27;
  LNMetadataProvider *metadataProvider;
  LNMetadataProvider *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  LNActionMetadata *metadata;
  WFLinkActionExecutor *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  void *v47;
  void *v48;
  objc_super v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionExecutor.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("linkAction"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionExecutor.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleIdentifier"));

LABEL_3:
  v49.receiver = self;
  v49.super_class = (Class)WFLinkActionExecutor;
  v21 = -[WFLinkActionExecutor init](&v49, sel_init);
  v22 = v21;
  if (v21)
  {
    v46 = v20;
    objc_storeStrong((id *)&v21->_linkAction, a3);
    v23 = objc_msgSend(v18, "copy");
    appBundleIdentifier = v22->_appBundleIdentifier;
    v22->_appBundleIdentifier = (NSString *)v23;

    v22->_source = a7;
    objc_storeStrong((id *)&v22->_sourceOverride, a8);
    v25 = objc_msgSend(v19, "copy");
    extensionBundleIdentifier = v22->_extensionBundleIdentifier;
    v22->_extensionBundleIdentifier = (NSString *)v25;

    v22->_authenticationPolicy = a6;
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0D44208]), "initWithOptions:", 2);
    metadataProvider = v22->_metadataProvider;
    v22->_metadataProvider = (LNMetadataProvider *)v27;

    v29 = v22->_metadataProvider;
    v30 = objc_alloc(MEMORY[0x1E0D43CE0]);
    objc_msgSend(v17, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initWithActionIdentifier:bundleIdentifier:", v31, v18);
    v52[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNMetadataProvider actionsWithFullyQualifiedIdentifiers:error:](v29, "actionsWithFullyQualifiedIdentifiers:error:", v33, a9);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", v18);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", v36);
    v37 = objc_claimAutoreleasedReturnValue();
    metadata = v22->_metadata;
    v22->_metadata = (LNActionMetadata *)v37;

    if (v22->_metadata)
    {
      v39 = v22;
    }
    else
    {
      if (a9)
      {
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v50 = *MEMORY[0x1E0CB2D50];
        v41 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v17, "identifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("WFLinkActionWorkflowRunnerClientErrorDomain"), 1, v44);
        *a9 = (id)objc_claimAutoreleasedReturnValue();

      }
      v39 = 0;
    }
    v20 = v46;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (WFLinkActionExecutor)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 error:(id *)a7
{
  return -[WFLinkActionExecutor initWithLinkAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:source:error:](self, "initWithLinkAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:source:error:", a3, a4, a5, a6, 0, a7);
}

- (void)performWithCompletionHandler:(id)a3
{
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

  -[WFLinkActionExecutor setCompletionHandler:](self, "setCompletionHandler:", a3);
  v14 = (id)objc_opt_new();
  -[WFLinkActionExecutor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPreferredExtensionBundleIdentifier:", v4);

  v5 = (void *)MEMORY[0x1E0D44180];
  -[WFLinkActionExecutor metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "policyWithActionMetadata:signals:", v6, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "connectionWithError:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkActionExecutor linkAction](self, "linkAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithParameters:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFLinkActionExecutor executorOptions](self, "executorOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executorForAction:options:delegate:", v11, v12, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "perform");
}

- (id)executorOptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0D441C8]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithLocaleIdentifier:", v6);
  objc_msgSend(v3, "setEnvironment:", v7);

  objc_msgSend(v3, "setClientLabel:", CFSTR("App Intent Runner"));
  v8 = 1;
  objc_msgSend(v3, "setAllowsPrepareBeforePerform:", 1);
  objc_msgSend(v3, "setSource:", -[WFLinkActionExecutor source](self, "source"));
  -[WFLinkActionExecutor sourceOverride](self, "sourceOverride");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceOverride:", v9);

  v10 = -[WFLinkActionExecutor authenticationPolicy](self, "authenticationPolicy");
  if (v10 == 1)
    goto LABEL_4;
  if (v10 == 2)
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v3, "setRequestUnlockIfNeeded:", v8);
  }
  return v3;
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0D44028];
  v6 = a4;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 2010, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "respondWithError:", v7);

}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0D44028];
  v6 = a4;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 2010, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "respondWithError:", v7);

}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0D44028];
  v6 = a4;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 2010, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "respondWithError:", v7);

}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  objc_msgSend(a4, "respondWithConfirmation:", 1);
}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a5;
  -[WFLinkActionExecutor completionHandler](self, "completionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFLinkActionExecutor completionHandler](self, "completionHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

    -[WFLinkActionExecutor setCompletionHandler:](self, "setCompletionHandler:", 0);
  }

}

- (LNAction)linkAction
{
  return self->_linkAction;
}

- (LNActionMetadata)metadata
{
  return self->_metadata;
}

- (unsigned)source
{
  return self->_source;
}

- (NSString)sourceOverride
{
  return self->_sourceOverride;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (int64_t)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceOverride, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_linkAction, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
}

@end
