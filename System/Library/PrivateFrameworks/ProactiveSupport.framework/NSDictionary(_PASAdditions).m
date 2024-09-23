@implementation NSDictionary(_PASAdditions)

- (id)_pas_unlazyDictionary
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_pas_overrideUnlazyDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)objc_msgSend(a1, "copy");
  }
  return v2;
}

+ (id)_pas_dictionaryNoCopyLeavesWithPropertyListData:()_PASAdditions error:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char isKindOfClass;
  id v11;

  v5 = a3;
  +[_PASLazyPlist dictionaryWithData:error:](_PASLazyPlistWithBPlistSupport, "dictionaryWithData:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pas_unlazyDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v11 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      v11 = v9;
      if (a4)
        *a4 = 0;
    }
    v8 = v11;

  }
  return v8;
}

@end
