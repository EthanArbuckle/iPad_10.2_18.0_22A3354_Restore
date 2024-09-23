@implementation UIViewController(IMAdditions)

- (uint64_t)IMDeviceOrientation
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "interfaceOrientation");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  if ((unint64_t)(v3 - 1) >= 4)
    return v1;
  else
    return v3;
}

- (uint64_t)preferredInterfaceOrientationGivenOrientation:()IMAdditions
{
  if ((objc_msgSend(a1, "isSupportedInterfaceOrientation:") & 1) == 0)
  {
    a3 = objc_msgSend(a1, "IMDeviceOrientation");
    if ((objc_msgSend(a1, "isSupportedInterfaceOrientation:", a3) & 1) == 0)
    {
      a3 = 1;
      if ((objc_msgSend(a1, "isSupportedInterfaceOrientation:", 1) & 1) == 0)
      {
        a3 = 3;
        if ((objc_msgSend(a1, "isSupportedInterfaceOrientation:", 3) & 1) == 0)
        {
          a3 = 4;
          if ((objc_msgSend(a1, "isSupportedInterfaceOrientation:", 4) & 1) == 0)
          {
            if (objc_msgSend(a1, "isSupportedInterfaceOrientation:", 2))
              return 2;
            else
              return 1;
          }
        }
      }
    }
  }
  return a3;
}

- (id)recursiveDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v31;
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
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithString:", v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(a1, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v10, "recursiveDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v11);

        objc_msgSend(a1, "childViewControllers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v13)
          objc_msgSend(v4, "appendString:", CFSTR("\n"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringByTrimmingCharactersInSet:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "length");

        if (v25)
        {
          objc_msgSend(v16, "appendFormat:", CFSTR("\t%@"), v22);
          objc_msgSend(v17, "lastObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 != v26)
            objc_msgSend(v16, "appendString:", CFSTR("\n"));
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v19);
  }

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "length");

  if (v29)
    objc_msgSend(v31, "appendFormat:", CFSTR("\n%@"), v16);

  return v31;
}

- (BOOL)isHorizontallySpecified
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "horizontalSizeClass") != 0;

  return v2;
}

- (BOOL)isHorizontallyCompact
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "horizontalSizeClass") == 1;

  return v2;
}

- (BOOL)isHorizontallyRegular
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "horizontalSizeClass") == 2;

  return v2;
}

- (BOOL)isVerticallySpecified
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "verticalSizeClass") != 0;

  return v2;
}

- (BOOL)isVerticallyCompact
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "verticalSizeClass") == 1;

  return v2;
}

- (BOOL)isVerticallyRegular
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "verticalSizeClass") == 2;

  return v2;
}

@end
