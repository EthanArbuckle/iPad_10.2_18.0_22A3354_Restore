@implementation NSLocale(PhoneNumbers)

+ (uint64_t)ITUCountryCodeForISOCountryCode:()PhoneNumbers
{
  void *v0;
  void *v1;
  uint64_t v2;

  v0 = (void *)_PNCopyInternationalCodeForCountry();
  v1 = v0;
  if (v0 && objc_msgSend(v0, "integerValue") >= 1)
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

+ (id)nationalDirectDialingPrefixForISOCountryCode:()PhoneNumbers
{
  return (id)_PNCopyNationalDirectDialingPrefixForCountry();
}

- (uint64_t)ITUCountryCode
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "countryCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = objc_msgSend((id)objc_opt_class(), "ITUCountryCodeForISOCountryCode:", v1);
  else
    v2 = 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

- (id)nationalDirectDialingPrefix
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "countryCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend((id)objc_opt_class(), "nationalDirectDialingPrefixForISOCountryCode:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
