@implementation SBHIconGridSizeClassIconImageInfoMap

+ (id)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return +[SBHIconGridSizeClassIconImageInfoMap allocWithZone:](SBHImmutableIconGridSizeClassIconImageInfoMap, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SBHIconGridSizeClassIconImageInfoMap;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (SBHIconGridSizeClassIconImageInfoMap)initWithIconImageInfo:(SBIconImageInfo *)a3 forGridSizeClass:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  SBIconImageInfo *v14;
  void *v15;
  void *v16;
  SBHIconGridSizeClassIconImageInfoMap *v17;
  SBIconImageInfo *v19;
  _QWORD v20[2];

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1E0CB3B18];
  v14 = a3;
  objc_msgSend(v13, "sbh_valueWithSBIconImageInfo:", v11, v10, v9, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v14;
  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[SBHIconGridSizeClassIconImageInfoMap initWithIconImageInfos:](self, "initWithIconImageInfos:", v16);
  return v17;
}

- (SBHIconGridSizeClassIconImageInfoMap)initWithGridSizeClassesAndIconImageInfos:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id *v7;
  id v8;
  SBHIconGridSizeClassIconImageInfoMap *v9;
  double *v11;
  uint64_t v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = (double *)&v12;
  if (v4)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "sbh_valueWithSBIconImageInfo:", *v11, v11[1], v11[2], v11[3]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, v4);
      v7 = (id *)(v11 + 4);
      v11 += 5;
      v8 = *v7;

      v4 = v8;
    }
    while (v8);
  }
  v9 = -[SBHIconGridSizeClassIconImageInfoMap initWithIconImageInfos:](self, "initWithIconImageInfos:", v5);

  return v9;
}

- (SBHIconGridSizeClassIconImageInfoMap)initWithIconImageInfos:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHIconGridSizeClassIconImageInfoMap;
  return -[SBHIconGridSizeClassIconImageInfoMap init](&v4, sel_init, a3);
}

- (SBHIconGridSizeClassIconImageInfoMap)init
{
  return -[SBHIconGridSizeClassIconImageInfoMap initWithIconImageInfos:](self, "initWithIconImageInfos:", MEMORY[0x1E0C9AA70]);
}

