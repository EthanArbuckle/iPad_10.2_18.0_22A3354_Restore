@implementation NSMutableArray(PreferencesAdditions)

- (void)ps_insertObject:()PreferencesAdditions afterObject:
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = objc_msgSend(a1, "indexOfObject:", a4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "insertObject:atIndex:", v7, v6 + 1);

}

- (void)ps_insertObjectsFromArray:()PreferencesAdditions afterObject:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = objc_msgSend(a1, "indexOfObject:", a4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v7 + 1, objc_msgSend(v9, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "insertObjects:atIndexes:", v9, v8);

    }
  }

}

- (void)ps_addSpecifier:()PreferencesAdditions toGroup:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ps_addSpecifiers:toGroup:", v9, v7, v10, v11);
}

- (void)ps_addSpecifiers:()PreferencesAdditions toGroup:
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = objc_msgSend(a1, "indexOfObject:", a4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    if (objc_msgSend(v13, "count"))
    {
      v8 = v7 + 1;
      do
      {
        v9 = v8;
        if (v8 >= objc_msgSend(a1, "count"))
          break;
        objc_msgSend(a1, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "cellType");

        v8 = v9 + 1;
      }
      while (v11);
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v9, objc_msgSend(v13, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "insertObjects:atIndexes:", v13, v12);

    }
  }

}

@end
