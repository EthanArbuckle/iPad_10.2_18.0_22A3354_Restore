@implementation NSDictionary(TVPlaybackAdditions)

- (id)_lookupValueForKey:()TVPlaybackAdditions expectedClass:
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

- (id)tvp_numberForKey:()TVPlaybackAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tvp_stringForKey:()TVPlaybackAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tvp_URLForKey:()TVPlaybackAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)tvp_BOOLForKey:()TVPlaybackAdditions defaultValue:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "tvp_numberForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (id)tvp_dateForKey:()TVPlaybackAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tvp_dateFromMillisecondsSince1970ForKey:()TVPlaybackAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "tvp_dateWithMillisecondsSince1970:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)tvp_dictionaryForKey:()TVPlaybackAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tvp_arrayForKey:()TVPlaybackAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tvp_dataForKey:()TVPlaybackAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)tvp_appleTimingAppHeaderValue
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "objectForKey:", CFSTR("apple-timing-app"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(" "));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
