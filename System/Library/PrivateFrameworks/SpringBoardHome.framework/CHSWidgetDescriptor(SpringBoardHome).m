@implementation CHSWidgetDescriptor(SpringBoardHome)

- (id)sbh_appName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  objc_msgSend(a1, "extensionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBHContainingBundleRecordForWidgetWithBundleIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "localizedShortName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v6 = v7;
    }
    else
    {
      objc_msgSend(a1, "sbh_iconDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_class();
      v11 = v9;
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v13 = v12;

      objc_msgSend(v13, "displayName");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (uint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome
{
  uint64_t v5;

  v5 = objc_msgSend(a1, "sbh_supportedSizeClasses");
  return v5 & ~objc_msgSend(a1, "sbh_disfavoredSizeClassesForAddWidgetSheetLocation:", a3);
}

- (uint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome
{
  return objc_msgSend(a1, "disfavoredFamiliesForLocation:", objc_msgSend(a1, "_widgetLocationStyleForAddWidgetSheetLocation:"));
}

- (uint64_t)_widgetLocationStyleForAddWidgetSheetLocation:()SpringBoardHome
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (uint64_t)sbh_canBeAddedToStack
{
  return 1;
}

- (uint64_t)sbh_supportsRemovableBackgroundOrAccessoryFamilies
{
  if ((objc_msgSend(a1, "supportedFamilies") & 0x1C00) != 0)
    return 1;
  else
    return objc_msgSend(a1, "sbh_supportsRemovableBackground");
}

- (id)sbh_iconDataSource
{
  void *v2;
  void *v3;

  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sbh_iconDataSourceInDomain:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SBHWidget)sbh_iconDataSourceInDomain:()SpringBoardHome
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  SBHIconGridSizeClassSet *v9;
  SBHWidget *v10;
  void *v11;
  void *v12;
  void *v13;
  SBHWidget *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  __objc2_class *v20;
  id v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_opt_class();
    v6 = a1;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v18 = v7;

    v19 = objc_msgSend(v18, "type");
    switch(v19)
    {
      case 1:
        v20 = SBHSiriSuggestionsElement;
        break;
      case 2:
        v20 = SBHShortcutsFolderElement;
        break;
      case 3:
        v20 = SBHFilesElement;
        break;
      case 4:
        v20 = SBHAppPredictionsElement;
        break;
      case 5:
        v20 = SBHSmartStackElement;
        break;
      case 6:
        v20 = SBHShortcutsSingleElement;
        break;
      default:
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Somehow got to SBHSpecialWidgetDescriptorTypeNone with a SBHSpecialWidgetDescriptor"), 0);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v22);
    }
    v14 = (SBHWidget *)objc_alloc_init(v20);
  }
  else
  {
    objc_msgSend(a1, "extensionIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBHIconGridSizeClassSet initWithCHSWidgetFamilyMask:inDomain:]([SBHIconGridSizeClassSet alloc], "initWithCHSWidgetFamilyMask:inDomain:", objc_msgSend(a1, "supportedFamilies"), v4);
    v10 = [SBHWidget alloc];
    objc_msgSend(a1, "kind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBHWidget initWithKind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:](v10, "initWithKind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:", v11, v12, v13, v9);

    SBLogWidgets();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[SBHWidget extensionBundleIdentifier](v14, "extensionBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidget uniqueIdentifier](v14, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v16;
      v25 = 2114;
      v26 = v17;
      _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created from CHS widget descriptor.", (uint8_t *)&v23, 0x16u);

    }
  }

  return v14;
}

- (id)sbh_galleryItemIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;

  objc_getAssociatedObject(a1, &SBHAvocadoDescriptorGalleryItemIdentifierKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "extensionIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "extensionBundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "kind");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "sbh_supportedSizeClasses");
    v8 = objc_msgSend(a1, "supportedFamilies");
    objc_msgSend(a1, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "widgetDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "intentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    v12 = (void *)v4;
    objc_msgSend(v15, "stringWithFormat:", CFSTR("AVO_DESCRIPTOR:%@-%@-%@-%lu-%lu-%@-%@-%@"), v4, v5, v6, v14, v8, v9, v10, v11);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setAssociatedObject(a1, &SBHAvocadoDescriptorGalleryItemIdentifierKey, v2, (void *)1);
  }
  return v2;
}

- (uint64_t)sbh_isLinkedOnOrAfter:()SpringBoardHome
{
  if (a3 == 1)
    return objc_msgSend(a1, "isLinkedOnOrAfter:", 0);
  else
    return a3 == 0;
}

- (id)backgroundColor
{
  id v2;
  id v4;

  objc_getAssociatedObject(a1, &SBHAvocadoDescriptorBackgroundColorKey);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v4 = 0;
    objc_msgSend(a1, "_loadColorsBackgroundColor:accentColor:", &v4, 0);
    v2 = v4;
  }
  return v2;
}

- (id)accentColor
{
  id v2;
  id v4;

  objc_getAssociatedObject(a1, &SBHAvocadoDescriptorAccentColorKey);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v4 = 0;
    objc_msgSend(a1, "_loadColorsBackgroundColor:accentColor:", 0, &v4);
    v2 = v4;
  }
  return v2;
}

