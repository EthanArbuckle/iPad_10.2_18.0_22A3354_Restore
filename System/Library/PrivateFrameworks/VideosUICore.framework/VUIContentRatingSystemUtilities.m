@implementation VUIContentRatingSystemUtilities

+ (id)stringForRatingSystem:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_ratingSystemStringLookUpDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_ratingSystemStringLookUpDictionary
{
  if (_ratingSystemStringLookUpDictionary___once != -1)
    dispatch_once(&_ratingSystemStringLookUpDictionary___once, &__block_literal_global_3);
  return (id)_ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary;
}

void __70__VUIContentRatingSystemUtilities__ratingSystemStringLookUpDictionary__block_invoke()
{
  uint64_t i;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  for (i = 0; i != 2496; i += 16)
  {
    v1 = *(uint64_t *)((char *)&__RatingSystems + i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(__CFString **)((char *)&__RatingSystems + i + 8));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v1, v2);

  }
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)_ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary;
  _ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary = v3;

}

void __64__VUIContentRatingSystemUtilities__ratingSystemLookUpDictionary__block_invoke()
{
  uint64_t i;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  for (i = 0; i != 2496; i += 16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(__CFString **)((char *)&__RatingSystems + i + 8));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v1, *(__CFString **)((char *)&__RatingSystems + i));

  }
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)_ratingSystemLookUpDictionary___ratingSystemLookUpDictionary;
  _ratingSystemLookUpDictionary___ratingSystemLookUpDictionary = v2;

}

+ (int64_t)ratingSystemForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  objc_msgSend(a1, "_ratingSystemLookUpDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cleanedRatingSystem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("s"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = objc_msgSend(v7, "unsignedIntegerValue");

  return v9;
}

+ (id)_ratingSystemLookUpDictionary
{
  if (_ratingSystemLookUpDictionary___once != -1)
    dispatch_once(&_ratingSystemLookUpDictionary___once, &__block_literal_global_1);
  return (id)_ratingSystemLookUpDictionary___ratingSystemLookUpDictionary;
}

+ (id)_cleanedRatingSystem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E9F2D140);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)ratingSystemKindForRatingSystem:(int64_t)a3
{
  if ((objc_msgSend(a1, "_isRatingSystemForMovies:") & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "_isRatingSystemForTV:", a3) & 1) != 0)
    return 2;
  if (objc_msgSend(a1, "_isRatingSystemForMusic:", a3))
    return 3;
  return 0;
}

+ (BOOL)_isRatingSystemForMovies:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 0x8C;
}

+ (BOOL)_isRatingSystemForMusic:(int64_t)a3
{
  return a3 == 1;
}

+ (BOOL)_isRatingSystemForTV:(int64_t)a3
{
  return (unint64_t)(a3 - 142) < 0xC;
}

@end
