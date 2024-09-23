@implementation UIView(PhotosUIFoundation)

- (double)maximumDynamicRangeHeadroom
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(v5, "maximumDynamicRangeHeadroom");
  v7 = v6;

  return v7;
}

- (double)px_screenScale
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(v5, "scale");
  if (v6 == 0.0)
    v7 = 1.0;
  else
    v7 = v6;

  return v7;
}

- (BOOL)px_hasRightToLeftLayoutDirection
{
  return objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection") == 1;
}

- (uint64_t)px_layoutDirection
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection");
  if (v1)
    return 2 * (v1 == 1);
  else
    return 1;
}

- (uint64_t)px_leadingEdge
{
  return PXLeadingRectEdge(objc_msgSend(a1, "px_layoutDirection"));
}

- (uint64_t)px_trailingEdge
{
  uint64_t v1;

  v1 = PXFlipLayoutDirection(objc_msgSend(a1, "px_layoutDirection"));
  return PXLeadingRectEdge(v1);
}

- (uint64_t)px_enumerateDescendantSubviewsUsingBlock:()PhotosUIFoundation
{
  return objc_msgSend(a1, "px_enumerateDescendantSubviewsPassingTest:usingBlock:", &__block_literal_global_6028, a3);
}

- (void)px_enumerateDescendantSubviewsPassingTest:()PhotosUIFoundation usingBlock:
{
  uint64_t (**v6)(id, void *);
  void (**v7)(id, void *, uint64_t);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  _QWORD v14[4];
  void (**v15)(id, void *, uint64_t);
  uint64_t *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      if ((v6[2](v6, v12) & 1) != 0)
      {
        v7[2](v7, v12, (uint64_t)(v22 + 3));
        if (*((_BYTE *)v22 + 24))
          break;
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __83__UIView_PhotosUIFoundation__px_enumerateDescendantSubviewsPassingTest_usingBlock___block_invoke;
        v14[3] = &unk_2514D07B8;
        v15 = v7;
        v16 = &v21;
        objc_msgSend(v12, "px_enumerateDescendantSubviewsPassingTest:usingBlock:", v6, v14);
        v13 = *((_BYTE *)v22 + 24) == 0;

        if (!v13)
          break;
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(&v21, 8);
}

- (BOOL)px_isAncestorOfFocusEnvironment:()PhotosUIFoundation
{
  id v4;
  void *v5;
  _BOOL8 i;
  void *v7;

  v4 = a3;
  v5 = v4;
  for (i = v4 != 0; v5 != a1 && v5; i = v5 != 0)
  {
    v7 = v5;
    objc_msgSend(v5, "parentFocusEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return i;
}

- (double)currentDynamicRangeHeadroom
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(v5, "currentDynamicRangeHeadroom");
  v7 = v6;

  return v7;
}

@end
