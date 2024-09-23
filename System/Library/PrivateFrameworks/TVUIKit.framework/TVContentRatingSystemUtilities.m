@implementation TVContentRatingSystemUtilities

void __64___TVContentRatingSystemUtilities__ratingSystemLookUpDictionary__block_invoke()
{
  uint64_t i;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  for (i = 0; i != 2480; i += 16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(__CFString **)((char *)&__RatingSystems + i + 8));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v1, *(__CFString **)((char *)&__RatingSystems + i));

  }
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)_ratingSystemLookUpDictionary___ratingSystemLookUpDictionary;
  _ratingSystemLookUpDictionary___ratingSystemLookUpDictionary = v2;

}

void __70___TVContentRatingSystemUtilities__ratingSystemStringLookUpDictionary__block_invoke()
{
  uint64_t i;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  for (i = 0; i != 2480; i += 16)
  {
    v1 = *(uint64_t *)((char *)&__RatingSystems + i);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(__CFString **)((char *)&__RatingSystems + i + 8));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v1, v2);

  }
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)_ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary;
  _ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary = v3;

}

@end
