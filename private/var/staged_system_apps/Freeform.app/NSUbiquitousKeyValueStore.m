@implementation NSUbiquitousKeyValueStore

+ (id)crl_encryptedKVS
{
  return objc_msgSend(objc_alloc((Class)NSUbiquitousKeyValueStore), "initWithStoreIdentifier:type:", CFSTR("com.apple.freeform"), 2);
}

@end
