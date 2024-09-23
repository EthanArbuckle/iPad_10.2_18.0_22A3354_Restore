@implementation NSArray(PSSpecifierUpdates)

- (id)arrayByPerformingSpecifierUpdatesUsingBlock:()PSSpecifierUpdates
{
  void (**v4)(id, void *);
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    +[PSSpecifierUpdates updatesWithSpecifiers:](PSSpecifierUpdates, "updatesWithSpecifiers:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);

    objc_msgSend(v5, "currentSpecifiers");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = a1;
  }
  return v6;
}

@end
