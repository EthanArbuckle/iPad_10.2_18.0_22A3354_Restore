@implementation ACAccountStore(SMUPrivate)

+ (id)SMUACDAccountStoreDidChangeNotification
{
  return (id)*MEMORY[0x24BDB41E0];
}

@end
