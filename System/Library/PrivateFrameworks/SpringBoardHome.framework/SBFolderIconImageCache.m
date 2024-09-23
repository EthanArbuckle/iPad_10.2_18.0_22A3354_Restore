@implementation SBFolderIconImageCache

- (void)addObserver:(id)a3 forFolderIcon:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_folderIconObservers, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_folderIconObservers, "setObject:forKey:", v7, v6);
  }
  if ((objc_msgSend(v7, "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(v7, "addObject:", v9);
    -[SBFolderIconImageCache sharedCache](self, "sharedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "folderIconImageCache:didAddObserverForFolderIcon:", self, v6);

  }
}

- (SBFolderIconImageSharedCache)sharedCache
{
  return self->_sharedCache;
}

- (void)removeObserver:(id)a3 forFolderIcon:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_folderIconObservers, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v8))
  {
    objc_msgSend(v7, "removeObject:", v8);
    if (!objc_msgSend(v7, "count"))
      -[NSMapTable removeObjectForKey:](self->_folderIconObservers, "removeObjectForKey:", v6);
  }

}

- (SBFolderIconImageCache)initWithListLayout:(id)a3
{
  return -[SBFolderIconImageCache initWithListLayout:sharedCache:](self, "initWithListLayout:sharedCache:", a3, 0);
}

- (SBFolderIconImageCache)initWithListLayout:(id)a3 sharedCache:(id)a4
{
  id v7;
  id v8;
  SBFolderIconImageCache *v9;
  SBFolderIconImageCache *v10;
  SBFolderIconImageSharedCache *v11;
  SBFolderIconImageSharedCache *sharedCache;
  uint64_t v13;
  NSMapTable *folderIconObservers;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBFolderIconImageCache;
  v9 = -[SBFolderIconImageCache init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listLayout, a3);
    if (v8)
      v11 = (SBFolderIconImageSharedCache *)v8;
    else
      v11 = -[SBFolderIconImageSharedCache initWithListLayout:]([SBFolderIconImageSharedCache alloc], "initWithListLayout:", v7);
    sharedCache = v10->_sharedCache;
    v10->_sharedCache = v11;

    -[SBFolderIconImageSharedCache registerFolderIconImageCache:](v10->_sharedCache, "registerFolderIconImageCache:", v10);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    folderIconObservers = v10->_folderIconObservers;
    v10->_folderIconObservers = (NSMapTable *)v13;

  }
  return v10;
}

+ (id)defaultListLayout
{
  SBIconListGridLayoutConfiguration *v2;
  void *v3;
  void *v4;
  SBIconListGridLayout *v5;

  v2 = objc_alloc_init(SBIconListGridLayoutConfiguration);
  -[SBIconListGridLayoutConfiguration setNumberOfPortraitRows:](v2, "setNumberOfPortraitRows:", 3);
  -[SBIconListGridLayoutConfiguration setNumberOfPortraitColumns:](v2, "setNumberOfPortraitColumns:", 3);
  -[SBIconListGridLayoutConfiguration folderIconVisualConfiguration](v2, "folderIconVisualConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGridCellSize:", 13.0, 13.0);

  -[SBIconListGridLayoutConfiguration folderIconVisualConfiguration](v2, "folderIconVisualConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGridCellSpacing:", 3.0, 3.0);

  -[SBIconListGridLayoutConfiguration setIconImageInfo:](v2, "setIconImageInfo:", 80.0, 80.0, 1.0, 20.0);
  v5 = -[SBIconListGridLayout initWithLayoutConfiguration:]([SBIconListGridLayout alloc], "initWithLayoutConfiguration:", v2);

  return v5;
}

- (SBFolderIconImageCache)init
{
  void *v3;
  SBFolderIconImageCache *v4;

  objc_msgSend((id)objc_opt_class(), "defaultListLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBFolderIconImageCache initWithListLayout:](self, "initWithListLayout:", v3);

  return v4;
}

- (void)setIconImageCache:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFolderIconImageCache sharedCache](self, "sharedCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconImageCache:", v4);

}

