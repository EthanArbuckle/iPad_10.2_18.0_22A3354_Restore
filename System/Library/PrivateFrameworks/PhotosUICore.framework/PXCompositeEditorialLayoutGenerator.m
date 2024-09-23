@implementation PXCompositeEditorialLayoutGenerator

- (PXCompositeEditorialLayoutGenerator)initWithMetrics:(id)a3
{
  id v4;
  PXCompositeEditorialLayoutGenerator *v5;
  PXCompositeEditorialLayoutGenerator *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCompositeEditorialLayoutGenerator;
  v5 = -[PXCompositeEditorialLayoutGenerator initWithMetrics:](&v9, sel_initWithMetrics_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_geometries = 0;
    objc_msgSend(v4, "editorialLayoutSpec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_minNumberOfColumns = objc_msgSend(v7, "minNumberOfColumns");
    v6->_minTemplateItemCount = objc_msgSend(v7, "minNumberOfRects");
    v6->_maxTemplateItemCount = objc_msgSend(v7, "maxNumberOfRects");

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_geometries);
  free(self->_layoutItemWeights);
  v3.receiver = self;
  v3.super_class = (Class)PXCompositeEditorialLayoutGenerator;
  -[PXCompositeEditorialLayoutGenerator dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCompositeEditorialLayoutGenerator;
  -[PXCompositeEditorialLayoutGenerator invalidate](&v3, sel_invalidate);
  self->_geometriesCount = 0;
}

- (CGSize)estimatedSize
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[PXCompositeEditorialLayoutGenerator metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "referenceSize");
  v5 = v4;
  v6 = self->_maxTemplateItemCount / self->_minNumberOfColumns;
  objc_msgSend(v3, "editorialLayoutSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "templates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tileAspectRatio");
  v11 = v10;

  v12 = 0.25;
  if (v11 >= 0.25)
    v12 = v11;
  v13 = v5 / v12 * (double)v6;

  v14 = v5;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  -[PXCompositeEditorialLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  _PXLayoutGeometry *v13;
  _PXLayoutGeometry *v14;
  __int128 v15;
  __int128 v16;
  CGFloat height;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;

  length = a4.length;
  location = a4.location;
  v11 = a4.location + a4.length;
  if (a4.location + a4.length > -[PXCompositeEditorialLayoutGenerator itemCount](self, "itemCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCompositeEditorialLayoutGenerator.m"), 106, CFSTR("the range must be <= to the number of itemCount"));

  }
  -[PXCompositeEditorialLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  if (location < v11)
  {
    v12 = location;
    do
    {
      v13 = &a3[v12];
      v14 = &self->_geometries[v12];
      v16 = *(_OWORD *)&v14->var6.origin.y;
      v15 = *(_OWORD *)&v14->var6.size.height;
      height = v14->var7.height;
      *(_OWORD *)&v13->var5 = *(_OWORD *)&v14->var5;
      v18 = *(_OWORD *)&v14->var1.y;
      *(_OWORD *)&v13->var0 = *(_OWORD *)&v14->var0;
      *(_OWORD *)&v13->var1.y = v18;
      v19 = *(_OWORD *)&v14->var2.height;
      v20 = *(_OWORD *)&v14->var3.b;
      v21 = *(_OWORD *)&v14->var3.ty;
      *(_OWORD *)&v13->var3.d = *(_OWORD *)&v14->var3.d;
      *(_OWORD *)&v13->var3.ty = v21;
      *(_OWORD *)&v13->var2.height = v19;
      *(_OWORD *)&v13->var3.b = v20;
      v13->var7.height = height;
      *(_OWORD *)&v13->var6.origin.y = v16;
      *(_OWORD *)&v13->var6.size.height = v15;
      v13->var5 = a5;
      ++v12;
      --length;
    }
    while (length);
  }
}

- (void)_prepareIfNeeded
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  _QWORD v13[12];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;

  if (!self->_isPrepared)
  {
    self->_isPrepared = 1;
    -[PXCompositeEditorialLayoutGenerator _prepareGeometriesBufferForCount:](self, "_prepareGeometriesBufferForCount:", -[PXCompositeEditorialLayoutGenerator itemCount](self, "itemCount"));
    -[PXCompositeEditorialLayoutGenerator metrics](self, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "referenceSize");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "interTileSpacing");
    v19 = 0;
    v20 = (double *)&v19;
    v21 = 0x3010000000;
    v22 = &unk_1A7E74EE7;
    v23 = *MEMORY[0x1E0C9D538];
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__PXCompositeEditorialLayoutGenerator__prepareIfNeeded__block_invoke;
    v13[3] = &unk_1E5118858;
    v13[7] = &v19;
    v13[8] = a2;
    v13[4] = self;
    v13[5] = v14;
    v13[9] = v6;
    v13[10] = v8;
    v13[11] = v9;
    v13[6] = &v15;
    -[PXCompositeEditorialLayoutGenerator _enumerateTemplatesWithBlock:](self, "_enumerateTemplatesWithBlock:", v13);
    free((void *)v16[3]);
    -[PXCompositeEditorialLayoutGenerator metrics](self, "metrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "referenceSize");
    v11 = v20[5];
    self->_contentSize.width = v12;
    self->_contentSize.height = v11;

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);

  }
}

- (void)_computeTemplatesByTileCountIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *templatesByTileCount;
  PXCompositeEditorialLayoutGenerator *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!self->_templatesByTileCount)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = self;
    -[PXCompositeEditorialLayoutGenerator metrics](self, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editorialLayoutSpec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "templates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "numberOfRects");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v15);

          }
          objc_msgSend(v14, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    v16 = objc_msgSend(v3, "copy");
    templatesByTileCount = v18->_templatesByTileCount;
    v18->_templatesByTileCount = (NSDictionary *)v16;

  }
}

