@implementation PGSharingSuggestionGraphBasedSource

- (BOOL)canRunWithInput:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;

  objc_msgSend(a3, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "universalStartDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "universalEndDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "timeIntervalSinceDate:", v5);
    v9 = v8 < 7776000.0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
