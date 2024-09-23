@implementation CTUIDataUsageSorting

+ (id)alphabeticalComparator
{
  return &__block_literal_global_14;
}

uint64_t __46__CTUIDataUsageSorting_alphabeticalComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

+ (id)usageComparator
{
  return &__block_literal_global_2;
}

uint64_t __39__CTUIDataUsageSorting_usageComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v5, "dataUsage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v4, "dataUsage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "localizedStandardCompare:", v10);

  }
  return v8;
}

+ (id)userSelectedComparator
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CellularDataUsageAlphabeticalSortKey"));

  if (v3)
    +[CTUIDataUsageSorting alphabeticalComparator](CTUIDataUsageSorting, "alphabeticalComparator");
  else
    +[CTUIDataUsageSorting usageComparator](CTUIDataUsageSorting, "usageComparator");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
