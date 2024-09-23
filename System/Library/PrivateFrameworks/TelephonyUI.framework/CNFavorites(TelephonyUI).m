@implementation CNFavorites(TelephonyUI)

- (id)entriesMatchingPredicate:()TelephonyUI
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
