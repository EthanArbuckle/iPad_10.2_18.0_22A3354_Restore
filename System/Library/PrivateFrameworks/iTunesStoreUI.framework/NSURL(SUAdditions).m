@implementation NSURL(SUAdditions)

+ (uint64_t)termsAndConditionsURL
{
  void *v0;
  void *v1;
  uint64_t result;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
  v1 = (void *)objc_msgSend(v0, "URLBagForContext:", objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0));
  result = objc_msgSend(v1, "urlForKey:", *MEMORY[0x24BEC8B30]);
  if (!result)
    return objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.apple.com/legal/itunes/ww/"));
  return result;
}

- (uint64_t)storeURLType
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend(a1, "absoluteString");
  if (objc_msgSend(v2, "rangeOfString:", CFSTR("MZSearch.woa")) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v2, "rangeOfString:", CFSTR("/search?")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    return 1;
  }
  if (objc_msgSend(v2, "rangeOfString:", CFSTR("buyCharityGiftWizard")) != 0x7FFFFFFFFFFFFFFFLL)
    return 3;
  if (objc_msgSend(v2, "rangeOfString:", CFSTR("getPass")) != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v2, "rangeOfString:", CFSTR("MZFinance.woa")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    return 4;
  }
  v3 = (void *)objc_msgSend(a1, "copyQueryStringDictionaryWithUnescapedValues:", 1);
  v4 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("action"));
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("account")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("donate")) & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("search"));
  }

  return v5;
}

@end
