@implementation IMMediaRequestEncoder

- (void)prepareRequest:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMMediaRequestEncoder *v11;
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
  if (-[IMMediaRequestEncoder personalizeRequests](v11, "personalizeRequests"))
  {
    v12 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      self = (IMMediaRequestEncoder *)objc_claimAutoreleasedReturnValue();
      -[IMMediaRequestEncoder ams_activeiTunesAccount](self, "ams_activeiTunesAccount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSMediaRequestEncoder setAccount:](v11, "setAccount:", v12);
    if (!v9)
    {

    }
  }
  v17.receiver = v11;
  v17.super_class = (Class)IMMediaRequestEncoder;
  -[AMSMediaRequestEncoder requestByEncodingRequest:parameters:](&v17, sel_requestByEncodingRequest_parameters_, v8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__IMMediaRequestEncoder_prepareRequest_account_completion___block_invoke;
  v15[3] = &unk_1E54D0E58;
  v14 = v10;
  v16 = v14;
  objc_msgSend(v13, "addFinishBlock:", v15);

  objc_sync_exit(v11);
}

- (BOOL)personalizeRequests
{
  return self->personalizeRequests;
}

- (IMMediaRequestEncoder)initWithBag:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  IMMediaRequestEncoder *v12;
  IMMediaRequestEncoder *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[IMURLBag sharedInstance](IMURLBag, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_alloc(MEMORY[0x1E0CFDB50]);
  +[PFClientUtil mediaApiClientIdentifier](PFClientUtil, "mediaApiClientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithClientIdentifier:bag:", v9, v6);

  objc_msgSend(v10, "setSession:", v7);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB30]), "initWithTokenService:", v10);
  objc_msgSend(v7, "setProtocolHandler:", v11);
  v16.receiver = self;
  v16.super_class = (Class)IMMediaRequestEncoder;
  v12 = -[AMSMediaRequestEncoder initWithTokenService:bag:](&v16, sel_initWithTokenService_bag_, v10, v6);
  v13 = v12;
  if (v12)
  {
    -[IMMediaRequestEncoder setPersonalizeRequests:](v12, "setPersonalizeRequests:", 1);
    objc_msgSend(MEMORY[0x1E0CFDBD0], "currentProcess");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTreatmentNamespace:", CFSTR("podcasts"));
    -[AMSMediaRequestEncoder setClientInfo:](v13, "setClientInfo:", v14);

  }
  return v13;
}

- (void)setPersonalizeRequests:(BOOL)a3
{
  self->personalizeRequests = a3;
}

- (void)prepareRequest:(id)a3 completion:(id)a4
{
  -[IMMediaRequestEncoder prepareRequest:account:completion:](self, "prepareRequest:account:completion:", a3, 0, a4);
}

uint64_t __59__IMMediaRequestEncoder_prepareRequest_account_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