- (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 compatibleWithTraitCollection:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0DC3E88];
  v9 = a4;
  objc_msgSend(v8, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageCache imageForPageAtIndex:inFolderIcon:imageAppearance:](self, "imageForPageAtIndex:inFolderIcon:imageAppearance:", a3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSHashTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "listAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = self->_layoutHidingAssertions;
  v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "referencesIconInListModel:", v11, (_QWORD)v21) & 1) != 0)
        {

          -[SBFolderIconImageCache listLayout](self, "listLayout");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "imageForPageAtIndex:inFolderIcon:imageAppearance:listLayout:gridCellImageProvider:pool:", a3, v8, v9, v17, self, 0);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
        continue;
      break;
    }
  }

  -[SBFolderIconImageCache sharedCache](self, "sharedCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageForPageAtIndex:inFolderIcon:imageAppearance:", a3, v8, v9);
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v19 = (void *)v18;

  return v19;
}

+ (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 compatibleWithTraitCollection:(id)a5 listLayout:(id)a6 gridCellImageProvider:(id)a7 pool:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v14 = (void *)MEMORY[0x1E0DC3E88];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  objc_msgSend(v14, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageForPageAtIndex:inFolderIcon:imageAppearance:listLayout:gridCellImageProvider:pool:", a3, v18, v19, v17, v16, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)imageForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5 listLayout:(id)a6 gridCellImageProvider:(id)a7 pool:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  char v52;
  _QWORD v53[5];

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v13, "folder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "listAtIndex:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = SBHIconListLayoutFolderIconGridCellSize(v15);
  v22 = v21;
  objc_msgSend(v15, "iconImageInfo");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = objc_msgSend(v19, "numberOfIcons");
  v32 = objc_opt_respondsToSelector() & 1;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v53[3] = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __113__SBFolderIconImageCache_imageForPageAtIndex_inFolderIcon_imageAppearance_listLayout_gridCellImageProvider_pool___block_invoke;
  v39[3] = &unk_1E8D88BC0;
  v43 = v53;
  v44 = v31;
  v33 = v19;
  v40 = v33;
  v52 = v32;
  v34 = v16;
  v41 = v34;
  v45 = v20;
  v46 = v22;
  v47 = v24;
  v48 = v26;
  v49 = v28;
  v50 = v30;
  v35 = v14;
  v42 = v35;
  v51 = a1;
  +[SBIconGridImage gridImageForLayout:imageAppearance:pool:cellImageDrawBlock:](SBIconGridImage, "gridImageForLayout:imageAppearance:pool:cellImageDrawBlock:", v15, v35, v17, v39);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v53, 8);
  return v36;
}

