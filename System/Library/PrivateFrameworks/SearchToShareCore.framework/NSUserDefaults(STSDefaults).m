@implementation NSUserDefaults(STSDefaults)

- (uint64_t)sts_legalNoticeCount
{
  return objc_msgSend(a1, "integerForKey:", CFSTR("LegalNoticeCount"));
}

- (uint64_t)sts_setLegalNoticeCount:()STSDefaults
{
  objc_msgSend(a1, "setInteger:forKey:", a3, CFSTR("LegalNoticeCount"));
  return objc_msgSend(a1, "synchronize");
}

@end
