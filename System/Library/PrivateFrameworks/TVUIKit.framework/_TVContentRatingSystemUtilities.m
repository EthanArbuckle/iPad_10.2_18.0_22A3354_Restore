@implementation _TVContentRatingSystemUtilities

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

+ (id)stringForRatingSystem:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_ratingSystemStringLookUpDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  return (unint64_t)(a3 - 142) < 0xB;
}

+ (id)_ratingSystemLookUpDictionary
{
  if (_ratingSystemLookUpDictionary___once != -1)
    dispatch_once(&_ratingSystemLookUpDictionary___once, &__block_literal_global_3);
  return (id)_ratingSystemLookUpDictionary___ratingSystemLookUpDictionary;
}

+ (id)_ratingSystemStringLookUpDictionary
{
  if (_ratingSystemStringLookUpDictionary___once != -1)
    dispatch_once(&_ratingSystemStringLookUpDictionary___once, &__block_literal_global_3_0);
  return (id)_ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary;
}

+ (id)_cleanedRatingSystem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24FD41578);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
