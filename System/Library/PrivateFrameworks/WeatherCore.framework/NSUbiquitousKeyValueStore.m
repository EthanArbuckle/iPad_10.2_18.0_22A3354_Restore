@implementation NSUbiquitousKeyValueStore

void __59__NSUbiquitousKeyValueStore_WeatherCore__wc_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A38]), "_initWithStoreIdentifier:usingEndToEndEncryption:", CFSTR("com.apple.weather"), 1);
  v1 = (void *)wc_sharedInstance_sSharedInstance;
  wc_sharedInstance_sSharedInstance = v0;

}

@end
