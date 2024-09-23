@implementation UIView(SpringBoardAdditions)

- (uint64_t)sb_hasActiveKeyboardOnScreen
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(a1, "superview");
    v2 = objc_claimAutoreleasedReturnValue();
    if (!v2)
      return v2 & 1;
    objc_msgSend(a1, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      LOBYTE(v2) = 0;
      return v2 & 1;
    }
  }
  objc_msgSend(a1, "firstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && UIKeyboardAutomaticIsOnScreen())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      objc_opt_class();
      LOBYTE(v2) = objc_opt_isKindOfClass();
    }
  }
  else
  {
    LOBYTE(v2) = 0;
  }

  return v2 & 1;
}

- (void)_printLayer:()SpringBoardAdditions level:
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;
  CGRect v32;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (a4 >= 1)
    {
      v8 = a4;
      do
      {
        objc_msgSend(v7, "appendString:", CFSTR("-----"));
        --v8;
      }
      while (v8);
    }
    objc_msgSend(v7, "appendString:", CFSTR(" "));
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v6, "masksToBounds");
      objc_msgSend(v6, "bounds");
      NSStringFromCGRect(v32);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v24 = v7;
      v25 = 2114;
      v26 = v6;
      v27 = 1024;
      v28 = v10;
      v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@layer: %{public}@, clipsToBounds: %d, bounds: %{public}@", buf, 0x26u);

    }
  }
  objc_msgSend(v6, "sublayers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = (a4 + 1);
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v12);
        objc_msgSend(a1, "_printLayer:level:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), v15);
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (void)sb_printLayerHierarchy
{
  id v2;

  objc_msgSend(a1, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_printLayer:level:", v2, 0);

}

- (id)sb_snapshotImage
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  const void *v13;
  id v14;
  void *v15;
  void *v16;

  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "frame");
  objc_msgSend(v3, "convertRect:toView:", v2);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend(v2, "createIOSurfaceWithFrame:", v5, v7, v9, v11);
  if (v12)
  {
    v13 = (const void *)v12;
    v14 = objc_alloc(MEMORY[0x1E0CEA638]);
    objc_msgSend(a1, "_screen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    v16 = (void *)objc_msgSend(v14, "_initWithIOSurface:scale:orientation:", v13, 0);

    CFRelease(v13);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)sb_removeAllSubviews
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "removeFromSuperview");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)sb_removeAnimationsForKeys:()SpringBoardAdditions update:
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v8, "animationKeys", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v15))
        {
          objc_msgSend(v8, "removeAnimationForKey:", v15);
          objc_msgSend(v9, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  v16 = objc_msgSend(v9, "count");
  if (v7 && v16)
    v7[2](v7, v9);

}

- (void)sb_removeAnimationsIncludingSubviews:()SpringBoardAdditions predicate:
{
  unsigned int (**v6)(id, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v7, "animationForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6[2](v6, v14))
          objc_msgSend(v7, "removeAnimationForKey:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }
  if (a3)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(a1, "subviews", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "sb_removeAnimationsIncludingSubviews:predicate:", 1, v6);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
    }

  }
}

- (double)anchorPoint
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anchorPoint");
  v3 = v2;

  return v3;
}

- (void)setAnchorPoint:()SpringBoardAdditions
{
  id v5;

  objc_msgSend(a1, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnchorPoint:", a2, a3);

}

+ (id)sb_firstDescendantOfViews:()SpringBoardAdditions passingTest:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bs_firstObjectPassingTest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "subviews", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(a1, "sb_firstDescendantOfViews:passingTest:", v9, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)sb_firstDescendantPassingTest:()SpringBoardAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  v9[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sb_firstDescendantOfViews:passingTest:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sb_firstDescendantOfClass:()SpringBoardAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__UIView_SpringBoardAdditions__sb_firstDescendantOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "sb_firstDescendantPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)sb_firstDescendantOfClassNamed:()SpringBoardAdditions
{
  return objc_msgSend(a1, "sb_firstDescendantOfClass:", NSClassFromString(aClassName));
}

@end
