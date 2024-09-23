@implementation NSMutableDictionary(PKMutableDictionaryAdditions)

- (void)safelySetObject:()PKMutableDictionaryAdditions forKey:
{
  if (a3)
  {
    if (a4)
      return (void *)objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

- (id)getOrCreateObjectForKey:()PKMutableDictionaryAdditions creationBlock:
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v7[2](v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v9, v6);

  }
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
