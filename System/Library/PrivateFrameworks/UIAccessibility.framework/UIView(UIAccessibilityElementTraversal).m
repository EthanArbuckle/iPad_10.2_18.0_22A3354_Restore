@implementation UIView(UIAccessibilityElementTraversal)

+ (id)_subviewsReplacedByModalViewSubviewsIfNecessary:()UIAccessibilityElementTraversal
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (!v5)
  {
    v7 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v30 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (objc_msgSend(v10, "accessibilityViewIsModal")
        && objc_msgSend(v10, "_accessibilityViewIsVisible"))
      {
        v11 = v10;

        v7 = v11;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  }
  while (v6);

  if (v7)
  {
    v24 = v3;
    objc_msgSend(v7, "_accessibilityObscuredScreenAllowedViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_accessibilityWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v4 = v12;
    v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v4);
          v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          objc_msgSend(v19, "_accessibilityWindow");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          if (v19 != v14)
          {
            if (v14 == (void *)v20
              || (AXUIKeyboardWindow(), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, v21 != v22))
            {
              objc_msgSend(v13, "addObject:", v19);
            }
          }

        }
        v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v16);
    }

    v3 = v13;
    goto LABEL_25;
  }
LABEL_26:

  return v3;
}

- (uint64_t)_accessibilityShouldUseSupplementaryViews
{
  if ((objc_msgSend(a1, "_accessibilityHasOrderedChildren") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isAccessibilityElement");
}

- (id)_accessibilitySubviewsForGettingElementsWithOptions:()UIAccessibilityElementTraversal
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  int v21;
  void *v22;
  char v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  id v54;
  int v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_accessibilitySubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogElementTraversal();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[UIView(UIAccessibilityElementTraversal) _accessibilitySubviewsForGettingElementsWithOptions:].cold.4();

  if ((objc_msgSend(v4, "shouldUseAllSubviews") & 1) != 0)
  {
    v9 = v7;
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0CEABB0], "_subviewsReplacedByModalViewSubviewsIfNecessary:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogElementTraversal();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[UIView(UIAccessibilityElementTraversal) _accessibilitySubviewsForGettingElementsWithOptions:].cold.3();

  if ((objc_msgSend(v4, "shouldIncludeKeyboardObscuredElements") & 1) == 0)
  {
    v54 = v4;
    v11 = v9;
    v12 = a1;
    v13 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilitySoftwareKeyboardActive");
    objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    AXUIAllKeyboardWindows();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (!v16)
      goto LABEL_39;
    v17 = v16;
    v18 = *(_QWORD *)v66;
    v56 = v12;
    v57 = v9;
    v55 = v13;
    v59 = v15;
    while (1)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v66 != v18)
          objc_enumerationMutation(v15);
        v20 = *(id *)(*((_QWORD *)&v65 + 1) + 8 * v19);
        if (v20 != v12)
        {
          if (v20 == v14)
            v21 = 0;
          else
            v21 = v13;
          if (v21 != 1)
            goto LABEL_34;
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v19), "_accessibilityIsDescendantOfElement:", v14) & 1) != 0)
            goto LABEL_34;
          objc_msgSend(v20, "window");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v60, "containsObject:", v22);

          v15 = v59;
          if ((v23 & 1) != 0)
            goto LABEL_34;
          objc_msgSend(v20, "accessibilityFrame");
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v31 = v30;
          AXDeviceGetMainScreenBounds();
          v75.origin.x = v32;
          v75.origin.y = v33;
          v75.size.width = v34;
          v75.size.height = v35;
          v72.origin.x = v25;
          v72.origin.y = v27;
          v72.size.width = v29;
          v72.size.height = v31;
          v73 = CGRectIntersection(v72, v75);
          x = v73.origin.x;
          y = v73.origin.y;
          width = v73.size.width;
          height = v73.size.height;
          if (CGRectIsEmpty(v73))
            goto LABEL_34;
          objc_msgSend(v14, "accessibilityFrame");
          v76.origin.x = x;
          v76.origin.y = y;
          v76.size.width = width;
          v76.size.height = height;
          if (!CGRectContainsRect(v74, v76))
            goto LABEL_34;
          objc_msgSend(v20, "window");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v40 = v60;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
          v42 = 3.40282347e38;
          if (v41)
          {
            v43 = v41;
            v44 = *(_QWORD *)v62;
            v42 = 3.40282347e38;
            do
            {
              for (i = 0; i != v43; ++i)
              {
                if (*(_QWORD *)v62 != v44)
                  objc_enumerationMutation(v40);
                v46 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
                objc_msgSend(v46, "level");
                if (v47 < v42)
                {
                  objc_msgSend(v46, "level");
                  v42 = v48;
                }
              }
              v43 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
            }
            while (v43);
          }

          if ((objc_msgSend(v40, "containsObject:", v58) & 1) == 0)
          {
            objc_msgSend(v58, "level");
            if (v49 > v42)
            {

              v12 = v56;
              v9 = v57;
              v13 = v55;
              v15 = v59;
LABEL_34:
              objc_msgSend(v9, "addObject:", v20);
              goto LABEL_35;
            }
          }

          v12 = v56;
          v9 = v57;
          v13 = v55;
          v15 = v59;
        }
