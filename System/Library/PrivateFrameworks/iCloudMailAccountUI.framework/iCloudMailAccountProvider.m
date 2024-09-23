@implementation iCloudMailAccountProvider

- (iCloudMailAccountProvider)initWithAccountStore:(id)a3 appleAccount:(id)a4 presenter:(id)a5
{
  id v8;
  id v9;
  id v10;
  iCloudMailAccountProvider *v11;
  iCloudMailAccountProviderSwift *v12;
  iCloudMailAccountProviderSwift *provider;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)iCloudMailAccountProvider;
  v11 = -[iCloudMailAccountProvider init](&v15, sel_init);
  if (v11)
  {
    v12 = -[iCloudMailAccountProviderSwift initWithPresenter:appleAccount:accountStore:]([iCloudMailAccountProviderSwift alloc], "initWithPresenter:appleAccount:accountStore:", v10, v9, v8);
    provider = v11->provider;
    v11->provider = v12;

  }
  return v11;
}

- (void)presentWithAlert:(BOOL)a3 completionHandler:(id)a4
{
  -[iCloudMailAccountProviderSwift presentWith:completion:](self->provider, "presentWith:completion:", a3, a4);
}

- (void)presentWithCompletionHandler:(id)a3
{
  -[iCloudMailAccountProviderSwift presentWith:](self->provider, "presentWith:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->provider, 0);
}

@end
