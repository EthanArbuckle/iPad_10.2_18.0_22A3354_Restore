@implementation SBHIconGridSizeClassSizeMap

+ (SBHIconGridSizeClassSizeMap)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return (SBHIconGridSizeClassSizeMap *)+[SBHIconGridSizeClassSizeMap allocWithZone:](SBHImmutableIconGridSizeClassSizeMap, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SBHIconGridSizeClassSizeMap;
  return (SBHIconGridSizeClassSizeMap *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (SBHIconGridSizeClassSizeMap)initWithGridSize:(SBHIconGridSize)a3 forGridSizeClass:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  SBHIconGridSizeClassSizeMap *v10;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3B18];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v5, "sbh_valueWithSBHIconGridSize:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBHIconGridSizeClassSizeMap initWithGridSizeClassSizes:](self, "initWithGridSizeClassSizes:", v9);
  return v10;
}

- (SBHIconGridSizeClassSizeMap)initWithGridSizeClassesAndGridSizes:(id)a3
{
  unint64_t v3;
  id v5;
  id v6;
  void *v7;
  id *v8;
  id v9;
  SBHIconGridSizeClassSizeMap *v10;
  unsigned int *v12;
  uint64_t v13;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = (unsigned int *)&v13;
  if (v5)
  {
    do
    {
      v3 = v3 & 0xFFFFFFFF00000000 | *v12;
      objc_msgSend(MEMORY[0x1E0CB3B18], "sbh_valueWithSBHIconGridSize:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v7, v5);
      v8 = (id *)(v12 + 2);
      v12 += 4;
      v9 = *v8;

      v5 = v9;
    }
    while (v9);
  }
  v10 = -[SBHIconGridSizeClassSizeMap initWithGridSizeClassSizes:](self, "initWithGridSizeClassSizes:", v6);

  return v10;
}

- (SBHIconGridSizeClassSizeMap)initWithGridSizeClassSizes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHIconGridSizeClassSizeMap;
  return -[SBHIconGridSizeClassSizeMap init](&v4, sel_init, a3);
}

- (SBHIconGridSizeClassSizeMap)init
{
  return -[SBHIconGridSizeClassSizeMap initWithGridSizeClassSizes:](self, "initWithGridSizeClassSizes:", MEMORY[0x1E0C9AA70]);
}

