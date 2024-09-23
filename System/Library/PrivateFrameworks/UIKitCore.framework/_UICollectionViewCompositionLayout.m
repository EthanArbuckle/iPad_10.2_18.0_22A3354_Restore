@implementation _UICollectionViewCompositionLayout

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (_UICollectionViewCompositionLayout)init
{
  _UICollectionViewCompositionLayout *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sublayoutsDict;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewCompositionLayout;
  v2 = -[UICollectionViewLayout init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sublayoutsDict = v2->_sublayoutsDict;
    v2->_sublayoutsDict = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_sublayoutsDict, "setObject:forKeyedSubscript:", v5, CFSTR("UINoElementKind"));

  }
  return v2;
}

- (void)addSublayout:(id)a3 forRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "_setFrame:", x, y, width, height);
  objc_msgSend(v9, "_setSublayoutType:", 1);
  objc_msgSend(v9, "_setCompositionLayout:", self);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", CFSTR("UINoElementKind"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);

}

- (CGRect)_frameForLayout:(id)a3 offset:(CGPoint)a4 relativeToEdges:(unint64_t)a5 fromSiblingLayout:(id)a6
{
  double v10;
  double v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double MinY;
  unint64_t v29;
  double MinX;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double y;
  double x;
  CGFloat rect;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v11 = *MEMORY[0x1E0C9D648];
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = a6;
  objc_msgSend(a3, "collectionViewContentSize");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "_frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  rect = v23;

  if ((*((_DWORD *)&self->super._collectionView->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    -[_UICollectionViewCompositionLayout collectionViewContentSize](self, "collectionViewContentSize");
    v27 = v26;
    v40.origin.x = v11;
    v40.origin.y = v10;
    v40.size.width = v14;
    v40.size.height = v16;
    v11 = v27 - CGRectGetWidth(v40);
    v24 = 8;
    v25 = 2;
    if ((a5 & 1) == 0)
      goto LABEL_8;
  }
  else
  {
    v24 = 2;
    v25 = 8;
    if ((a5 & 1) == 0)
      goto LABEL_8;
  }
  if ((a5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionLayout.m"), 79, CFSTR("UICollectionViewCompositionLayout cannot place a sublayout relative to both the top and bottom edge of a sibling layout"));

  }
  v41.origin.x = v18;
  v41.origin.y = v20;
  v41.size.width = v22;
  v41.size.height = rect;
  MinY = CGRectGetMinY(v41);
  v42.origin.x = v11;
  v42.origin.y = v10;
  v42.size.width = v14;
  v42.size.height = v16;
  v10 = MinY - (y + CGRectGetHeight(v42));
LABEL_8:
  if ((a5 & 4) != 0)
  {
    v43.origin.x = v18;
    v43.origin.y = v20;
    v43.size.width = v22;
    v43.size.height = rect;
    v10 = y + CGRectGetMaxY(v43);
  }
  v29 = v25 & a5;
  if ((v24 & a5) != 0)
  {
    if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionLayout.m"), 86, CFSTR("UICollectionViewCompositionLayout cannot place a sublayout relative to both the leading and trailing edge of a sibling layout"));

    }
    v44.origin.x = v18;
    v44.origin.y = v20;
    v44.size.width = v22;
    v44.size.height = rect;
    MinX = CGRectGetMinX(v44);
    v45.origin.x = v11;
    v45.origin.y = v10;
    v45.size.width = v14;
    v45.size.height = v16;
    v11 = MinX - (x + CGRectGetWidth(v45));
  }
  if (v29)
  {
    v46.origin.x = v18;
    v46.origin.y = v20;
    v46.size.width = v22;
    v46.size.height = rect;
    v11 = x + CGRectGetMaxX(v46);
  }
  v31 = v11;
  v32 = v10;
  v33 = v14;
  v34 = v16;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)addSublayout:(id)a3 forSections:(id)a4 offset:(CGPoint)a5 relativeToEdges:(unint64_t)a6 fromSiblingLayout:(id)a7
{
  double y;
  double x;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  y = a5.y;
  x = a5.x;
  v19 = a3;
  v14 = a7;
  objc_msgSend(v19, "_setSections:", a4);
  objc_msgSend(v19, "_setSublayoutType:", 2);
  objc_msgSend(v19, "_setCompositionLayout:", self);
  if (v14)
  {
    -[_UICollectionViewCompositionLayout sublayouts](self, "sublayouts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v14);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionLayout.m"), 101, CFSTR("attempt to add layout (%@) to composition layout with sibling (%@) where the sibling does not have the same parent"), v19, v14);

    }
  }
  objc_msgSend(v19, "_setLayoutOffset:", x, y);
  objc_msgSend(v19, "_setLayoutOffsetEdges:", a6);
  objc_msgSend(v19, "_setSiblingLayout:", v14);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", CFSTR("UINoElementKind"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v19);

}

