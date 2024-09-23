@implementation PSDeviceStateFeatures

id __78___PSDeviceStateFeatures_isInCallWithCandidates_facetimeRequest_caches_store___block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
  {
    v3 = (_QWORD *)a1;
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      +[_PSConstants facetimeBundleId](_PSConstants, "facetimeBundleId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "isEqualToString:", v6);
      if ((v7 & 1) != 0)
      {
        v8 = 0;
        v9 = 1;
      }
      else
      {
        v10 = (void *)v3[4];
        +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", v1) & 1) != 0)
        {
          v8 = 0;
          v9 = 1;
        }
        else
        {
          v11 = (void *)v3[4];
          +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
          v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v11, "isEqualToString:", v3);
          v8 = 1;
        }
      }
      objc_msgSend(v5, "numberWithInt:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "BOOLValue");

      if (v8)
      if ((v7 & 1) == 0)

    }
  }
  v13 = objc_alloc(MEMORY[0x1E0D020D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2 == 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, 0, v14, 0);

  return v15;
}

@end
