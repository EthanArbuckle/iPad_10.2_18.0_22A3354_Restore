@implementation REMAccountTemplatesContext

- (REMAccountTemplatesContext)initWithAccount:(id)a3
{
  id v5;
  REMAccountTemplatesContext *v6;
  REMAccountTemplatesContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountTemplatesContext;
  v6 = -[REMAccountTemplatesContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)fetchTemplatesWithError:(id *)a3
{
  REMTemplatesDataView *v5;
  void *v6;
  void *v7;
  REMTemplatesDataView *v8;
  void *v9;
  void *v10;

  v5 = [REMTemplatesDataView alloc];
  -[REMAccountTemplatesContext account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMTemplatesDataView initWithStore:](v5, "initWithStore:", v7);

  -[REMAccountTemplatesContext account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplatesDataView fetchTemplatesInAccount:error:](v8, "fetchTemplatesInAccount:error:", v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (REMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
