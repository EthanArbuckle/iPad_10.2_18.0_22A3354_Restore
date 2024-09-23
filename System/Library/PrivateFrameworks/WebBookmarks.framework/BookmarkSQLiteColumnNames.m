@implementation BookmarkSQLiteColumnNames

void __BookmarkSQLiteColumnNames_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[26];

  v2[25] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("bookmarks.type");
  v2[1] = CFSTR("bookmarks.title");
  v2[2] = CFSTR("bookmarks.url");
  v2[3] = CFSTR("bookmarks.id");
  v2[4] = CFSTR("bookmarks.editable");
  v2[5] = CFSTR("bookmarks.deletable");
  v2[6] = CFSTR("bookmarks.hidden");
  v2[7] = CFSTR("bookmarks.parent");
  v2[8] = CFSTR("bookmarks.order_index");
  v2[9] = CFSTR("bookmarks.external_uuid");
  v2[10] = CFSTR("bookmarks.special_id");
  v2[11] = CFSTR("bookmarks.server_id");
  v2[12] = CFSTR("bookmarks.sync_key");
  v2[13] = CFSTR("bookmarks.sync_data");
  v2[14] = CFSTR("bookmarks.extra_attributes");
  v2[15] = CFSTR("bookmarks.local_attributes");
  v2[16] = CFSTR("bookmarks.fetched_icon");
  v2[17] = CFSTR("bookmarks.icon");
  v2[18] = CFSTR("bookmarks.locally_added");
  v2[19] = CFSTR("bookmarks.archive_status");
  v2[20] = CFSTR("bookmarks.syncable");
  v2[21] = CFSTR("bookmarks.web_filter_status");
  v2[22] = CFSTR("bookmarks.modified_attributes");
  v2[23] = CFSTR("bookmarks.last_selected_child");
  v2[24] = CFSTR("bookmarks.subtype");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 25);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BookmarkSQLiteColumnNames_columns;
  BookmarkSQLiteColumnNames_columns = v0;

}

@end
