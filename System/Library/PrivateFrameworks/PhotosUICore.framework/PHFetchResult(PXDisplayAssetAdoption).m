@implementation PHFetchResult(PXDisplayAssetAdoption)

- (id)thumbnailAssetAtIndex:()PXDisplayAssetAdoption
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "thumbnailAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(a1, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (uint64_t)hasIdentifiersEqualTo:()PXDisplayAssetAdoption
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(a1, "fetchedObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchedObjectIDs");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 && v7)
    {
      if (v6 == (void *)v7)
        v9 = 1;
      else
        v9 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      objc_msgSend(a1, "fetchedObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fetchedObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
        v9 = 1;
      else
        v9 = objc_msgSend(v10, "isEqual:", v11);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
