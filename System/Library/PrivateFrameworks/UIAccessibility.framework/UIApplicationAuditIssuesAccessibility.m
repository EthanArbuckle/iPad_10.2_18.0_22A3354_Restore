@implementation UIApplicationAuditIssuesAccessibility

+ (id)_axAuditGetCellReferenceMapTable
{
  return (id)cellReferenceMapTable;
}

+ (id)_accessibilityGetAllSubviews:(id)a3 withFiltering:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  char v32;
  BOOL v33;
  void *v34;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "axArrayByIgnoringNilElementsWithCount:", 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v8 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      objc_msgSend(v5, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectAtIndex:", 0);
      if (!v4)
        goto LABEL_15;
      objc_msgSend(v10, "bounds");
      if (v8 != v12 || v9 != v11)
      {
        objc_msgSend(v10, "bounds");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(v10, "window");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "convertRect:toView:", v22, v15, v17, v19, v21);
        v24 = v23;
        v26 = v25;

        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "bounds");
        v29 = v28;
        v31 = v30;

        if ((objc_msgSend(v10, "isHidden") & 1) == 0)
        {
          v32 = objc_msgSend(v10, "accessibilityElementsHidden");
          v33 = v24 <= v29 && v26 <= v31;
          if (v33 && (v32 & 1) == 0)
          {
LABEL_15:
            if ((objc_msgSend(v6, "containsObject:", v10) & 1) == 0)
            {
              objc_msgSend(v10, "subviews");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObjectsFromArray:", v34);
              objc_msgSend(v6, "addObject:", v10);

            }
          }
        }
      }

      if (!objc_msgSend(v5, "count"))
        break;
    }
    while (v7++ < 0x270F);
  }

  return v6;
}

+ (id)_accessibilityGetAllSwiftUISubviews:(id)a3 withFiltering:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unsigned int v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "axArrayByIgnoringNilElementsWithCount:", 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  if (objc_msgSend(v5, "count"))
  {
    v12 = 0;
    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      objc_msgSend(v5, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectAtIndex:", 0);
      v16 = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v15, "automationElements");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v5, "addObjectsFromArray:", v16);
      }
      else if (!v4
             || (objc_opt_respondsToSelector() & 1) == 0
             || ((objc_msgSend(v15, "accessibilityFrame"), v13 != v20) || v14 != v19) && v17 <= v9 && v18 <= v11)
      {
        objc_msgSend(v6, "addObject:", v15);
      }

      if (!objc_msgSend(v5, "count"))
        break;
    }
    while (v12++ < 0x270F);
  }

  return v6;
}

+ (id)_axAuditGetAllFontSizes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[13];

  v12[12] = *MEMORY[0x1E0C80C00];
  v2 = (void *)ALLFONTSIZES;
  if (!ALLFONTSIZES)
  {
    v3 = *MEMORY[0x1E0CEB438];
    v12[0] = *MEMORY[0x1E0CEB410];
    v12[1] = v3;
    v4 = *MEMORY[0x1E0CEB420];
    v12[2] = *MEMORY[0x1E0CEB428];
    v12[3] = v4;
    v5 = *MEMORY[0x1E0CEB400];
    v12[4] = *MEMORY[0x1E0CEB408];
    v12[5] = v5;
    v6 = *MEMORY[0x1E0CEB3E0];
    v12[6] = *MEMORY[0x1E0CEB3F8];
    v12[7] = v6;
    v7 = *MEMORY[0x1E0CEB3D0];
    v12[8] = *MEMORY[0x1E0CEB3D8];
    v12[9] = v7;
    v8 = *MEMORY[0x1E0CEB3C0];
    v12[10] = *MEMORY[0x1E0CEB3C8];
    v12[11] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 12);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)ALLFONTSIZES;
    ALLFONTSIZES = v9;

    v2 = (void *)ALLFONTSIZES;
  }
  return v2;
}

+ (id)_axAuditFindAllTablesInHierarchyForView:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  do
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "addObject:", v3);
    objc_msgSend(v3, "superview");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  while (v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

+ (id)_axAuditFindAllTablesInHierarchyForElements:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "_axAuditFindAllTablesInHierarchyForView:", v11, (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
            objc_msgSend(v5, "unionSet:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

+ (id)_axAuditFindAllCollectionViewsInHierarchyForView:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  do
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "addObject:", v3);
    objc_msgSend(v3, "superview");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  while (v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

+ (id)_axAuditFindAllCollectionViewsInHierarchyForElements:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "_axAuditFindAllCollectionViewsInHierarchyForView:", v11, (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
            objc_msgSend(v5, "unionSet:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

+ (void)_axAuditUpdateRowHeightForTableAndCollectionViewsOfElements:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_axAuditFindAllTablesInHierarchyForElements:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "beginUpdates");
        objc_msgSend(v10, "endUpdates");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }
  objc_msgSend(a1, "_axAuditFindAllCollectionViewsInHierarchyForElements:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
        objc_msgSend(v16, "reloadData");
        objc_msgSend(v16, "layoutIfNeeded");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

}

+ (void)_axAuditRemoveUIViewsFromArray:(id)a3 usingFilter:(id)a4
{
  id v5;
  unsigned int (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (unsigned int (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "count");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend(v5, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6[2](v6, v11))
      {
        objc_msgSend(v7, "addIndex:", i);
        objc_msgSend(v24, "addObject:", v11);
      }

    }
  }
  objc_msgSend(v5, "removeObjectsAtIndexes:", v7, v7);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "count");
  if (v13)
  {
    v14 = v13;
    for (j = 0; j != v14; ++j)
    {
      objc_msgSend(v5, "objectAtIndex:", j);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v18 = v24;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v26;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v26 != v21)
                objc_enumerationMutation(v18);
              if (objc_msgSend(v16, "isDescendantOfView:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22)))
                objc_msgSend(v12, "addIndex:", j);
              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v20);
        }

      }
      else
      {
        objc_msgSend(v12, "addIndex:", j);
      }

    }
  }
  objc_msgSend(v5, "removeObjectsAtIndexes:", v12);

}

