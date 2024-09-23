@implementation NSNull(PBFSQLiteQueryBuilderAdditions)

- (const)pbf_valueForSQLiteQuery
{
  return CFSTR("NULL");
}

@end
