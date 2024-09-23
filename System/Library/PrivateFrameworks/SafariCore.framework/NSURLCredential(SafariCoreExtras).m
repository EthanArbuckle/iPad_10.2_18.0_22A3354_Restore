@implementation NSURLCredential(SafariCoreExtras)

+ (uint64_t)safari_credentialWithUser:()SafariCoreExtras password:persistence:
{
  if (!a3)
    a3 = &stru_1E64A2498;
  return objc_msgSend(MEMORY[0x1E0C92C60], "credentialWithUser:password:persistence:", a3);
}

@end