+ (id)_axAuditFindFrontmostViewControllerForHierarchy:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = v3;
    do
    {
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObjectAtIndex:", 0);
      objc_msgSend(v6, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "presentedViewController");
        v8 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
        v9 = v4;
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v6, "topViewController"),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v10,
              v10))
        {
          v11 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v6, "topViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "arrayWithObject:", v9);
          v12 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v12;
        }
        else
        {
          objc_msgSend(v6, "childViewControllers");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v9);
        }
      }

    }
    while (objc_msgSend(v4, "count"));
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

+ (id)_axAuditGetFontForElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "textLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_26;
    objc_msgSend(v3, "detailTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIApplicationAuditIssuesAccessibility _axAuditGetFontAttrFromAttributedString:](UIApplicationAuditIssuesAccessibility, "_axAuditGetFontAttrFromAttributedString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = (void *)v7;

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_10;
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("font"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  if (!v5)
  {
LABEL_10:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "layoutManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "textStorage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          +[UIApplicationAuditIssuesAccessibility _axAuditGetFontAttrFromAttributedString:](UIApplicationAuditIssuesAccessibility, "_axAuditGetFontAttrFromAttributedString:", v11);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = 0;
        }

      }
      else
      {
        v5 = 0;
      }
      goto LABEL_25;
    }
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("_UITextContainerView")))
    {
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v3, "performSelector:", sel_textStorage);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (uint64_t)v10;
LABEL_22:
        +[UIApplicationAuditIssuesAccessibility _axAuditGetFontAttrFromAttributedString:](UIApplicationAuditIssuesAccessibility, "_axAuditGetFontAttrFromAttributedString:", v15);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {

    }
    objc_msgSend(v3, "_accessibilityAXAttributedValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isAXAttributedString"))
      v15 = objc_msgSend(v10, "cfAttributedString");
    else
      v15 = 0;
    goto LABEL_22;
  }
LABEL_26:
  v16 = v5;

  return v16;
}

+ (id)_axAuditGetFontForSwiftUIView:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_axAuditGetAttrLabelFromSwiftUIView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[UIApplicationAuditIssuesAccessibility _axAuditGetFontAttrFromAttributedString:](UIApplicationAuditIssuesAccessibility, "_axAuditGetFontAttrFromAttributedString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_axAuditGetFontAttrFromAttributedString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__1;
    v26 = __Block_byref_object_dispose__1;
    v27 = 0;
    v5 = objc_msgSend(v3, "length");
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__1;
    v20 = __Block_byref_object_dispose__1;
    v21 = 0;
    v12 = 0;
    v13 = (double *)&v12;
    v14 = 0x2020000000;
    v15 = 0xBFF0000000000000;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__UIApplicationAuditIssuesAccessibility__axAuditGetFontAttrFromAttributedString___block_invoke;
    v11[3] = &unk_1E3DFE230;
    v11[4] = &v22;
    v11[5] = &v16;
    v11[6] = &v12;
    objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v11);
    v6 = (void *)v23[5];
    if (!v6)
    {
      if (!v17[5] || v13[3] == -1.0)
      {
        v6 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithName:size:");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v23[5];
        v23[5] = v7;

        v6 = (void *)v23[5];
      }
    }
    v9 = v6;
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __81__UIApplicationAuditIssuesAccessibility__axAuditGetFontAttrFromAttributedString___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;

  v7 = a2;
  v8 = *MEMORY[0x1E0CEA098];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEA098]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    objc_msgSend(v7, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1[4] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a5 = 1;
  }
  else
  {
    v14 = (_QWORD *)MEMORY[0x1E0CF41A8];
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF41A8]);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      v17 = (_QWORD *)MEMORY[0x1E0CF41B0];
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF41B0]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_opt_class();
        objc_msgSend(v7, "objectForKey:", *v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v20 = objc_claimAutoreleasedReturnValue();

        v21 = *(_QWORD *)(a1[5] + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;

        objc_opt_class();
        objc_msgSend(v7, "objectForKey:", *v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "floatValue");
        *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v25;
        *a5 = 1;

      }
    }
  }

}

+ (id)_axAuditFindElementsNotSupportingDynamicText:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v54;
    v44 = (void *)*MEMORY[0x1E0CEB410];
    v40 = *(_QWORD *)v54;
    v41 = a1;
    do
    {
      v9 = 0;
      v42 = v7;
      do
      {
        if (*(_QWORD *)v54 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v9);
        objc_msgSend(v5, "objectForKey:", v10, v35, v36, v37, v38, v39);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12 >= 2)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "_axAuditGetTextFromObject:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v13, "length"))
              goto LABEL_40;
          }
          else if (objc_msgSend((id)objc_opt_class(), "_axAuditViewIsSwiftUI:", v10))
          {
            objc_msgSend((id)objc_opt_class(), "_axAuditGetAttrLabelFromSwiftUIView:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "string");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend((id)objc_opt_class(), "_axAuditSwiftUIViewHasText:", v10))
              goto LABEL_40;
          }
          else
          {
            v13 = 0;
          }
          v45 = v9;
          v46 = v13;
          v15 = v44;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          objc_msgSend(a1, "_axAuditGetAllFontSizes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          v48 = v16;
          if (v18)
          {
            v19 = v18;
            v47 = 0;
            v20 = *(_QWORD *)v50;
            v21 = 0.0;
            v22 = 0.0;
            v23 = 0.0;
            do
            {
              v24 = 0;
              v25 = v22;
              do
              {
                if (*(_QWORD *)v50 != v20)
                  objc_enumerationMutation(v17);
                v26 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v24);
                objc_msgSend(v5, "objectForKey:", v10);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "objectForKey:", v26);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                {
                  objc_msgSend(v27, "objectForKeyedSubscript:", v26);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "pointSize");
                  v22 = v30;
                  if (v21 == 0.0)
                  {
                    v31 = v26;

                    v15 = v31;
                    v21 = v22;
                  }
                  else
                  {
                    if (v23 == 0.0)
                      v23 = v30;
                    if (v30 <= v25)
                    {
                      objc_msgSend(v48, "addObject:", v26);
                      v47 = 1;
                    }
                  }

                  v25 = v22;
                }
                else
                {
                  v22 = v25;
                }

                ++v24;
              }
              while (v19 != v24);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            }
            while (v19);

            if (v21 < v23)
            {
              v8 = v40;
              a1 = v41;
              v7 = v42;
              v9 = v45;
              v16 = v48;
              if ((v47 & 1) == 0)
              {
LABEL_39:

                v13 = v46;
LABEL_40:

                goto LABEL_41;
              }
LABEL_36:
              objc_msgSend(v43, "setObject:forKey:", v16, v10);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                || (objc_msgSend(a1, "_axAuditGetTextFromObject:", v10),
                    v32 = (void *)objc_claimAutoreleasedReturnValue(),
                    v33 = objc_msgSend(v32, "length"),
                    v32,
                    v16 = v48,
                    v33))
              {
                objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
                v38 = v46;
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = CFSTR("AX Audit: Element: %@, with text: %@, does not support these font sizes:%@");
                v37 = v10;
                LOBYTE(v35) = 1;
                _AXLogWithFacility();

                v16 = v48;
              }
              goto LABEL_39;
            }
            v8 = v40;
            a1 = v41;
            v7 = v42;
            v9 = v45;
            v16 = v48;
          }
          else
          {

            v9 = v45;
          }
          objc_msgSend(v16, "insertObject:atIndex:", v15, 0);
          goto LABEL_36;
        }
