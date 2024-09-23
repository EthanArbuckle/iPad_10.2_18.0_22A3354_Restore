@implementation NSURL(ICUtilities)

- (id)URLByAddingValuesFromQueryDictionary:()ICUtilities
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
    objc_msgSend(v5, "addValuesFromQueryDictionary:", v4);
    objc_msgSend(v5, "URL");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = a1;
  }

  return v6;
}

@end
