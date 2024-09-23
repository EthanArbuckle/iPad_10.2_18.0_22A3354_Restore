@implementation SBIcon

- (id)overrideBadgeNumberOrString
{
  return self->_overrideBadgeNumberOrString;
}

- (BOOL)isFolderIcon
{
  return 0;
}

- (int64_t)accessoryTypeForLocation:(id)a3
{
  void *v3;
  int64_t v4;

  -[SBIcon accessoryTextForLocation:](self, "accessoryTextForLocation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)accessoryTextForLocation:(id)a3
{
  void *v3;
  char isKindOfClass;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[SBIcon badgeNumberOrString](self, "badgeNumberOrString", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v3;
  v6 = v5;
  v7 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(v5, "integerValue") < 1)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37F0], "sbf_cachedDecimalNumberFormatter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromNumber:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (id)badgeNumberOrString
{
  id overrideBadgeNumberOrString;

  overrideBadgeNumberOrString = self->_overrideBadgeNumberOrString;
  if (!overrideBadgeNumberOrString)
    overrideBadgeNumberOrString = self->_badgeNumberOrString;
  return overrideBadgeNumberOrString;
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (Class)iconImageViewClassForLocation:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)isAdditionalItemsIndicatorIcon
{
  return 0;
}

- (BOOL)isApplicationIcon
{
  return 0;
}

- (BOOL)isLaunchEnabled
{
  return 1;
}

- (BOOL)isLaunchDisabledForObscuredReason
{
  return 0;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (void)addObserver:(id)a3
{
  BOOL v4;
  void *v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ cannot be observed by a nil object"), objc_opt_class());
LABEL_7:
    v5 = v9;
    goto LABEL_8;
  }
  v4 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v9);
  v5 = v9;
  if (!v4)
  {
    observers = self->_observers;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)canTruncateLabel
{
  return 1;
}

- (BOOL)canTightenLabel
{
  return 1;
}

- (BOOL)isBookmarkIcon
{
  return 0;
}

- (id)statusDescriptionForLocation:(id)a3
{
  return 0;
}

- (id)applicationBundleID
{
  return 0;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIcon descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  SBIcon *v5;
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon nodeIdentifier](self, "nodeIdentifier");
  v5 = (SBIcon *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
    v7 = (id)objc_msgSend(v4, "appendPointer:withName:", self, CFSTR("nodeID"));
  else
    v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("nodeID"));
  -[SBIcon applicationBundleID](self, "applicationBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v8, CFSTR("bundleID"), 1);

  -[SBIcon gridSizeClass](self, "gridSizeClass");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 != CFSTR("SBHIconGridSizeClassDefault") && (-[__CFString isEqualToString:](v9, "isEqualToString:") & 1) == 0)
  {
    SBHStringForIconGridSizeClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v11, CFSTR("gridSizeClass"));

  }
  return v4;
}

- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[SBIcon nodeIdentifier](self, "nodeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setBadge:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(self->_badgeNumberOrString, "isEqual:") & 1) == 0)
  {
    objc_storeStrong(&self->_badgeNumberOrString, a3);
    -[SBIcon noteBadgeDidChange](self, "noteBadgeDidChange");
  }

}

- (BOOL)isPlaceholder
{
  return 0;
}

- (BOOL)isTimedOut
{
  return 0;
}

- (void)_notifyLaunchEnabledDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "iconLaunchEnabledDidChange:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)enumerateObserversUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      v12 = 0;
      v4[2](v4, v11, &v12);
      if (v12)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_notifyAccessoriesDidUpdate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "iconAccessoriesDidUpdate:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (int64_t)progressState
{
  return 0;
}

- (double)progressPercent
{
  return 0.0;
}

- (BOOL)isProgressPaused
{
  return 0;
}

- (BOOL)shouldAnimateProgress
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_notifyImageDidUpdate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "iconImageDidUpdate:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)isWidgetIcon
{
  return 0;
}