- (SBHIconGridSizeClassIconImageInfoMap)initWithIconGridSizeClassIconImageInfoMap:(id)a3
{
  void *v4;
  SBHIconGridSizeClassIconImageInfoMap *v5;

  objc_msgSend(a3, "_iconImageInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBHIconGridSizeClassIconImageInfoMap initWithIconImageInfos:](self, "initWithIconImageInfos:", v4);

  return v5;
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  id v5;
  void *v6;
  void *v7;
  SBIconImageInfo *result;

  v5 = a4;
  -[SBHIconGridSizeClassIconImageInfoMap _iconImageInfos](self, "_iconImageInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "sbh_SBIconImageInfoValue");

  return result;
}

- (BOOL)hasIconImageInfoForGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBHIconGridSizeClassIconImageInfoMap _iconImageInfos](self, "_iconImageInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (CGSize)extraIconImageSizeForGridSizeClass:(id)a3 gridSizeClassSizes:(id)a4 iconSpacing:(CGSize)a5
{
  double height;
  double width;
  __CFString *v9;
  id v10;
  double v11;
  double v12;
  unsigned int v13;
  unsigned __int16 v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  height = a5.height;
  width = a5.width;
  v9 = (__CFString *)a3;
  v10 = a4;
  v11 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (CFSTR("SBHIconGridSizeClassDefault") != v9
    && (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
  {
    v13 = objc_msgSend(v10, "gridSizeForGridSizeClass:", v9);
    v14 = v13;
    v15 = HIWORD(v13);
    -[SBHIconGridSizeClassIconImageInfoMap iconImageInfoForGridSizeClass:](self, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
    v17 = v16;
    v19 = v18;
    -[SBHIconGridSizeClassIconImageInfoMap iconImageInfoForGridSizeClass:](self, "iconImageInfoForGridSizeClass:", v9);
    v11 = v20 - (width * (double)(v14 - 1) + v17 * (double)v14);
    v12 = v21 - (height * (double)(v15 - 1) + v19 * (double)v15);
  }

  v22 = v11;
  v23 = v12;
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)extraIconImageSizeForGridSizeClassSizes:(id)a3 iconSpacing:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconGridSizeClassIconImageInfoMap extraIconImageSizeForGridSizeClassSizes:iconSpacing:inDomain:](self, "extraIconImageSizeForGridSizeClassSizes:iconSpacing:inDomain:", v7, v8, width, height);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)extraIconImageSizeForGridSizeClassSizes:(id)a3 iconSpacing:(CGSize)a4 inDomain:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  CGFloat v19;
  CGFloat v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x3010000000;
  v24 = &unk_1D01C8D52;
  v25 = *MEMORY[0x1E0C9D820];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__SBHIconGridSizeClassIconImageInfoMap_extraIconImageSizeForGridSizeClassSizes_iconSpacing_inDomain___block_invoke;
  v16[3] = &unk_1E8D8DE88;
  v16[4] = self;
  v11 = v9;
  v19 = width;
  v20 = height;
  v17 = v11;
  v18 = &v21;
  objc_msgSend(v10, "enumerateGridSizeClassesUsingBlock:", v16);
  v12 = v22[4];
  v13 = v22[5];

  _Block_object_dispose(&v21, 8);
  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

uint64_t __101__SBHIconGridSizeClassIconImageInfoMap_extraIconImageSizeForGridSizeClassSizes_iconSpacing_inDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  double v4;
  double v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "extraIconImageSizeForGridSizeClass:gridSizeClassSizes:iconSpacing:", a2, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v4 > *(double *)(v6 + 32))
  {
    *(double *)(v6 + 32) = v4;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  if (v5 > *(double *)(v6 + 40))
    *(double *)(v6 + 40) = v5;
  return result;
}

- (void)enumerateIconImageInfosUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  -[SBHIconGridSizeClassIconImageInfoMap _iconImageInfos](self, "_iconImageInfos");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      -[SBHIconGridSizeClassIconImageInfoMap iconImageInfoForGridSizeClass:](self, "iconImageInfoForGridSizeClass:", v10);
      v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_iconImageInfos
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconGridSizeClassIconImageInfoMap *v4;
  void *v5;
  char isKindOfClass;
  SBHIconGridSizeClassIconImageInfoMap *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SBHIconGridSizeClassIconImageInfoMap *)a3;
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
      -[SBHIconGridSizeClassIconImageInfoMap _iconImageInfos](self, "_iconImageInfos");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconGridSizeClassIconImageInfoMap _iconImageInfos](v7, "_iconImageInfos");
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

  -[SBHIconGridSizeClassIconImageInfoMap _iconImageInfos](self, "_iconImageInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  -[SBHIconGridSizeClassIconImageInfoMap appendDescriptionToFormatter:](self, "appendDescriptionToFormatter:", v3);
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBHIconGridSizeClassIconImageInfoMap initWithIconGridSizeClassIconImageInfoMap:](+[SBHIconGridSizeClassIconImageInfoMap allocWithZone:](SBHMutableIconGridSizeClassIconImageInfoMap, "allocWithZone:", a3), "initWithIconGridSizeClassIconImageInfoMap:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SBHIconGridSizeClassIconImageInfoMap_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E8D84EF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

void __69__SBHIconGridSizeClassIconImageInfoMap_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __69__SBHIconGridSizeClassIconImageInfoMap_appendDescriptionToFormatter___block_invoke_2;
  v2[3] = &unk_1E8D8DEB0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateIconImageInfosUsingBlock:", v2);

}

void __69__SBHIconGridSizeClassIconImageInfoMap_appendDescriptionToFormatter___block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  void *v12;
  id v13;

  v11 = a2;
  SBHStringForIconImageInfo(a3, a4, a5, a6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  SBHStringForIconGridSizeClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", v13, v12, 0);
}

@end
