@implementation PRSAnonymousPipelineManagerSession

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_33);
  return (id)sharedManager_session;
}

void __51__PRSAnonymousPipelineManagerSession_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_session;
  sharedManager_session = v0;

}

- (PRSAnonymousPipelineManagerSession)init
{
  PRSAnonymousPipelineManagerSession *v2;
  PRSAnonymousPipelineManagerSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRSAnonymousPipelineManagerSession;
  v2 = -[PRSAnonymousPipelineManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PRSAnonymousPipelineManager setDelegate:](v2, "setDelegate:", 0);
  return v3;
}

- (void)sendCustomFeedback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[PRSAnonymousPipelineManagerSession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "infoDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Metadata/%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D177E0]), "initWithId:userAgent:", CFSTR("com.apple.spotlight.metadata"), v9);
    objc_msgSend(MEMORY[0x1E0D177D8], "sessionWithConfiguration:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSAnonymousPipelineManagerSession setSession:](self, "setSession:", v11);

  }
  -[PRSAnonymousPipelineManagerSession session](self, "session");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendCustomFeedback:", v4);

}

- (PARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
