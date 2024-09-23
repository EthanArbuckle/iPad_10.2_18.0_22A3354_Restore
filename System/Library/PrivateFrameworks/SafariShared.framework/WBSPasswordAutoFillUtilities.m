@implementation WBSPasswordAutoFillUtilities

+ (BOOL)mayAutoFillPasswordOnHost:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "safari_highLevelDomainFromHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = !objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", CFSTR("google.com"))
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("accounts.google.com")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("myaccount.google.com"));

  return v5;
}

@end