- (id)mostInterestingColor
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(a1, "accentColor");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "backgroundColor");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3 | v2)
  {
    v5 = (void *)MEMORY[0x1E0DC3658];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__CHSWidgetDescriptor_SpringBoardHome__mostInterestingColor__block_invoke;
    v8[3] = &unk_1E8D86C50;
    v9 = (id)v3;
    v10 = (id)v2;
    objc_msgSend(v5, "colorWithDynamicProvider:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_loadColorsBackgroundColor:()SpringBoardHome accentColor:
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  objc_msgSend(a1, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  objc_msgSend(a1, "_loadColorsFromExtensionForBundleIdentifier:backgroundColor:accentColor:", v7, &v15, &v14);
  v8 = v15;
  v9 = v14;
  v12 = v9;
  v13 = v8;
  objc_msgSend(a1, "_loadColorsFromShortcutsForBundleIdentifier:backgroundColor:accentColor:", v7, &v13, &v12);
  v10 = v13;

  v11 = v12;
  objc_setAssociatedObject(a1, &SBHAvocadoDescriptorBackgroundColorKey, v10, (void *)1);
  objc_setAssociatedObject(a1, &SBHAvocadoDescriptorAccentColorKey, v11, (void *)1);
  if (a3 && !*a3)
  {
    *a3 = objc_retainAutorelease(v10);
    if (!a4)
      goto LABEL_7;
  }
  else if (!a4)
  {
    goto LABEL_7;
  }
  if (!*a4)
    *a4 = objc_retainAutorelease(v11);
LABEL_7:

}

- (void)_loadColorsFromExtensionForBundleIdentifier:()SpringBoardHome backgroundColor:accentColor:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  id v26;
  id v27;

  v7 = a3;
  if (!*a4 || !*a5)
  {
    v25 = a5;
    v26 = v7;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v7, 0);
    objc_msgSend(v8, "compatibilityObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01700]), "initWithURL:", v10);
    objc_msgSend(v11, "infoDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("NSWidgetBackgroundColorName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("NSAccentColorName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0DC4020]);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v17 = (void *)objc_msgSend(v15, "initWithURL:idiom:error:", v10, objc_msgSend(v16, "userInterfaceIdiom"), &v27);
    v18 = v27;

    if (v18)
    {
      SBLogWidgets();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CHSWidgetDescriptor(SpringBoardHome) _loadColorsFromExtensionForBundleIdentifier:backgroundColor:accentColor:].cold.1(v18, v19);
    }
    else
    {
      v23 = v11;
      v24 = v8;
      v20 = (void *)objc_opt_new();
      objc_msgSend(v17, "colorNamed:withTraitCollection:", v13, v20);
      v19 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)objc_opt_new();
      objc_msgSend(v17, "colorNamed:withTraitCollection:", v14, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19 && !*a4)
        *a4 = objc_retainAutorelease(v19);
      if (v25 && v22 && !*v25)
        *v25 = objc_retainAutorelease(v22);

      v11 = v23;
      v8 = v24;
    }

    v7 = v26;
  }

}

- (void)_loadColorsFromShortcutsForBundleIdentifier:()SpringBoardHome backgroundColor:accentColor:
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  if (!*a4 || !*a5)
  {
    WFWidgetGetDefaultColors();
    v8 = 0;
    v9 = 0;
    if (v8 && !*a4)
      *a4 = objc_retainAutorelease(v8);
    if (v9 && !*a5)
      *a5 = objc_retainAutorelease(v9);

  }
}

- (void)_loadColorsFromExtensionForBundleIdentifier:()SpringBoardHome backgroundColor:accentColor:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Error creating asset manager: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
