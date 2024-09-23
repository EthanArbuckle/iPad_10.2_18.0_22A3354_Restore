@implementation WLKCanonicalContainerRequest

- (WLKCanonicalContainerRequest)initWithCanonicalID:(id)a3
{
  id v5;
  WLKCanonicalContainerRequest *v6;
  WLKCanonicalContainerRequest *v7;
  WLKCanonicalContainerRequest *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKCanonicalContainerRequest;
    v6 = -[WLKCanonicalContainerRequest init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_canonicalID, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("canonicalID must be non-nil"));
    v8 = 0;
  }

  return v8;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  WLKCanonicalContainerRequestOperation *v6;
  NSString *canonicalID;
  void *v8;
  WLKCanonicalContainerRequestOperation *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [WLKCanonicalContainerRequestOperation alloc];
  canonicalID = self->_canonicalID;
  -[WLKRequest caller](self, "caller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WLKCanonicalPlayablesRequestOperation initWithContentID:caller:isMovie:](v6, "initWithContentID:caller:isMovie:", canonicalID, v8, 0);

  objc_initWeak(&location, v9);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __58__WLKCanonicalContainerRequest_makeRequestWithCompletion___block_invoke;
  v16 = &unk_1E68A8D58;
  v10 = v5;
  v17 = v10;
  objc_copyWeak(&v19, &location);
  v11 = v4;
  v18 = v11;
  -[WLKCanonicalContainerRequestOperation setCompletionBlock:](v9, "setCompletionBlock:", &v13);
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v9);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __58__WLKCanonicalContainerRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  NSLog(CFSTR("WLKCanonicalContainerRequestOperation: elapsed time: %.5f"), v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 40))
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "containerResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);

    WeakRetained = v8;
  }

}

- (void)makeRequestWithCompletion:(id)a3 canonicalType:(int64_t)a4
{
  id v6;
  void *v7;
  WLKCanonicalContainerRequestOperation *v8;
  NSString *canonicalID;
  void *v10;
  WLKCanonicalContainerRequestOperation *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [WLKCanonicalContainerRequestOperation alloc];
  canonicalID = self->_canonicalID;
  -[WLKRequest caller](self, "caller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WLKCanonicalPlayablesRequestOperation initWithContentID:caller:canonicalType:](v8, "initWithContentID:caller:canonicalType:", canonicalID, v10, a4);

  objc_initWeak(&location, v11);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __72__WLKCanonicalContainerRequest_makeRequestWithCompletion_canonicalType___block_invoke;
  v18 = &unk_1E68A8D58;
  v12 = v7;
  v19 = v12;
  objc_copyWeak(&v21, &location);
  v13 = v6;
  v20 = v13;
  -[WLKCanonicalContainerRequestOperation setCompletionBlock:](v11, "setCompletionBlock:", &v15);
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue", v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v11);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __72__WLKCanonicalContainerRequest_makeRequestWithCompletion_canonicalType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  NSLog(CFSTR("WLKCanonicalContainerRequestOperation: elapsed time: %.5f"), v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 40))
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "containerResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);

    WeakRetained = v8;
  }

}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end
