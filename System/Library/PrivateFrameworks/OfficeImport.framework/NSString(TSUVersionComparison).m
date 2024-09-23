@implementation NSString(TSUVersionComparison)

- (uint64_t)tsu_compareToVersionString:()TSUVersionComparison
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  TokenizeVersionString(a1);
  v5 = objc_claimAutoreleasedReturnValue();
  TokenizeVersionString(v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v5 || !v6)
    {
      if (!v5 || v6)
      {
        v10 = 0;
        while (1)
        {
          objc_msgSend((id)v5, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v11, "compare:", v12);

          if (v8)
            break;
          if (++v10 == 3)
            goto LABEL_2;
        }
      }
      else
      {
        v8 = 1;
      }
    }
    else
    {
      v8 = -1;
    }
  }
  else
  {
LABEL_2:
    v8 = 0;
  }

  return v8;
}

@end
