@implementation PSVideoSubscriberPrivacyCell

+ (id)_accountStore
{
  if (_accountStore_onceToken != -1)
    dispatch_once(&_accountStore_onceToken, &__block_literal_global_32);
  return (id)_accountStore_accountStore;
}

void __45__PSVideoSubscriberPrivacyCell__accountStore__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getVSAccountStoreClass_softClass;
  v8 = getVSAccountStoreClass_softClass;
  if (!getVSAccountStoreClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getVSAccountStoreClass_block_invoke;
    v4[3] = &unk_1E4A65650;
    v4[4] = &v5;
    __getVSAccountStoreClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "sharedAccountStore");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_accountStore_accountStore;
  _accountStore_accountStore = v2;

}

+ (id)identityProviderDisplayName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identityProviderDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)cellStyle
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PSVideoSubscriberPrivacyCell;
  v3 = objc_msgSendSuper2(&v6, sel_cellStyle);
  objc_msgSend(a1, "identityProviderDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 3;
  else
    return (int64_t)v3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSVideoSubscriberPrivacyCell;
  -[PSSwitchTableCell refreshCellContentsWithSpecifier:](&v6, sel_refreshCellContentsWithSpecifier_, a3);
  objc_msgSend((id)objc_opt_class(), "identityProviderDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSVideoSubscriberPrivacyCell detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

@end
