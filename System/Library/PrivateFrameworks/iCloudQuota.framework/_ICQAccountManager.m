@implementation _ICQAccountManager

- (ACAccountStore)accountStore
{
  return (ACAccountStore *)objc_getProperty(self, a2, 8, 1);
}

- (_ICQAccountManager)init
{
  void *v3;
  _ICQAccountManager *v4;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_ICQAccountManager initWithAccountStore:](self, "initWithAccountStore:", v3);

  return v4;
}

- (_ICQAccountManager)initWithAccountStore:(id)a3
{
  id v5;
  _ICQAccountManager *v6;
  _ICQAccountManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ICQAccountManager;
  v6 = -[_ICQAccountManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountStore, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
