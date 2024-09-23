@implementation PSAccountsLinkSpecifier

- (PSAccountsLinkSpecifier)initWithDetailClass:(Class)a3
{
  void *v5;
  PSAccountsLinkSpecifier *v6;
  PSAccountsLinkSpecifier *v7;
  objc_super v9;

  PS_LocalizedStringForSystemPolicy(CFSTR("ACCOUNTS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PSAccountsLinkSpecifier;
  v6 = -[PSSpecifier initWithName:target:set:get:detail:cell:edit:](&v9, sel_initWithName_target_set_get_detail_cell_edit_, v5, self, 0, sel__accountsCount_, a3, 2, 0);

  if (v6)
    v7 = v6;

  return v6;
}

- (id)_accountsCount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37F0];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  +[PSAccountEnumerator sharedEnumerator](PSAccountEnumerator, "sharedEnumerator", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "visibleAccountCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringFromNumber:numberStyle:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PSAccountEnumerator)accountEnumerator
{
  return self->_accountEnumerator;
}

- (void)setAccountEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_accountEnumerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountEnumerator, 0);
}

@end