LABEL_41:
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v7);
  }

  return v43;
}

+ (void)_axAuditStoreFontForElement:(id)a3 intoDictionary:(id)a4 forCurrentFont:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "_axAuditGetFontForElement:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_axAuditGetTextFromObject:", v19);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 && v11)
  {
    objc_msgSend(v8, "objectForKey:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "objectForKey:", v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = v10;
      v17 = v9;
    }
    else
    {
      LOBYTE(v18) = 1;
      _AXLogWithFacility();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v18, CFSTR("AX Audit: %s: Could not find existing entry for element: %@"), "+[UIApplicationAuditIssuesAccessibility _axAuditStoreFontForElement:intoDictionary:forCurrentFont:]", v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, v9);
      v14 = v8;
      v16 = v15;
      v17 = v19;
    }
    objc_msgSend(v14, "setObject:forKey:", v16, v17);

  }
}

+ (void)_axAuditStoreFontForSwiftUIView:(id)a3 intoDictionary:(id)a4 forCurrentFont:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "_axAuditGetFontForSwiftUIView:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "objectForKey:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "objectForKey:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v10;
      v15 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v9);
      v12 = v8;
      v14 = v13;
      v15 = v16;
    }
    objc_msgSend(v12, "setObject:forKey:", v14, v15);

  }
}

+ (void)_axAuditRemoveUnsupportedCategories:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v4 = v3;
  v26 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v26)
  {
    v24 = v4;
    v25 = *(_QWORD *)v37;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v4);
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v5);
        if (v6)
        {
          v27 = v5;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKey:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v33;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v33 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v12);
                v14 = v6;
                while (objc_msgSend(v14, "_accessibilitySupportsContentSizeCategory:", v13))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v14, "superview");
                    v15 = objc_claimAutoreleasedReturnValue();

                    v14 = (id)v15;
                    if (v15)
                      continue;
                  }

                  goto LABEL_18;
                }

                objc_msgSend(v7, "addObject:", v13);
LABEL_18:
                ++v12;
              }
              while (v12 != v10);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            }
            while (v10);
          }
          objc_msgSend(v8, "removeObjectsForKeys:", v7);
          objc_msgSend(v8, "allKeys");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (!v17)
            objc_msgSend(v23, "addObject:", v6);

          v4 = v24;
          v5 = v27;
        }
        ++v5;
      }
      while (v5 != v26);
      v26 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v26);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v23;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v20);
  }

}

+ (void)_axAuditSpinRunloopForDuration:(double)a3
{
  CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x1E0C9B280], a3, 0);
}

+ (void)_axAuditCheckElementForClipping:(id)a3 storeIntoSet:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(a1, "_axAuditElementIsClipping:", v7))
    objc_msgSend(v6, "addObject:", v7);

}

+ (BOOL)_axAuditElementIsClipping:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  double v20;
  BOOL v21;
  char v22;
  BOOL v23;
  BOOL v24;
  CGRect v26;

  v4 = a3;
  if (objc_msgSend(a1, "_axAuditShouldElementBeCheckedForClipping:", v4))
  {
    objc_msgSend(v4, "frame");
    objc_msgSend(v4, "alignmentRectForFrame:");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "sizeThatFits:", v9, v11);
    v15 = v13;
    v16 = v14;
    v17 = v10 + 5.0 < v13 && v13 != *MEMORY[0x1E0CEBDE0];
    v18 = v12 + 5.0 < v14 && v14 != *MEMORY[0x1E0CEBDE0];
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.width = v10;
    v26.size.height = v12;
    v19 = CGRectEqualToRect(v26, *MEMORY[0x1E0C9D648]);
    v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v21 = v10 == *MEMORY[0x1E0C9D820];
    if (v12 != v20)
      v21 = 0;
    v22 = v19 || v21;
    v23 = v15 == *MEMORY[0x1E0C9D820];
    if (v16 != v20)
      v23 = 0;
    v24 = (v17 || v18) & ~(v22 | v23);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (void)_axAuditCheckSwiftUIViewForClipping:(id)a3 storeIntoSet:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(a1, "_axAuditSwiftUIViewIsClipping:", v7))
    objc_msgSend(v6, "addObject:", v7);

}

