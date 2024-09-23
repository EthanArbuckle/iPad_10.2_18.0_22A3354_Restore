@implementation NSURLComponents(ICUtilities)

- (id)queryDictionary
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dc_queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setQueryDictionary:()ICUtilities
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "dc_queryStringWithQueryDictionary:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setPercentEncodedQuery:", v2);

}

- (void)addValuesFromQueryDictionary:()ICUtilities
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v4 = a3;
  objc_msgSend(a1, "percentEncodedQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(a1, "percentEncodedQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("&"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E7AFA810;
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "dc_queryStringWithQueryDictionary:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setPercentEncodedQuery:", v8);

}

@end
