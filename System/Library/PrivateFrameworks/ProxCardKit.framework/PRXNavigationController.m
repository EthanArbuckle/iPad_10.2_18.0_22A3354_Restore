@implementation PRXNavigationController

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  PRXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PRXNavigationController preferredContentSizeDidChangeForChildContentContainer:].cold.1((uint64_t)v4, v5);

  -[PRXNavigationController topViewController](self, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "isEqual:", v4))
  {
    objc_msgSend(v4, "preferredContentSize");
    -[PRXNavigationController setPreferredContentSize:](self, "setPreferredContentSize:");
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21161A000, a2, OS_LOG_TYPE_DEBUG, "preferredContentSizeDidChangeForChildContentContainer: %@", (uint8_t *)&v2, 0xCu);
}

@end
