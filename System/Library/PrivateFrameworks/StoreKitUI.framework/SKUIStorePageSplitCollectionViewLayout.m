@implementation SKUIStorePageSplitCollectionViewLayout

- (SKUIStorePageSplitCollectionViewLayout)init
{
  SKUIStorePageSplitCollectionViewLayout *v3;
  NSMutableArray *v4;
  NSMutableArray *orderedSublayouts;
  objc_super v7;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStorePageSplitCollectionViewLayout init].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  v3 = -[_UICollectionViewCompositionLayout init](&v7, sel_init);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderedSublayouts = v3->_orderedSublayouts;
    v3->_orderedSublayouts = v4;

    -[SKUIStorePageSplitCollectionViewLayout registerClass:forDecorationViewOfKind:](v3, "registerClass:forDecorationViewOfKind:", objc_opt_class(), 0x1E73B7DF0);
    -[SKUIStorePageSplitCollectionViewLayout registerClass:forDecorationViewOfKind:](v3, "registerClass:forDecorationViewOfKind:", objc_opt_class(), 0x1E73B27D0);
  }
  return v3;
}

- (void)addSublayoutsUsingSplitsDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  double *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIStorePageSplitCollectionViewLayout sublayouts](self, "sublayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v4, "numberOfSplits");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __78__SKUIStorePageSplitCollectionViewLayout_addSublayoutsUsingSplitsDescription___block_invoke;
    v48[3] = &unk_1E73A8810;
    v9 = v8;
    v49 = v9;
    v50 = v6;
    objc_msgSend(v4, "enumerateSplitsUsingBlock:", v48);

  }
  else
  {
    v9 = 0;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(v10);
        -[SKUIStorePageSplitCollectionViewLayout removeSublayout:](self, "removeSublayout:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v12);
  }

  objc_msgSend(v4, "topSplit");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (double *)MEMORY[0x1E0C9D538];
  v40 = (void *)v15;
  if (v15)
  {
    v17 = (void *)v15;
    objc_msgSend(v9, "objectForKey:", v15);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!v18)
      v18 = -[SKUIStorePageSplitCollectionViewLayout _newStorePageCollectionViewLayout](self, "_newStorePageCollectionViewLayout");
    v19 = objc_msgSend(v17, "numberOfPageSections");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSplitCollectionViewLayout addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:](self, "addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:", v18, v20, 0, 0, *v16, v16[1]);

    v43 = v18;
    v21 = 4;
  }
  else
  {
    v21 = 0;
    v43 = 0;
    v19 = 0;
  }
  objc_msgSend(v4, "leftSplit");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v9;
  if (v22)
  {
    v23 = v4;
    objc_msgSend(v9, "objectForKey:", v22);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (!v24)
      v24 = -[SKUIStorePageSplitCollectionViewLayout _newStorePageCollectionViewLayout](self, "_newStorePageCollectionViewLayout");
    v25 = objc_msgSend(v22, "numberOfPageSections");
    objc_msgSend(v22, "sectionContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activePageWidth");
    objc_msgSend(v24, "setOverrideContentWidth:");

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v19, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSplitCollectionViewLayout addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:](self, "addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:", v24, v27, v21, v43, *v16, v16[1]);

    v19 += v25;
    v28 = v24;

    v21 = 8;
    v41 = v28;
    v4 = v23;
    v9 = v42;
  }
  else
  {
    v41 = 0;
    v28 = v43;
  }
  objc_msgSend(v4, "rightSplit");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v39 = v4;
    objc_msgSend(v9, "objectForKey:", v29);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (!v30)
      v30 = -[SKUIStorePageSplitCollectionViewLayout _newStorePageCollectionViewLayout](self, "_newStorePageCollectionViewLayout");
    v31 = objc_msgSend(v29, "numberOfPageSections");
    objc_msgSend(v29, "sectionContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activePageWidth");
    objc_msgSend(v30, "setOverrideContentWidth:");

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v19, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSplitCollectionViewLayout addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:](self, "addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:", v30, v33, v21, v28, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    v19 += v31;
    v34 = v41;

    v28 = v34;
    v4 = v39;
    v9 = v42;
  }
  objc_msgSend(v4, "bottomSplit");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v9, "objectForKey:", v35);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    if (!v36)
      v36 = -[SKUIStorePageSplitCollectionViewLayout _newStorePageCollectionViewLayout](self, "_newStorePageCollectionViewLayout");
    v37 = objc_msgSend(v35, "numberOfPageSections");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v19, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSplitCollectionViewLayout addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:](self, "addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:", v36, v38, 4, v28, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    v9 = v42;
  }

}

void __78__SKUIStorePageSplitCollectionViewLayout_addSublayoutsUsingSplitsDescription___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

