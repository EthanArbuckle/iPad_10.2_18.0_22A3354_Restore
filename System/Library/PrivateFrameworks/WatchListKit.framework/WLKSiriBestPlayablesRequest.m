@implementation WLKSiriBestPlayablesRequest

- (WLKSiriBestPlayablesRequest)init
{
  -[WLKSiriBestPlayablesRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (WLKSiriBestPlayablesRequest)initWithStatsIDs:(id)a3
{
  id v4;
  WLKSiriBestPlayablesRequest *v5;
  uint64_t v6;
  NSArray *statsIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLKSiriBestPlayablesRequest;
  v5 = -[WLKSiriBestPlayablesRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    statsIDs = v5->_statsIDs;
    v5->_statsIDs = (NSArray *)v6;

  }
  return v5;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4;
  WLKSiriBestPlayableForStatsIDsOperation *v5;
  void *v6;
  void *v7;
  WLKSiriBestPlayableForStatsIDsOperation *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  v5 = [WLKSiriBestPlayableForStatsIDsOperation alloc];
  -[WLKSiriBestPlayablesRequest statsIDs](self, "statsIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKRequest caller](self, "caller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WLKSiriBestPlayableForStatsIDsOperation initWithStatsIDs:caller:](v5, "initWithStatsIDs:caller:", v6, v7);

  objc_initWeak(&location, v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__WLKSiriBestPlayablesRequest_makeRequestWithCompletion___block_invoke;
  v11[3] = &unk_1E68A7A28;
  objc_copyWeak(&v13, &location);
  v9 = v4;
  v12 = v9;
  -[WLKSiriBestPlayableForStatsIDsOperation setCompletionBlock:](v8, "setCompletionBlock:", v11);
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __57__WLKSiriBestPlayablesRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);

    WeakRetained = v6;
  }

}

- (NSArray)statsIDs
{
  return self->_statsIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsIDs, 0);
}

@end
