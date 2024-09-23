@implementation WLKCanonicalPlayablesRequest

- (WLKCanonicalPlayablesRequest)initWithCanonicalID:(id)a3
{
  id v4;
  WLKCanonicalPlayablesRequest *v5;
  uint64_t v6;
  NSString *canonicalID;
  WLKCanonicalPlayablesRequest *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKCanonicalPlayablesRequest;
    v5 = -[WLKCanonicalPlayablesRequest init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      canonicalID = v5->_canonicalID;
      v5->_canonicalID = (NSString *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("canonicalID must be non-nil"));
    v8 = 0;
  }

  return v8;
}

- (WLKCanonicalPlayablesRequest)initWithStatsID:(id)a3
{
  id v4;
  WLKCanonicalPlayablesRequest *v5;
  uint64_t v6;
  NSString *statsID;
  WLKCanonicalPlayablesRequest *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKCanonicalPlayablesRequest;
    v5 = -[WLKCanonicalPlayablesRequest init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      statsID = v5->_statsID;
      v5->_statsID = (NSString *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("statsID must be non-nil"));
    v8 = 0;
  }

  return v8;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  WLKCanonicalPlayablesRequestOperation *v7;
  void *v8;
  WLKCanonicalPlayablesRequestOperation *v9;
  WLKCanonicalPlayablesSiriRequestOperation *v10;
  void *v11;
  WLKCanonicalPlayablesSiriRequestOperation *v12;
  NSString *statsID;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  WLKCanonicalPlayablesSiriRequestOperation *v20;
  id v21;
  id v22;
  id location;

  v4 = a3;
  v5 = self->_canonicalID;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [WLKCanonicalPlayablesRequestOperation alloc];
    -[WLKRequest caller](self, "caller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WLKCanonicalPlayablesRequestOperation initWithContentID:caller:isMovie:](v7, "initWithContentID:caller:isMovie:", v5, v8, 1);

    objc_initWeak(&location, v9);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__WLKCanonicalPlayablesRequest_makeRequestWithCompletion___block_invoke;
    v19[3] = &unk_1E68A8398;
    objc_copyWeak(&v22, &location);
    v19[4] = self;
    v10 = v6;
    v20 = v10;
    v21 = v4;
    -[WLKCanonicalPlayablesRequestOperation setCompletionBlock:](v9, "setCompletionBlock:", v19);
    objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addOperation:", v9);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  else
  {
    v12 = [WLKCanonicalPlayablesSiriRequestOperation alloc];
    statsID = self->_statsID;
    -[WLKRequest caller](self, "caller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WLKCanonicalPlayablesSiriRequestOperation initWithStatsID:caller:](v12, "initWithStatsID:caller:", statsID, v14);

    objc_initWeak(&location, v10);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__WLKCanonicalPlayablesRequest_makeRequestWithCompletion___block_invoke_2;
    v16[3] = &unk_1E68A7A28;
    objc_copyWeak(&v18, &location);
    v17 = v4;
    -[WLKCanonicalPlayablesSiriRequestOperation setCompletionBlock:](v10, "setCompletionBlock:", v16);
    objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addOperation:", v10);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __58__WLKCanonicalPlayablesRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  NSLog(CFSTR("%@: elapsed time: %.5f"), v3, v5);

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(WeakRetained, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v6, v8);

  }
}

void __58__WLKCanonicalPlayablesRequest_makeRequestWithCompletion___block_invoke_2(uint64_t a1)
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

- (void)makeRequestWithCompletion:(id)a3 canonicalType:(int64_t)a4
{
  id v6;
  void *v7;
  WLKCanonicalPlayablesRequestOperation *v8;
  NSString *canonicalID;
  void *v10;
  WLKCanonicalPlayablesRequestOperation *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [WLKCanonicalPlayablesRequestOperation alloc];
  canonicalID = self->_canonicalID;
  -[WLKRequest caller](self, "caller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WLKCanonicalPlayablesRequestOperation initWithContentID:caller:canonicalType:](v8, "initWithContentID:caller:canonicalType:", canonicalID, v10, a4);

  objc_initWeak(&location, v11);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__WLKCanonicalPlayablesRequest_makeRequestWithCompletion_canonicalType___block_invoke;
  v15[3] = &unk_1E68A8398;
  objc_copyWeak(&v18, &location);
  v15[4] = self;
  v12 = v7;
  v16 = v12;
  v13 = v6;
  v17 = v13;
  -[WLKCanonicalPlayablesRequestOperation setCompletionBlock:](v11, "setCompletionBlock:", v15);
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v11);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __72__WLKCanonicalPlayablesRequest_makeRequestWithCompletion_canonicalType___block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  NSLog(CFSTR("%@: elapsed time: %.5f"), v3, v5);

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(WeakRetained, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v6, v8);

  }
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSString)statsID
{
  return self->_statsID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsID, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end