- (void)addSublayout:(id)a3 forItems:(id)a4 inSection:(int64_t)a5 offset:(CGPoint)a6 relativeToEdges:(unint64_t)a7 fromSiblingLayout:(id)a8
{
  double y;
  double x;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;

  y = a6.y;
  x = a6.x;
  v24 = a3;
  v16 = a8;
  v17 = (void *)MEMORY[0x1E0CB36B8];
  v18 = a4;
  objc_msgSend(v17, "indexSetWithIndex:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_setSections:", v19);

  objc_msgSend(v24, "_setItems:", v18);
  objc_msgSend(v24, "_setSublayoutType:", 3);
  objc_msgSend(v24, "_setCompositionLayout:", self);
  if (v16)
  {
    -[_UICollectionViewCompositionLayout sublayouts](self, "sublayouts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", v16);

    if ((v21 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionLayout.m"), 114, CFSTR("attempt to add layout (%@) to composition layout with sibling (%@) where the sibling does not have the same parent"), v24, v16);

    }
  }
  objc_msgSend(v24, "_setLayoutOffset:", x, y);
  objc_msgSend(v24, "_setLayoutOffsetEdges:", a7);
  objc_msgSend(v24, "_setSiblingLayout:", v16);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", CFSTR("UINoElementKind"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v24);

}

- (void)addSublayout:(id)a3 forElementKinds:(id)a4
{
  id v6;
  id v7;
  id v8;
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
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_setElementKinds:", v7);
  objc_msgSend(v6, "_setSublayoutType:", 4);
  objc_msgSend(v6, "_setCompositionLayout:", self);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
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
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sublayoutsDict, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)removeSublayout:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *sublayoutsDict;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  sublayoutsDict = self->_sublayoutsDict;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54___UICollectionViewCompositionLayout_removeSublayout___block_invoke;
  v10[3] = &unk_1E16BDD98;
  v11 = v4;
  v12 = v5;
  v7 = v5;
  v9 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sublayoutsDict, "enumerateKeysAndObjectsUsingBlock:", v10);
  -[NSMutableDictionary removeObjectsForKeys:](self->_sublayoutsDict, "removeObjectsForKeys:", v7);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", CFSTR("UINoElementKind"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v9);

}

