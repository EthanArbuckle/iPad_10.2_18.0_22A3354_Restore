@implementation ACTClientProxy

- (ACTClientProxy)initWithClient:(id)a3
{
  id v4;
  ACTClientProxy *v5;
  ACTClientProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACTClientProxy;
  v5 = -[ACTClientProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_client, v4);

  return v6;
}

- (void)pushCandidates:(id)a3 requestToken:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ACTClientProxy client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "pushAutocorrections:requestToken:", v9, v6);

}

- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ACTClientProxy client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "pushCandidateResultSet:requestToken:", v9, v6);

}

- (void)closeRequestToken:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ACTClientProxy client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "closeRequestToken:", v5);

}

- (ACTClientProtocol)client
{
  return (ACTClientProtocol *)objc_loadWeakRetained((id *)&self->_client);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
}

@end
