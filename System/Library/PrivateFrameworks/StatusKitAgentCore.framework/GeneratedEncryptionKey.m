@implementation GeneratedEncryptionKey

+ (NSString)dateGeneratedKeyPath
{
  return (NSString *)CFSTR("dateGenerated");
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("GeneratedEncryptionKey"));
}

@end
