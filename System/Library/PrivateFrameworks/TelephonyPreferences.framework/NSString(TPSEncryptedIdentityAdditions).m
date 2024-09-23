@implementation NSString(TPSEncryptedIdentityAdditions)

+ (id)tps_ctStringWithTPSEncryptedIdentityType:()TPSEncryptedIdentityAdditions
{
  id *v3;

  if (a3 == 1)
  {
    v3 = (id *)MEMORY[0x1E0CA7380];
  }
  else
  {
    if (a3 != 2)
      return 0;
    v3 = (id *)MEMORY[0x1E0CA7388];
  }
  return *v3;
}

+ (id)tps_stringWithTPSEncryptedIdentityType:()TPSEncryptedIdentityAdditions
{
  if (a3 > 2)
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", off_1EA2CD880[a3]);
}

- (uint64_t)tps_encryptedIdentityType
{
  if ((objc_msgSend(a1, "isEqualToString:", *MEMORY[0x1E0CA7380]) & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "isEqualToString:", *MEMORY[0x1E0CA7388]))
    return 2;
  return 0;
}

@end