+ (BOOL)_axAuditSwiftUIViewIsClipping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  _BOOL4 v40;
  _BOOL4 v41;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v4 = a3;
  if (objc_msgSend(a1, "_axAuditSwiftUIViewHasText:", v4))
  {
    objc_msgSend((id)objc_opt_class(), "_axAuditGetAttrLabelFromSwiftUIView:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (unint64_t)objc_msgSend(v5, "length") >= 2)
    {
      objc_msgSend((id)objc_opt_class(), "_axAuditBoundsForRange:onSwiftUIView:", 0, 1, v4);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend((id)objc_opt_class(), "_axAuditBoundsForRange:onSwiftUIView:", 1, 1, v4);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      objc_msgSend((id)objc_opt_class(), "_axAuditBoundsForRange:onSwiftUIView:", objc_msgSend(v6, "length") - 1, 1, v4);
      v49 = v25;
      v50 = v24;
      v47 = v27;
      v48 = v26;
      objc_msgSend((id)objc_opt_class(), "_axAuditBoundsForRange:onSwiftUIView:", objc_msgSend(v6, "length") - 2, 1, v4);
      v51.origin.x = v28;
      v51.origin.y = v29;
      v51.size.width = v30;
      v51.size.height = v31;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "accessibilityFrame");
        v45 = v33;
        v46 = v32;
        v43 = v35;
        v44 = v34;
      }
      else
      {
        v45 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v46 = *MEMORY[0x1E0C9D648];
        v43 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v44 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      }
      if (AX_CGRectAlmostEqualToRect())
      {
        v52.origin.x = v9;
        v52.origin.y = v11;
        v52.size.width = v13;
        v52.size.height = v15;
        v55.origin.x = v46;
        v55.origin.y = v45;
        v55.size.width = v44;
        v55.size.height = v43;
        v37 = v49;
        v36 = v50;
        v39 = v47;
        v38 = v48;
        if (CGRectEqualToRect(v52, v55))
        {
          LOBYTE(v40) = 0;
        }
        else
        {
          v53.origin.y = v19;
          v53.origin.x = v17;
          v53.size.height = v23;
          v53.size.width = v21;
          v56.origin.x = v46;
          v56.origin.y = v45;
          v56.size.width = v44;
          v56.size.height = v43;
          v40 = !CGRectEqualToRect(v53, v56);
        }
      }
      else
      {
        LOBYTE(v40) = 0;
        v37 = v49;
        v36 = v50;
        v39 = v47;
        v38 = v48;
      }
      if (!AX_CGRectAlmostEqualToRect())
        goto LABEL_16;
      v54.origin.x = v36;
      v54.origin.y = v37;
      v54.size.width = v38;
      v54.size.height = v39;
      v57.origin.x = v46;
      v57.origin.y = v45;
      v57.size.width = v44;
      v57.size.height = v43;
      if (!CGRectEqualToRect(v54, v57))
      {
        v58.origin.x = v46;
        v58.origin.y = v45;
        v58.size.width = v44;
        v58.size.height = v43;
        v41 = !CGRectEqualToRect(v51, v58);
      }
      else
      {
LABEL_16:
        LOBYTE(v41) = 0;
      }
      v7 = v40 || v41;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)_axAuditShouldElementBeCheckedForClipping:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v5, "textFieldShouldBeginEditing:", v4) & 1) != 0)
      {
        v6 = 0;
LABEL_18:

        goto LABEL_19;
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v4, "isEditable") & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v4, "isScrollEnabled") & 1) == 0)
      {
        objc_msgSend(v4, "superview");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!v7
          || (v8 = (void *)v7,
              objc_msgSend(v4, "superview"),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EE4B3860),
              v9,
              v8,
              (v10 & 1) == 0))
        {
          objc_msgSend(a1, "_axAuditGetTextFromObject:", v4);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v5, "length") != 0;
          goto LABEL_18;
        }
      }
    }
  }
  v6 = 0;
LABEL_19:

  return v6;
}

