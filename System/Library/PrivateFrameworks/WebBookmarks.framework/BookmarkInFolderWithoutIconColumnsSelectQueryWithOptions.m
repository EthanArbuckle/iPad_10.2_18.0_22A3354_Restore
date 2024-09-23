@implementation BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions

void __BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  BookmarkSQLiteColumnNames();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeObject:", CFSTR("bookmarks.icon"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_columnsStringWithoutIcon;
  BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_columnsStringWithoutIcon = v1;

}

@end