- (NSArray)sublayouts
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NSMutableDictionary valueForKey:](self->_sublayoutsDict, "valueForKey:", CFSTR("UINoElementKind"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_sublayoutsDict, "objectEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "addObject:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return (NSArray *)v6;
}

- (CGSize)collectionViewContentSize
{
  CGFloat *v2;
  CGFloat height;
  CGFloat width;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CGFloat x;
  CGFloat y;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGSize result;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (CGFloat *)MEMORY[0x1E0C9D648];
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[_UICollectionViewCompositionLayout sublayouts](self, "sublayouts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    x = *v2;
    y = v2[1];
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "_frame");
        v27.origin.x = v12;
        v27.origin.y = v13;
        v27.size.width = v14;
        v27.size.height = v15;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v26 = CGRectUnion(v25, v27);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v16 = width;
  v17 = height;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)_originConvertedSublayoutAttributesForAttributes:(id)a3 inLayout:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "_frame");
  if (v9 == *MEMORY[0x1E0C9D538] && v8 == *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    v11 = v6;
  }
  else
  {
    v11 = (id)objc_msgSend(v6, "copy");
    objc_msgSend(v6, "frame");
    -[UICollectionViewLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", v7);
    objc_msgSend(v11, "setFrame:");
  }

  return v11;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v50 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[_UICollectionViewCompositionLayout sublayouts](self, "sublayouts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    do
    {
      v12 = 0;
      v38 = v10;
      do
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v12);
        objc_msgSend(v13, "_frame", v38);
        v53.origin.x = v14;
        v53.origin.y = v15;
        v53.size.width = v16;
        v53.size.height = v17;
        v51.origin.x = x;
        v51.origin.y = y;
        v51.size.width = width;
        v51.size.height = height;
        if (CGRectIntersectsRect(v51, v53))
        {
          -[UICollectionViewLayout convertRect:toLayout:](self, "convertRect:toLayout:", v13, x, y, width, height);
          v19 = v18;
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(v13, "layoutAttributesForElementsInRect:", v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v41 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                objc_msgSend(v31, "frame");
                v54.origin.x = v32;
                v54.origin.y = v33;
                v54.size.width = v34;
                v54.size.height = v35;
                v52.origin.x = v19;
                v52.origin.y = v21;
                v52.size.width = v23;
                v52.size.height = v25;
                if (CGRectIntersectsRect(v52, v54))
                {
                  -[_UICollectionViewCompositionLayout _originConvertedSublayoutAttributesForAttributes:inLayout:](self, "_originConvertedSublayoutAttributesForAttributes:inLayout:", v31, v13);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "addObject:", v36);

                }
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            }
            while (v28);
          }

          v10 = v38;
        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v10);
  }

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  SEL v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", 0x1E170AD00);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "layoutAttributesForItemAtIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewCompositionLayout _originConvertedSublayoutAttributesForAttributes:inLayout:](self, "_originConvertedSublayoutAttributesForAttributes:inLayout:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = a2;
    v23 = v5;
    v10 = objc_msgSend(v5, "section");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", CFSTR("UINoElementKind"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v16, "_sections");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsIndex:", v10);

          if ((v18 & 1) != 0)
          {
            v5 = v23;
            objc_msgSend(v16, "layoutAttributesForItemAtIndexPath:", v23);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UICollectionViewCompositionLayout _originConvertedSublayoutAttributesForAttributes:inLayout:](self, "_originConvertedSublayoutAttributesForAttributes:inLayout:", v20, v16);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v22, self, CFSTR("UICollectionViewCompositionLayout.m"), 208, CFSTR("composition layout (%@) does not have a sublayout for UICollectionElementKindCell or for section %ld"), self, v10);

    v9 = 0;
    v5 = v23;
  }
LABEL_13:

  return v9;
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  id v7;
  id *v8;
  NSMutableDictionary *sublayoutsDict;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  SEL v25;
  _UICollectionViewCompositionLayout *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (id *)a4;
  sublayoutsDict = self->_sublayoutsDict;
  -[UIBarButtonItemGroup _items](v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sublayoutsDict, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(v11, "shouldInvalidateLayoutForPreferredLayoutAttributes:withOriginalAttributes:", v7, v8);
  }
  else
  {
    v25 = a2;
    v27 = v7;
    objc_msgSend(v8, "indexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "section");

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = self;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", CFSTR("UINoElementKind"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v20, "_sections");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "containsIndex:", v14);

          if ((v22 & 1) != 0)
          {
            v7 = v27;
            v12 = objc_msgSend(v20, "shouldInvalidateLayoutForPreferredLayoutAttributes:withOriginalAttributes:", v27, v8);

            goto LABEL_13;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v17)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, v14);

    v12 = 0;
    v7 = v27;
  }
LABEL_13:

  return v12;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  SEL v23;
  _UICollectionViewCompositionLayout *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = a2;
    v25 = v8;
    v12 = objc_msgSend(v8, "section");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = self;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", CFSTR("UINoElementKind"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v18, "_sections");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsIndex:", v12);

          if ((v20 & 1) != 0)
          {
            v8 = v25;
            objc_msgSend(v18, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v7, v25);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, v7, v12);

    v11 = 0;
    v8 = v25;
  }
LABEL_13:

  return v11;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  SEL v23;
  _UICollectionViewCompositionLayout *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "layoutAttributesForDecorationViewOfKind:atIndexPath:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = a2;
    v25 = v8;
    v12 = objc_msgSend(v8, "section");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = self;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", CFSTR("UINoElementKind"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v18, "_sections");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsIndex:", v12);

          if ((v20 & 1) != 0)
          {
            v8 = v25;
            objc_msgSend(v18, "layoutAttributesForDecorationViewOfKind:atIndexPath:", v7, v25);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, v7, v12);

    v11 = 0;
    v8 = v25;
  }