- (SBHIconGridSizeClassSizeMap)initWithIconGridSizeClassSizeMap:(id)a3
{
  void *v4;
  SBHIconGridSizeClassSizeMap *v5;

  objc_msgSend(a3, "_sizes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBHIconGridSizeClassSizeMap initWithGridSizeClassSizes:](self, "initWithGridSizeClassSizes:", v4);

  return v5;
}

- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBHIconGridSize v7;

  v4 = a3;
  -[SBHIconGridSizeClassSizeMap _sizes](self, "_sizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (SBHIconGridSize)objc_msgSend(v6, "sbh_SBHIconGridSizeValue");
  else
    v7 = (SBHIconGridSize)65537;

  return v7;
}

- (unsigned)gridSizeAreaForGridSizeClass:(id)a3
{
  return SBHIconGridSizeGetArea(-[SBHIconGridSizeClassSizeMap gridSizeForGridSizeClass:](self, "gridSizeForGridSizeClass:", a3));
}

- (BOOL)hasGridSizeForGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBHIconGridSizeClassSizeMap _sizes](self, "_sizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)bestGridSizeClassForGridSize:(SBHIconGridSize)a3
{
  return -[SBHIconGridSizeClassSizeMap bestGridSizeClassForGridSize:allowedGridSizeClasses:](self, "bestGridSizeClassForGridSize:allowedGridSizeClasses:", *(unsigned int *)&a3, 0);
}

- (id)bestGridSizeClassForGridSize:(SBHIconGridSize)a3 allowedGridSizeClasses:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  SBHIconGridSize v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__SBHIconGridSizeClassSizeMap_bestGridSizeClassForGridSize_allowedGridSizeClasses___block_invoke;
  v10[3] = &unk_1E8D88320;
  v7 = v6;
  v13 = a3;
  v11 = v7;
  v12 = &v14;
  -[SBHIconGridSizeClassSizeMap enumerateGridSizesUsingBlock:](self, "enumerateGridSizesUsingBlock:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __83__SBHIconGridSizeClassSizeMap_bestGridSizeClassForGridSize_allowedGridSizeClasses___block_invoke(uint64_t a1, void *a2, int a3, _BYTE *a4)
{
  void *v8;
  id v9;

  v9 = a2;
  v8 = *(void **)(a1 + 32);
  if ((!v8 || objc_msgSend(v8, "containsGridSizeClass:", v9))
    && SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)(a1 + 48), a3))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (NSString)largestGridSizeClass
{
  id v3;
  _QWORD v5[6];
  _QWORD v6[3];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  __CFString *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = CFSTR("SBHIconGridSizeClassDefault");
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SBHIconGridSizeClassSizeMap_largestGridSizeClass__block_invoke;
  v5[3] = &unk_1E8D88348;
  v5[4] = v6;
  v5[5] = &v8;
  -[SBHIconGridSizeClassSizeMap enumerateGridSizesUsingBlock:](self, "enumerateGridSizesUsingBlock:", v5);
  v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return (NSString *)v3;
}

void __51__SBHIconGridSizeClassSizeMap_largestGridSizeClass__block_invoke(uint64_t a1, void *a2, int a3)
{
  unsigned int Area;
  uint64_t v7;
  id v8;

  v8 = a2;
  Area = SBHIconGridSizeGetArea(a3);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (Area > *(_DWORD *)(v7 + 24))
  {
    *(_DWORD *)(v7 + 24) = Area;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (NSString)widestGridSizeClass
{
  id v3;
  _QWORD v5[6];
  _QWORD v6[3];
  __int16 v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  __CFString *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = CFSTR("SBHIconGridSizeClassDefault");
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SBHIconGridSizeClassSizeMap_widestGridSizeClass__block_invoke;
  v5[3] = &unk_1E8D88348;
  v5[4] = v6;
  v5[5] = &v8;
  -[SBHIconGridSizeClassSizeMap enumerateGridSizesUsingBlock:](self, "enumerateGridSizesUsingBlock:", v5);
  v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return (NSString *)v3;
}

void __50__SBHIconGridSizeClassSizeMap_widestGridSizeClass__block_invoke(uint64_t a1, void *a2, unsigned __int16 a3)
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(unsigned __int16 *)(v7 + 24) < a3)
  {
    *(_WORD *)(v7 + 24) = a3;
    v8 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = v8;
  }

}

- (NSString)tallestGridSizeClass
{
  id v3;
  _QWORD v5[6];
  _QWORD v6[3];
  __int16 v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  __CFString *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = CFSTR("SBHIconGridSizeClassDefault");
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SBHIconGridSizeClassSizeMap_tallestGridSizeClass__block_invoke;
  v5[3] = &unk_1E8D88348;
  v5[4] = v6;
  v5[5] = &v8;
  -[SBHIconGridSizeClassSizeMap enumerateGridSizesUsingBlock:](self, "enumerateGridSizesUsingBlock:", v5);
  v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return (NSString *)v3;
}

void __51__SBHIconGridSizeClassSizeMap_tallestGridSizeClass__block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(unsigned __int16 *)(v7 + 24) < HIWORD(a3))
  {
    *(_WORD *)(v7 + 24) = HIWORD(a3);
    v8 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = v8;
  }

}

- (id)largestGridSizeClassWhichTilesInGridSize:(SBHIconGridSize)a3
{
  return -[SBHIconGridSizeClassSizeMap largestGridSizeClassWhichTilesInGridSize:allowedGridSizeClasses:](self, "largestGridSizeClassWhichTilesInGridSize:allowedGridSizeClasses:", *(unsigned int *)&a3, 0);
}

