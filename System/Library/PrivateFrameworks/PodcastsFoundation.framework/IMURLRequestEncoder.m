@implementation IMURLRequestEncoder

- (IMURLRequestEncoder)initWithBag:(id)a3
{
  id v4;
  IMURLRequestEncoder *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (!v4)
  {
    +[IMURLBag sharedInstance](IMURLBag, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8.receiver = self;
  v8.super_class = (Class)IMURLRequestEncoder;
  v5 = -[AMSURLRequestEncoder initWithBag:](&v8, sel_initWithBag_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CFDBD0], "currentProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setClientInfo:](v5, "setClientInfo:", v6);

  }
  return v5;
}

- (void)prepareRequest:(id)a3 completion:(id)a4
{
  -[IMURLRequestEncoder prepareRequest:account:completion:](self, "prepareRequest:account:completion:", a3, 0, a4);
}

- (void)prepareRequest:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMURLRequestEncoder *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if (-[IMURLRequestEncoder personalizeRequests](v11, "personalizeRequests"))
  {
    v12 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      self = (IMURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
      -[IMURLRequestEncoder ams_activeiTunesAccount](self, "ams_activeiTunesAccount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSURLRequestEncoder setAccount:](v11, "setAccount:", v12);
    if (!v9)
    {

    }
  }
  v17.receiver = v11;
  v17.super_class = (Class)IMURLRequestEncoder;
  -[AMSURLRequestEncoder requestByEncodingRequest:parameters:](&v17, sel_requestByEncodingRequest_parameters_, v8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__IMURLRequestEncoder_prepareRequest_account_completion___block_invoke;
  v15[3] = &unk_1E54D0E58;
  v14 = v10;
  v16 = v14;
  objc_msgSend(v13, "addFinishBlock:", v15);

  objc_sync_exit(v11);
}

uint64_t __57__IMURLRequestEncoder_prepareRequest_account_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0CFDBD8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__IMURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke;
  v10[3] = &unk_1E54D0E80;
  v8 = v7;
  v11 = v8;
  -[IMURLRequestEncoder prepareRequest:completion:](self, "prepareRequest:completion:", v6, v10);

  return v8;
}

uint64_t __59__IMURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (BOOL)personalizeRequests
{
  return self->personalizeRequests;
}

- (void)setPersonalizeRequests:(BOOL)a3
{
  self->personalizeRequests = a3;
}

@end