- (BOOL)isDebugIcon
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[SBIcon descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isLibraryPodIcon
{
  return 0;
}

- (BOOL)isAppClipIcon
{
  return 0;
}

- (BOOL)isWebAppIcon
{
  return 0;
}

- (id)application
{
  return 0;
}

- (id)applicationPlaceholder
{
  return 0;
}

- (BOOL)hasApplication
{
  void *v2;
  BOOL v3;

  -[SBIcon application](self, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasApplicationPlaceholder
{
  void *v2;
  BOOL v3;

  -[SBIcon applicationPlaceholder](self, "applicationPlaceholder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isGrabbedIconPlaceholder
{
  return 0;
}

- (BOOL)isClusteredIconPlaceholder
{
  return 0;
}

- (BOOL)isLeafIcon
{
  return 0;
}

- (id)leafIdentifier
{
  return 0;
}

- (id)representedSceneIdentifier
{
  return 0;
}

- (id)folder
{
  return 0;
}

- (id)parentFolderIcon
{
  void *v2;
  void *v3;
  void *v4;

  -[SBIcon folder](self, "folder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isCategoryIcon
{
  return 0;
}

- (id)iconLibraryQueryingAlphaSortString
{
  return -[SBIcon displayNameForLocation:](self, "displayNameForLocation:", CFSTR("SBIconLocationRoot"));
}

- (id)iconLibraryQueryingFilterStrings
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SBIcon displayNameForLocation:](self, "displayNameForLocation:", CFSTR("SBIconLocationAppLibrarySearch"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (id)_sbhIconLibraryCollationString
{
  __CFString *v2;
  __CFString *v3;
  void *v4;

  -[SBIcon displayNameForLocation:](self, "displayNameForLocation:", CFSTR("SBIconLocationAppLibrarySearch"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E8D8E958;
  -[__CFString localizedUppercaseString](v2, "localizedUppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_sbhIconLibraryOverrideCollationSectionTitle
{
  return 0;
}

- (void)applyTreatmentsToLayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBIcon isTimedOut](self, "isTimedOut") || -[SBIcon progressState](self, "progressState"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    objc_msgSend(v5, "setValue:forKey:", v7, *MEMORY[0x1E0CD2D00]);

    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", v8);

  }
  else
  {
    objc_msgSend(v4, "setFilters:", MEMORY[0x1E0C9AA60]);
  }

}

- (SBIcon)init
{
  SBIcon *v2;
  SBIcon *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIcon;
  v2 = -[SBIcon init](&v5, sel_init);
  v3 = v2;
  if (v2)
    objc_storeStrong((id *)&v2->_gridSizeClass, CFSTR("SBHIconGridSizeClassDefault"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_setPropertiesFromIcon:", self);
    v6 = v5;
  }

  return v5;
}

- (BOOL)hasObserver:(id)a3
{
  return -[NSHashTable containsObject:](self->_observers, "containsObject:", a3);
}

- (NSString)nodeIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBIcon:%p"), self);
}

- (BOOL)containsNodeIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBIcon nodeIdentifier](self, "nodeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (id)containedNodeIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E20];
  -[SBIcon nodeIdentifier](self, "nodeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4 + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertObject:atIndex:", self, 0);
  return v5;
}

- (id)nodeDescriptionWithPrefix:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[SBIcon nodeIdentifier](self, "nodeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = (void *)MEMORY[0x1E0CB3940];
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_class();
    -[SBIcon displayNameForLocation:](self, "displayNameForLocation:", CFSTR("SBIconLocationNone"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@-%p (%@)"), v4, v9, v5, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)shouldWarmUp
{
  return 1;
}

- (id)displayNameForLocation:(id)a3
{
  return 0;
}

- (NSString)displayName
{
  return (NSString *)-[SBIcon displayNameForLocation:](self, "displayNameForLocation:", CFSTR("SBIconLocationNone"));
}

- (int64_t)localizedCompareDisplayNames:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  int64_t v9;

  v4 = a3;
  -[SBIcon displayNameForLocation:](self, "displayNameForLocation:", CFSTR("SBIconLocationNone"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (__CFString *)v5;
  else
    v6 = &stru_1E8D8E958;
  objc_msgSend(v4, "displayNameForLocation:", CFSTR("SBIconLocationNone"));
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (__CFString *)v7;
  else
    v8 = &stru_1E8D8E958;
  v9 = -[__CFString localizedStandardCompare:](v6, "localizedStandardCompare:", v8);

  return v9;
}

- (NSArray)tags
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsStackConfiguration
{
  return 0;
}

- (BOOL)supportsRasterization
{
  return 1;
}

+ (id)iconImageFromUnmaskedImage:(id)a3 info:(SBIconImageInfo *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  _QWORD v27[2];

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v27[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = objc_alloc(MEMORY[0x1E0D3A7C0]);
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "CGImage");
  objc_msgSend(v12, "scale");
  v14 = (void *)objc_msgSend(v11, "initWithCGImage:scale:", v13);
  v15 = objc_alloc(MEMORY[0x1E0D3A820]);
  v27[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithImages:", v16);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v9, v8, v7);
  objc_msgSend(v18, "setShape:", 1);
  objc_msgSend(v17, "prepareImageForDescriptor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = (void *)MEMORY[0x1E0DC3870];
    v22 = objc_msgSend(v19, "CGImage");
    objc_msgSend(v20, "scale");
    objc_msgSend(v21, "imageWithCGImage:scale:orientation:", v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = v12;
  }
  v24 = v23;
  if (objc_msgSend(v12, "flipsForRightToLeftLayoutDirection"))
  {
    objc_msgSend(v24, "imageFlippedForRightToLeftLayoutDirection");
    v25 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v25;
  }

  return v24;
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  -[SBIcon unmaskedIconImageWithInfo:](self, "unmaskedIconImageWithInfo:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "iconImageFromUnmaskedImage:info:", v11, v10, v9, v8, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)makeIconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  if ((a4 & 1) != 0)
    -[SBIcon generateIconImageWithInfo:](self, "generateIconImageWithInfo:", a3);
  else
    -[SBIcon unmaskedIconImageWithInfo:](self, "unmaskedIconImageWithInfo:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  return 0;
}

- (id)makeIconLayerFromImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  id v11;

  v7 = v6;
  v8 = v5;
  -[SBIcon iconImageWithInfo:traitCollection:options:](self, "iconImageWithInfo:traitCollection:options:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v8, v7);
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "setContents:", objc_msgSend(v11, "CGImage"));

  return v10;
}

- (id)iconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  SBIconImageInfo *v15;
  void *v16;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v15 = a3;
  -[SBIcon makeIconLayerWithInfo:traitCollection:options:](self, "makeIconLayerWithInfo:traitCollection:options:", v15, a4, v13, v12, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    -[SBIcon makeIconLayerFromImageWithInfo:traitCollection:options:](self, "makeIconLayerFromImageWithInfo:traitCollection:options:", v15, a4, v13, v12, v11, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (BOOL)canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  return 1;
}

+ (id)backgroundGenerationQueue
{
  if (backgroundGenerationQueue_onceToken != -1)
    dispatch_once(&backgroundGenerationQueue_onceToken, &__block_literal_global_66);
  return (id)backgroundGenerationQueue_backgroundGenerationQueue;
}

void __35__SBIcon_backgroundGenerationQueue__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D01760], "serial");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = BSDispatchQueueCreate();
  v1 = (void *)backgroundGenerationQueue_backgroundGenerationQueue;
  backgroundGenerationQueue_backgroundGenerationQueue = v0;

}

- (void)iconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v12;
  double v13;
  double v14;
  double v15;
  SBIconImageInfo *v17;
  void (**v18)(id, void *);
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  SBIconImageInfo *v22;
  void (**v23)(id, void *);
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;

  v12 = v9;
  v13 = v8;
  v14 = v7;
  v15 = v6;
  v17 = a3;
  v18 = (void (**)(id, void *))(id)a5;
  if (-[SBIcon canMakeIconLayerQuicklyWithInfo:traitCollection:options:](self, "canMakeIconLayerQuicklyWithInfo:traitCollection:options:", v17, a4, v15, v14, v13, v12))
  {
    -[SBIcon iconLayerWithInfo:traitCollection:options:](self, "iconLayerWithInfo:traitCollection:options:", v17, a4, v15, v14, v13, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v19);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "backgroundGenerationQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70__SBIcon_iconLayerWithInfo_traitCollection_options_completionHandler___block_invoke;
    v21[3] = &unk_1E8D8D7D8;
    v21[4] = self;
    v24 = v15;
    v25 = v14;
    v26 = v13;
    v27 = v12;
    v22 = v17;
    v28 = a4;
    v23 = v18;
    dispatch_async(v20, v21);

  }
}

void __70__SBIcon_iconLayerWithInfo_traitCollection_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "prepareToMakeLayerWithInfo:traitCollection:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  BSDispatchMain();

}

void __70__SBIcon_iconLayerWithInfo_traitCollection_options_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "iconLayerWithInfo:traitCollection:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3
{
  return 0;
}

- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  return (id)objc_msgSend((id)objc_opt_class(), "genericIconImageWithInfo:", v3, v4, v5, v6);
}

+ (id)genericIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  CGColorSpace *v19;
  _QWORD v21[8];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v10, v9, v8);
  objc_msgSend(v11, "prepareImageForDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13
    || (v15 = (void *)MEMORY[0x1E0DC3870],
        v16 = objc_msgSend(v13, "CGImage"),
        objc_msgSend(v14, "scale"),
        objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v16, 0),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    SBLogIcon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v23 = v14;
      v24 = 2112;
      v25 = v11;
      v26 = 2112;
      v27 = v12;
      _os_log_error_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_ERROR, "Could not create generic application icon via IconServices. isImage=%@, genericIcon=%@, imageDescriptor=%@", buf, 0x20u);
    }

    v19 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __35__SBIcon_genericIconImageWithInfo___block_invoke;
    v21[3] = &__block_descriptor_64_e5_v8__0l;
    *(double *)&v21[4] = v10;
    *(double *)&v21[5] = v9;
    *(double *)&v21[6] = v8;
    v21[7] = v7;
    objc_msgSend(MEMORY[0x1E0DC3870], "sbf_imageFromBGRAContextWithSize:scale:colorSpace:withAlpha:pool:drawing:encapsulation:", v19, 1, 0, v21, 0, v10, v9, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CGColorSpaceRelease(v19);
  }

  return v17;
}

void __35__SBIcon_genericIconImageWithInfo___block_invoke(CGFloat *a1)
{
  void *v2;
  void *v3;
  CGRect v4;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a1[4], a1[5], a1[7]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addClip");

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");

  v4.size.width = a1[4];
  v4.size.height = a1[5];
  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  UIRectFill(v4);
}

+ (id)genericIconLayerWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  id v11;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  objc_msgSend(a1, "genericIconImageWithInfo:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v8, v7);
  objc_msgSend(v10, "setCornerRadius:", v6);
  objc_msgSend(v10, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "setContents:", objc_msgSend(v11, "CGImage"));

  return v10;
}

+ (BOOL)forcesBackgroundIconGeneration
{
  return 0;
}

- (BOOL)canGenerateIconsInBackground
{
  return objc_msgSend((id)objc_opt_class(), "canGenerateIconsInBackground");
}

+ (BOOL)hasIconImage
{
  return 1;
}

- (void)setOverrideBadgeNumberOrString:(id)a3
{
  void *v4;
  id overrideBadgeNumberOrString;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    overrideBadgeNumberOrString = self->_overrideBadgeNumberOrString;
    self->_overrideBadgeNumberOrString = v4;

    -[SBIcon noteBadgeDidChange](self, "noteBadgeDidChange");
  }

}

- (int64_t)badgeValue
{
  void *v3;
  int64_t v4;

  if (self->_overrideBadgeNumberOrString)
    return objc_msgSend(self->_overrideBadgeNumberOrString, "integerValue");
  -[SBIcon badgeNumberOrString](self, "badgeNumberOrString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)labelAccessoryType
{
  if (-[SBIcon isTimedOut](self, "isTimedOut"))
    return 4;
  else
    return 0;
}

- (NSString)automationID
{
  void *v2;
  void *v3;

  -[SBIcon displayNameForLocation:](self, "displayNameForLocation:", CFSTR("SBIconLocationNone"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("BTN "), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)launchFromLocation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  SBIcon *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBIcon delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIcon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138413058;
    v11 = self;
    v12 = 2114;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_DEFAULT, "SBIcon %@ launchFromLocation:%{public}@ context:%@ delegate:%@", (uint8_t *)&v10, 0x2Au);
  }

  if (!-[SBIcon performLaunchFromLocation:context:](self, "performLaunchFromLocation:context:", v6, v7))
    objc_msgSend(v8, "icon:launchFromLocation:context:", self, v6, v7);

}

- (BOOL)performLaunchFromLocation:(id)a3 context:(id)a4
{
  return 0;
}

- (BOOL)isUninstallSupported
{
  return 0;
}

- (void)completeUninstall
{
  NSObject *v3;
  int v4;
  SBIcon *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "Complete uninstall for icon: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)setUninstalled
{
  self->_uninstalled = 1;
}

- (NSString)uninstallAlertTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  SBHBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UNINSTALL_ICON_TITLE_DELETE_WITH_NAME"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon displayNameForLocation:](self, "displayNameForLocation:", CFSTR("SBIconLocationNone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)uninstallAlertBody
{
  return 0;
}

- (NSString)uninstallAlertConfirmTitle
{
  void *v2;
  void *v3;

  SBHBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNINSTALL_ICON_BUTTON_DELETE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)uninstallAlertCancelTitle
{
  void *v2;
  void *v3;

  SBHBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNINSTALL_ICON_BUTTON_CANCEL"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)folderTitleOptions
{
  return 0;
}

- (NSString)folderFallbackTitle
{
  return 0;
}

- (BOOL)canReceiveGrabbedIcon
{
  return 1;
}

- (BOOL)canBeReceivedByIcon
{
  return 1;
}

- (BOOL)canBeAddedToMultiItemDrag
{
  return 1;
}

- (NSArray)iTunesCategoriesOrderedByRelevancy
{
  return 0;
}

- (BOOL)canBeAddedToSubfolder
{
  __CFString *v3;
  void *v4;
  char v5;

  -[SBIcon gridSizeClass](self, "gridSizeClass");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3 == CFSTR("SBHIconGridSizeClassDefault"))
  {
    v5 = 1;
  }
  else
  {
    -[SBIcon gridSizeClass](self, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

  }
  return v5;
}

- (void)setGridSizeClass:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *gridSizeClass;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_gridSizeClass != v4
    && !-[NSString isEqualToString:](v4, "isEqualToString:")
    && -[SBIcon isGridSizeClassAllowed:](self, "isGridSizeClassAllowed:", v5))
  {
    v6 = (NSString *)-[NSString copy](v5, "copy");
    gridSizeClass = self->_gridSizeClass;
    self->_gridSizeClass = v6;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "iconGridSizeClassDidChange:", self);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (BOOL)isGridSizeClassAllowed:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBIcon supportedGridSizeClasses](self, "supportedGridSizeClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsGridSizeClass:", v4);

  return v6;
}

- (SBHIconGridSizeClassSet)supportedGridSizeClasses
{
  return (SBHIconGridSizeClassSet *)+[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllGridSizeClasses");
}

- (void)archivableStateDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "iconArchivableStateDidChange:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (NSUserActivity)draggingUserActivity
{
  return 0;
}

- (void)_setPropertiesFromIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "gridSizeClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon setGridSizeClass:](self, "setGridSizeClass:", v5);

  objc_msgSend(v4, "badgeNumberOrString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon setBadge:](self, "setBadge:", v6);

  objc_msgSend(v4, "overrideBadgeNumberOrString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon setOverrideBadgeNumberOrString:](self, "setOverrideBadgeNumberOrString:", v7);

  LODWORD(v7) = objc_msgSend(v4, "isUninstalled");
  if ((_DWORD)v7)
    -[SBIcon setUninstalled](self, "setUninstalled");
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIcon succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (SBIconDelegate)delegate
{
  return (SBIconDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setIconImageCacheIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isUninstalled
{
  return self->_uninstalled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_iconImageCacheIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_overrideBadgeNumberOrString, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_badgeNumberOrString, 0);
}

- (BOOL)isWidgetStackIcon
{
  return 0;
}

@end
