@implementation STUsageBlock

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STUsageBlock;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchRequestMatchingUsage:(id)a3 dateInterval:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  +[STUsageBlock fetchRequest](STUsageBlock, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v5, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "predicateWithFormat:", CFSTR("(%K == %@) AND (%K >= %@) AND (%K < %@)"), CFSTR("usage"), v6, CFSTR("startDate"), v9, CFSTR("startDate"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v11);
  return v7;
}

+ (double)totalScreenTimeForUsageBlocks:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;

  v3 = a3;
  objc_msgSend(CFSTR("@sum."), "stringByAppendingString:", CFSTR("screenTimeInSeconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (double)objc_msgSend(v5, "integerValue");
  return v6;
}

+ (int64_t)totalPickupsForUsageBlocks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a1, "usageCountedItemsForUsageBlocks:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("@sum."), "stringByAppendingString:", CFSTR("numberOfPickups"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(CFSTR("@sum."), "stringByAppendingString:", CFSTR("numberOfPickupsWithoutApplicationUsage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "integerValue");
  return v11 + v8;
}

+ (int64_t)totalNotificationsForUsageBlocks:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(a1, "usageCountedItemsForUsageBlocks:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("@sum."), "stringByAppendingString:", CFSTR("numberOfNotifications"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

+ (id)usageCountedItemsForUsageBlocks:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(CFSTR("@distinctUnionOfSets."), "stringByAppendingString:", CFSTR("countedItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)usageCategoriesForUsageBlocks:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(CFSTR("@distinctUnionOfSets."), "stringByAppendingString:", CFSTR("categories"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
