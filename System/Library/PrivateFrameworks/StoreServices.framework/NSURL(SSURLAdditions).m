@implementation NSURL(SSURLAdditions)

- (uint64_t)isStoreServicesURL
{
  uint64_t result;

  result = objc_msgSend(a1, "scheme");
  if (result)
    return objc_msgSend((id)objc_msgSend(a1, "scheme"), "caseInsensitiveCompare:", CFSTR("itms-services")) == 0;
  return result;
}

@end
