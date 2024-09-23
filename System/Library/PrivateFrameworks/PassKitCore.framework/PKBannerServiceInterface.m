@implementation PKBannerServiceInterface

void __PKBannerServiceInterface_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("com.apple.wallet.banner"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE296628);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v0);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE20F070);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);

  objc_msgSend(v4, "setClientMessagingExpectation:", 0);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v2;

  if (_MergedGlobals_1)
  else
    __break(1u);
}

@end
