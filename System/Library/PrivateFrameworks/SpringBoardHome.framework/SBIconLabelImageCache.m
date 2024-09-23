@implementation SBIconLabelImageCache

- (id)labelImageForParameters:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_labelImages, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconLabelImageCache();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      -[SBIconLabelImageCache labelImageForParameters:].cold.2((uint64_t)v4, v6, v8, v9, v10, v11, v12, v13);

    ++self->_cacheHits;
  }
  else
  {
    if (v7)
      -[SBIconLabelImageCache labelImageForParameters:].cold.1((uint64_t)v4, v6, v8, v9, v10, v11, v12, v13);

    ++self->_cacheMisses;
    -[SBIconLabelImageCache generateAndStoreLabelImageForParameters:](self, "generateAndStoreLabelImageForParameters:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (SBIconLabelImageCache)initWithMaxLabelSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  SBIconLabelImageCache *v7;
  SBIconLabelImageCache *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CPMemoryPool *grayPool;
  uint64_t v13;
  CPMemoryPool *colorPool;
  NSMutableDictionary *v15;
  NSMutableDictionary *labelImages;
  objc_super v18;

  height = a3.height;
  width = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)SBIconLabelImageCache;
  v7 = -[SBIconLabelImageCache init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_maxLabelSize.width = width;
    v7->_maxLabelSize.height = height;
    v7->_scale = a4;
    v9 = objc_msgSend(MEMORY[0x1E0DC3870], "sbf_bytesNeededForSize:scale:withContextType:", 4, width, height, a4);
    v10 = objc_msgSend(MEMORY[0x1E0DC3870], "sbf_bytesNeededForSize:scale:withContextType:", 0, width, height, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9A0]), "initWithLabel:slotLength:", "iconLabels_gray", v9);
    grayPool = v8->_grayPool;
    v8->_grayPool = (CPMemoryPool *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9A0]), "initWithLabel:slotLength:", "iconLabels_color", v10);
    colorPool = v8->_colorPool;
    v8->_colorPool = (CPMemoryPool *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    labelImages = v8->_labelImages;
    v8->_labelImages = v15;

  }
  return v8;
}

- (void)ensureLabelImagesAreCached:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17DF4E4]();
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_labelImages, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v14, (_QWORD)v16) & 1) == 0)
        {
          ++self->_cacheMisses;
          v15 = -[SBIconLabelImageCache generateAndStoreLabelImageForParameters:](self, "generateAndStoreLabelImageForParameters:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_autoreleasePoolPop(v5);
}

- (id)cachedLabelImageForParameters:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_labelImages, "objectForKey:", a3);
}

- (void)cacheLabelImageForParameters:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_labelImages, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    SBLogIconLabelImageCache();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBIconLabelImageCache cacheLabelImageForParameters:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

    v13 = -[SBIconLabelImageCache generateAndStoreLabelImageForParameters:](self, "generateAndStoreLabelImageForParameters:", v4);
  }

}

- (id)generateAndStoreLabelImageForParameters:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v4, "maxSize");
  if (v7 <= self->_maxLabelSize.width && v6 <= self->_maxLabelSize.height)
  {
    v9 = objc_msgSend(v4, "isColorspaceGrayscale");
    v10 = 48;
    if (v9)
      v10 = 40;
    v8 = *(id *)((char *)&self->super.isa + v10);
  }
  else
  {
    v8 = 0;
  }
  +[SBIconLabelImage imageWithParameters:pool:](SBIconLabelImage, "imageWithParameters:pool:", v5, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[NSMutableDictionary setObject:forKey:](self->_labelImages, "setObject:forKey:", v11, v5);

  return v11;
}

- (void)removeLabelImageForParameters:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_labelImages, "removeObjectForKey:", a3);
}

- (id)cachedLabelImagesWithParametersPassingTest:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *labelImages;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  labelImages = self->_labelImages;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__SBIconLabelImageCache_cachedLabelImagesWithParametersPassingTest___block_invoke;
  v12[3] = &unk_1E8D874D0;
  v14 = v4;
  v7 = v5;
  v13 = v7;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](labelImages, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v13;
  v10 = v7;

  return v10;
}

void __68__SBIconLabelImageCache_cachedLabelImagesWithParametersPassingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (void)removeLabelImagesWithParametersPassingTest:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_labelImages;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v4[2](v4, v11))
        {
          if (!v8)
            v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v8, "addObject:", v11);
        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[NSMutableDictionary removeObjectForKey:](self->_labelImages, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (unint64_t)numberOfCachedImages
{
  return -[NSMutableDictionary count](self->_labelImages, "count");
}

- (unint64_t)numberOfCacheHits
{
  return self->_cacheHits;
}

- (unint64_t)numberOfCacheMisses
{
  return self->_cacheMisses;
}

- (NSString)description
{
  return (NSString *)-[SBIconLabelImageCache descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconLabelImageCache succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconLabelImageCache descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[SBIconLabelImageCache succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconLabelImageCache maxLabelSize](self, "maxLabelSize");
  v5 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("maxLabelSize"));
  -[SBIconLabelImageCache scale](self, "scale");
  v6 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("scale"));
  return v4;
}

- (CGSize)maxLabelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxLabelSize.width;
  height = self->_maxLabelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (CPMemoryPool)grayPool
{
  return self->_grayPool;
}

- (CPMemoryPool)colorPool
{
  return self->_colorPool;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPool, 0);
  objc_storeStrong((id *)&self->_grayPool, 0);
  objc_storeStrong((id *)&self->_labelImages, 0);
}

- (void)labelImageForParameters:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, a2, a3, "SBIconLabelImageCache CACHE MISS: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)labelImageForParameters:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, a2, a3, "SBIconLabelImageCache CACHE HIT: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)cacheLabelImageForParameters:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, a2, a3, "SBIconLabelImageCache cache label image for parameters: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