LABEL_13:

  return v11;
}

- (void)prepareLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_UICollectionViewCompositionLayout;
  -[UICollectionViewLayout prepareLayout](&v12, sel_prepareLayout);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[_UICollectionViewCompositionLayout sublayouts](self, "sublayouts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
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
        -[_UICollectionViewCompositionLayout _prepareLayout:](self, "_prepareLayout:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)_prepareLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "_siblingLayout");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_msgSend(v11, "_isPrepared") & 1) == 0)
    -[_UICollectionViewCompositionLayout _prepareLayout:](self, "_prepareLayout:", v11);
  objc_msgSend(v4, "prepareLayout");
  objc_msgSend(v4, "_layoutOffset");
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "_layoutOffsetEdges");
  objc_msgSend(v4, "_siblingLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewCompositionLayout _frameForLayout:offset:relativeToEdges:fromSiblingLayout:](self, "_frameForLayout:offset:relativeToEdges:fromSiblingLayout:", v4, v9, v10, v6, v8);
  objc_msgSend(v4, "_setFrame:");

}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_UICollectionViewCompositionLayout;
  -[UICollectionViewLayout invalidateLayoutWithContext:](&v28, sel_invalidateLayoutWithContext_, v4);
  objc_msgSend(v4, "_invalidationContextTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v26 = 0uLL;
    v27 = 0uLL;
    v24 = 0uLL;
    v25 = 0uLL;
    objc_msgSend(v5, "keyEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "invalidateLayoutWithContext:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v9);
    }
  }
  else
  {
    v22 = 0uLL;
    v23 = 0uLL;
    *((_QWORD *)&v20 + 1) = 0;
    v21 = 0uLL;
    -[_UICollectionViewCompositionLayout sublayouts](self, "sublayouts", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v7);
          v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          v19 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
          objc_msgSend(v19, "_setInvalidateEverything:", objc_msgSend(v4, "invalidateEverything"));
          objc_msgSend(v19, "_setInvalidateDataSourceCounts:", objc_msgSend(v4, "invalidateDataSourceCounts"));
          objc_msgSend(v18, "invalidateLayoutWithContext:", v19);

        }
        v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      }
      while (v15);
    }
  }

}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
  v9 = objc_alloc_init(MEMORY[0x1E0CB3748]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[_UICollectionViewCompositionLayout sublayouts](self, "sublayouts", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "invalidationContextForBoundsChange:", x, y, width, height);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v16, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  objc_msgSend(v8, "_setInvalidationContextTable:", v9);
  return v8;
}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  id v6;
  id *v7;
  void *v8;
  id v9;
  NSMutableDictionary *sublayoutsDict;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (id *)a4;
  v33.receiver = self;
  v33.super_class = (Class)_UICollectionViewCompositionLayout;
  -[UICollectionViewLayout invalidationContextForPreferredLayoutAttributes:withOriginalAttributes:](&v33, sel_invalidationContextForPreferredLayoutAttributes_withOriginalAttributes_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB3748]);
  sublayoutsDict = self->_sublayoutsDict;
  -[UIBarButtonItemGroup _items](v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sublayoutsDict, "objectForKeyedSubscript:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v7, "indexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "section");

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sublayoutsDict, "objectForKeyedSubscript:", CFSTR("UINoElementKind"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v16)
    {
      v17 = v16;
      v27 = v8;
      v28 = v6;
      v18 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v20, "_sections", v27, v28);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "containsIndex:", v14);

          if (v22)
          {
            v12 = v20;
            goto LABEL_12;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v17)
          continue;
        break;
      }
      v12 = 0;
LABEL_12:
      v8 = v27;
      v6 = v28;
    }
    else
    {
      v12 = 0;
    }

  }
  objc_msgSend(v12, "invalidationContextForPreferredLayoutAttributes:withOriginalAttributes:", v6, v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "invalidatedItemIndexPaths");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateItemsAtIndexPaths:", v25);

    objc_msgSend(v9, "setObject:forKey:", v24, v12);
  }
  objc_msgSend(v8, "_setInvalidationContextTable:", v9);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sublayoutsDict, 0);
}

@end
