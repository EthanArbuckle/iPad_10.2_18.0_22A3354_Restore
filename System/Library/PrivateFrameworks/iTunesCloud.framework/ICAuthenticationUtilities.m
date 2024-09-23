@implementation ICAuthenticationUtilities

+ (AKAppleIDSession)sharedAuthKitSession
{
  if (sharedAuthKitSession_sOnceToken != -1)
    dispatch_once(&sharedAuthKitSession_sOnceToken, &__block_literal_global_739);
  return (AKAppleIDSession *)(id)sharedAuthKitSession_sSharedAuthKitSession;
}

void __49__ICAuthenticationUtilities_sharedAuthKitSession__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D00140]);
  v1 = (void *)sharedAuthKitSession_sSharedAuthKitSession;
  sharedAuthKitSession_sSharedAuthKitSession = (uint64_t)v0;

}

@end
