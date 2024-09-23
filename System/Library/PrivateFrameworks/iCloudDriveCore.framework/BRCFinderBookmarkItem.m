@implementation BRCFinderBookmarkItem

- (BOOL)isFinderBookmark
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (-[BRCStatInfo type](self->super.super._st, "type") != 6
    && -[BRCStatInfo type](self->super.super._st, "type") != 7)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCFinderBookmarkItem isFinderBookmark].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return 1;
}

- (BOOL)isShareableItem
{
  return 0;
}

- (id)asShareableItem
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCFinderBookmarkItem asShareableItem].cold.1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (id)documentRecordID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[BRCItemID itemIDString](self->super.super._itemID, "itemIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("finderBookmark/"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x24BDB91E8]);
  -[BRCServerZone zoneID](self->super.super._serverZone, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRecordName:zoneID:", v4, v6);

  return v7;
}

- (void)isFinderBookmark
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: _st.type == BRC_ITEM_TYPE_FINDER_BOOKMARK || _st.type == BRC_ITEM_TYPE_FINDER_BOOKMARK_FAULT%@", a5, a6, a7, a8, 2u);
}

- (void)asShareableItem
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] UNREACHABLE: -asShareableItem called on a non-shareable item%@", a5, a6, a7, a8, 2u);
}

@end