LABEL_35:
        ++v19;
      }
      while (v19 != v17);
      v50 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      v17 = v50;
      if (!v50)
      {
LABEL_39:

        AXLogElementTraversal();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          -[UIView(UIAccessibilityElementTraversal) _accessibilitySubviewsForGettingElementsWithOptions:].cold.2();

        v4 = v54;
        break;
      }
    }
  }
  AXLogElementTraversal();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    -[UIView(UIAccessibilityElementTraversal) _accessibilitySubviewsForGettingElementsWithOptions:].cold.1();

LABEL_45:
  return v9;
}

+ (id)_accessibilityElementsAndContainersDescendingFromViews:()UIAccessibilityElementTraversal options:sorted:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v13, "_accessibilityAdditionalElements");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ax_filteredArrayUsingBlock:", &__block_literal_global_399);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "axSafelyAddObjectsFromArray:", v15);

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v13, "_accessibilitySubviewsForGettingElementsWithOptions:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v27 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "_addAccessibilityElementsAndOrderedContainersWithOptions:toCollection:", v7, v8);
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v18);
        }

        objc_msgSend(v13, "_accessibilityAdditionalElements");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "ax_filteredArrayUsingBlock:", &__block_literal_global_400);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "axSafelyAddObjectsFromArray:", v22);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  if (a5)
    objc_msgSend(v8, "sortUsingSelector:", sel__accessibilityCompareGeometryForViewOrDictionary_);

  return v8;
}

- (uint64_t)_accessibilityIsSortingInUpperFrame
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)_accessibilitySetIsSortingInUpperFrame:()UIAccessibilityElementTraversal
{
  return __UIAccessibilitySetAssociatedBool();
}

- (id)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "_accessibilityIsSortingInUpperFrame");
  if ((v5 & 1) == 0)
    objc_msgSend(a1, "_accessibilitySetIsSortingInUpperFrame:", 1);
  v6 = (void *)objc_opt_class();
  v10[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilityElementsAndContainersDescendingFromViews:options:sorted:", v7, v4, objc_msgSend(v4, "sorted") & (v5 ^ 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v5 & 1) == 0)
    objc_msgSend(a1, "_accessibilitySetIsSortingInUpperFrame:", 0);
  return v8;
}

- (uint64_t)_accessibilityShouldBeProcessed:()UIAccessibilityElementTraversal
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  if (objc_msgSend(v4, "includeWindowlessViews"))
  {
    objc_msgSend(a1, "frame");
    if (v5 > 1.0)
    {
      objc_msgSend(a1, "frame");
      if (v6 > 1.0 && (objc_msgSend(a1, "isHidden") & 1) == 0)
      {
        objc_msgSend(a1, "alpha");
        if (v7 > 0.0)
          goto LABEL_24;
      }
    }
  }
  if ((objc_msgSend(a1, "_accessibilityViewIsVisible") & 1) != 0
    || objc_msgSend(v4, "includeHiddenViews"))
  {
    objc_msgSend(a1, "accessibilityFrame");
    v10 = v9 < 1.0 && v8 < 1.0;
    if (!v10 || objc_msgSend(a1, "_accessibilityOverridesInvalidFrames"))
    {
      if ((UIAccessibilityIsWidgetExtension() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_24;
        objc_msgSend(a1, "_accessibilityAncestorIsKindOf:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {

          goto LABEL_24;
        }
        objc_msgSend(a1, "_accessibilityAncestorIsKindOf:", objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          goto LABEL_24;
      }
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityContainerToStopVisibilityCheck");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {

LABEL_24:
        v13 = 1;
        goto LABEL_25;
      }
      if ((objc_msgSend(a1, "_accessibilityIsFrameOutOfBounds") & 1) == 0)
        goto LABEL_24;
    }
  }
  v13 = 0;
LABEL_25:

  return v13;
}

- (void)_accessibilitySubviewsForGettingElementsWithOptions:()UIAccessibilityElementTraversal .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "After filtering obscured: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilitySubviewsForGettingElementsWithOptions:()UIAccessibilityElementTraversal .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "After filtering elements behind KB: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilitySubviewsForGettingElementsWithOptions:()UIAccessibilityElementTraversal .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "After replacing with modal views: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilitySubviewsForGettingElementsWithOptions:()UIAccessibilityElementTraversal .cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_19D0DD000, v0, v1, "Self: %{public}@. Subviews: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
