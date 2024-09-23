@implementation SBAnalyticsContextProvider

- (SBSAnalyticsState)eventPayload
{
  return self->_eventPayload;
}

- (SBAnalyticsContextProvider)initWithEventPayload:(id)a3 backend:(id)a4
{
  id v6;
  id v7;
  SBAnalyticsContextProvider *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  SBSAnalyticsState *eventPayload;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBAnalyticsContextProvider;
  v8 = -[SBAnalyticsContextProvider init](&v16, sel_init);
  if (v8)
  {
    v9 = CACurrentMediaTime();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF60]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      v9 = v12;
    }
    objc_msgSend(MEMORY[0x1E0DAAD60], "withTimestamp:payload:", v6, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    eventPayload = v8->_eventPayload;
    v8->_eventPayload = (SBSAnalyticsState *)v13;

    objc_storeStrong((id *)&v8->_backend, a4);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAnalyticsContextProvider eventPayload](self, "eventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("eventPayload"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)stateForQueryName:(unint64_t)a3 completion:(id)a4
{
  id v6;
  SBFAnalyticsBackend *backend;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  backend = self->_backend;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SBAnalyticsContextProvider_stateForQueryName_completion___block_invoke;
  v9[3] = &unk_1E200ECD8;
  v10 = v6;
  v8 = v6;
  -[SBFAnalyticsBackend stateForQueryName:completion:](backend, "stateForQueryName:completion:", a3, v9);

}

void __59__SBAnalyticsContextProvider_stateForQueryName_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DAAD60];
  v4 = a2;
  objc_msgSend(v3, "withTimestamp:payload:", v4, CACurrentMediaTime());
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
