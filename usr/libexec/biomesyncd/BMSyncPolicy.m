@implementation BMSyncPolicy

+ (double)minimumTimeBetweenSyncsForTransport:(unint64_t)a3
{
  double result;

  result = dbl_1000504F0[a3 == 3];
  if (a3 == 2)
    return 3600.0;
  return result;
}

+ (double)minimumTimeBetweenSyncsAttemptsForTransport:(unint64_t)a3
{
  double result;

  result = dbl_1000504F0[a3 == 3];
  if (a3 == 2)
    return 3600.0;
  return result;
}

@end
