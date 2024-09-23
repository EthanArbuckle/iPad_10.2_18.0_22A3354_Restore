@implementation PDSlideBase

- (PDSlideBase)init
{
  PDSlideBase *v2;
  PDSlideBase *v3;
  PDAnimation *v4;
  PDAnimation *mAnimation;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDSlideBase;
  v2 = -[PDSlideBase init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->mSlideId = 0;
    v4 = objc_alloc_init(PDAnimation);
    mAnimation = v3->mAnimation;
    v3->mAnimation = v4;

  }
  return v3;
}

- (id)drawables
{
  return self->mDrawables;
}

- (void)setBackground:(id)a3
{
  objc_storeStrong((id *)&self->mBackground, a3);
}

+ (int)inheritedPlaceholderType:(int)a3
{
  int result;

  result = a3;
  if (a3 <= 0xF && ((0xBF0Fu >> a3) & 1) != 0)
    return dword_22A4D3D0C[a3];
  return result;
}

- (id)placeholderWithType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return -[PDSlideBase placeholderWithType:placeholderTypeIndex:useBaseTypeMatch:overrideIndex:](self, "placeholderWithType:placeholderTypeIndex:useBaseTypeMatch:overrideIndex:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0, a5);
}

- (id)placeholderWithType:(int)a3 placeholderTypeIndex:(int)a4 useBaseTypeMatch:(BOOL)a5 overrideIndex:(BOOL)a6
{
  int v6;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  _BOOL4 v21;

  v6 = a3;
  v21 = a5;
  if (a5)
    v6 = +[PDSlideBase inheritedPlaceholderType:](PDSlideBase, "inheritedPlaceholderType:", *(_QWORD *)&a3);
  v8 = -[NSArray count](self->mDrawables, "count");
  if (v8)
  {
    v9 = v8;
    for (i = 0; v9 != i; ++i)
    {
      -[NSArray objectAtIndex:](self->mDrawables, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        if ((objc_msgSend(v13, "hasPlaceholder") & 1) != 0)
        {
          objc_msgSend(v13, "placeholder");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "type");

          if (v21)
            LODWORD(v15) = +[PDSlideBase inheritedPlaceholderType:](PDSlideBase, "inheritedPlaceholderType:", v15);
          if ((_DWORD)v15 == v6)
          {
            objc_msgSend(v13, "placeholder");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "index");

            if (v17 == a4 || a6)
            {

              return v11;
            }
          }
        }

      }
    }
  }
  v11 = 0;
  return v11;
}

- (void)addSlideNumberPlaceholder:(id)a3
{
  NSArray *v4;
  NSArray *mDrawables;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NSArray addObject:](v4, "addObject:", v6);
  -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", self->mDrawables);
  mDrawables = self->mDrawables;
  self->mDrawables = v4;

}

- (BOOL)isHidden
{
  return *((_BYTE *)self + 72) & 1;
}

- (id)background
{
  return self->mBackground;
}

- (void)setTransition:(id)a3
{
  objc_storeStrong((id *)&self->mTransition, a3);
}

- (id)animation
{
  return self->mAnimation;
}

- (void)setDefaultTableStyle:(id)a3
{
  objc_storeStrong((id *)&self->mDefaultTableStyle, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->mName, a3);
}

- (id)transition
{
  return self->mTransition;
}

- (void)setIsHidden:(BOOL)a3
{
  *((_BYTE *)self + 72) = *((_BYTE *)self + 72) & 0xFE | a3;
}

- (id)name
{
  return self->mName;
}

