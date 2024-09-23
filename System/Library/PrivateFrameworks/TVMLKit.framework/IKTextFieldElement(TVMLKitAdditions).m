@implementation IKTextFieldElement(TVMLKitAdditions)

- (uint64_t)tv_isSecure
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("secure"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)tv_keyboardType
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("keyboardType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("emailAddress")) & 1) != 0)
  {
    v3 = 7;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("numberPad")) & 1) != 0)
  {
    v3 = 4;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("url")))
  {
    v3 = 3;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
