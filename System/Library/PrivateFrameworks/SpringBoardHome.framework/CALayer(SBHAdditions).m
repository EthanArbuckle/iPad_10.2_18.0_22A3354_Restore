@implementation CALayer(SBHAdditions)

- (void)sbh_addFilter:()SBHAdditions
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "filters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(a1, "setFilters:", v5);

}

- (void)sbh_removeFilterWithName:()SBHAdditions
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  objc_msgSend(a1, "filters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__CALayer_SBHAdditions__sbh_removeFilterWithName___block_invoke;
    v9[3] = &unk_1E8D88288;
    v10 = v8;
    v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v9);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v7, "removeObjectAtIndex:", v6);
      objc_msgSend(a1, "setFilters:", v7);

    }
  }

}

- (BOOL)sbh_hasFilterWithName:()SBHAdditions
{
  id v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(a1, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__CALayer_SBHAdditions__sbh_hasFilterWithName___block_invoke;
    v8[3] = &unk_1E8D88288;
    v9 = v4;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
