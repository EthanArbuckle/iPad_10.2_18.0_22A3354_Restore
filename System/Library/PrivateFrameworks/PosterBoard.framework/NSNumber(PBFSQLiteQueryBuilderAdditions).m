@implementation NSNumber(PBFSQLiteQueryBuilderAdditions)

- (uint64_t)pbf_valueForSQLiteQuery
{
  if (pbf_valueForSQLiteQuery___once != -1)
    dispatch_once(&pbf_valueForSQLiteQuery___once, &__block_literal_global_284);
  return objc_msgSend((id)pbf_valueForSQLiteQuery_numberFormatter, "stringFromNumber:", a1);
}

@end
