@implementation NSBundle

void __70__NSBundle_UIAccessibilityLoader___loadAXBundleForBundleOffMainThread__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 || a2)
  {
    AXLogLoading();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __70__NSBundle_UIAccessibilityLoader___loadAXBundleForBundleOffMainThread__block_invoke_cold_1((uint64_t)v4, v5);

    v12 = v4;
    +[UIAccessibilityLoader _accessibilityBundlesForBundle:](UIAccessibilityLoader, "_accessibilityBundlesForBundle:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            _AXAssert();
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            +[UIAccessibilityLoader loadAccessibilityBundleForBundle:didLoadCallback:](UIAccessibilityLoader, "loadAccessibilityBundleForBundle:didLoadCallback:", v11, 0);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    AXPerformBlockAsynchronouslyOnMainThread();

    v4 = v12;
  }

}

void __70__NSBundle_UIAccessibilityLoader___loadAXBundleForBundleOffMainThread__block_invoke_2()
{
  id v0;

  +[UIAccessibilityInformationLoader sharedInstance](UIAccessibilityInformationLoader, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setNeedsLoadAccessibilityInformation");

}

void __70__NSBundle_UIAccessibilityLoader___loadAXBundleForBundleOffMainThread__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_19D0DD000, a2, OS_LOG_TYPE_DEBUG, "Main bundle: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
