@implementation STSortedCategoriesForUsageLimits

void __STSortedCategoriesForUsageLimits_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  STAvailableCategoriesExcludingSystemCategories();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v9, "mutableCopy");
  v1 = (void *)STSortedCategoriesForUsageLimits_sortedCategories;
  STSortedCategoriesForUsageLimits_sortedCategories = v0;

  objc_msgSend((id)STSortedCategoriesForUsageLimits_sortedCategories, "sortUsingSelector:", sel_compare_);
  v2 = *MEMORY[0x1E0D0D468];
  v3 = (id)STSortedCategoriesForUsageLimits_sortedCategories;
  if (objc_msgSend(v3, "containsObject:", v2))
  {
    objc_msgSend(v3, "removeObject:", v2);
    objc_msgSend(v3, "insertObject:atIndex:", v2, 0);
  }

  v4 = *MEMORY[0x1E0D0D470];
  v5 = (id)STSortedCategoriesForUsageLimits_sortedCategories;
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    objc_msgSend(v5, "removeObject:", v4);
    objc_msgSend(v5, "insertObject:atIndex:", v4, 0);
  }

  v6 = *MEMORY[0x1E0D0D4A8];
  v7 = (id)STSortedCategoriesForUsageLimits_sortedCategories;
  if (objc_msgSend(v7, "containsObject:", v6))
  {
    objc_msgSend(v7, "removeObject:", v6);
    objc_msgSend(v7, "insertObject:atIndex:", v6, 0);
  }

  v8 = *MEMORY[0x1E0D0D480];
  if (objc_msgSend((id)STSortedCategoriesForUsageLimits_sortedCategories, "containsObject:", *MEMORY[0x1E0D0D480]))
  {
    objc_msgSend((id)STSortedCategoriesForUsageLimits_sortedCategories, "removeObject:", v8);
    objc_msgSend((id)STSortedCategoriesForUsageLimits_sortedCategories, "addObject:", v8);
  }

}

@end
