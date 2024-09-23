@implementation NSArray(PreferencesAdditions)

- (id)specifierForID:()PreferencesAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  objc_msgSend(a1, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  while (1)
  {
    v7 = v6;
    objc_msgSend(v5, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v4);

    if (v9)
    {
      v10 = v6;
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (uint64_t)indexOfSpecifierWithID:()PreferencesAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NSArray_PreferencesAdditions__indexOfSpecifierWithID___block_invoke;
  v8[3] = &unk_1E4A66730;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a1, "indexOfObjectPassingTest:", v8);

  return v6;
}

- (uint64_t)indexOfNextGroupStartingAtIndex:()PreferencesAdditions
{
  unint64_t v3;
  void *v5;
  uint64_t v6;

  if (a3)
  {
    v3 = a3;
    if (objc_msgSend(a1, "count") > a3)
    {
      while (++v3 < objc_msgSend(a1, "count"))
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "cellType");

        if (!v6)
          return v3;
      }
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

@end