BOOL __113__SBFolderIconImageCache_imageForPageAtIndex_inFolderIcon_imageAppearance_listLayout_gridCellImageProvider_pool___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, _BYTE *a8)
{
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;

  if ((unint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + a2) >= *(_QWORD *)(a1 + 64))
    return 0;
  v15 = 0;
  while (1)
  {
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 32), "iconAtIndex:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(a1 + 128) || !objc_msgSend(*(id *)(a1 + 40), "shouldSkipGridCellImageForIcon:", v15))
      break;
    if ((unint64_t)(++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + a2) >= *(_QWORD *)(a1 + 64))
    {
      v17 = 0;
      goto LABEL_14;
    }
  }
  v18 = *(void **)(a1 + 40);
  if (!v18)
    v18 = *(void **)(a1 + 120);
  objc_msgSend(v18, "gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:", v15, *(_QWORD *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v17 = v19 != 0;
  if (v19)
  {
    objc_msgSend(v19, "drawInRect:", a3, a4, a5, a6);
    v21 = objc_msgSend(*(id *)(a1 + 120), "drawTreatmentForIcon:inRect:", v15, a3, a4, a5, a6);
    if (a8)
      *a8 = v21;
  }

LABEL_14:
  return v17;
}

- (id)layerForPageAtIndex:(unint64_t)a3 inFolderIcon:(id)a4 imageAppearance:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSHashTable *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v27;
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
  v8 = a4;
  v27 = a5;
  objc_msgSend(v8, "folder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "listAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = self->_layoutHidingAssertions;
  v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v11);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v15), "referencesIconInListModel:", v10) & 1) != 0)
        {

          -[SBFolderIconImageCache listLayout](self, "listLayout");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v10, "copy");
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v20 = self->_layoutHidingAssertions;
          v21 = -[NSHashTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v29;
            do
            {
              v24 = 0;
              do
              {
                if (*(_QWORD *)v29 != v23)
                  objc_enumerationMutation(v20);
                objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v24), "icons");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "removeIcons:options:", v25, 0);

                ++v24;
              }
              while (v22 != v24);
              v22 = -[NSHashTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v22);
          }

          v17 = v27;
          objc_msgSend(v19, "folderLayerWithListLayout:imageAppearance:", v16, v27);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_18;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v13)
        continue;
      break;
    }
  }

  -[SBFolderIconImageCache sharedCache](self, "sharedCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v27;
  objc_msgSend(v16, "layerForPageAtIndex:inFolderIcon:imageAppearance:", a3, v8, v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v18;
}

+ (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  double width;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  height = a3.height;
  width = a3.width;
  v18 = (void *)MEMORY[0x1E0DC3E88];
  v19 = a4;
  objc_msgSend(v18, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:", v19, v20, width, height, v14, v13, v12, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 imageAppearance:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  double width;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  height = a3.height;
  width = a3.width;
  v18 = a4;
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_traitCollectionWithIconImageAppearance:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "iconImageWithInfo:traitCollection:options:", v19, 1, v14, v13, v12, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if ((objc_msgSend((id)objc_opt_class(), "hasIconImage") & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      +[SBHIconImageCache genericImageWithInfo:](SBHIconImageCache, "genericImageWithInfo:", v14, v13, v12, v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(a1, "gridCellImageOfSize:forIconImage:", v20, width, height);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)gridCellImageOfSize:(CGSize)a3 forIconImage:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  double v13;
  double v14;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", width, height);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__SBFolderIconImageCache_gridCellImageOfSize_forIconImage___block_invoke;
  v11[3] = &unk_1E8D88BE8;
  v12 = v6;
  v13 = width;
  v14 = height;
  v8 = v6;
  objc_msgSend(v7, "imageWithActions:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __59__SBFolderIconImageCache_gridCellImageOfSize_forIconImage___block_invoke(uint64_t a1, void *a2)
{
  CGContextSetInterpolationQuality((CGContextRef)objc_msgSend(a2, "CGContext"), kCGInterpolationHigh);
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)gridCellImageForIcon:(id)a3 imageAppearance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[SBFolderIconImageCache sharedCache](self, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gridCellImageForIcon:imageAppearance:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)needsTreatmentForIcon:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isTimedOut") & 1) != 0 || objc_msgSend(v3, "progressState") != 0;

  return v4;
}

+ (BOOL)drawTreatmentForIcon:(id)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int v8;
  void *v9;
  void *v10;
  CGRect v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = objc_msgSend(a1, "needsTreatmentForIcon:", a3);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithAlphaComponent:", 0.5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFill");

    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    UIRectFillUsingBlendMode(v12, kCGBlendModeSourceAtop);
  }
  return v8;
}

- (void)rebuildImagesForFolderIcon:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  SBLogFolderIconImageCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBFolderIconImageCache rebuildImagesForFolderIcon:].cold.1();

  -[SBFolderIconImageCache sharedCache](self, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rebuildImagesForFolderIcon:", v4);

}

- (void)rebuildAllCachedFolderImages
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1CFEF3000, v0, v1, "rebuilding all images", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)purgeAllCachedFolderImages
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1CFEF3000, v0, v1, "purging all images", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)informObserversOfUpdateForFolderIcon:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_folderIconObservers, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "folderIconImageCache:didUpdateImagesForFolderIcon:", self, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)informObserversOfUpdateForAllFolderIcons
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_folderIconObservers;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SBFolderIconImageCache informObserversOfUpdateForFolderIcon:](self, "informObserversOfUpdateForFolderIcon:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (unint64_t)numberOfCachedImages
{
  void *v2;
  unint64_t v3;

  -[SBFolderIconImageCache sharedCache](self, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfCachedImages");

  return v3;
}

- (unint64_t)numberOfCacheHits
{
  void *v2;
  unint64_t v3;

  -[SBFolderIconImageCache sharedCache](self, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfCacheHits");

  return v3;
}

- (unint64_t)numberOfCacheMisses
{
  void *v2;
  unint64_t v3;

  -[SBFolderIconImageCache sharedCache](self, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfCacheMisses");

  return v3;
}

- (id)gridCellImageOfSize:(CGSize)a3 forIcon:(id)a4 iconImageInfo:(SBIconImageInfo *)a5 compatibleWithTraitCollection:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  double width;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  height = a3.height;
  width = a3.width;
  v18 = (void *)MEMORY[0x1E0DC3E88];
  v19 = a4;
  objc_msgSend(v18, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageCache gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:](self, "gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:", v19, v20, width, height, v14, v13, v12, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)shouldSkipGridCellImageForIcon:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_layoutHidingAssertions;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "referencesIcon:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)folderIconImageSharedCache:(id)a3 didUpdateImagesForFolderIcon:(id)a4
{
  -[SBFolderIconImageCache informObserversOfUpdateForFolderIcon:](self, "informObserversOfUpdateForFolderIcon:", a4);
}

- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  SBHIconLayoutHidingAssertion *v10;
  NSHashTable *layoutHidingAssertions;
  NSHashTable *v12;
  NSHashTable *v13;
  NSMapTable *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[SBHIconLayoutHidingAssertion initWithDelegate:icons:reason:options:]([SBHIconLayoutHidingAssertion alloc], "initWithDelegate:icons:reason:options:", self, v8, v9, a5);
  layoutHidingAssertions = self->_layoutHidingAssertions;
  if (!layoutHidingAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v13 = self->_layoutHidingAssertions;
    self->_layoutHidingAssertions = v12;

    layoutHidingAssertions = self->_layoutHidingAssertions;
  }
  -[NSHashTable addObject:](layoutHidingAssertions, "addObject:", v10);
  -[SBFolderIconImageCache informObserversOfUpdateForAllFolderIcons](self, "informObserversOfUpdateForAllFolderIcons");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_folderIconObservers;
  v15 = -[NSMapTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        -[SBFolderIconImageCache informObserversOfUpdateForFolderIcon:](self, "informObserversOfUpdateForFolderIcon:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18++), (_QWORD)v20);
      }
      while (v16 != v18);
      v16 = -[NSMapTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

  return v10;
}

- (void)layoutHidingAssertionDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  SBFolderIconImageCache *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogFolderIconImageCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "icons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218498;
    v8 = self;
    v9 = 2048;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "%p: icon hiding assertion %p did change icons %@", (uint8_t *)&v7, 0x20u);

  }
  if (-[NSHashTable containsObject:](self->_layoutHidingAssertions, "containsObject:", v4))
    -[SBFolderIconImageCache informObserversOfUpdateForAllFolderIcons](self, "informObserversOfUpdateForAllFolderIcons");

}

- (void)layoutHidingAssertionDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  NSHashTable *layoutHidingAssertions;
  int v7;
  SBFolderIconImageCache *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogFolderIconImageCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = self;
    v9 = 2048;
    v10 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "%p: remove icon hiding assertion %p", (uint8_t *)&v7, 0x16u);
  }

  if (-[NSHashTable containsObject:](self->_layoutHidingAssertions, "containsObject:", v4))
  {
    -[NSHashTable removeObject:](self->_layoutHidingAssertions, "removeObject:", v4);
    if (!-[NSHashTable count](self->_layoutHidingAssertions, "count"))
    {
      layoutHidingAssertions = self->_layoutHidingAssertions;
      self->_layoutHidingAssertions = 0;

    }
    -[SBFolderIconImageCache informObserversOfUpdateForAllFolderIcons](self, "informObserversOfUpdateForAllFolderIcons");
  }

}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_sharedCache, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_layoutHidingAssertions, 0);
  objc_storeStrong((id *)&self->_folderIconObservers, 0);
}

- (void)rebuildImagesForFolderIcon:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "rebuilding image for icon: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
