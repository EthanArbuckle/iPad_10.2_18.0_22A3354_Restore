@implementation SFIsAllowedAirDropCredentialClient

void __SFIsAllowedAirDropCredentialClient_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.Sharing.AirDrop"), CFSTR("com.apple.Safari"), CFSTR("com.apple.Passwords.remoteservice"), CFSTR("com.apple.Preferences"), CFSTR("com.apple.SafariTechnologyPreview"), CFSTR("com.apple.Passwords"), CFSTR("com.apple.SafariPlatformSupport.Helper"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SFIsAllowedAirDropCredentialClient_allowedClients;
  SFIsAllowedAirDropCredentialClient_allowedClients = v0;

}

@end
