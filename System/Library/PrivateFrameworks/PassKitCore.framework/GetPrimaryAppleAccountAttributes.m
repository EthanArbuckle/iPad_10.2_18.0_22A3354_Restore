@implementation GetPrimaryAppleAccountAttributes

void ___GetPrimaryAppleAccountAttributes_block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (_MergedGlobals_261 && *(_BYTE *)(a1 + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    +[PKAppleAccountManager sharedInstance](PKAppleAccountManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appleAccountInformation");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    _MergedGlobals_261 = v3 != 0;
    byte_1ECF229C9 = objc_msgSend(v3, "isManagedAppleAccount");
    byte_1ECF229CA = objc_msgSend(v3, "isWalletEnabledOnManagedAppleAccount");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void ___GetPrimaryAppleAccountAttributes_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.passkitcore.wallet.visibility", 0);
  v1 = (void *)qword_1ECF229E8;
  qword_1ECF229E8 = (uint64_t)v0;

}

@end
