@implementation PODirectoryServices

- (id)uniqueIdentifierForUserName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (PO_LOG_PODirectoryServices_once != -1)
    dispatch_once(&PO_LOG_PODirectoryServices_once, &__block_literal_global);
  v5 = (void *)PO_LOG_PODirectoryServices_log;
  if (os_log_type_enabled((os_log_t)PO_LOG_PODirectoryServices_log, OS_LOG_TYPE_DEBUG))
    -[PODirectoryServices uniqueIdentifierForUserName:].cold.1(v5, v4);
  objc_msgSend(v4, "alternateDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)shortNameForUserName:(id)a3
{
  return 0;
}

- (void)uniqueIdentifierForUserName:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "alternateDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138477827;
  v6 = v4;
  _os_log_debug_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEBUG, "Current altDSID: %{private}@", (uint8_t *)&v5, 0xCu);

}

@end
