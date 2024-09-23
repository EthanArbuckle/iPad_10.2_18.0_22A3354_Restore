@implementation UIOverlayServiceInterfaceSpecification

void __52___UIOverlayServiceInterfaceSpecification_interface__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D22FE8], "interfaceWithIdentifier:", CFSTR("com.apple.UIKit.OverlayUI.OverlayService"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDE026A0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v0);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE065F78);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);

  objc_msgSend(v4, "setClientMessagingExpectation:", 0);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)_MergedGlobals_1144;
  _MergedGlobals_1144 = v2;

}

@end
