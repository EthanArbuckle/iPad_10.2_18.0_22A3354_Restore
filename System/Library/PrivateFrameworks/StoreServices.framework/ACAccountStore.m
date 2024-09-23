@implementation ACAccountStore

void __50__ACAccountStore_SSExtensions___accountTypesCache__block_invoke()
{
  SSLRUCache *v0;
  void *v1;

  v0 = objc_alloc_init(SSLRUCache);
  v1 = (void *)_accountTypesCache_ss_once_object___COUNTER__;
  _accountTypesCache_ss_once_object___COUNTER__ = (uint64_t)v0;

}

uint64_t __96__ACAccountStore_SSExtensions___correspondingAccountWithAccountTypeIdentifier_forAccount_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a2;
  objc_msgSend(v4, "_ss_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", a1[4]) & 1) == 0)
  {
    v7 = a1[5];
    if (v7
      && (objc_msgSend(v4, "_ss_DSID"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v2, "isEqualToNumber:", a1[5]) & 1) != 0))
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "username");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "isEqualToString:", a1[6]);

      if (!v7)
        goto LABEL_8;
    }

    goto LABEL_8;
  }
  v6 = 1;
LABEL_8:

  return v6;
}

@end
