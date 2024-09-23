@implementation StocksLogForCategory

void __StocksLogForCategory_block_invoke()
{
  os_log_t v0;
  os_log_t v1;
  os_log_t v2;
  os_log_t v3;
  os_log_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create("com.apple.stocks", "serviceLogging");
  objc_msgSend(v7, "scw_safelySetObjectAllowingNil:forKey:", v0, &unk_1E5B1BEB0);

  v1 = os_log_create("com.apple.stocks", "syncLogging");
  objc_msgSend(v7, "scw_safelySetObjectAllowingNil:forKey:", v1, &unk_1E5B1BEC8);

  v2 = os_log_create("com.apple.stocks", "duetLogging");
  objc_msgSend(v7, "scw_safelySetObjectAllowingNil:forKey:", v2, &unk_1E5B1BEE0);

  v3 = os_log_create("com.apple.stocks", "widgetLogging");
  objc_msgSend(v7, "scw_safelySetObjectAllowingNil:forKey:", v3, &unk_1E5B1BEF8);

  v4 = os_log_create("com.apple.stocks", "watchlistLogging");
  objc_msgSend(v7, "scw_safelySetObjectAllowingNil:forKey:", v4, &unk_1E5B1BF10);

  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)StocksLogForCategory_loggingTypes;
  StocksLogForCategory_loggingTypes = v5;

}

@end
