@implementation NSDictionary(TVMLKitAdditions)

- (id)tv_lookupValueForKey:()TVMLKitAdditions expectedClass:
{
  void *v1;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (id)tv_stringForKey:()TVMLKitAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "tv_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tv_dictionaryForKey:()TVMLKitAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "tv_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tv_arrayForKey:()TVMLKitAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "tv_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tv_numberForKey:()TVMLKitAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "tv_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)tv_BOOLForKey:()TVMLKitAdditions defaultValue:
{
  void *v5;

  objc_msgSend(a1, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

@end
