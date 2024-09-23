@implementation MTLibraryLegacyUtil

+ (int64_t)playStateFromHasBeenPlayed:(BOOL)a3 andPlayCount:(int64_t)a4
{
  int64_t v4;

  v4 = 1;
  if (!a3)
    v4 = 2;
  if (a4 <= 0)
    return v4;
  else
    return 0;
}

+ (BOOL)hasBeenPlayedForPlayState:(int64_t)a3
{
  return a3 != 2;
}

+ (int64_t)legacyPlayCountForPlayState:(int64_t)a3 playCount:(int64_t)a4
{
  int64_t v4;

  if ((unint64_t)a4 <= 1)
    v4 = 1;
  else
    v4 = a4;
  if (a3)
    return 0;
  else
    return v4;
}

@end