- (void)_enumerateTemplatesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t, void *, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t maxTemplateItemCount;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int64_t v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;

  v4 = (void (**)(id, _QWORD, uint64_t, void *, void *))a3;
  -[PXCompositeEditorialLayoutGenerator _computeTemplatesByTileCountIfNeeded](self, "_computeTemplatesByTileCountIfNeeded");
  if (-[NSDictionary count](self->_templatesByTileCount, "count"))
  {
    -[PXCompositeEditorialLayoutGenerator metrics](self, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editorialLayoutSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v6;
    objc_msgSend(v6, "templates");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[PXCompositeEditorialLayoutGenerator itemCount](self, "itemCount");
    v9 = v8;
    if (v8 >= self->_maxTemplateItemCount)
      maxTemplateItemCount = self->_maxTemplateItemCount;
    else
      maxTemplateItemCount = v8;
    -[PXCompositeEditorialLayoutGenerator _layoutInputsInRange:](self, "_layoutInputsInRange:", 0, maxTemplateItemCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v7;
    -[PXCompositeEditorialLayoutGenerator _minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:](self, "_minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:", v7, v11, 0, maxTemplateItemCount, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "numberOfRects");
    objc_msgSend(v11, "subarrayWithRange:", 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v13, v14, v12);
    v15 = v9 - v13;

    if (v9 - v13 <= self->_minTemplateItemCount)
    {
      v19 = v12;
    }
    else
    {
      do
      {
        if (v15 >= self->_maxTemplateItemCount)
          v16 = self->_maxTemplateItemCount;
        else
          v16 = v15;
        objc_msgSend(v33, "preferredNextTemplatesForTemplate:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXCompositeEditorialLayoutGenerator _layoutInputsInRange:](self, "_layoutInputsInRange:", v13, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 3.40282347e38;
        -[PXCompositeEditorialLayoutGenerator _minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:](self, "_minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:", v17, v18, v13, v16, &v34);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          v20 = v34 < 0.5;
        else
          v20 = 0;
        if (!v20)
        {
          -[PXCompositeEditorialLayoutGenerator _minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:](self, "_minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:", v32, v18, v13, v16, &v34, v34);
          v21 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v21;
        }
        v22 = objc_msgSend(v19, "numberOfRects");
        objc_msgSend(v18, "subarrayWithRange:", 0, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v13, v22, v23, v19);
        v15 -= v22;
        v13 += v22;

        v12 = v19;
      }
      while (v15 > self->_minTemplateItemCount);
    }
    if (v15 >= 1)
    {
      if (v15 >= self->_maxTemplateItemCount)
        v24 = self->_maxTemplateItemCount;
      else
        v24 = v15;
      objc_msgSend(v33, "preferredNextTemplatesForTemplate:", v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCompositeEditorialLayoutGenerator _layoutInputsInRange:](self, "_layoutInputsInRange:", v13, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 3.40282347e38;
      -[PXCompositeEditorialLayoutGenerator _minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:](self, "_minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:", v25, v26, v13, v24, &v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        v28 = v34 <= 0.5;
      else
        v28 = 0;
      if (!v28)
      {
        -[PXCompositeEditorialLayoutGenerator _minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:](self, "_minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:", v32, v26, v13, v24, 0, v34);
        v29 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v29;
      }
      v30 = objc_msgSend(v27, "numberOfRects");
      objc_msgSend(v26, "subarrayWithRange:", 0, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v13, v30, v31, v27);

    }
  }

}

- (id)_minCostingTemplateAmongTemplates:(id)a3 forFittingInputItems:(id)a4 inRange:(_NSRange)a5 minCost:(double *)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  PXCompositeEditorialLayoutGenerator *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  void *v20;
  unint64_t v21;
  double v22;
  double v23;
  id v24;
  double *v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v26 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v27 = -[PXCompositeEditorialLayoutGenerator itemCount](self, "itemCount");
  -[PXCompositeEditorialLayoutGenerator metrics](self, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "useSaliency");

  v12 = self;
  -[PXCompositeEditorialLayoutGenerator _normalizeWeightsForInputItems:](self, "_normalizeWeightsForInputItems:", v9);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v30;
    v18 = 3.40282347e38;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "numberOfRects", v26);
        if (v21 <= objc_msgSend(v9, "count"))
        {
          objc_msgSend(v20, "costForFittingLayoutItemInputs:inRange:ofTotalItemCount:normalizedWeights:useSaliency:", v9, a5.location, a5.length, v27, v12->_layoutItemWeights, v11);
          v23 = v22;
          if (!v16 || v22 < v18)
          {
            v24 = v20;

            v18 = v23;
            v16 = v24;
          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
    v18 = 3.40282347e38;
  }

  if (v26)
    *v26 = v18;

  return v16;
}

- (void)_normalizeWeightsForInputItems:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[7];
  _QWORD v7[6];
  _QWORD v8[4];
  _QWORD v9[4];

  v4 = a3;
  -[PXCompositeEditorialLayoutGenerator _prepareLayoutItemWeightsBufferForCount:](self, "_prepareLayoutItemWeightsBufferForCount:", objc_msgSend(v4, "count"));
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0x47EFFFFFE0000000;
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PXCompositeEditorialLayoutGenerator__normalizeWeightsForInputItems___block_invoke;
  v7[3] = &unk_1E5118880;
  v7[4] = v9;
  v7[5] = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __70__PXCompositeEditorialLayoutGenerator__normalizeWeightsForInputItems___block_invoke_2;
  v6[3] = &unk_1E51188A8;
  v6[4] = self;
  v6[5] = v8;
  v6[6] = v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v9, 8);

}

- (void)_prepareLayoutItemWeightsBufferForCount:(unint64_t)a3
{
  if (self->_layoutItemWeightsCount < a3)
  {
    self->_layoutItemWeights = (double *)malloc_type_realloc(self->_layoutItemWeights, 8 * a3, 0x100004000313F17uLL);
    self->_layoutItemWeightsCount = a3;
  }
}

- (void)_prepareGeometriesBufferForCount:(unint64_t)a3
{
  if (self->_geometriesCount < a3)
  {
    self->_geometries = (_PXLayoutGeometry *)malloc_type_realloc(self->_geometries, 152 * a3, 0x100004050011849uLL);
    self->_geometriesCount = a3;
  }
}

- (id)_layoutInputsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (location < location + length)
  {
    do
    {
      -[PXCompositeEditorialLayoutGenerator itemLayoutInfoBlock](self, "itemLayoutInfoBlock");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, location);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++location;
      --length;
    }
    while (length);
  }
  v9 = (void *)objc_msgSend(v6, "copy");

  return v9;
}

