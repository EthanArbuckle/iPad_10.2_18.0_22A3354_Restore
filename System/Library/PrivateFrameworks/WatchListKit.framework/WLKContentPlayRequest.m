@implementation WLKContentPlayRequest

- (WLKContentPlayRequest)initWithCanonicalID:(id)a3
{
  id v5;
  WLKContentPlayRequest *v6;
  WLKContentPlayRequest *v7;
  WLKContentPlayRequest *v8;
  objc_super v10;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKContentPlayRequest;
    v6 = -[WLKContentPlayRequest init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_canonicalID, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4;
  WLKContentPlayRequestOperation *v5;
  NSString *canonicalID;
  void *v7;
  WLKContentPlayRequestOperation *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  v5 = [WLKContentPlayRequestOperation alloc];
  canonicalID = self->_canonicalID;
  -[WLKRequest caller](self, "caller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WLKContentPlayRequestOperation initWithCanonicalID:caller:](v5, "initWithCanonicalID:caller:", canonicalID, v7);

  objc_initWeak(&location, v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__WLKContentPlayRequest_makeRequestWithCompletion___block_invoke;
  v11[3] = &unk_1E68A7A28;
  objc_copyWeak(&v13, &location);
  v9 = v4;
  v12 = v9;
  -[WLKContentPlayRequestOperation setCompletionBlock:](v8, "setCompletionBlock:", v11);
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __51__WLKContentPlayRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
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

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end
