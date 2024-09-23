@implementation PRUISExternallyHostedPosterEditingServiceInterface

void __PRUISExternallyHostedPosterEditingServiceInterface_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE38010], "interfaceWithIdentifier:", CFSTR("com.apple.posterboardui.externalEditing"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_257397340);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v0);

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_257397170);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);

  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)PRUISExternallyHostedPosterEditingServiceInterface___interface;
  PRUISExternallyHostedPosterEditingServiceInterface___interface = v2;

}

@end
