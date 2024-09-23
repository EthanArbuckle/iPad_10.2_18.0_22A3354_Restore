@implementation BRCUserActionsNavigator

+ (id)defaultNavigator
{
  if (defaultNavigator_onceToken != -1)
    dispatch_once(&defaultNavigator_onceToken, &__block_literal_global_17);
  return (id)defaultNavigator_navigator;
}

void __43__BRCUserActionsNavigator_defaultNavigator__block_invoke()
{
  BRCUserActionsNavigator *v0;
  void *v1;

  v0 = objc_alloc_init(BRCUserActionsNavigator);
  v1 = (void *)defaultNavigator_navigator;
  defaultNavigator_navigator = (uint64_t)v0;

}

- (void)openShareURLInWebBrowser:(id)a3 withReason:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
      goto LABEL_3;
    goto LABEL_22;
  }
  brc_bread_crumbs();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    -[BRCUserActionsNavigator openShareURLInWebBrowser:withReason:].cold.3();

  if (!v7)
  {
LABEL_22:
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      -[BRCUserActionsNavigator openShareURLInWebBrowser:withReason:].cold.2();

  }
LABEL_3:
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScheme:", CFSTR("https"));
  objc_msgSend(v8, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "rangeOfString:", CFSTR("redirectReason")) != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_8;
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("&%@=%@"), CFSTR("redirectReason"), v7);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("redirectReason"), v7);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  objc_msgSend(v8, "setQuery:", v11);

LABEL_8:
  objc_msgSend(v8, "fragment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasSuffix:", CFSTR(":nooverride"));

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v8, "fragment");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = &stru_24FE4A790;
    if (v15)
      v17 = (__CFString *)v15;
    v18 = v17;

    -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", CFSTR(":nooverride"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setFragment:", v19);
  }
  objc_msgSend(v8, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v35 = v7;
    v36 = 2112;
    v37 = v20;
    v38 = 2112;
    v39 = v21;
    _os_log_debug_impl(&dword_230455000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Opening in web browser (reason: %@) %@%@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x24BDC14D0];
  v33 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "openURL:withOptions:", v20, v24);

  if ((v25 & 1) == 0)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      -[BRCUserActionsNavigator openShareURLInWebBrowser:withReason:].cold.1();

  }
}

- (void)openiCloudSettings
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Ubiquity"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)openAppStoreForBundleID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("itms-apps://?bundleIdentifier=%@"), a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      -[BRCUserActionsNavigator openAppStoreForBundleID:].cold.1();

  }
}

- (void)openShareURLInWebBrowser:withReason:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_230455000, v1, (os_log_type_t)0x90u, "[ERROR] Can't open \"%@\" using default web browser%@", v2, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)openShareURLInWebBrowser:withReason:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: redirectReason%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)openShareURLInWebBrowser:withReason:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: shareURL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)openAppStoreForBundleID:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] passed nil app bundle ID%@", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

@end
