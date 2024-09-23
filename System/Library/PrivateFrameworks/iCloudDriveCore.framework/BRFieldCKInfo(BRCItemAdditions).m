@implementation BRFieldCKInfo(BRCItemAdditions)

- (void)revertEtagsForOldZoneTombstone
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "etagBeforeCrossZoneMove");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Reverting etag to pre-czm tag %@%@", (uint8_t *)&v6, 0x16u);

}

@end
