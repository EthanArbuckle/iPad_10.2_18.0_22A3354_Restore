@implementation STAvailableVersion1CategoriesExcludingSystemCategories

void __STAvailableVersion1CategoriesExcludingSystemCategories_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = objc_alloc(MEMORY[0x1E0C99E10]);
  STAvailableCategoriesExcludingSystemCategories();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v0, "initWithArray:", v1);

  objc_msgSend(v5, "removeObject:", *MEMORY[0x1E0D0D4F0]);
  objc_msgSend(v5, "removeObject:", *MEMORY[0x1E0D0D4A0]);
  objc_msgSend(v5, "removeObject:", *MEMORY[0x1E0D0D4E8]);
  objc_msgSend(v5, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)STAvailableVersion1CategoriesExcludingSystemCategories_version1Categories;
  STAvailableVersion1CategoriesExcludingSystemCategories_version1Categories = v3;

}

@end