+ (id)_axAuditContrastDetectionForSwiftUIView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "_axAuditSwiftUIViewHasText:", v4))
  {
    objc_msgSend(a1, "_axAuditGetAttrLabelFromSwiftUIView:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__1;
      v25 = __Block_byref_object_dispose__1;
      v26 = 0;
      v7 = objc_msgSend(v5, "length");
      v8 = *MEMORY[0x1E0CEA0A0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __81__UIApplicationAuditIssuesAccessibility__axAuditContrastDetectionForSwiftUIView___block_invoke;
      v20[3] = &unk_1E3DFE258;
      v20[4] = &v21;
      objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v20);
      if (v22[5])
      {
        +[UIViewAuditIssuesAccessibility _axAuditHexValueForColor:](UIViewAuditIssuesAccessibility, "_axAuditHexValueForColor:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      +[UIApplicationAuditIssuesAccessibility _axAuditGetFontAttrFromAttributedString:](UIApplicationAuditIssuesAccessibility, "_axAuditGetFontAttrFromAttributedString:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "pointSize");
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      LOBYTE(v19) = 1;
      _AXLogWithFacility();
      objc_msgSend(v6, "string", v19, CFSTR("AX Audit: SwiftUI view %@ has an unknown contrast issue type."), v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIAccessibilityAuditUtilities dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:](UIAccessibilityAuditUtilities, "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", 4001, v4, 0, v15, v9, 0, v14, 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v21, 8);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __81__UIApplicationAuditIssuesAccessibility__axAuditContrastDetectionForSwiftUIView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *a5 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

+ (BOOL)_axAuditSwiftUIViewHasText:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 v5;
  CGRect v7;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_axAuditViewIsSwiftUI:", v3))
  {
    objc_msgSend((id)objc_opt_class(), "_axAuditGetAttrLabelFromSwiftUIView:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "_axAuditBoundsForRange:onSwiftUIView:", 0, objc_msgSend(v4, "length"), v3);
      v5 = !CGRectEqualToRect(v7, *MEMORY[0x1E0C9D648]);
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (CGRect)_axAuditBoundsForRange:(_NSRange)a3 onSwiftUIView:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (objc_msgSend((id)objc_opt_class(), "_axAuditViewIsSwiftUI:", v6)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "_accessibilityBoundsForRange:", location, length);
    v7 = v11;
    v8 = v12;
    v9 = v13;
    v10 = v14;
  }

  v15 = v7;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (id)_axAuditGetAttrLabelFromSwiftUIView:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_axAuditViewIsSwiftUI:", v3)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "performSelector:", sel_accessibilityAttributedLabel);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)_axAuditViewIsSwiftUI:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  NSClassFromString(CFSTR("SwiftUI.AccessibilityNode"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)_axAuditFindDescendantInaccessibleElements:(id)a3 honorsGroups:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  int v12;
  void *v13;
  double v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  int v20;
  void *v21;
  uint64_t v22;
  char isKindOfClass;
  char v24;
  void *v25;
  _BOOL4 v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  uint64_t j;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  BOOL v60;
  double v61;
  double v62;
  double v63;
  char v67;
  uint64_t m;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t n;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v83;
  uint64_t v84;
  const __CFString *v85;
  void *v86;
  void *v87;
  void *v88;
  id obj;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;
  CGRect v119;
  CGRect v120;

  v4 = a4;
  v118 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v97 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v95 = v6;
  objc_msgSend(v6, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v9;
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    v12 = !v4;
    while (1)
    {
      objc_msgSend(v96, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "removeObjectAtIndex:", 0);
      if ((objc_msgSend(v13, "accessibilityElementsHidden") & 1) == 0)
      {
        objc_msgSend(v13, "bounds");
        if (v15 >= 1.0)
        {
          objc_msgSend(v13, "bounds");
          v16 = v17 >= 1.0;
        }
        else
        {
          v16 = 0;
        }
        objc_msgSend(v13, "alpha");
        v19 = v18;
        v20 = objc_msgSend(v13, "isAccessibilityElement");
        if (((v20 | v12) & 1) == 0)
          v20 = objc_msgSend(v13, "accessibilityContainerType") == 4;
        objc_msgSend((id)objc_opt_class(), "_axAuditFindAllTablesInHierarchyForView:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (!v22)
        {
          v24 = 0;
LABEL_17:
          if ((v24 & 1) == 0)
          {
            objc_msgSend(v13, "subviews");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count") == 0;

            v27 = v26 & ~v20 & v16;
            if (v19 <= 0.0)
              v27 = 0;
            if ((v27 | v20) == 1)
            {
              if (v27)
                v28 = v10;
              else
                v28 = v88;
              objc_msgSend(v28, "addObject:", v13);
            }
            if ((objc_msgSend(v13, "isAccessibilityElement") & 1) == 0)
            {
              v29 = a1;
              v112 = 0u;
              v113 = 0u;
              v110 = 0u;
              v111 = 0u;
              objc_msgSend(v13, "subviews");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
              if (v31)
              {
                v32 = v31;
                v33 = *(_QWORD *)v111;
                do
                {
                  for (i = 0; i != v32; ++i)
                  {
                    if (*(_QWORD *)v111 != v33)
                      objc_enumerationMutation(v30);
                    v35 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i);
                    if ((objc_msgSend(v96, "containsObject:", v35) & 1) == 0)
                      objc_msgSend(v96, "addObject:", v35);
                  }
                  v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
                }
                while (v32);
              }

              a1 = v29;
            }
          }
          goto LABEL_4;
        }
        NSClassFromString(CFSTR("_UITableCellAccessoryButton"));
        isKindOfClass = objc_opt_isKindOfClass();
        objc_opt_class();
        v24 = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) == 0)
          goto LABEL_17;
      }
LABEL_4:

      if (objc_msgSend(v96, "count"))
      {
        if (v11++ < 0x270F)
          continue;
      }
      break;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v10, "count");
  if (v93)
  {
    for (j = 0; j != v93; ++j)
    {
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v37 = v88;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v107;
        while (2)
        {
          for (k = 0; k != v38; ++k)
          {
            if (*(_QWORD *)v107 != v39)
              objc_enumerationMutation(v37);
            v41 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * k);
            objc_msgSend(v10, "objectAtIndex:", j);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "bounds");
            objc_msgSend(v41, "convertRect:toView:", v95);
            v44 = v43;
            v46 = v45;
            v48 = v47;
            v50 = v49;
            objc_msgSend(v42, "bounds");
            objc_msgSend(v42, "convertRect:toView:", v95);
            v52 = v51;
            v54 = v53;
            v56 = v55;
            v58 = v57;
            objc_msgSend(v41, "subviews");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v59, "count"))
            {

            }
            else
            {
              v119.origin.x = v44;
              v119.origin.y = v46;
              v119.size.width = v48;
              v119.size.height = v50;
              v120.origin.x = v52;
              v120.origin.y = v54;
              v120.size.width = v56;
              v120.size.height = v58;
              v60 = CGRectIntersectsRect(v119, v120);

              if (v60)
              {
                LODWORD(v38) = 0;
                v67 = 1;
                goto LABEL_61;
              }
            }
            v61 = vabdd_f64(v46, v54);
            v62 = vabdd_f64(v48, v56);
            v63 = vabdd_f64(v50, v58);
            if (vabdd_f64(v44, v52) <= 20.0 && v61 <= 20.0 && v62 <= 50.0 && v63 <= 50.0)
            {
              v67 = 0;
              LODWORD(v38) = 1;
LABEL_61:

              goto LABEL_62;
            }

          }
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
          if (v38)
            continue;
          break;
        }
      }
      v67 = 0;
