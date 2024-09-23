@implementation NSNumber

void __67__NSNumber_PBFSQLiteQueryBuilderAdditions__pbf_valueForSQLiteQuery__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)pbf_valueForSQLiteQuery_numberFormatter;
  pbf_valueForSQLiteQuery_numberFormatter = (uint64_t)v0;

  v2 = (void *)pbf_valueForSQLiteQuery_numberFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

@end
