@implementation NSString(ReminderKitAdditions)

- (BOOL)rem_hasPrefixCaseInsensitive:()ReminderKitAdditions
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)rem_hasMailto
{
  return objc_msgSend(a1, "rem_hasPrefixCaseInsensitive:", CFSTR("mailto:"));
}

- (id)rem_addingMailto
{
  id v2;

  if ((objc_msgSend(a1, "rem_hasMailto") & 1) != 0)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(CFSTR("mailto:"), "stringByAppendingString:", a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)rem_removingMailto
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "rem_hasMailto"))
  {
    objc_msgSend(v1, "substringFromIndex:", 7);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  return v1;
}

- (uint64_t)rem_hasTel
{
  return objc_msgSend(a1, "rem_hasPrefixCaseInsensitive:", CFSTR("tel:"));
}

- (id)rem_addingTel
{
  id v2;

  if ((objc_msgSend(a1, "rem_hasTel") & 1) != 0)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(CFSTR("tel:"), "stringByAppendingString:", a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)rem_removingTel
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "rem_hasTel"))
  {
    objc_msgSend(v1, "substringFromIndex:", 4);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  return v1;
}

+ (uint64_t)rem_isFirstString:()ReminderKitAdditions equalToSecondString:
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend((id)v5, "isEqualToString:", v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
