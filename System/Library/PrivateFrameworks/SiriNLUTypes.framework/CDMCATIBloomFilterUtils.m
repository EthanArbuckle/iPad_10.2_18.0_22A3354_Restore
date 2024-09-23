@implementation CDMCATIBloomFilterUtils

+ (id)getCATIBloomFiltersFromFileURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  FLTCDMCATIBloomFilters *v8;
  id v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = v6;
  if (v5)
  {
    v8 = -[FLTCDMCATIBloomFilters initWithFlatbuffData:]([FLTCDMCATIBloomFilters alloc], "initWithFlatbuffData:", v5);
  }
  else
  {
    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }

  return v8;
}

@end
