@implementation NSString(UserNotificationsCore)

+ (id)unc_stringWithDigestOfSHA1Hash:()UserNotificationsCore
{
  id v3;
  unsigned __int8 *v4;
  uint64_t v5;
  void *i;
  unsigned int v7;
  void *v8;

  v3 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * v5);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v5; --v5)
  {
    v7 = *v4++;
    objc_msgSend(i, "appendFormat:", CFSTR("%02x"), v7);
  }
  v8 = (void *)objc_msgSend(i, "copy");

  return v8;
}

@end