- (NSArray)indexPathsForPinningItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SKUIStorePageSplitCollectionViewLayout sublayouts](self, "sublayouts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "indexPathsForPinningItems");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          if (!v5)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v5, "addObjectsFromArray:", v8);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (id)layoutAttributesForUnpinnedItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "item");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SKUIStorePageSplitCollectionViewLayout sublayouts](self, "sublayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v18 = v4;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_sublayoutToSectionsToIndexRanges, "objectForKey:", v12, v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "objectForKey:", v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "containsIndex:", v6) & 1) != 0)
          {
            v4 = v18;
            objc_msgSend(v12, "layoutAttributesForUnpinnedItemAtIndexPath:", v18);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
    v16 = 0;
    v4 = v18;
  }
  else
  {
    v16 = 0;
  }
LABEL_14:

  return v16;
}

- (id)pinnedLayoutAttributesForItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_orderedSublayouts;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[SKUIStorePageSplitCollectionViewLayout convertRect:toLayout:](self, "convertRect:toLayout:", v14, x, y, width, height, (_QWORD)v17);
        objc_msgSend(v14, "pinnedLayoutAttributesForItemsInRect:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
        {
          if (v11)
            objc_msgSend(v11, "addObjectsFromArray:", v15);
          else
            v11 = (void *)objc_msgSend(v15, "mutableCopy");
        }

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setBackdropGroupName:(id)a3
{
  NSString *v4;
  NSString *backdropGroupName;
  NSString *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  backdropGroupName = self->_backdropGroupName;
  if (backdropGroupName != v4 && !-[NSString isEqualToString:](backdropGroupName, "isEqualToString:", v4))
  {
    v6 = (NSString *)-[NSString copy](v4, "copy");
    v7 = self->_backdropGroupName;
    self->_backdropGroupName = v6;

    -[SKUIStorePageSplitCollectionViewLayout sublayouts](self, "sublayouts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setBackdropGroupName:", v4);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_rendersWithPerspective != a3)
  {
    v3 = a3;
    self->_rendersWithPerspective = a3;
    -[SKUIStorePageSplitCollectionViewLayout sublayouts](self, "sublayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setRendersWithPerspective:", v3);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)setRendersWithParallax:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_rendersWithParallax != a3)
  {
    self->_rendersWithParallax = a3;
    -[SKUIStorePageSplitCollectionViewLayout sublayouts](self, "sublayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setRendersWithParallax:", self->_rendersWithParallax);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)addSublayout:(id)a3 forElementKinds:(id)a4
{
  _BOOL8 rendersWithPerspective;
  id v7;
  id v8;
  objc_super v9;

  rendersWithPerspective = self->_rendersWithPerspective;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "setRendersWithPerspective:", rendersWithPerspective);
  objc_msgSend(v8, "setRendersWithParallax:", self->_rendersWithParallax);
  -[NSMutableArray addObject:](self->_orderedSublayouts, "addObject:", v8);
  v9.receiver = self;
  v9.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  -[_UICollectionViewCompositionLayout addSublayout:forElementKinds:](&v9, sel_addSublayout_forElementKinds_, v8, v7);

}

- (void)addSublayout:(id)a3 forItems:(id)a4 inSection:(int64_t)a5 offset:(CGPoint)a6 relativeToEdges:(unint64_t)a7 fromSiblingLayout:(id)a8
{
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_super v23;

  y = a6.y;
  x = a6.x;
  v15 = a3;
  v16 = a4;
  v17 = a8;
  objc_msgSend(v15, "setRendersWithPerspective:", self->_rendersWithPerspective);
  objc_msgSend(v15, "setRendersWithParallax:", self->_rendersWithParallax);
  -[NSMutableArray addObject:](self->_orderedSublayouts, "addObject:", v15);
  -[SKUIStorePageSplitCollectionViewLayout _createSectionsToIndexRangesMapTableIfNeededForSublayout:](self, "_createSectionsToIndexRangesMapTableIfNeededForSublayout:", v15);
  -[NSMapTable objectForKey:](self->_sublayoutToSectionsToIndexRanges, "objectForKey:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = v20;
    objc_msgSend(v20, "addIndexes:", v16);
LABEL_5:

    goto LABEL_6;
  }
  v22 = objc_msgSend(v16, "mutableCopy");
  if (v22)
  {
    v21 = (void *)v22;
    objc_msgSend(v18, "setObject:forKey:", v22, v19);
    goto LABEL_5;
  }
LABEL_6:
  v23.receiver = self;
  v23.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  -[_UICollectionViewCompositionLayout addSublayout:forItems:inSection:offset:relativeToEdges:fromSiblingLayout:](&v23, sel_addSublayout_forItems_inSection_offset_relativeToEdges_fromSiblingLayout_, v15, v16, a5, a7, v17, x, y);

}

