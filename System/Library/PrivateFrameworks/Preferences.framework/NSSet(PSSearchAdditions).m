@implementation NSSet(PSSearchAdditions)

- (id)setByIntersectingWithSet:()PSSearchAdditions
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "setWithSet:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intersectSet:", v5);

  return v6;
}

@end