- (id)largestGridSizeClassWhichTilesInGridSize:(SBHIconGridSize)a3 allowedGridSizeClasses:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[6];
  SBHIconGridSize v10;
  _QWORD v11[3];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  __CFString *v18;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = CFSTR("SBHIconGridSizeClassDefault");
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__SBHIconGridSizeClassSizeMap_largestGridSizeClassWhichTilesInGridSize_allowedGridSizeClasses___block_invoke;
  v9[3] = &unk_1E8D88370;
  v10 = a3;
  v9[4] = v11;
  v9[5] = &v13;
  -[SBHIconGridSizeClassSizeMap enumerateGridSizesFilteringBySet:usingBlock:](self, "enumerateGridSizesFilteringBySet:usingBlock:", v6, v9);
  v7 = (id)v14[5];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __95__SBHIconGridSizeClassSizeMap_largestGridSizeClassWhichTilesInGridSize_allowedGridSizeClasses___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int Area;
  uint64_t v10;
  id v11;

  v6 = a2;
  if (a3 >= 0x10000)
  {
    if ((_WORD)a3)
    {
      v7 = *(unsigned __int16 *)(a1 + 48);
      if (v7 == 0xFFFF || !(v7 % (unsigned __int16)a3))
      {
        v8 = *(unsigned __int16 *)(a1 + 50);
        if (v8 == 0xFFFF || !(v8 % HIWORD(a3)))
        {
          v11 = v6;
          Area = SBHIconGridSizeGetArea(a3);
          v6 = v11;
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          if (Area > *(_DWORD *)(v10 + 24))
          {
            *(_DWORD *)(v10 + 24) = Area;
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
            v6 = v11;
          }
        }
      }
    }
  }

}

- (id)shortestGridSizeClassWithWidth:(unsigned __int16)a3
{
  return -[SBHIconGridSizeClassSizeMap shortestGridSizeClassWithWidth:allowedGridSizeClasses:](self, "shortestGridSizeClassWithWidth:allowedGridSizeClasses:", a3, 0);
}

- (id)shortestGridSizeClassWithWidth:(unsigned __int16)a3 allowedGridSizeClasses:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[6];
  unsigned __int16 v10;
  _QWORD v11[3];
  __int16 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  __CFString *v18;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = CFSTR("SBHIconGridSizeClassDefault");
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = -1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__SBHIconGridSizeClassSizeMap_shortestGridSizeClassWithWidth_allowedGridSizeClasses___block_invoke;
  v9[3] = &unk_1E8D88398;
  v10 = a3;
  v9[4] = v11;
  v9[5] = &v13;
  -[SBHIconGridSizeClassSizeMap enumerateGridSizesFilteringBySet:usingBlock:](self, "enumerateGridSizesFilteringBySet:usingBlock:", v6, v9);
  v7 = (id)v14[5];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __85__SBHIconGridSizeClassSizeMap_shortestGridSizeClassWithWidth_allowedGridSizeClasses___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a2;
  if (*(unsigned __int16 *)(a1 + 48) == (unsigned __int16)a3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(unsigned __int16 *)(v7 + 24) > HIWORD(a3))
    {
      *(_WORD *)(v7 + 24) = HIWORD(a3);
      v8 = v6;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      v6 = v8;
    }
  }

}

- (id)gridSizeClassLargerThanGridSizeClass:(id)a3 allowedGridSizeClasses:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBHIconGridSizeClassSizeMap gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:](self, "gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = -[SBHIconGridSizeClassSizeMap gridSizeAreaForGridSizeClass:](self, "gridSizeAreaForGridSizeClass:", v6);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (-[SBHIconGridSizeClassSizeMap gridSizeAreaForGridSizeClass:](self, "gridSizeAreaForGridSizeClass:", v15, (_QWORD)v19) > v9)
          {
            v16 = v15;
            goto LABEL_14;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_14:

  }
  else
  {
    v17 = v8 + 1;
    if (v8 + 1 >= (unint64_t)objc_msgSend(v7, "count"))
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndex:", v17);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

- (id)gridSizeClassSmallerThanGridSizeClass:(id)a3 allowedGridSizeClasses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  -[SBHIconGridSizeClassSizeMap gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:](self, "gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v6);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  v22 = 0;
  if (v9)
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = -[SBHIconGridSizeClassSizeMap gridSizeAreaForGridSizeClass:](self, "gridSizeAreaForGridSizeClass:", v6);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __92__SBHIconGridSizeClassSizeMap_gridSizeClassSmallerThanGridSizeClass_allowedGridSizeClasses___block_invoke;
      v15[3] = &unk_1E8D883C0;
      v16 = v10;
      v15[4] = self;
      v15[5] = &v17;
      objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v15);
    }
    else
    {
      objc_msgSend(v8, "objectAtIndex:", v9 - 1);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v18[5];
      v18[5] = v11;

    }
  }
  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __92__SBHIconGridSizeClassSizeMap_gridSizeClassSmallerThanGridSizeClass_allowedGridSizeClasses___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "gridSizeAreaForGridSizeClass:") < *(_DWORD *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)gridSizeClassesSortedByGridArea
{
  return -[SBHIconGridSizeClassSizeMap gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:](self, "gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:", 0);
}

