@implementation UIWindowScene(UIAccessibilityElementTraversal)

- (id)_accessibilityTraversalWindows
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldIncludeStatusBarWindow:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityTraversalWindowsWithOptions:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "axSafelyAddObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_accessibilityTraversalWindowsWithOptions:()UIAccessibilityElementTraversal
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  v4 = a3;
  objc_msgSend(a1, "_visibleWindows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "sortWithOptions:usingComparator:", 16, &__block_literal_global_411);
  v7 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityMainWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != a1)
  {
    objc_msgSend(*v7, "_accessibilityMainWindowInWindows:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(a1, "keyWindow");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    v8 = v13;
  }
  objc_msgSend(*v7, "_accessibilityElementWindowsWithOptions:referenceWindow:allWindows:", v4, v8, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  const __CFString *v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = a1;
  objc_msgSend(a1, "_accessibilityTraversalWindowsWithOptions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0x1E0CEA000uLL;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(v9 + 2992), "_accessibilityElementsAndContainersDescendingFromViews:options:sorted:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11), v4, objc_msgSend(v4, "sorted"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if (objc_msgSend(v4, "shouldReturnScannerGroups")
            && (unint64_t)objc_msgSend(v6, "count") >= 2)
          {
            v13 = v5;
            v14 = (void *)MEMORY[0x1E0C99E08];
            v26 = CFSTR("GroupElements");
            v27 = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "dictionaryWithDictionary:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E3E10850, CFSTR("GroupTraits"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v21, "_accessibilityScanningBehaviorTraits") | 0x10);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("GroupScanBehaviorTraits"));

            objc_msgSend(v21, "_accessibilityGroupIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("GroupIdentifier"));
            v5 = v13;
            objc_msgSend(v13, "addObject:", v16);

            v9 = 0x1E0CEA000;
          }
          else
          {
            objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v12);
          }
        }

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v8);
  }
  AXLogElementTraversal();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[UIWindowScene(UIAccessibilityElementTraversal) _accessibilityViewChildrenWithOptions:].cold.1();

  return v5;
}

- (void)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Children of the window scene are %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
