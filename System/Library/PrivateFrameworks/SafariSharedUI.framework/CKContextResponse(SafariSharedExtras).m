@implementation CKContextResponse(SafariSharedExtras)

- (id)safari_topQIDsWithMaximumCount:()SafariSharedExtras
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(a1, "results");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      if (objc_msgSend(v5, "count") <= v3)
        v3 = objc_msgSend(v5, "count");
      objc_msgSend(v5, "subarrayWithRange:", 0, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v6;
}

@end
