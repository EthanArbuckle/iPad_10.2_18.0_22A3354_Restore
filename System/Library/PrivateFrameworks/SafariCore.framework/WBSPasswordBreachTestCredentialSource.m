@implementation WBSPasswordBreachTestCredentialSource

- (WBSPasswordBreachTestCredentialSource)initWithPasswords:(id)a3
{
  id v4;
  WBSPasswordBreachTestCredentialSource *v5;
  uint64_t v6;
  NSArray *credentials;
  WBSPasswordBreachTestCredentialSource *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordBreachTestCredentialSource;
  v5 = -[WBSPasswordBreachTestCredentialSource init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_39);
    v6 = objc_claimAutoreleasedReturnValue();
    credentials = v5->_credentials;
    v5->_credentials = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

WBSPasswordBreachCredential *__59__WBSPasswordBreachTestCredentialSource_initWithPasswords___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSPasswordBreachCredential *v3;
  void *v4;
  void *v5;
  WBSPasswordBreachCredential *v6;

  v2 = a2;
  v3 = [WBSPasswordBreachCredential alloc];
  objc_msgSend(v2, "dataUsingEncoding:allowLossyConversion:", 4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 1000.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBSPasswordBreachCredential initWithPassword:persistentIdentifier:dateLastModified:](v3, "initWithPassword:persistentIdentifier:dateLastModified:", v2, v4, v5);

  return v6;
}

- (NSArray)credentials
{
  return self->_credentials;
}

- (id)savedAccountsForPersistentIdentifiers:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end
