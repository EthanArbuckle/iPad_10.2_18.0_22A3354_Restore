@implementation NSDictionary(PowerlogExtensions)

- (__CFString)objectForNullMarkerForKey:()PowerlogExtensions
{
  __CFString *v1;

  objc_msgSend(a1, "objectForKey:");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v1)
    v1 = CFSTR("<none>");
  return v1;
}

- (id)descriptionSingleLine
{
  void *v1;
  void *v2;
  void *v4;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E6A56538);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "rangeOfString:", CFSTR("  ")) == 0x7FFFFFFFFFFFFFFFLL)
    return v2;
  do
  {
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("  "), CFSTR(" "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v4;
  }
  while (objc_msgSend(v4, "rangeOfString:", CFSTR("  ")) != 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

- (id)serializedJSONString
{
  void *v2;
  void *v3;
  uint64_t v5;

  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", a1))
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a1, 0, &v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
    if (!v5)
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v2, 4);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
