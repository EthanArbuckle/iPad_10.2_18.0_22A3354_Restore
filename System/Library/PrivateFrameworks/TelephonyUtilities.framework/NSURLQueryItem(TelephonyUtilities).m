@implementation NSURLQueryItem(TelephonyUtilities)

+ (id)queryItemForHandleType:()TelephonyUtilities
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(a1, "queryItemValueForHandleType:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "queryItemWithName:value:", CFSTR("handleType"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (__CFString)queryItemValueForHandleType:()TelephonyUtilities
{
  if ((unint64_t)(a3 - 1) > 2)
    return (__CFString *)0;
  else
    return *(&off_1E38A2FE8)[a3 - 1];
}

@end
