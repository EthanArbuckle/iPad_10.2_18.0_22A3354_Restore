@implementation NSMutableArray(PSSpecifierUpdates)

- (void)performSpecifierUpdatesUsingBlock:()PSSpecifierUpdates
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    +[PSSpecifierUpdates updatesWithSpecifiers:](PSSpecifierUpdates, "updatesWithSpecifiers:", a1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);

    objc_msgSend(v6, "currentSpecifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setArray:", v5);

  }
}

@end
