@implementation CRTextFeaturesFilterV2

- (CRTextFeaturesFilterV2)initWithLocale:(id)a3
{
  id v5;
  CRTextFeaturesFilterV2 *v6;
  CRTextFeaturesFilterV2 *v7;
  uint64_t v8;
  CRSingleTextFeatureFiltering *latinLowConfidenceFilter;
  CRCJKLowConfidenceTextFeatureFilterV2 *v10;
  CRSingleTextFeatureFiltering *chineseLowConfidenceFilter;
  CRCJKLowConfidenceTextFeatureFilterV2 *v12;
  CRSingleTextFeatureFiltering *japaneseLowConfidenceFilter;
  CRCJKLowConfidenceTextFeatureFilterV2 *v14;
  CRSingleTextFeatureFiltering *koreanLowConfidenceFilter;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRTextFeaturesFilterV2;
  v6 = -[CRTextFeaturesFilterV2 init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preferredLocale, a3);
    v8 = objc_opt_new();
    latinLowConfidenceFilter = v7->_latinLowConfidenceFilter;
    v7->_latinLowConfidenceFilter = (CRSingleTextFeatureFiltering *)v8;

    v10 = -[CRCJKLowConfidenceTextFeatureFilterV2 initWithLowConfidenceThresholdFor1CharLines:for2PlusCharLines:forIsolated1CharLines:]([CRCJKLowConfidenceTextFeatureFilterV2 alloc], "initWithLowConfidenceThresholdFor1CharLines:for2PlusCharLines:forIsolated1CharLines:", 0.5, 0.3, 0.4);
    chineseLowConfidenceFilter = v7->_chineseLowConfidenceFilter;
    v7->_chineseLowConfidenceFilter = (CRSingleTextFeatureFiltering *)v10;

    v12 = -[CRCJKLowConfidenceTextFeatureFilterV2 initWithLowConfidenceThresholdFor1CharLines:for2PlusCharLines:forIsolated1CharLines:]([CRCJKLowConfidenceTextFeatureFilterV2 alloc], "initWithLowConfidenceThresholdFor1CharLines:for2PlusCharLines:forIsolated1CharLines:", 0.5, 0.3, 0.4);
    japaneseLowConfidenceFilter = v7->_japaneseLowConfidenceFilter;
    v7->_japaneseLowConfidenceFilter = (CRSingleTextFeatureFiltering *)v12;

    v14 = -[CRCJKLowConfidenceTextFeatureFilterV2 initWithLowConfidenceThresholdFor1CharLines:for2PlusCharLines:forIsolated1CharLines:]([CRCJKLowConfidenceTextFeatureFilterV2 alloc], "initWithLowConfidenceThresholdFor1CharLines:for2PlusCharLines:forIsolated1CharLines:", 0.5, 0.3, 0.4);
    koreanLowConfidenceFilter = v7->_koreanLowConfidenceFilter;
    v7->_koreanLowConfidenceFilter = (CRSingleTextFeatureFiltering *)v14;

  }
  return v7;
}

- (id)filterLineRegions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isCurved", (_QWORD)v16) & 1) == 0)
        {
          objc_msgSend(v11, "locale");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRTextFeaturesFilterV2 _filterForLocale:](self, "_filterForLocale:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13 || (v14 = objc_msgSend(v13, "shouldFilterRegion:", v11), v13, (v14 & 1) == 0))
            objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)filterBlocks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[CRTextFeaturesFilterV2 _groupGeometriesForRegions:](self, "_groupGeometriesForRegions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v11, "shouldBeConsiderForFiltering"))
        {
          objc_msgSend(v11, "calculateMinimumDistanceFromOtherGeometries:", v6);
          v13 = v12;
          -[CRTextFeaturesFilterV2 preferredLocale](self, "preferredLocale");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRTextFeaturesFilterV2 _filterForLocale:](self, "_filterForLocale:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15 || (objc_msgSend(v15, "shouldFilterRegionBasedOnGeometry:closestDistance:", v11, v13) & 1) == 0)
          {
            objc_msgSend(v11, "groupRegion");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v16);

          }
        }
        else
        {
          objc_msgSend(v11, "groupRegion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_groupGeometriesForRegions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CRGroupRegionGeometry *v11;
  CRGroupRegionGeometry *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [CRGroupRegionGeometry alloc];
        v12 = -[CRGroupRegionGeometry initWithGroupRegion:](v11, "initWithGroupRegion:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (CGPoint)_pointInImageSpace:(CGPoint)a3 imageSize:(CGSize)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x * a4.width;
  v5 = a3.y * a4.height;
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)_distanceFromPoint1:(CGPoint)a3 toPoint2:(CGPoint)a4
{
  return sqrt((a3.y - a4.y) * (a3.y - a4.y) + (a3.x - a4.x) * (a3.x - a4.x));
}

- (id)_filterForLocale:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[CRTextFeaturesFilterV2 latinLowConfidenceFilter](self, "latinLowConfidenceFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v4))
  {
    -[CRTextFeaturesFilterV2 chineseLowConfidenceFilter](self, "chineseLowConfidenceFilter");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v6;

    v5 = v7;
    goto LABEL_8;
  }
  if (+[CRImageReader languageIsKorean:](CRImageReader, "languageIsKorean:", v4))
  {
    -[CRTextFeaturesFilterV2 koreanLowConfidenceFilter](self, "koreanLowConfidenceFilter");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (+[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v4))
  {
    -[CRTextFeaturesFilterV2 japaneseLowConfidenceFilter](self, "japaneseLowConfidenceFilter");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (NSString)preferredLocale
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreferredLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CRSingleTextFeatureFiltering)latinLowConfidenceFilter
{
  return (CRSingleTextFeatureFiltering *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLatinLowConfidenceFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CRSingleTextFeatureFiltering)chineseLowConfidenceFilter
{
  return (CRSingleTextFeatureFiltering *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChineseLowConfidenceFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CRSingleTextFeatureFiltering)japaneseLowConfidenceFilter
{
  return (CRSingleTextFeatureFiltering *)objc_getProperty(self, a2, 32, 1);
}

- (void)setJapaneseLowConfidenceFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CRSingleTextFeatureFiltering)koreanLowConfidenceFilter
{
  return (CRSingleTextFeatureFiltering *)objc_getProperty(self, a2, 40, 1);
}

- (void)setKoreanLowConfidenceFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_koreanLowConfidenceFilter, 0);
  objc_storeStrong((id *)&self->_japaneseLowConfidenceFilter, 0);
  objc_storeStrong((id *)&self->_chineseLowConfidenceFilter, 0);
  objc_storeStrong((id *)&self->_latinLowConfidenceFilter, 0);
  objc_storeStrong((id *)&self->_preferredLocale, 0);
}

@end