LABEL_62:

      if ((v67 & 1) != 0 || (_DWORD)v38)
        objc_msgSend(v87, "addIndex:", j);
    }
  }
  objc_msgSend(v10, "removeObjectsAtIndexes:", v87);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  obj = v10;
  v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
  if (v91)
  {
    v90 = *(_QWORD *)v103;
    do
    {
      for (m = 0; m != v91; ++m)
      {
        if (*(_QWORD *)v103 != v90)
          objc_enumerationMutation(obj);
        v69 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * m);
        +[UIViewAuditIssuesAccessibility _axAuditTextCandidateForView:](UIViewAuditIssuesAccessibility, "_axAuditTextCandidateForView:", v69, v83);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v69, "bounds");
        objc_msgSend(v69, "convertRect:toView:", v95);
        objc_msgSend(v71, "valueWithCGRect:");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v70, "count"))
        {
          v92 = v70;
          v94 = m;
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v73 = v70;
          v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
          if (v74)
          {
            v75 = v74;
            v76 = *(_QWORD *)v99;
            do
            {
              for (n = 0; n != v75; ++n)
              {
                if (*(_QWORD *)v99 != v76)
                  objc_enumerationMutation(v73);
                v78 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * n);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), 1007, v85, v86);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "setObject:forKey:", v79, CFSTR("AXAuditIssueTypeKey"));

                objc_msgSend(v78, "setObject:forKey:", v72, CFSTR("AXAuditIssueElementRectKey"));
                objc_msgSend(v78, "setObject:forKey:", v69, CFSTR("AXAuditIssueElementKey"));
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v78);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "addObject:", v80);

                v85 = CFSTR("AX Audit: Element: %@ is inaccessible and has text.");
                v86 = v69;
                LOBYTE(v84) = 1;
                _AXLogWithFacility();
              }
              v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v98, v114, 16, v84, CFSTR("AX Audit: Element: %@ is inaccessible and has text."), v69);
            }
            while (v75);
          }

          v70 = v92;
          m = v94;
        }
        else
        {
          +[UIAccessibilityAuditUtilities dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:](UIAccessibilityAuditUtilities, "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", 1006, v69, 0, 0, 0, 0, 0, v72, 0);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "addObject:", v81);

          v85 = CFSTR("AX Audit: Element: %@ is inaccessible.");
          v86 = v69;
          LOBYTE(v83) = 1;
          _AXLogWithFacility();
        }

      }
      v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
    }
    while (v91);
  }

  return v97;
}

+ (id)_axAuditUnlabeledIssueDictForElement:(id)a3 honorsGroups:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "accessibilityContainerType");
  v7 = 0;
  if (v4 && v6 == 4)
  {
    objc_msgSend(v5, "accessibilityLabel");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "accessibilityValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        v7 = 0;
        goto LABEL_8;
      }
      v8 = v5;
      objc_msgSend(v8, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v8, "superview");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "frame");
        objc_msgSend(v13, "convertPoint:toView:", 0);
        v15 = v14;
        v17 = v16;

        objc_msgSend(v8, "bounds");
        v19 = v18;
        objc_msgSend(v8, "bounds");
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v15, v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }
      +[UIAccessibilityAuditUtilities dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:](UIAccessibilityAuditUtilities, "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", 1000, v8, 0, 0, 0, 0, 0, v20, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_8:

  return v7;
}

+ (id)_axAuditGetAllTableAndCollectionViewsForHierarchy:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectAtIndex:", 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        objc_msgSend(v4, "addObject:", v7);
      objc_msgSend(v7, "subviews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v8);

      if (!objc_msgSend(v5, "count"))
        break;
    }
    while (v6++ < 0x270F);
  }

  return v4;
}

+ (id)_axAuditGetIndexPathsDictionaryForCaptureActionForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend((id)cellReferenceMapTable, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)cellReferenceMapTable, "setObject:forKey:", v4, v3);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("Index Paths"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("Index Paths"));
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("Content Offset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_opt_class();
      objc_msgSend(v3, "safeValueForKey:", CFSTR("contentOffset"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("Content Offset"));
    }
    else
    {
      v6 = 0;
    }
  }

  return v5;
}

+ (id)_axAuditGetIndexPathsDictionaryForUpdateActionForView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend((id)cellReferenceMapTable, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("Index Paths"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_axAuditGetOriginalContentOffsetForView:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend((id)cellReferenceMapTable, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Content Offset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_axAuditForHierarchy:(id)a3 withTableOrCollectionViews:(id)a4 performAction:(id)a5 performBlockOnEachCell:(id)a6
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *, _QWORD);
  int v11;
  uint64_t i;
  void *v13;
  void *v14;
  char isKindOfClass;
  char v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  int v46;
  id obj;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(id, uint64_t, void *, _QWORD))a6;
  v50 = objc_msgSend(v9, "isEqualToString:", CFSTR("Capture Cell References"));
  v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("Update Cell References Key"));
  v44 = v9;
  v48 = objc_msgSend(v9, "isEqualToString:", CFSTR("Dereference Cells"));
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v8;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v51)
  {
    v49 = *(_QWORD *)v68;
    v46 = v11 | v48;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v68 != v49)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        if (v50)
        {
          objc_msgSend(a1, "_axAuditGetIndexPathsDictionaryForCaptureActionForView:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (v46)
        {
          objc_msgSend(a1, "_axAuditGetIndexPathsDictionaryForUpdateActionForView:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
            continue;
        }
        else
        {
          v14 = 0;
        }
        v53 = i;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        objc_opt_class();
        v16 = objc_opt_isKindOfClass();
        v17 = v16;
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v13, "indexPathsForVisibleRows");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if ((v16 & 1) != 0)
        {
          objc_msgSend(v13, "indexPathsForVisibleItems");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v54 = v18;
        v19 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v64;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v64 != v21)
                objc_enumerationMutation(v54);
              v23 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v13, "cellForRowAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
                v24 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                if ((v17 & 1) == 0)
                  continue;
                objc_msgSend(v13, "cellForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
                v24 = objc_claimAutoreleasedReturnValue();
              }
              v25 = (void *)v24;
              if (v24)
              {
                v10[2](v10, v24, v14, v23);

              }
            }
            v20 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
          }
          while (v20);
        }

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v13, "_accessibilityIndicesOfVisibleHeadersAndFooters");
          v26 = (id)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v60;
            do
            {
              for (k = 0; k != v28; ++k)
              {
                if (*(_QWORD *)v60 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * k);
                objc_msgSend(v13, "headerViewForSection:", objc_msgSend(v31, "integerValue"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "footerViewForSection:", objc_msgSend(v31, "integerValue"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (v32)
                  ((void (**)(id, uint64_t, void *, void *))v10)[2](v10, (uint64_t)v32, v14, v31);
                if (v33)
                  ((void (**)(id, uint64_t, void *, void *))v10)[2](v10, (uint64_t)v33, v14, v31);

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
            }
            while (v28);
          }
LABEL_54:

          goto LABEL_55;
        }
        if ((v17 & 1) != 0)
        {
          v26 = v13;
          objc_msgSend(v26, "_accessibilityIndexPathToOtherCollectionViewItems");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v34, "count"))
          {
            v45 = v26;
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v35 = v34;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v56;
              do
              {
                for (m = 0; m != v37; ++m)
                {
                  if (*(_QWORD *)v56 != v38)
                    objc_enumerationMutation(v35);
                  v40 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * m);
                  objc_msgSend(v35, "objectForKeyedSubscript:", v40);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v10[2](v10, (uint64_t)v41, v14, v40);

                }
                v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
              }
              while (v37);
            }

            v26 = v45;
          }

          goto LABEL_54;
        }
