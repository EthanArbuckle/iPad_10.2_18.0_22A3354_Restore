@implementation STAvailableCategoriesExcludingSystemCategories

void __STAvailableCategoriesExcludingSystemCategories_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D0D510], "sharedCategories");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "availableCategoryIDs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = *MEMORY[0x1E0D0D4B8];
  v7[0] = *MEMORY[0x1E0D0D4D8];
  v7[1] = v3;
  v7[2] = *MEMORY[0x1E0D0D4C8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsInArray:", v4);

  v5 = objc_msgSend(v2, "copy");
  v6 = (void *)STAvailableCategoriesExcludingSystemCategories_categories;
  STAvailableCategoriesExcludingSystemCategories_categories = v5;

}

@end