- (id)gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[5];
  char v12;
  _QWORD v13[4];
  id v14;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__SBHIconGridSizeClassSizeMap_gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses___block_invoke;
  v13[3] = &unk_1E8D883E8;
  v8 = v6;
  v14 = v8;
  -[SBHIconGridSizeClassSizeMap enumerateGridSizesFilteringBySet:usingBlock:](self, "enumerateGridSizesFilteringBySet:usingBlock:", v5, v13);

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __89__SBHIconGridSizeClassSizeMap_gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses___block_invoke_2;
  v11[3] = &unk_1E8D88410;
  v11[4] = self;
  v12 = objc_msgSend(v8, "containsObject:", CFSTR("SBHIconGridSizeClassDefault"));
  objc_msgSend(v8, "sortUsingComparator:", v11);
  v9 = v8;

  return v9;
}

uint64_t __89__SBHIconGridSizeClassSizeMap_gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __89__SBHIconGridSizeClassSizeMap_gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "gridSizeAreaForGridSizeClass:", v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "gridSizeAreaForGridSizeClass:", v6);
  if (v7 == v8)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (!v5 || (objc_msgSend(v5, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) != 0)
      {
        v9 = -1;
        goto LABEL_14;
      }
      if (*(_BYTE *)(a1 + 40)
        && (!v6 || (objc_msgSend(v6, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) != 0))
      {
        v9 = 1;
        goto LABEL_14;
      }
    }
    v9 = 0;
    goto LABEL_14;
  }
  if (v7 < v8)
    v9 = -1;
  else
    v9 = 1;
LABEL_14:

  return v9;
}

- (BOOL)gridSizesMatchDefault
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__SBHIconGridSizeClassSizeMap_gridSizesMatchDefault__block_invoke;
  v4[3] = &unk_1E8D88438;
  v4[4] = &v5;
  -[SBHIconGridSizeClassSizeMap enumerateGridSizesUsingBlock:](self, "enumerateGridSizesUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

BOOL __52__SBHIconGridSizeClassSizeMap_gridSizesMatchDefault__block_invoke(uint64_t a1, uint64_t a2, int a3, _BYTE *a4)
{
  _BOOL8 result;

  result = SBHIconGridSizeEqualToIconGridSize(a3, 65537);
  if (!result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateGridSizesUsingBlock:(id)a3
{
  unint64_t v3;
  void (**v5)(id, uint64_t, unint64_t, char *);
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SBHIconGridSize v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, uint64_t, unint64_t, char *))a3;
  -[SBHIconGridSizeClassSizeMap _sizes](self, "_sizes");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
      v12 = (SBHIconGridSize)-[SBHIconGridSizeClassSizeMap gridSizeForGridSizeClass:](self, "gridSizeForGridSizeClass:", v11);
      v13 = 0;
      v3 = v3 & 0xFFFFFFFF00000000 | *(unsigned int *)&v12;
      v5[2](v5, v11, v3, &v13);
      if (v13)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateGridSizesSortedByAreaWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[SBHIconGridSizeClassSizeMap _sizesSortedByArea](self, "_sizesSortedByArea");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__SBHIconGridSizeClassSizeMap_enumerateGridSizesSortedByAreaWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_1E8D86C28;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", a3, v9);

}

void __84__SBHIconGridSizeClassSizeMap_enumerateGridSizesSortedByAreaWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  (*(void (**)(_QWORD, id, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, objc_msgSend(v6, "gridSizeForGridSizeClass:", v7), a4);

}

- (void)enumerateGridSizesInSet:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__SBHIconGridSizeClassSizeMap_enumerateGridSizesInSet_usingBlock___block_invoke;
  v10[3] = &unk_1E8D88460;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBHIconGridSizeClassSizeMap enumerateGridSizesUsingBlock:](self, "enumerateGridSizesUsingBlock:", v10);

}

