@implementation UIAirDropActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.AirDrop");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AirDrop"), CFSTR("AirDrop"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "classNamesForItems:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "classesForClassNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "canPerformActivityWithItemClasses:", v5);

  return v6;
}

- (id)_activityImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0DC3870];
  _ShareSheetBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("UIActivityAirDrop"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v4, "_applicationIconImageForFormat:precomposed:scale:", 10, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_activitySettingsImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0DC3870];
  _ShareSheetBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("UIActivityAirDrop"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v4, "_applicationIconImageForFormat:precomposed:scale:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGSize)_thumbnailSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_thumbnailSize");
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)_thumbnailSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  SFSuggestedAirDropThumbnailSize();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 0;
}

+ (id)classNamesForItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11, v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)classesForClassNames:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = NSClassFromString(*(NSString **)(*((_QWORD *)&v12 + 1) + 8 * v9));
        if (v10)
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)canPerformActivityWithItemClasses:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v8, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v9, "length") >= 0x3D)
        {
          objc_msgSend(v8, "description");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "substringToIndex:", 60);
          v11 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v5);
  }
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "isSubclassOfClass:", objc_opt_class());
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v14);
    }

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = v3;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v22);
        v20 = v20
           || (objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class(), (_QWORD)v26) & 1) != 0
           || (objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
           || (objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
           || (objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
           || (objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
           || objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class());
        if ((objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || (objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()))
        {
          v20 = 1;
        }
        if ((objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
          || objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()))
        {
          v20 = 1;
        }
        ++v22;
      }
      while (v19 != v22);
      v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      v19 = v24;
    }
    while (v24);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
