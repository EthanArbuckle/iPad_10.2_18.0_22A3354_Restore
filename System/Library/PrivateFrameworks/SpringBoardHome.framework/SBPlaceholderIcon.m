@implementation SBPlaceholderIcon

- (id)_initWithNodeIdentifier:(id)a3 icon:(id)a4
{
  id v7;
  id v8;
  SBPlaceholderIcon *v9;
  id *p_isa;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBPlaceholderIcon;
  v9 = -[SBIcon init](&v13, sel_init);
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong(&v9->_nodeIdentifier, a3);
    objc_storeStrong(p_isa + 9, a4);
    if (v8)
    {
      objc_msgSend(v8, "gridSizeClass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "setGridSizeClass:", v11);

    }
  }

  return p_isa;
}

- (id)_initWithNodeIdentifier:(id)a3 icons:(id)a4
{
  id v7;
  id v8;
  SBPlaceholderIcon *v9;
  SBPlaceholderIcon *v10;
  uint64_t v11;
  NSArray *icons;
  __CFString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SBPlaceholderIcon;
  v9 = -[SBIcon init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_nodeIdentifier, a3);
    v11 = objc_msgSend(v8, "copy");
    icons = v10->_icons;
    v10->_icons = (NSArray *)v11;

    v13 = CFSTR("SBHIconGridSizeClassDefault");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "gridSizeClass", (_QWORD)v23);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19 > v13)
          {
            v21 = v19;

            v13 = v21;
          }

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v16);
    }

    -[SBIcon setGridSizeClass:](v10, "setGridSizeClass:", v13);
  }

  return v10;
}

+ (id)placeholderNodeIdentifierForIcon:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "nodeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "placeholderNodeIdentifierForIconNodeIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)placeholderNodeIdentifierForIconNodeIdentifier:(id)a3
{
  void *v3;
  void *v4;

  SBIconIndexDebugStringForNodeIdentifier(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Placeholder: "), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)placeholderForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "placeholderNodeIdentifierForIcon:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithNodeIdentifier:icon:", v5, v4);

  return v6;
}

+ (id)grabbedIconPlaceholderForIcon:(id)a3
{
  id v3;
  SBGrabbedPlaceholderIcon *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = [SBGrabbedPlaceholderIcon alloc];
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "nodeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBIconIndexDebugStringForNodeIdentifier(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Placeholder: Grabbed %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBPlaceholderIcon _initWithNodeIdentifier:icon:](v4, "_initWithNodeIdentifier:icon:", v8, v3);

  return v9;
}

+ (id)grabbedIconPlaceholderForIcons:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SBGrabbedPlaceholderIcon *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "nodeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        SBIconIndexDebugStringForNodeIdentifier(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v12 = [SBGrabbedPlaceholderIcon alloc];
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Placeholder: Grabbed %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBPlaceholderIcon _initWithNodeIdentifier:icons:](v12, "_initWithNodeIdentifier:icons:", v15, v5);

  return v16;
}

+ (id)clusteredIconPlaceholderForIcons:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SBClusteredPlaceholderIcon *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "nodeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        SBIconIndexDebugStringForNodeIdentifier(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v12 = [SBClusteredPlaceholderIcon alloc];
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Placeholder: Clustered %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBPlaceholderIcon _initWithNodeIdentifier:icons:](v12, "_initWithNodeIdentifier:icons:", v15, v5);

  return v16;
}

+ (id)placeholderForReason:(id)a3
{
  id v3;
  SBCustomPlaceholderIcon *v4;

  v3 = a3;
  v4 = -[SBCustomPlaceholderIcon initWithReason:]([SBCustomPlaceholderIcon alloc], "initWithReason:", v3);

  return v4;
}

- (id)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (id)automationID
{
  return (id)objc_msgSend(CFSTR("BTN "), "stringByAppendingString:", CFSTR("DestinationHole"));
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  return 0;
}

- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  return 0;
}

- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3
{
  return 0;
}

+ (BOOL)hasIconImage
{
  return 0;
}

- (BOOL)isPlaceholder
{
  return 1;
}

- (SBIcon)referencedIcon
{
  SBIcon *icon;

  icon = self->_icon;
  if (icon)
    return icon;
  -[NSArray firstObject](self->_icons, "firstObject");
  return (SBIcon *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)referencedIcons
{
  NSArray *icons;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  icons = self->_icons;
  if (icons)
    return icons;
  if (self->_icon)
  {
    v5[0] = self->_icon;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

- (BOOL)referencesIcon:(id)a3
{
  return self->_icon == a3 || -[NSArray containsObject:](self->_icons, "containsObject:");
}

- (BOOL)referencesIconWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  NSArray *icons;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[SBIcon nodeIdentifier](self->_icon, "nodeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    icons = self->_icons;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__SBPlaceholderIcon_referencesIconWithIdentifier___block_invoke;
    v10[3] = &unk_1E8D87A40;
    v11 = v4;
    v7 = -[NSArray indexOfObjectPassingTest:](icons, "indexOfObjectPassingTest:", v10) != 0x7FFFFFFFFFFFFFFFLL;

  }
  return v7;
}

uint64_t __50__SBPlaceholderIcon_referencesIconWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "nodeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (void)updateReferencedIcons:(id)a3
{
  NSArray *v4;
  NSArray *icons;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  icons = self->_icons;
  self->_icons = v4;

}

- (id)gridCellImage
{
  return 0;
}

- (BOOL)isUninstallSupported
{
  return 0;
}

- (BOOL)isGridSizeClassAllowed:(id)a3
{
  return 1;
}

- (BOOL)canReceiveGrabbedIcon
{
  return 0;
}

- (id)folder
{
  void *v2;
  void *v3;

  -[SBPlaceholderIcon referencedIcon](self, "referencedIcon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong(&self->_nodeIdentifier, 0);
}

@end