- (_PXLayoutGeometry)_geometryFromFrame:(SEL)a3 index:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  _PXLayoutGeometry *result;
  CGFloat v19;
  CGFloat v20;
  uint64_t v21;
  __int128 v22;
  CGSize v23;
  CGRect v24;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PXCompositeEditorialLayoutGenerator metrics](self, "metrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "padding");
  v13 = v12;
  v15 = v14;

  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v25 = CGRectOffset(v24, v15, v13);
  v16 = v25.size.width;
  v17 = v25.size.height;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3.a = 0u;
  *(_OWORD *)&retstr->var3.c = 0u;
  *(_OWORD *)&retstr->var3.tx = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  retstr->var6.origin = 0u;
  retstr->var6.size = 0u;
  retstr->var7 = 0u;
  retstr->var0 = a5;
  result = (_PXLayoutGeometry *)PXRectGetCenter();
  retstr->var1.x = v19;
  retstr->var1.y = v20;
  retstr->var2.width = v16;
  retstr->var2.height = v17;
  v21 = MEMORY[0x1E0C9BAA8];
  v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->var3.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->var3.c = v22;
  *(_OWORD *)&retstr->var3.tx = *(_OWORD *)(v21 + 32);
  retstr->var4 = 0.0;
  retstr->var5 = 0;
  v23 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
  retstr->var6.origin = *(CGPoint *)off_1E50B86D0;
  retstr->var6.size = v23;
  retstr->var7.width = v16;
  retstr->var7.height = v17;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templatesByTileCount, 0);
}

