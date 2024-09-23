@implementation WLKContinueWatchingRequest

- (WLKContinueWatchingRequest)init
{
  WLKContinueWatchingRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLKContinueWatchingRequest;
  result = -[WLKContinueWatchingRequest init](&v3, sel_init);
  if (result)
    result->_allowAuthentication = 1;
  return result;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4;
  WLKContinueWatchingRequestOperation *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id from;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(WLKContinueWatchingRequestOperation);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__WLKContinueWatchingRequest_makeRequestWithCompletion___block_invoke;
  v8[3] = &unk_1E68A7D38;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  v6 = v4;
  v9 = v6;
  -[WLKContinueWatchingRequestOperation setCompletionBlock:](v5, "setCompletionBlock:", v8);
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __56__WLKContinueWatchingRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 3, v3);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v2, "response");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _BOOL8, void *))(v6 + 16))(v6, v5, v7);

  }
}

- (BOOL)allowAuthentication
{
  return self->_allowAuthentication;
}

- (void)setAllowAuthentication:(BOOL)a3
{
  self->_allowAuthentication = a3;
}

- (WLKContinueWatchingResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

@end