void __66__SBHIconGridSizeClassSizeMap_enumerateGridSizesInSet_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsGridSizeClass:"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)enumerateGridSizesFilteringBySet:(id)a3 usingBlock:(id)a4
{
  if (a3)
    -[SBHIconGridSizeClassSizeMap enumerateGridSizesInSet:usingBlock:](self, "enumerateGridSizesInSet:usingBlock:", a3, a4);
  else
    -[SBHIconGridSizeClassSizeMap enumerateGridSizesUsingBlock:](self, "enumerateGridSizesUsingBlock:", a4);
}

- (id)_sizes
{
  return 0;
}

- (id)_sizesSortedByArea
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[SBHIconGridSizeClassSizeMap _sizes](self, "_sizes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SBHIconGridSizeClassSizeMap__sizesSortedByArea__block_invoke;
  v7[3] = &unk_1E8D88488;
  v7[4] = self;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __49__SBHIconGridSizeClassSizeMap__sizesSortedByArea__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unsigned int v7;
  unsigned int v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "gridSizeAreaForGridSizeClass:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "gridSizeAreaForGridSizeClass:", v6);

  if (v7 < v8)
    return -1;
  else
    return v7 > v8;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconGridSizeClassSizeMap *v4;
  void *v5;
  char isKindOfClass;
  SBHIconGridSizeClassSizeMap *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SBHIconGridSizeClassSizeMap *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[SBHIconGridSizeClassSizeMap _sizes](self, "_sizes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconGridSizeClassSizeMap _sizes](v7, "_sizes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = BSEqualDictionaries();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SBHIconGridSizeClassSizeMap _sizes](self, "_sizes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  -[SBHIconGridSizeClassSizeMap appendDescriptionToFormatter:](self, "appendDescriptionToFormatter:", v3);
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)descriptionWithGridSizeClassDomain:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D01750];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[SBHIconGridSizeClassSizeMap appendDescriptionToFormatter:gridSizeClassDomain:](self, "appendDescriptionToFormatter:gridSizeClassDomain:", v6, v5);

  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBHIconGridSizeClassSizeMap initWithIconGridSizeClassSizeMap:](+[SBHIconGridSizeClassSizeMap allocWithZone:](SBHMutableIconGridSizeClassSizeMap, "allocWithZone:", a3), "initWithIconGridSizeClassSizeMap:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHIconGridSizeClassSizeMap appendDescriptionToFormatter:gridSizeClassDomain:](self, "appendDescriptionToFormatter:gridSizeClassDomain:", v4, v5);

}

- (void)appendDescriptionToFormatter:(id)a3 gridSizeClassDomain:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__SBHIconGridSizeClassSizeMap_appendDescriptionToFormatter_gridSizeClassDomain___block_invoke;
  v10[3] = &unk_1E8D84F18;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v8, "appendProem:block:", self, v10);

}

void __80__SBHIconGridSizeClassSizeMap_appendDescriptionToFormatter_gridSizeClassDomain___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__SBHIconGridSizeClassSizeMap_appendDescriptionToFormatter_gridSizeClassDomain___block_invoke_2;
  v3[3] = &unk_1E8D884B0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "enumerateGridSizesUsingBlock:", v3);

}

void __80__SBHIconGridSizeClassSizeMap_appendDescriptionToFormatter_gridSizeClassDomain___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  SBHStringForIconGridSize(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "descriptionForGridSizeClass:", v7);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = v7;
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:skipIfEmpty:", v5, v6, 0);

}

@end