- (void)addSublayout:(id)a3 forSections:(id)a4 offset:(CGPoint)a5 relativeToEdges:(unint64_t)a6 fromSiblingLayout:(id)a7
{
  double y;
  double x;
  _BOOL8 rendersWithPerspective;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;

  y = a5.y;
  x = a5.x;
  rendersWithPerspective = self->_rendersWithPerspective;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v16, "setRendersWithPerspective:", rendersWithPerspective);
  objc_msgSend(v16, "setRendersWithParallax:", self->_rendersWithParallax);
  -[NSMutableArray addObject:](self->_orderedSublayouts, "addObject:", v16);
  -[SKUIStorePageSplitCollectionViewLayout _createSectionsToIndexRangesMapTableIfNeededForSublayout:](self, "_createSectionsToIndexRangesMapTableIfNeededForSublayout:", v16);
  -[NSMapTable objectForKey:](self->_sublayoutToSectionsToIndexRanges, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __108__SKUIStorePageSplitCollectionViewLayout_addSublayout_forSections_offset_relativeToEdges_fromSiblingLayout___block_invoke;
  v20[3] = &unk_1E73A4750;
  v21 = v17;
  v18 = v17;
  objc_msgSend(v15, "enumerateIndexesUsingBlock:", v20);
  v19.receiver = self;
  v19.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  -[_UICollectionViewCompositionLayout addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:](&v19, sel_addSublayout_forSections_offset_relativeToEdges_fromSiblingLayout_, v16, v15, a6, v14, x, y);

}

void __108__SKUIStorePageSplitCollectionViewLayout_addSublayout_forSections_offset_relativeToEdges_fromSiblingLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, 0x7FFFFFFFFFFFFFFFLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, v5);

}

- (CGRect)_frameForLayout:(id)a3 offset:(CGPoint)a4 relativeToEdges:(unint64_t)a5 fromSiblingLayout:(id)a6
{
  double y;
  double x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v11 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  -[_UICollectionViewCompositionLayout _frameForLayout:offset:relativeToEdges:fromSiblingLayout:](&v25, sel__frameForLayout_offset_relativeToEdges_fromSiblingLayout_, a3, a5, v11, x, y);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if ((a5 & 8) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "_frame");
    v15 = v20;
  }

  v21 = v13;
  v22 = v15;
  v23 = v17;
  v24 = v19;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)removeSublayout:(id)a3
{
  NSMutableArray *orderedSublayouts;
  id v5;
  objc_super v6;

  orderedSublayouts = self->_orderedSublayouts;
  v5 = a3;
  -[NSMutableArray removeObjectIdenticalTo:](orderedSublayouts, "removeObjectIdenticalTo:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  -[_UICollectionViewCompositionLayout removeSublayout:](&v6, sel_removeSublayout_, v5);

}

- (id)sublayouts
{
  return self->_orderedSublayouts;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21 = *MEMORY[0x1E0C80C00];
  -[SKUIStorePageSplitCollectionViewLayout sublayouts](self, "sublayouts");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "shouldInvalidateLayoutForBoundsChange:", x, y, width, height) & 1) != 0)
        {

          v13 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }

  v15.receiver = self;
  v15.super_class = (Class)SKUIStorePageSplitCollectionViewLayout;
  v13 = -[SKUIStorePageSplitCollectionViewLayout shouldInvalidateLayoutForBoundsChange:](&v15, sel_shouldInvalidateLayoutForBoundsChange_, x, y, width, height);
LABEL_11:

  return v13;
}

- (void)_createSectionsToIndexRangesMapTableIfNeededForSublayout:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *v6;
  NSMapTable *sublayoutToSectionsToIndexRanges;
  NSMapTable *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = v4;
    if (self->_sublayoutToSectionsToIndexRanges)
    {
      v6 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
      sublayoutToSectionsToIndexRanges = self->_sublayoutToSectionsToIndexRanges;
      self->_sublayoutToSectionsToIndexRanges = v6;

      v5 = v10;
      v8 = self->_sublayoutToSectionsToIndexRanges;
    }
    else
    {
      v8 = 0;
    }
    -[NSMapTable objectForKey:](v8, "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
      -[NSMapTable setObject:forKey:](self->_sublayoutToSectionsToIndexRanges, "setObject:forKey:", v9, v10);
    }

    v5 = v10;
  }

}

- (id)_newStorePageCollectionViewLayout
{
  SKUIStorePageCollectionViewLayout *v3;

  v3 = objc_alloc_init(SKUIStorePageCollectionViewLayout);
  -[SKUIStorePageCollectionViewLayout setBackdropGroupName:](v3, "setBackdropGroupName:", self->_backdropGroupName);
  -[SKUIStorePageCollectionViewLayout setRendersWithPerspective:](v3, "setRendersWithPerspective:", self->_rendersWithPerspective);
  -[SKUIStorePageCollectionViewLayout setRendersWithParallax:](v3, "setRendersWithParallax:", self->_rendersWithParallax);
  return v3;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (NSArray)indexPathsForGradientItems
{
  return self->_indexPathsForGradientItems;
}

- (void)setIndexPathsForGradientItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (BOOL)rendersWithParallax
{
  return self->_rendersWithParallax;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sublayoutToSectionsToIndexRanges, 0);
  objc_storeStrong((id *)&self->_orderedSublayouts, 0);
  objc_storeStrong((id *)&self->_indexPathsForGradientItems, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStorePageSplitCollectionViewLayout init]";
}

@end
