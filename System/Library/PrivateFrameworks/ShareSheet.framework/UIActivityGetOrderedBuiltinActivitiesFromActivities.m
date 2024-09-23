@implementation UIActivityGetOrderedBuiltinActivitiesFromActivities

uint64_t ___UIActivityGetOrderedBuiltinActivitiesFromActivities_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "activityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  if (v8 < v11)
    return -1;
  else
    return v8 > v11;
}

@end
