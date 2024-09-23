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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create("com.apple.stocks", "serviceLogging");
  objc_msgSend(v7, "na_safeSetObject:forKey:", v0, &unk_24D75F010);

  v1 = os_log_create("com.apple.stocks", "syncLogging");
  objc_msgSend(v7, "na_safeSetObject:forKey:", v1, &unk_24D75F028);

  v2 = os_log_create("com.apple.stocks", "duetLogging");
  objc_msgSend(v7, "na_safeSetObject:forKey:", v2, &unk_24D75F040);

  v3 = os_log_create("com.apple.stocks", "widgetLogging");
  objc_msgSend(v7, "na_safeSetObject:forKey:", v3, &unk_24D75F058);

  v4 = os_log_create("com.apple.stocks", "watchlistLogging");
  objc_msgSend(v7, "na_safeSetObject:forKey:", v4, &unk_24D75F070);

  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)StocksLogForCategory_loggingTypes;
  StocksLogForCategory_loggingTypes = v5;

}

@end