void __70__PXCompositeEditorialLayoutGenerator__normalizeWeightsForInputItems___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  objc_msgSend(v4, "weight");
  if (v3 >= v5)
    v5 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(v4, "weight");
  v8 = v7;

  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
}

double __70__PXCompositeEditorialLayoutGenerator__normalizeWeightsForInputItems___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double result;

  objc_msgSend(a2, "weight");
  v5 = *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
  result = (v6 - v5) / (*(double *)(*(_QWORD *)(a1[6] + 8) + 24) - v5);
  *(double *)(*(_QWORD *)(a1[4] + 56) + 8 * a3) = result;
  return result;
}

void __55__PXCompositeEditorialLayoutGenerator__prepareIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  double v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  CGRect v31;

  v7 = a5;
  v8 = objc_msgSend(v7, "numberOfRects");
  if (v8 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("PXCompositeEditorialLayoutGenerator.m"), 133, CFSTR("no rects in template %@"), v7);

  }
  v30 = *MEMORY[0x1E0C9D820];
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(_QWORD *)(v9 + 24);
  if (v10 < v8)
  {
    if (!v10)
    {
      *(_QWORD *)(v9 + 24) = 10;
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(_QWORD *)(v9 + 24);
    }
    if (v10 < v8)
    {
      v11 = (_QWORD *)(v9 + 24);
      do
      {
        *v11 = 2 * v10;
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v13 = *(_QWORD *)(v12 + 24);
        v11 = (_QWORD *)(v12 + 24);
        v10 = v13;
      }
      while (v13 < v8);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = malloc_type_realloc(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24), 32 * v10, 0x1000040E0EAB150uLL);
  }
  objc_msgSend(v7, "getComputedRects:contentSize:forReferenceSize:interTileSpacing:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), &v30, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  if (v8 >= 1)
  {
    v14 = 0;
    v15 = 152 * a2;
    do
    {
      v31 = CGRectOffset(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + v14), 0.0, *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v16 = *(_QWORD **)(a1 + 32);
      v17 = v16[5] + v15;
      objc_msgSend(v16, "_geometryFromFrame:index:", a2, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
      *(_OWORD *)v17 = v20;
      *(_OWORD *)(v17 + 16) = v21;
      *(_OWORD *)(v17 + 64) = v24;
      *(_OWORD *)(v17 + 80) = v25;
      *(_OWORD *)(v17 + 32) = v22;
      *(_OWORD *)(v17 + 48) = v23;
      *(_QWORD *)(v17 + 144) = v29;
      *(_OWORD *)(v17 + 112) = v27;
      *(_OWORD *)(v17 + 128) = v28;
      *(_OWORD *)(v17 + 96) = v26;
      ++a2;
      v15 += 152;
      v14 += 32;
      --v8;
    }
    while (v8);
  }
  v18 = *((double *)&v30 + 1);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = *(double *)&v30
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 32);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v18
                                                              + *(double *)(a1 + 88)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 40);

}

@end