LABEL_55:
        i = v53;
        if (v48)
        {
          objc_msgSend(a1, "_axAuditGetOriginalContentOffsetForView:", v13);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v42;
          if (v42)
          {
            objc_msgSend(v42, "CGPointValue");
            objc_msgSend(v13, "setContentOffset:");
          }

        }
      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v51);
  }

}

+ (void)_axAuditCaptureReferenceToCellsForViewHierarchy:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];

  v4 = (void *)MEMORY[0x1E0CB3748];
  v5 = a3;
  objc_msgSend(v4, "weakToStrongObjectsMapTable");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)cellReferenceMapTable;
  cellReferenceMapTable = v6;

  objc_msgSend(a1, "_axAuditGetAllTableAndCollectionViewsForHierarchy:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__UIApplicationAuditIssuesAccessibility__axAuditCaptureReferenceToCellsForViewHierarchy___block_invoke;
  aBlock[3] = &__block_descriptor_40_e64_v32__0__UIView_8__NSMutableDictionary_16__NSObject_NSCopying__24l;
  aBlock[4] = a1;
  v9 = _Block_copy(aBlock);
  objc_msgSend(a1, "_axAuditForHierarchy:withTableOrCollectionViews:performAction:performBlockOnEachCell:", v5, v8, CFSTR("Capture Cell References"), v9);

}

void __89__UIApplicationAuditIssuesAccessibility__axAuditCaptureReferenceToCellsForViewHierarchy___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_axAuditHelperToFindRelevantSubviewsOfCellView:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_axAuditCreateElementInfoDictionariesForSubviews:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v7);

  }
}

+ (void)_axAuditUpdateReferenceOfCellsForViewHierarchy:(id)a3 forFontSize:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_axAuditGetAllTableAndCollectionViewsForHierarchy:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __100__UIApplicationAuditIssuesAccessibility__axAuditUpdateReferenceOfCellsForViewHierarchy_forFontSize___block_invoke;
  v14 = &unk_1E3DFE2A0;
  v15 = v6;
  v16 = a1;
  v9 = v6;
  v10 = _Block_copy(&v11);
  objc_msgSend(a1, "_axAuditForHierarchy:withTableOrCollectionViews:performAction:performBlockOnEachCell:", v7, v8, CFSTR("Update Cell References Key"), v10, v11, v12, v13, v14);

}

void __100__UIApplicationAuditIssuesAccessibility__axAuditUpdateReferenceOfCellsForViewHierarchy_forFontSize___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = *(void **)(a1 + 40);
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "_axAuditHelperToFindRelevantSubviewsOfCellView:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_axAuditMatchReferenceSubviews:againstNewSubviews:", v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_axAuditUpdateFontsForReferenceMatches:forFontSize:", v11, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_axAuditUpdateClippingStatusForReferenceMatches:", v11);

}

+ (id)_axAuditDereferenceCellsForViewHierarchy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(a1, "_axAuditGetAllTableAndCollectionViewsForHierarchy:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v6, CFSTR("Font Info for Cells"), v7, CFSTR("Clipping Info for Cells"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__UIApplicationAuditIssuesAccessibility__axAuditDereferenceCellsForViewHierarchy___block_invoke;
  aBlock[3] = &unk_1E3DFE2C8;
  v16 = v7;
  v17 = a1;
  v15 = v6;
  v9 = v7;
  v10 = v6;
  v11 = _Block_copy(aBlock);
  objc_msgSend(a1, "_axAuditForHierarchy:withTableOrCollectionViews:performAction:performBlockOnEachCell:", v4, v5, CFSTR("Dereference Cells"), v11);

  v12 = (void *)cellReferenceMapTable;
  cellReferenceMapTable = 0;

  return v8;
}

void __82__UIApplicationAuditIssuesAccessibility__axAuditDereferenceCellsForViewHierarchy___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = *(void **)(a1 + 48);
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "_axAuditHelperToFindRelevantSubviewsOfCellView:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "_axAuditMatchReferenceSubviews:againstNewSubviews:", v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_axAuditStoreFontsIntoDictionary:forReferenceMatches:", *(_QWORD *)(a1 + 32), v11);
  objc_msgSend(*(id *)(a1 + 48), "_axAuditStoreClippedElementsIntoSet:forReferenceMatches:", *(_QWORD *)(a1 + 40), v11);

}

+ (id)_axAuditHelperToFindRelevantSubviewsOfCellView:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    v21 = v4;
    do
    {
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObjectAtIndex:", 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(a1, "_axAuditGetFontForElement:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_axAuditGetTextFromObject:", v6);
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = (void *)v8;
          if (v7 && v8)
          {
            v23 = (void *)v8;
            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            v10 = v22;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v25;
              while (2)
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v25 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
                  objc_msgSend(a1, "_axAuditGetFontForElement:", v15);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "_axAuditGetTextFromObject:", v15);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v7, "isEqual:", v16)
                    && objc_msgSend(v23, "isEqualToString:", v17))
                  {

                    goto LABEL_18;
                  }

                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
                if (v12)
                  continue;
                break;
              }
            }

            objc_msgSend(v10, "addObject:", v6);
LABEL_18:
            v4 = v21;
            v9 = v23;
          }
          objc_msgSend(v6, "subviews");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v18);

        }
      }

      if (!objc_msgSend(v4, "count"))
        break;
    }
    while (v5++ < 0x270F);
  }

  return v22;
}