- (void)setUpPropertyHierarchyForDrawable:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;

  v29 = a3;
  -[PDSlideBase defaultTextListStyle](self, "defaultTextListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PDSlideBase parentTextStyleForTables](self, "parentTextStyleForTables");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      v7 = v4;
    objc_msgSend(v6, "setParentTextListStyle:", v7);
  }
  else
  {
    v8 = objc_opt_class();
    objc_msgSend(v29, "clientData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v8, (uint64_t)v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_opt_class();
    objc_msgSend(v6, "placeholder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v10, (uint64_t)v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "inheritedTextStylePlaceholderType") != -1)
    {
      -[PDSlideBase inheritedTextStyleForPlaceholderType:](self, "inheritedTextStyleForPlaceholderType:", objc_msgSend(v6, "inheritedTextStylePlaceholderType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;

        v4 = v14;
      }

    }
    if (!v7)
      goto LABEL_19;
    v15 = objc_msgSend(v7, "type");
    v16 = objc_msgSend(v7, "index");
    -[PDSlideBase parentTextStyleForPlaceholderType:placeholderTypeIndex:defaultTextListStyle:overrideIndex:](self, "parentTextStyleForPlaceholderType:placeholderTypeIndex:defaultTextListStyle:overrideIndex:", v15, v16, v4, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[PDSlideBase parentTextBodyPropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:](self, "parentTextBodyPropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:", v15, v16, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v18 = objc_opt_class();
      TSUDynamicCast(v18, (uint64_t)v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textBody");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "properties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setParent:", v27);

    }
    -[PDSlideBase parentShapePropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:](self, "parentShapePropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:", v15, v16, 0, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v29, "drawableProperties");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setParent:", v22);

      }
    }
    -[PDSlideBase masterGraphicForPlaceholderType:placeholderTypeIndex:overrideIndex:](self, "masterGraphicForPlaceholderType:placeholderTypeIndex:overrideIndex:", v15, v16, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = objc_opt_class();
      TSUDynamicCast(v25, (uint64_t)v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setMasterGraphic:", v24);

    }
    if (!v17)
LABEL_19:
      v17 = v4;
    objc_msgSend(v29, "setParentTextListStyle:", v17);

  }
}

- (void)setUpDrawablePropertyHierarchy
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->mDrawables;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[PDSlideBase setUpPropertyHierarchyForDrawable:](self, "setUpPropertyHierarchyForDrawable:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setUpPropertyHierarchyForDrawablePreservingEffectiveValues:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  -[PDSlideBase defaultTextListStyle](self, "defaultTextListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PDSlideBase parentTextStyleForTables](self, "parentTextStyleForTables");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      v7 = v4;
    objc_msgSend(v6, "changeParentTextListStylePreservingEffectiveValues:", v7);
  }
  else
  {
    v8 = objc_opt_class();
    objc_msgSend(v31, "clientData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v8, (uint64_t)v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_opt_class();
    objc_msgSend(v6, "placeholder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v10, (uint64_t)v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "inheritedTextStylePlaceholderType") != -1)
    {
      -[PDSlideBase inheritedTextStyleForPlaceholderType:](self, "inheritedTextStyleForPlaceholderType:", objc_msgSend(v6, "inheritedTextStylePlaceholderType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;

        v4 = v14;
      }

    }
    v29 = v4;
    if (v7)
    {
      v15 = objc_msgSend(v7, "type");
      v16 = objc_msgSend(v7, "index");
      -[PDSlideBase parentTextStyleForPlaceholderType:placeholderTypeIndex:defaultTextListStyle:overrideIndex:](self, "parentTextStyleForPlaceholderType:placeholderTypeIndex:defaultTextListStyle:overrideIndex:", v15, v16, v4, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[PDSlideBase parentTextBodyPropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:](self, "parentTextBodyPropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:", v15, v16, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDSlideBase parentShapePropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:](self, "parentShapePropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:", v15, v16, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDSlideBase masterGraphicForPlaceholderType:placeholderTypeIndex:overrideIndex:](self, "masterGraphicForPlaceholderType:placeholderTypeIndex:overrideIndex:", v15, v16, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = objc_opt_class();
        TSUDynamicCast(v21, (uint64_t)v31);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setMasterGraphic:", v20);

      }
    }
    else
    {
      v17 = 0;
      v18 = 0;
      v19 = 0;
    }
    v23 = objc_opt_class();
    TSUDynamicCast(v23, (uint64_t)v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      if (!v18)
      {
        +[OADTextBodyProperties defaultProperties](OADTextBodyProperties, "defaultProperties");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "textBody", v29);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "properties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "changeParentPreservingEffectiveValues:", v18);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v19)
      {
        objc_msgSend(v31, "drawableProperties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v31, "drawableProperties", v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "changeParentPreservingEffectiveValues:", v19);

    }
    if (!v17)
      v17 = v29;
    objc_msgSend(v31, "changeParentTextListStylePreservingEffectiveValues:", v17, v29);

    v4 = v30;
  }

}

- (void)setUpPropertyHierarchyPreservingEffectiveValues
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->mDrawables;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[PDSlideBase setUpPropertyHierarchyForDrawablePreservingEffectiveValues:](self, "setUpPropertyHierarchyForDrawablePreservingEffectiveValues:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)inheritedTextStyleForPlaceholderType:(int)a3
{
  return 0;
}

- (void)setDrawablesNoHierarchy:(id)a3
{
  objc_storeStrong((id *)&self->mDrawables, a3);
}

- (void)setDrawables:(id)a3
{
  id v4;

  v4 = a3;
  -[PDSlideBase setDrawablesNoHierarchy:](self, "setDrawablesNoHierarchy:");
  -[PDSlideBase setUpDrawablePropertyHierarchy](self, "setUpDrawablePropertyHierarchy");

}

- (id)ppt2011Transition
{
  return self->mPpt2011Transition;
}

- (void)setPpt2011Transition:(id)a3
{
  objc_storeStrong((id *)&self->mPpt2011Transition, a3);
}

- (id)defaultTheme
{
  return 0;
}

- (id)defaultTextListStyle
{
  return 0;
}

- (id)placeholders
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->mDrawables;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "clientData", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "hasPlaceholder"))
          objc_msgSend(v3, "addObject:", v8);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6
{
  return 0;
}

- (id)parentTextStyleForTables
{
  return 0;
}

- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)parentSlideBase
{
  return 0;
}

- (id)colorScheme
{
  return 0;
}

- (id)fontScheme
{
  return 0;
}

- (id)colorMap
{
  return 0;
}

- (id)styleMatrix
{
  return 0;
}

- (id)defaultTableStyle
{
  return self->mDefaultTableStyle;
}

- (void)doneWithContent
{
  NSString *mName;
  NSArray *mDrawables;
  OADBackground *mBackground;
  PDAnimation *mAnimation;
  PDTransition *mTransition;
  OADTableStyle *mDefaultTableStyle;

  mName = self->mName;
  self->mName = 0;

  mDrawables = self->mDrawables;
  self->mDrawables = 0;

  mBackground = self->mBackground;
  self->mBackground = 0;

  mAnimation = self->mAnimation;
  self->mAnimation = 0;

  mTransition = self->mTransition;
  self->mTransition = 0;

  mDefaultTableStyle = self->mDefaultTableStyle;
  self->mDefaultTableStyle = 0;

  *((_BYTE *)self + 72) |= 2u;
}

- (id)drawingTheme
{
  return 0;
}

- (BOOL)hasPpt10Animations
{
  void *v2;
  BOOL v3;

  -[PDAnimation rootTimeNode](self->mAnimation, "rootTimeNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasPpt9Animations
{
  uint64_t v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[NSArray count](self->mDrawables, "count"))
  {
    v3 = 0;
    v4 = 1;
    do
    {
      -[NSArray objectAtIndex:](self->mDrawables, "objectAtIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientData");
      v6 = objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v5, "clientData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v6) = objc_msgSend(v7, "hasAnimationInfo");

      }
      if (-[NSArray count](self->mDrawables, "count") <= v4)
        break;
      v3 = v4++;
    }
    while ((v6 & 1) == 0);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)generatePpt9Animations:(id)a3
{
  id v4;
  unsigned int i;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[PDAnimationCache loadAnimationCache:pdAnimation:state:](PDAnimationCache, "loadAnimationCache:pdAnimation:state:", v4, self->mAnimation, v7);
  for (i = 0; objc_msgSend(v4, "count") > (unint64_t)i; ++i)
  {
    objc_msgSend(v4, "objectAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDSlideBase setPpt9AnimationDataForCacheItem:order:state:](self, "setPpt9AnimationDataForCacheItem:order:state:", v6, i, v7);

  }
}

- (void)removeUnnecessaryOverrides
{
  -[NSArray makeObjectsPerformSelector:](self->mDrawables, "makeObjectsPerformSelector:", sel_removeUnnecessaryOverrides);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDSlideBase;
  -[PDSlideBase description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)slideId
{
  return self->mSlideId;
}

- (void)setSlideId:(unsigned int)a3
{
  self->mSlideId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDefaultTableStyle, 0);
  objc_storeStrong((id *)&self->mPpt2011Transition, 0);
  objc_storeStrong((id *)&self->mTransition, 0);
  objc_storeStrong((id *)&self->mAnimation, 0);
  objc_storeStrong((id *)&self->mBackground, 0);
  objc_storeStrong((id *)&self->mDrawables, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

- (void)setPpt9AnimationDataForCacheItem:(id)a3 order:(int)a4 state:(id)a5
{
  void *v5;
  void *v6;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  PDOfficeArtClient *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  PDAnimationInfo *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;

  v8 = *(_QWORD *)&a4;
  v31 = a3;
  v9 = a5;
  objc_msgSend(v31, "target");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "drawable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v11;
  objc_msgSend(v11, "clientData");
  v12 = (PDOfficeArtClient *)objc_claimAutoreleasedReturnValue();
  -[PDOfficeArtClient animationInfo](v12, "animationInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = objc_msgSend(v31, "presetClass");
  if (v15 == 1)
  {
    objc_msgSend(v13, "entranceData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_24:

      goto LABEL_25;
    }
  }
  v16 = objc_msgSend(v31, "presetClass");
  if (v16 == 2)
  {
    objc_msgSend(v13, "exitData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (v15 != 1)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  v29 = v9;
  if (objc_msgSend(v31, "presetClass") != 6 || objc_msgSend(v31, "presetId") != 1)
  {
    v17 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v13, "entranceData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v17 = 1;
LABEL_10:
    if (objc_msgSend(v31, "presetClass") == 6 && objc_msgSend(v31, "presetId") == 3)
    {
      objc_msgSend(v13, "exitData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (!v17)
      {
LABEL_16:
        v9 = v29;
        if (v16 != 2)
          goto LABEL_18;
        goto LABEL_17;
      }
    }
    else
    {
      v19 = 0;
      if ((v17 & 1) == 0)
        goto LABEL_16;
    }

    goto LABEL_16;
  }
  v19 = 1;
  if (v16 == 2)
LABEL_17:

LABEL_18:
  if (v15 != 1)
  {
    if (v19)
      goto LABEL_25;
LABEL_22:
    v20 = v30;
    goto LABEL_42;
  }

  if (!v19)
    goto LABEL_22;
LABEL_25:
  v20 = v30;
  v21 = +[PDAnimationCache createAnimationInfoDataForCacheItem:order:](PDAnimationCache, "createAnimationInfoDataForCacheItem:order:", v31, v8);
  if (v21)
  {
    v22 = v21;
    if (!v12)
    {
      v12 = objc_alloc_init(PDOfficeArtClient);
      objc_msgSend(v30, "setClientData:", v12);
    }
    objc_msgSend(v30, "clientData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 && !v13)
    {
      v24 = objc_alloc_init(PDAnimationInfo);
      objc_msgSend(v30, "clientData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAnimationInfo:", v24);

      v13 = v24;
    }
    if (objc_msgSend(v31, "presetClass") == 1
      || objc_msgSend(v31, "presetClass") == 6 && objc_msgSend(v31, "presetId") == 1)
    {
      objc_msgSend(v13, "setEntranceData:", v22);
    }
    else if (objc_msgSend(v31, "presetClass") == 2
           || objc_msgSend(v31, "presetClass") == 6 && objc_msgSend(v31, "presetId") == 3)
    {
      objc_msgSend(v13, "setExitData:", v22);
    }
    objc_msgSend(v9, "mediaNodeMap");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "target");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      objc_msgSend(v13, "setMediaNode:", v28);

  }
LABEL_42:

}

@end
