@implementation NSURL(PKURLAdditions)

- (BOOL)isAppleURL
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("apple.com")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("applepaydemo.apple.com")))
      v2 = objc_msgSend(v1, "rangeOfString:options:", CFSTR(".apple.com"), 13) != 0x7FFFFFFFFFFFFFFFLL;
    else
      v2 = 0;
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

@end