+ (id)_axAuditCreateElementInfoDictionariesForSubviews:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_axAuditGetTextFromObject:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = CFSTR("Class Name");
        v23[1] = CFSTR("Text");
        v24[0] = v12;
        v24[1] = v13;
        v23[2] = CFSTR("Font Dictionary");
        v23[3] = CFSTR("Clipping Status");
        v24[2] = v14;
        v24[3] = MEMORY[0x1E0C9AAA0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");
        objc_msgSend(v5, "addObject:", v16);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  return v5;
}

+ (id)_axAuditMatchReferenceSubviews:(id)a3 againstNewSubviews:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v24)
  {
    v21 = *(_QWORD *)v33;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(obj);
        v25 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v6);
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v7;
        objc_msgSend(a1, "_axAuditGetTextFromObject:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v11 = v23;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v29 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v16, "objectForKey:", CFSTR("Class Name"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKey:", CFSTR("Text"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v9, "isEqualToString:", v17)
                && objc_msgSend(v10, "isEqualToString:", v18))
              {
                objc_msgSend(v26, "setObject:forKey:", v16, v27);
              }

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v13);
        }

        v6 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v24);
  }

  return v26;
}

+ (void)_axAuditUpdateFontsForReferenceMatches:(id)a3 forFontSize:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_axAuditGetFontForElement:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v13, "objectForKey:", CFSTR("Font Dictionary"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v14, v7);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

+ (void)_axAuditUpdateClippingStatusForReferenceMatches:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v8, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("Clipping Status"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

        if ((v11 & 1) != 0)
        {

          goto LABEL_13;
        }
        if (+[UIApplicationAuditIssuesAccessibility _axAuditElementIsClipping:](UIApplicationAuditIssuesAccessibility, "_axAuditElementIsClipping:", v8))
        {
          objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("Clipping Status"));
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

}

+ (id)_axAuditGetTextFromObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  char v12;
  uint64_t v14;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("text"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v5, "length"))
    {
      objc_msgSend(v3, "placeholder");
      v14 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v14;
      if (v14)
        goto LABEL_17;
    }
    else if (v5)
    {
      goto LABEL_17;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "layoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "textStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;

        v3 = v10;
      }

    }
  }
  else
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("_UITextContainerView")))
    {
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0)
        goto LABEL_14;
      objc_msgSend(v3, "performSelector:", sel_textStorage);
      v7 = v3;
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_14:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
LABEL_17:

  return v5;
}

+ (void)_axAuditStoreFontsIntoDictionary:(id)a3 forReferenceMatches:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("Font Dictionary"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "setObject:forKey:", v13, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

+ (void)_axAuditStoreClippedElementsIntoSet:(id)a3 forReferenceMatches:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("Clipping Status"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLValue");

        if (v14)
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

+ (void)_axAuditUIKitShouldReportFontSize:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)_axFontSizeToReturn;
  _axFontSizeToReturn = v4;

  if (dyld_program_sdk_at_least())
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  else
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CEB3F0];
  v12[0] = *MEMORY[0x1E0CEB430];
  v9 = (void *)objc_msgSend(v3, "copy");

  v12[1] = CFSTR("UIContentSizeCategoryTextLegibilityEnabledKey");
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", UIAccessibilityIsBoldTextEnabled());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", v8, v6, v11);

}

uint64_t __75__UIApplicationAuditIssuesAccessibility__axAuditUIKitShouldReportFontSize___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CEA950], "_enumerateScreensWithBlock:", &__block_literal_global_538);
}

uint64_t __75__UIApplicationAuditIssuesAccessibility__axAuditUIKitShouldReportFontSize___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateTraits");
}

+ (BOOL)_axAuditSwizzleAwayContentSize:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  Method InstanceMethod;
  objc_class *v7;
  Method v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  objc_method *(*v13)(uint64_t);
  void *v14;
  Method v15;
  Method v16;

  v3 = a3;
  v5 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v5, sel_preferredContentSizeCategory);
  v7 = (objc_class *)objc_opt_class();
  v8 = class_getInstanceMethod(v7, sel_preferredContentSizeCategory);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __72__UIApplicationAuditIssuesAccessibility__axAuditSwizzleAwayContentSize___block_invoke;
  v14 = &__block_descriptor_48_e5_v8__0l;
  v15 = InstanceMethod;
  v16 = v8;
  if (_axAuditSwizzleAwayContentSize__onceToken != -1)
    dispatch_once(&_axAuditSwizzleAwayContentSize__onceToken, &v11);
  v9 = objc_msgSend(a1, "_axAuditSetSwizzledImp:orOrigImp:forMethod:withSwizzling:", axAuditSwizzlePreferredContentSizeCategory1, _axAuditOrigPreferredContentSizeCategory1, InstanceMethod, v3, v11, v12, v13, v14, v15, v16);
  return v9 & objc_msgSend(a1, "_axAuditSetSwizzledImp:orOrigImp:forMethod:withSwizzling:", axAuditSwizzlePreferredContentSizeCategory2, _axAuditOrigPreferredContentSizeCategory2, v8, v3);
}

objc_method *__72__UIApplicationAuditIssuesAccessibility__axAuditSwizzleAwayContentSize___block_invoke(uint64_t a1)
{
  objc_method *v2;
  objc_method *result;

  v2 = *(objc_method **)(a1 + 32);
  if (v2)
    _axAuditOrigPreferredContentSizeCategory1 = (uint64_t)method_getImplementation(v2);
  result = *(objc_method **)(a1 + 40);
  if (result)
  {
    result = (objc_method *)method_getImplementation(result);
    _axAuditOrigPreferredContentSizeCategory2 = (uint64_t)result;
  }
  return result;
}

+ (BOOL)_axAuditSetSwizzledImp:(void *)a3 orOrigImp:(void *)a4 forMethod:(objc_method *)a5 withSwizzling:(BOOL)a6
{
  if (a5)
  {
    if (!a6)
      a3 = a4;
    method_setImplementation(a5, (IMP)a3);
  }
  return a5 != 0;
}

@end
