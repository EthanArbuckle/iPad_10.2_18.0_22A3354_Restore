@implementation NSMutableDictionary(OSASubmitterExtension)

- (void)_accumulateKey:()OSASubmitterExtension value:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v11 = v7;
  if (v7)
    v9 = (int)objc_msgSend(v7, "intValue");
  else
    v9 = 0;
  objc_msgSend(v8, "numberWithLong:", v9 + a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v10, v6);

}

- (void)_recordRetirement:()OSASubmitterExtension reason:
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "_accumulateKey:value:", v8, 1);

}

@end
