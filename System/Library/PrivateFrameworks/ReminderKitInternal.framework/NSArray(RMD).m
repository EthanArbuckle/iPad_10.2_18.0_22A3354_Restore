@implementation NSArray(RMD)

- (uint64_t)shuffledArrayWithRandomSource:()RMD
{
  return objc_msgSend(a3, "arrayByShufflingObjectsInArray:", a1);
}

- (id)shuffledArray
{
  void *v2;
  void *v3;

  +[RMDRandomSource sharedRandom](RMDRandomSource, "sharedRandom");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "shuffledArrayWithRandomSource:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
