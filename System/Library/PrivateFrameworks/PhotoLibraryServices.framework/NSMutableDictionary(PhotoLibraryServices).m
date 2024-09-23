@implementation NSMutableDictionary(PhotoLibraryServices)

- (void)_pl_setNonNilObject:()PhotoLibraryServices forKey:
{
  if (a3)
    return (void *)objc_msgSend(a1, "setObject:forKey:");
  return a1;
}

- (void)_pl_safeAddObject:()PhotoLibraryServices toMutableArrayForKey:
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    objc_msgSend(a1, "objectForKey:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(a1, "setObject:forKey:", v7, v6);
    }
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (id)_pl_mutableDictionaryCreateAndInsertIfNeededForKey:()PhotoLibraryServices
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "setObject:forKey:", v5, v4);
  }

  return v5;
}

@end
