@implementation BookmarkSQLiteColumns

void __BookmarkSQLiteColumns_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  BookmarkSQLiteColumnNames();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BookmarkSQLiteColumns_columns;
  BookmarkSQLiteColumns_columns = v0;

}

@end
