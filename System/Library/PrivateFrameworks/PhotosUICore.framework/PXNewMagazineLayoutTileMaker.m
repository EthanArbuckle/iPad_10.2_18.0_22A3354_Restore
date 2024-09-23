@implementation PXNewMagazineLayoutTileMaker

- (PXNewMagazineLayoutTileMaker)initWithReferenceSize:(CGSize)a3 numberOfColumns:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  PXNewMagazineLayoutTileMaker *v7;
  PXNewMagazineLayoutTileMaker *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *sharedTempArray;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)PXNewMagazineLayoutTileMaker;
  v7 = -[PXNewMagazineLayoutTileMaker init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_referenceSize.width = width;
    v7->_referenceSize.height = height;
    v9 = 80;
    if (a4 < 5)
      v9 = 48;
    v7->_interTileSpacing = 2.0;
    v7->_maxTilesInFrame = v9;
    v7->_numberOfColumns = 2 * a4;
    v7->_tileAspectRatio = 1.33333333;
    v7->_maxFrameAspectRatio = (double)a4 * 1.33333333;
    v7->_minFrameAspectRatio = 0.25;
    v7->_startLastPadding = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 60);
    v10 = objc_claimAutoreleasedReturnValue();
    sharedTempArray = v8->_sharedTempArray;
    v8->_sharedTempArray = (NSMutableArray *)v10;

    v8->_isPerfectEnding = 0;
    -[PXNewMagazineLayoutTileMaker _updateDimensionInfos](v8, "_updateDimensionInfos");
  }
  return v8;
}

- (void)dealloc
{
  double *normalizedWeights;
  objc_super v4;

  normalizedWeights = self->_normalizedWeights;
  if (normalizedWeights)
    free(normalizedWeights);
  v4.receiver = self;
  v4.super_class = (Class)PXNewMagazineLayoutTileMaker;
  -[PXNewMagazineLayoutTileMaker dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXNewMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_interTileSpacing);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNewMagazineLayoutTileMaker tileAspectRatio](self, "tileAspectRatio");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxTilesInFrame >> 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Tile Maker = {Columns: %@, InterTileSpacing: %@, TileASP: %.2f, MaxTiles: %@, MaxASP: %.2f, MinASP: %.2f}"), v4, v5, v7, v8, *(_QWORD *)&self->_maxFrameAspectRatio, *(_QWORD *)&self->_minFrameAspectRatio);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns >> 1;
}

- (void)setInterTileSpacing:(double)a3
{
  if (self->_interTileSpacing != a3)
  {
    self->_interTileSpacing = a3;
    -[PXNewMagazineLayoutTileMaker _updateDimensionInfos](self, "_updateDimensionInfos");
  }
}

- (unint64_t)getMagazineRects:(PXMagazineRect *)a3 withInputs:(id)a4
{
  -[PXNewMagazineLayoutTileMaker _getFrames:magazineRects:withInputs:](self, "_getFrames:magazineRects:withInputs:", 0, a3, a4);
  return self->_numberOfColumns;
}

- (BOOL)convertRects:(PXMagazineRect *)a3 outFrames:(CGRect *)a4 count:(unint64_t)a5 forReferenceSize:(CGSize)a6
{
  uint64_t v10;
  CGSize *p_size;
  CGFloat MaxY;
  PXMagazineSize var1;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  _OWORD v23[2];
  CGRect v24;

  self->_referenceSize = a6;
  -[PXNewMagazineLayoutTileMaker _updateDimensionInfos](self, "_updateDimensionInfos");
  if (a4)
  {
    if (a5)
    {
      v10 = 0;
      p_size = &a4->size;
      MaxY = 0.0;
      do
      {
        var1 = a3->var1;
        v23[0] = a3->var0;
        v23[1] = var1;
        -[PXNewMagazineLayoutTileMaker _frameFromTileFrame:](self, "_frameFromTileFrame:", v23);
        p_size[-1].width = v14;
        p_size[-1].height = v15;
        p_size->width = v16;
        p_size->height = v17;
        if (v10 + self->_numberOfColumns >= a5)
        {
          v18 = v14;
          v19 = v15;
          v20 = v16;
          v21 = v17;
          if (CGRectGetMaxY(*(CGRect *)&v14) > MaxY)
          {
            v24.origin.x = v18;
            v24.origin.y = v19;
            v24.size.width = v20;
            v24.size.height = v21;
            MaxY = CGRectGetMaxY(v24);
          }
        }
        ++v10;
        p_size += 2;
        ++a3;
      }
      while (a5 != v10);
    }
    else
    {
      MaxY = 0.0;
    }
    self->_height = MaxY;
  }
  return 1;
}

- (void)getFrames:(CGRect *)a3 withInputs:(id)a4
{
  -[PXNewMagazineLayoutTileMaker _getFrames:magazineRects:withInputs:](self, "_getFrames:magazineRects:withInputs:", a3, 0, a4);
}

- (void)_getFrames:(CGRect *)a3 magazineRects:(PXMagazineRect *)a4 withInputs:(id)a5
{
  id v9;
  double *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  CGFloat MaxY;
  void *v17;
  void *v18;
  unint64_t v19;
  PXMagazineRect *v20;
  _QWORD *p_width;
  uint64_t v22;
  PXMagazineSize v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  double *normalizedWeights;
  void *v30;
  void *v31;
  CGSize *p_size;
  void *v33;
  unint64_t v34;
  void *v35;
  _OWORD v36[2];
  PXMagazineOrigin v37;
  PXMagazineSize v38;

  v9 = a5;
  if (self->_normalizedWeights)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewMagazineLayoutTileMaker.m"), 204, CFSTR("normalizedWeights Memory leak."));

  }
  -[PXNewMagazineLayoutTileMaker _resetWithNumberOfAssets:](self, "_resetWithNumberOfAssets:", objc_msgSend(v9, "count"));
  -[PXNewMagazineLayoutTileMaker _setRandomSeedWithInputs:](self, "_setRandomSeedWithInputs:", v9);
  v10 = -[PXNewMagazineLayoutTileMaker _normalizeWeightsByInputs:](self, "_normalizeWeightsByInputs:", v9);
  self->_normalizedWeights = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewMagazineLayoutTileMaker.m"), 208, CFSTR("Allocate normalizedWeights memory faill."));

  }
  self->_isPerfectEnding = 0;
  -[PXNewMagazineLayoutTileMaker _generateTilesWithInputs:](self, "_generateTilesWithInputs:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rectsArray");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isPerfectEnding = objc_msgSend(v13, "isPerfectEnding");

  }
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    v35 = v9;
    if (objc_msgSend(v11, "count"))
    {
      v14 = 0;
      v15 = 0;
      p_size = &a3->size;
      v33 = v11;
      MaxY = 0.0;
      do
      {
        objc_msgSend(v11, "objectAtIndex:", v15, p_size);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "rectsArray");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          v34 = v15;
          v19 = 0;
          v20 = &a4[v14];
          p_width = (_QWORD *)&p_size[2 * v14].width;
          do
          {
            v37 = (PXMagazineOrigin)0;
            v38 = (PXMagazineSize)0;
            if (v18)
              objc_msgSend(v18, "rectAtIndex:", v19);
            v22 = objc_msgSend(v17, "startY");
            v37.var1 += v22;
            if (a4)
            {
              v23 = v38;
              v20->var0 = v37;
              v20->var1 = v23;
            }
            if (a3)
            {
              v36[0] = v37;
              v36[1] = v38;
              -[PXNewMagazineLayoutTileMaker _frameFromTileFrame:](self, "_frameFromTileFrame:", v36);
              *(p_width - 2) = v24;
              *(p_width - 1) = v25;
              *p_width = v26;
              p_width[1] = v27;
              v28 = v14 + v19 + self->_numberOfColumns;
              if (v28 >= objc_msgSend(v35, "count") && CGRectGetMaxY(*(CGRect *)(p_width - 2)) > MaxY)
                MaxY = CGRectGetMaxY(*(CGRect *)(p_width - 2));
            }
            ++v19;
            ++v20;
            p_width += 4;
          }
          while (v19 < objc_msgSend(v18, "count"));
          v14 += v19;
          v11 = v33;
          v15 = v34;
        }

        ++v15;
      }
      while (v15 < objc_msgSend(v11, "count"));
    }
    else
    {
      MaxY = 0.0;
    }
    self->_height = MaxY;
    v9 = v35;
  }
  normalizedWeights = self->_normalizedWeights;
  if (normalizedWeights)
  {
    free(normalizedWeights);
    self->_normalizedWeights = 0;
  }

}

- (double)_normalizeWeightsByInputs:(id)a3
{
  id v3;
  void *v4;
  double *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  double v35;
  __int16 v36;
  double v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (double *)malloc_type_calloc(objc_msgSend(v4, "count"), 8uLL, 0x100004000313F17uLL);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      v10 = 0.0;
      v11 = 1.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "weight");
          if (v13 > v10)
            v10 = v13;
          if (v13 < v11)
            v11 = v13;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 0.0;
      v11 = 1.0;
    }

    if (v10 - v11 >= 0.0)
      v14 = v10 - v11;
    else
      v14 = -(v10 - v11);
    if (v14 < 0.01)
    {
      PLUIGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v35 = v11;
        v36 = 2048;
        v37 = v10;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, "No weights !!!  %.3f ~ %.3f", buf, 0x16u);
      }

      v11 = 1.0;
      v10 = 1.0;
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v16);
          v22 = v10;
          if (v14 >= 0.01)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "weight", v10, (_QWORD)v25);
            v22 = v11 + (v23 - v11) * ((1.0 - v11) / (v10 - v11));
            if (v22 > 1.0)
              v22 = 1.0;
          }
          v5[v19 + j] = v22;
        }
        v19 += j;
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v18);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setRandomSeedWithInputs:(id)a3
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "size");
    v5 = v4;

    srand(v5);
  }

}

- (void)_updateDimensionInfos
{
  double width;
  unint64_t numberOfColumns;
  double interTileSpacing;
  CGFloat v5;
  CGFloat v6;

  width = self->_referenceSize.width;
  numberOfColumns = self->_numberOfColumns;
  interTileSpacing = self->_interTileSpacing;
  v5 = (width - (double)(numberOfColumns - 1) * interTileSpacing) / (double)numberOfColumns;
  v6 = v5 / self->_tileAspectRatio;
  self->_defaultTileSize.width = v5;
  self->_defaultTileSize.height = v6;
  self->_lastTileWidthPadding = width - -(interTileSpacing - (interTileSpacing + v5) * (double)numberOfColumns);
}

- (void)_resetWithNumberOfAssets:(unint64_t)a3
{
  NSMutableArray *allFrames;

  allFrames = self->_allFrames;
  self->_allFrames = 0;

  self->_startLastPadding = 0;
}

- (BOOL)_isSameRectsArray:(id)a3 otherArray:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = (objc_msgSend(v5, "isEqualToRectArray:", v6) & 1) != 0
    || objc_msgSend(v5, "count") == 1 && objc_msgSend(v6, "count") == 1;

  return v7;
}

- (unint64_t)_numberOfInputsForLastPadding
{
  if (-[PXNewMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns") < 5)
    return 9;
  else
    return 10;
}

- (id)_generateTilesWithInputs:(id)a3
{
  unint64_t v4;
  PXNewMagazineRectArray *v5;
  PXNewMagazineGrid *v6;
  PXNewMagazineRectArray *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  PXNewMagazineChunk *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  PXNewMagazineChunk *v23;
  void *v25;
  uint64_t v26;
  BOOL v27;
  _BOOL8 v28;
  uint64_t v29;
  PXNewMagazineChunk *v30;
  unint64_t maxTilesInFrame;
  unint64_t v32;
  id v33;

  v33 = a3;
  v4 = objc_msgSend(v33, "count");
  v5 = [PXNewMagazineRectArray alloc];
  v6 = -[PXNewMagazineGrid initWithNumberOfColumns:size:]([PXNewMagazineGrid alloc], "initWithNumberOfColumns:size:", self->_numberOfColumns, 50);
  v7 = -[PXNewMagazineRectArray initWithSize:tileGrid:](v5, "initWithSize:tileGrid:", 50, v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setGeneratedChunks:", v8);
  objc_msgSend(v9, "setOutRectArray:", v7);
  objc_msgSend(v9, "setFallbackRectArray:", 0);
  v32 = -[PXNewMagazineLayoutTileMaker _numberOfInputsForLastPadding](self, "_numberOfInputsForLastPadding");
  if (v4)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    maxTilesInFrame = self->_maxTilesInFrame;
    while (1)
    {
      objc_msgSend(v9, "outRectArray");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reset");

      objc_msgSend(v9, "setFallbackRectArray:", 0);
      -[PXNewMagazineLayoutTileMaker _findNextChunkWithInputs:fromIndex:context:](self, "_findNextChunkWithInputs:fromIndex:context:", v33, v12, v9);
      if (!-[PXNewMagazineRectArray count](v7, "count"))
      {
        objc_msgSend(v9, "fallbackRectArray");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          break;
      }
      if (v11)
      {
        if (!-[PXNewMagazineRectArray count](v7, "count"))
        {
          v15 = v4 - v12;
          if (v4 - v12 < v32)
            goto LABEL_17;
        }
      }
      if (-[PXNewMagazineRectArray count](v7, "count"))
        v11 = 0;
      else
        ++v11;
      if (-[PXNewMagazineRectArray count](v7, "count"))
        -[PXNewMagazineRectArray immutableCopyForCurrentRectsCount](v7, "immutableCopyForCurrentRectsCount");
      else
        objc_msgSend(v9, "fallbackRectArray");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PXNewMagazineChunk initWithStartY:startIndexOfInputs:rectsArray:]([PXNewMagazineChunk alloc], "initWithStartY:startIndexOfInputs:rectsArray:", v10, v12, v16);
      objc_msgSend(v8, "addObject:", v17);
      v10 += -[PXNewMagazineChunk height](v17, "height");
      v12 += objc_msgSend(v16, "count");

      if (v12 >= v4)
        goto LABEL_27;
    }
    v15 = v4 - v12;
LABEL_17:
    self->_maxTilesInFrame = maxTilesInFrame;
    objc_msgSend(v33, "subarrayWithRange:", v12, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v19 = v15 >= v32;
    else
      v19 = 1;
    v20 = v19;
    -[PXNewMagazineLayoutTileMaker _generateLastTilesWithInputs:baseIndex:returnFallback:](self, "_generateLastTilesWithInputs:baseIndex:returnFallback:", v18, v12, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      v23 = -[PXNewMagazineChunk initWithStartY:startIndexOfInputs:rectsArray:]([PXNewMagazineChunk alloc], "initWithStartY:startIndexOfInputs:rectsArray:", v10, v12, v21);
      objc_msgSend(v8, "addObject:", v23);
    }
    else
    {
      if ((v20 & 1) != 0)
        goto LABEL_26;
      objc_msgSend(v8, "count");
      while (1)
      {
        v25 = v18;
        objc_msgSend(v8, "lastObject");
        v23 = (PXNewMagazineChunk *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeLastObject");
        v26 = -[PXNewMagazineChunk startIndexOfInputs](v23, "startIndexOfInputs");
        objc_msgSend(v33, "subarrayWithRange:", v26, v4 - v26);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = !v26 || v4 - v26 >= v32;
        v28 = v27;
        -[PXNewMagazineLayoutTileMaker _generateLastTilesWithInputs:baseIndex:returnFallback:](self, "_generateLastTilesWithInputs:baseIndex:returnFallback:", v18, v26, v28);
        v29 = objc_claimAutoreleasedReturnValue();
        if (v29)
          break;

        if (!v26)
          goto LABEL_26;
      }
      v22 = (void *)v29;
      v30 = -[PXNewMagazineChunk initWithStartY:startIndexOfInputs:rectsArray:]([PXNewMagazineChunk alloc], "initWithStartY:startIndexOfInputs:rectsArray:", -[PXNewMagazineChunk startY](v23, "startY"), v26, v29);
      objc_msgSend(v8, "addObject:", v30);

    }
LABEL_26:

  }
LABEL_27:

  return v8;
}

- (void)_findNextChunkWithInputs:(id)a3 fromIndex:(unint64_t)a4 context:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "editorialLayoutTargetRowsForChunk");
  if (-[PXNewMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns") <= 3)
    v11 = v10;
  else
    v11 = v10 + 1;

  if (!-[PXNewMagazineLayoutTileMaker _generateNextChunkWithInputs:fromIndex:maxY:reserveNumberForPadding:context:](self, "_generateNextChunkWithInputs:fromIndex:maxY:reserveNumberForPadding:context:", v14, a4, 2 * v11, 0, v8))
  {
    objc_msgSend(v8, "setFallbackRectArray:", 0);
    if (!-[PXNewMagazineLayoutTileMaker _generateNextChunkWithInputs:fromIndex:maxY:reserveNumberForPadding:context:](self, "_generateNextChunkWithInputs:fromIndex:maxY:reserveNumberForPadding:context:", v14, a4, 4 * v11, 0, v8))
    {
      v12 = -[PXNewMagazineLayoutTileMaker _numberOfInputsForLastPadding](self, "_numberOfInputsForLastPadding");
      objc_msgSend(v8, "setFallbackRectArray:", 0);
      if (!-[PXNewMagazineLayoutTileMaker _generateNextChunkWithInputs:fromIndex:maxY:reserveNumberForPadding:context:](self, "_generateNextChunkWithInputs:fromIndex:maxY:reserveNumberForPadding:context:", v14, a4, -1, v12, v8))
      {
        objc_msgSend(v8, "setFallbackRectArray:", 0);
        objc_msgSend(v8, "outRectArray");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "reset");

      }
    }
  }

}

- (BOOL)_generateNextChunkWithInputs:(id)a3 fromIndex:(unint64_t)a4 maxY:(unint64_t)a5 reserveNumberForPadding:(unint64_t)a6 context:(id)a7
{
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  BOOL v19;
  void *v20;
  BOOL v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  unint64_t v39;
  unint64_t v40;
  id v41;
  void *v42;
  _BOOL4 v43;
  PXNewMagazineLayoutTileMaker *v44;
  _QWORD v45[4];
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _OWORD v49[6];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v47 = 0;
  v48 = 0;
  v46 = 0;
  objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  PXSizeGetAspectRatio();
  v16 = v15;
  v44 = self;
  v17 = self->_normalizedWeights[a4];
  v18 = v15 <= 0.402;
  if (v15 >= 2.3)
    v18 = 1;
  v43 = v18;
  v19 = a6 + a4 == objc_msgSend(v12, "count") - 1 || objc_msgSend(v12, "count") - 1 == a4;
  objc_msgSend(v13, "outRectArray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  if (!objc_msgSend(v20, "nextEmptyTileX:Y:maxWidth:", &v48, &v47, &v46) || v47 > a5)
    goto LABEL_40;
  v42 = v14;
  if (-[PXNewMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns") == 3)
    v22 = 1.5;
  else
    v22 = 1.8;
  memset(v49, 0, sizeof(v49));
  v23 = -[PXNewMagazineLayoutTileMaker _availableFrames:maxReturnCount:forAspectRatio:weight:maxWidth:](self, "_availableFrames:maxReturnCount:forAspectRatio:weight:maxWidth:", v49, 12, v46, v16, v17);
  if (v23 < 1)
  {
    v21 = 0;
    goto LABEL_39;
  }
  v24 = v23;
  v25 = 0;
  v39 = a4 + 1;
  v40 = a6;
  v21 = 1;
  v41 = v12;
  while (1)
  {
    v26 = *((id *)v49 + v25);
    v27 = objc_msgSend(v26, "width");
    v28 = objc_msgSend(v26, "height");
    if (v27 != v46 && v19)
      goto LABEL_36;
    if (a5 != -1)
    {
      v30 = v28 == 2 && v27 == 2;
      if (v30 && v16 >= 2.3)
        goto LABEL_36;
    }
    if (v47 + v28 > a5)
      goto LABEL_36;
    v45[0] = v48;
    v45[1] = v47;
    v45[2] = v27;
    v45[3] = v28;
    objc_msgSend(v20, "addRect:", v45);
    if (objc_msgSend(v20, "isPerfectEnding"))
      break;
    if (!v19
      && -[PXNewMagazineLayoutTileMaker _generateNextChunkWithInputs:fromIndex:maxY:reserveNumberForPadding:context:](v44, "_generateNextChunkWithInputs:fromIndex:maxY:reserveNumberForPadding:context:", v12, v39, a5, v40, v13))
    {
      goto LABEL_41;
    }
    objc_msgSend(v20, "removeLastRect", v39, v40);
LABEL_36:

    v21 = ++v25 < v24;
    if (v24 == v25)
      goto LABEL_39;
  }
  objc_msgSend(v13, "generatedChunks");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "lastObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "rectsArray");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXNewMagazineLayoutTileMaker _isSameRectsArray:otherArray:](v44, "_isSameRectsArray:otherArray:", v20, v33)
    && !v43)
  {

    goto LABEL_33;
  }
  objc_msgSend(v20, "tileDensity");
  v35 = v34;

  if (v35 < v22)
  {
LABEL_33:
    objc_msgSend(v13, "fallbackRectArray", v39, v40);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      objc_msgSend(v20, "immutableCopyForCurrentRectsCount");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFallbackRectArray:", v37);

    }
    objc_msgSend(v20, "removeLastRect");

    v12 = v41;
    goto LABEL_36;
  }

  v12 = v41;
LABEL_41:

LABEL_39:
  v14 = v42;
LABEL_40:

  return v21;
}

- (id)_generateLastTilesWithInputs:(id)a3 baseIndex:(unint64_t)a4 returnFallback:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  PXNewMagazineLayoutCoordinator *v9;
  PXNewMagazineGrid *v10;
  PXNewMagazineLayoutCoordinator *v11;
  PXNewMagazineLayoutCoordinator *v12;
  PXNewMagazineGrid *v13;
  uint64_t v14;
  void *v15;

  v5 = a5;
  v8 = a3;
  self->_startLastPadding = 1;
  v9 = [PXNewMagazineLayoutCoordinator alloc];
  v10 = -[PXNewMagazineGrid initWithNumberOfColumns:size:]([PXNewMagazineGrid alloc], "initWithNumberOfColumns:size:", self->_numberOfColumns, objc_msgSend(v8, "count"));
  v11 = -[PXNewMagazineLayoutCoordinator initWithPaddingInputs:tileGrid:tileAspectRatio:stopIfAnyGoodLayout:](v9, "initWithPaddingInputs:tileGrid:tileAspectRatio:stopIfAnyGoodLayout:", v8, v10, 0, self->_tileAspectRatio);

  if (!-[PXNewMagazineLayoutTileMaker _findNextTileWithInputs:atIndex:baseIndex:coordinator:](self, "_findNextTileWithInputs:atIndex:baseIndex:coordinator:", v8, 0, a4, v11))
  {
    objc_msgSend((id)objc_opt_class(), "printInputs:", v8);
    if (!v5)
    {
      v15 = 0;
      goto LABEL_6;
    }
    v12 = [PXNewMagazineLayoutCoordinator alloc];
    v13 = -[PXNewMagazineGrid initWithNumberOfColumns:size:]([PXNewMagazineGrid alloc], "initWithNumberOfColumns:size:", self->_numberOfColumns, objc_msgSend(v8, "count"));
    v14 = -[PXNewMagazineLayoutCoordinator initWithPaddingInputs:tileGrid:tileAspectRatio:stopIfAnyGoodLayout:](v12, "initWithPaddingInputs:tileGrid:tileAspectRatio:stopIfAnyGoodLayout:", v8, v13, 1, self->_tileAspectRatio);

    -[PXNewMagazineLayoutTileMaker _findNextTileWithInputs:atIndex:baseIndex:coordinator:](self, "_findNextTileWithInputs:atIndex:baseIndex:coordinator:", v8, 0, a4, v14);
    v11 = (PXNewMagazineLayoutCoordinator *)v14;
  }
  -[PXNewMagazineLayoutCoordinator currentBestLayout](v11, "currentBestLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v15;
}

- (BOOL)_findNextTileWithInputs:(id)a3 atIndex:(unint64_t)a4 baseIndex:(unint64_t)a5 coordinator:(id)a6
{
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  size_t v17;
  id *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  id v33;
  PXNewMagazineLayoutTileMaker *v34;
  unint64_t v35;
  int v36;
  _QWORD v37[4];
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];

  v34 = self;
  v35 = a5;
  v40[1] = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40[0] = 0;
  v38 = 0;
  objc_msgSend(a3, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  PXSizeGetAspectRatio();
  v11 = v10;
  v12 = objc_msgSend(a3, "count");
  objc_msgSend(a6, "currentLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "nextEmptyTileX:Y:maxWidth:", v40, &v39, &v38))
  {
    v14 = objc_msgSend(a3, "count");
    v30 = v9;
    v33 = a3;
    if (v14 <= 7)
    {
      if (v14 - 1 > 6)
        v15 = 10;
      else
        v15 = qword_1A7C0A258[v14 - 1];
    }
    else
    {
      v15 = 5;
    }
    v29 = (uint64_t)&v29;
    MEMORY[0x1E0C80A78](v14);
    v18 = (id *)((char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v18, v17);
    v19 = -[PXNewMagazineLayoutTileMaker _availableFrames:maxReturnCount:forAspectRatio:weight:maxWidth:](v34, "_availableFrames:maxReturnCount:forAspectRatio:weight:maxWidth:", v18, v15, v38, v11, v34->_normalizedWeights[v35 + a4]);
    v31 = (void *)MEMORY[0x1A85CE17C]();
    v36 = objc_msgSend(a6, "stopIfAnyGoodLayout");
    if (v19 >= 1)
    {
      v20 = v12 - 1;
      v32 = a4 + 1;
      do
      {
        v21 = *v18;
        v23 = v39;
        v22 = v40[0];
        v24 = objc_msgSend(v21, "width");
        v25 = objc_msgSend(v21, "height");
        v37[0] = v22;
        v37[1] = v23;
        v37[2] = v24;
        v37[3] = v25;
        objc_msgSend(v13, "addRect:", v37);
        if (v20 == a4)
        {
          v26 = objc_msgSend(v13, "endingType");
          if (v26 == 1)
            v27 = v36;
          else
            v27 = 0;
          if (v26 == 2 || v27)
          {
            objc_msgSend(a6, "validateCurrentLayout");
          }
          else if (v36 && !objc_msgSend(a6, "currentLayoutsCount"))
          {
            objc_msgSend(a6, "validateCurrentLayoutAsFallback");
          }
          if ((objc_msgSend(a6, "stop") & 1) != 0)
          {
LABEL_27:

            objc_autoreleasePoolPop(v31);
            goto LABEL_31;
          }
          objc_msgSend(v13, "removeLastRect");
        }
        else
        {
          if (-[PXNewMagazineLayoutTileMaker _findNextTileWithInputs:atIndex:baseIndex:coordinator:](v34, "_findNextTileWithInputs:atIndex:baseIndex:coordinator:", v33, v32, v35, a6))
          {
            goto LABEL_27;
          }
          objc_msgSend(v13, "removeLastRect");
          if ((objc_msgSend(a6, "stop") & 1) != 0)
          {

            break;
          }
        }

        ++v18;
        --v19;
      }
      while (v19);
    }
    objc_autoreleasePoolPop(v31);
    if (a4 || !objc_msgSend(a6, "currentLayoutsCount"))
      v16 = 0;
    else
LABEL_31:
      v16 = 1;
    v9 = v30;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (CGRect)_frameFromTileFrame:(PXMagazineRect *)a3
{
  double width;
  double interTileSpacing;
  double v5;
  int64_t var0;
  double v7;
  double lastTileWidthPadding;
  double v9;
  double height;
  double v11;
  double v12;
  double v13;
  CGRect result;

  width = self->_defaultTileSize.width;
  interTileSpacing = self->_interTileSpacing;
  v5 = width + interTileSpacing;
  var0 = a3->var1.var0;
  v7 = interTileSpacing * (double)(var0 - 1) + width * (double)var0;
  lastTileWidthPadding = 0.0;
  if (var0 + a3->var0.var0 == self->_numberOfColumns)
    lastTileWidthPadding = self->_lastTileWidthPadding;
  v9 = v5 * (double)a3->var0.var0;
  height = self->_defaultTileSize.height;
  v11 = v7 + lastTileWidthPadding;
  if (self->_layoutFromRightToLeft)
    v9 = self->_referenceSize.width - v9 - v11;
  v12 = interTileSpacing * (double)(a3->var1.var1 - 1) + height * (double)a3->var1.var1;
  v13 = (interTileSpacing + height) * (double)a3->var0.var1;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v13;
  result.origin.x = v9;
  return result;
}

- (id)_getAllFramesInOrder
{
  NSMutableArray *allFrames;
  NSMutableArray *v4;
  NSMutableArray *v5;
  unint64_t v6;
  double tileAspectRatio;
  unint64_t v8;
  unint64_t numberOfColumns;
  float v10;
  float v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  unint64_t v17;
  unint64_t i;
  double v19;
  PXNewMagazineFrame *v20;
  double v21;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  allFrames = self->_allFrames;
  if (!allFrames || !-[NSMutableArray count](allFrames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_allFrames;
    self->_allFrames = v4;

    v6 = -[PXNewMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns");
    tileAspectRatio = self->_tileAspectRatio;
    v8 = -[PXNewMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns");
    numberOfColumns = self->_numberOfColumns;
    if (numberOfColumns >= 2)
    {
      v10 = tileAspectRatio * (double)v6;
      v11 = roundf(v10);
      v12 = (unint64_t)(float)(v11 + v11);
      v13 = 2 * v8 * v12;
      v14 = 2;
      v15 = 4;
      v16 = 1.25;
      do
      {
        if (v12 >= 2)
        {
          v17 = v15;
          for (i = 2; i <= v12; ++i)
          {
            if (v17 <= v13)
            {
              v19 = self->_tileAspectRatio * (double)v14 / (double)i;
              if (v19 <= self->_maxFrameAspectRatio && v19 >= self->_minFrameAspectRatio)
              {
                v20 = -[PXNewMagazineFrame initWithWidth:height:]([PXNewMagazineFrame alloc], "initWithWidth:height:", v14, i);
                -[PXNewMagazineFrame setAspectRatio:](v20, "setAspectRatio:", v19);
                v21 = v19 + -1.0;
                if (v19 + -1.0 < 0.0)
                  v21 = -(v19 + -1.0);
                if (v19 < 2.3 && v19 > 0.402)
                  v23 = 1.35;
                else
                  v23 = v16;
                if (v21 >= 0.112)
                  v24 = v23;
                else
                  v24 = 1.6;
                -[PXNewMagazineFrame setMinAspectRatio:](v20, "setMinAspectRatio:", v19 / v24, v23);
                v25 = v19 * v24;
                v16 = 1.25;
                -[PXNewMagazineFrame setMaxAspectRatio:](v20, "setMaxAspectRatio:", v25);
                if (v19 >= 2.3)
                {
                  -[PXNewMagazineFrame setMinAspectRatio:](v20, "setMinAspectRatio:", fmin(v19 / 1.25, 2.3));
                  -[PXNewMagazineFrame setMaxAspectRatio:](v20, "setMaxAspectRatio:", 1000.0);
                }
                if (v19 <= 0.402)
                {
                  -[PXNewMagazineFrame setMinAspectRatio:](v20, "setMinAspectRatio:", 0.0);
                  v26 = v19 * 1.25;
                  if (v19 * 1.25 < 0.402)
                    v26 = 0.402;
                  -[PXNewMagazineFrame setMaxAspectRatio:](v20, "setMaxAspectRatio:", v26);
                }
                -[NSMutableArray addObject:](self->_allFrames, "addObject:", v20);

              }
            }
            v17 += v14;
          }
          numberOfColumns = self->_numberOfColumns;
        }
        ++v14;
        v15 += 2;
      }
      while (v14 <= numberOfColumns);
    }
    -[NSMutableArray sortUsingComparator:](self->_allFrames, "sortUsingComparator:", &__block_literal_global_191922);
    -[NSMutableArray objectAtIndexedSubscript:](self->_allFrames, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "aspectRatio");
    v29 = v28;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v30 = self->_allFrames;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v53;
LABEL_33:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v53 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v34);
        objc_msgSend(v35, "aspectRatio");
        if (v36 > v29)
          break;
        objc_msgSend(v35, "setMinAspectRatio:", 0.0);
        if (v32 == ++v34)
        {
          v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          if (v32)
            goto LABEL_33;
          break;
        }
      }
    }

    -[NSMutableArray lastObject](self->_allFrames, "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "aspectRatio");
    v39 = v38;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[NSMutableArray reverseObjectEnumerator](self->_allFrames, "reverseObjectEnumerator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v49;
LABEL_41:
      v44 = 0;
      while (1)
      {
        if (*(_QWORD *)v49 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v44);
        objc_msgSend(v45, "aspectRatio");
        if (v46 < v39)
          break;
        objc_msgSend(v45, "setMaxAspectRatio:", 1000.0);
        if (v42 == ++v44)
        {
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v42)
            goto LABEL_41;
          break;
        }
      }
    }

  }
  return self->_allFrames;
}

- (int64_t)_availableFrames:(id *)a3 maxReturnCount:(unint64_t)a4 forAspectRatio:(double)a5 weight:(double)a6 maxWidth:(unint64_t)a7
{
  NSMutableArray *v11;
  double v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  uint64_t v27;
  BOOL v28;
  BOOL v29;
  double v30;
  BOOL v31;
  _BOOL4 v32;
  BOOL v33;
  _BOOL4 v34;
  void *v35;
  int v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  char v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  int v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  NSMutableArray *v61;
  id v62;
  uint64_t v63;
  NSMutableArray *v64;
  uint64_t v65;
  uint64_t v66;
  int64_t v67;
  uint64_t v68;
  uint64_t k;
  void *v71;
  unint64_t v75;
  void *v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[5];
  BOOL v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_sharedTempArray, "removeAllObjects");
  v11 = self->_sharedTempArray;
  if (1.0 / a5 <= a5)
    v12 = a5;
  else
    v12 = 1.0 / a5;
  -[PXNewMagazineLayoutTileMaker _getAllFramesInOrder](self, "_getAllFramesInOrder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewMagazineLayoutTileMaker.m"), 706, CFSTR("We should never have no frames"));

  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v89 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        objc_msgSend(v19, "aspectRatio");
        v21 = v20;
        objc_msgSend(v19, "minAspectRatio");
        v23 = v22;
        objc_msgSend(v19, "maxAspectRatio");
        v25 = v24;
        v26 = objc_msgSend(v19, "width");
        v27 = objc_msgSend(v19, "height");
        if (v26 <= a7
          && v27 * v26 <= self->_maxTilesInFrame
          && (self->_startLastPadding || ((v26 | v27) & 1) == 0))
        {
          v28 = a5 <= 0.402;
          if (v21 >= 0.801)
            v28 = 0;
          v29 = v21 > 1.334 || v21 < 0.8;
          v30 = v12 + -1.0;
          v31 = v29 || v12 + -1.0 > 0.15;
          if (!v31 || v28)
            goto LABEL_39;
          if (v23 > a5)
            goto LABEL_42;
          v30 = 0.9;
          if (a5 >= 0.9 && v26 == 2 && v27 == 2)
            goto LABEL_39;
          v32 = v26 == 2 && a5 < 0.9;
          if (v32 && v27 == 4)
            goto LABEL_39;
          if (v25 >= a5)
          {
            v30 = 0.9;
            v33 = v21 < 0.9;
            if (a5 < 0.9)
              v33 = v21 >= 1.1;
            if (!v33)
LABEL_39:
              -[NSMutableArray addObject:](v11, "addObject:", v19, v30);
          }
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
    }
    while (v16);
  }
LABEL_42:

  v34 = 1;
  if (a5 > 0.402 && a5 < 2.3 && a6 < 0.66)
    v34 = -[PXNewMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns", 0.66, a6) >= 4 && rand() % 10 > 4;
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __95__PXNewMagazineLayoutTileMaker__availableFrames_maxReturnCount_forAspectRatio_weight_maxWidth___block_invoke;
  v86[3] = &__block_descriptor_41_e51_q24__0__PXNewMagazineFrame_8__PXNewMagazineFrame_16l;
  *(double *)&v86[4] = a5;
  v87 = v34;
  -[NSMutableArray sortUsingComparator:](v11, "sortUsingComparator:", v86);
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "editorialLayoutAvoidSmallestTile");

  v37 = -[PXNewMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns");
  if (v36)
  {
    v38 = v37;
    if ((unint64_t)-[NSMutableArray count](v11, "count") >= 3)
    {
      v39 = 2 * v38;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray firstObject](v11, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (a5 < 2.3)
      {
        if (objc_msgSend(v41, "width") != v39 || v34 && rand() % 100 < 6)
        {
          v43 = 0;
        }
        else
        {
          -[NSMutableArray removeObjectAtIndex:](v11, "removeObjectAtIndex:", 0);
          -[NSMutableArray firstObject](v11, "firstObject");
          v43 = v42;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (v39 >= 7 && v42)
        {
          v75 = v39;
          v76 = v43;
          v44 = 0;
          v45 = v39 - 2;
          v46 = 1;
          while (objc_msgSend(v42, "width") == v45)
          {
            if (rand() % 100 < 51)
            {
              ++v44;
            }
            else
            {
              -[NSMutableArray removeObjectAtIndex:](v11, "removeObjectAtIndex:", v44);
              objc_msgSend(v40, "addObject:", v42);
            }
            if (v44 >= -[NSMutableArray count](v11, "count"))
            {

              v42 = 0;
              break;
            }
            -[NSMutableArray objectAtIndex:](v11, "objectAtIndex:", v44);
            v47 = objc_claimAutoreleasedReturnValue();

            v48 = v46 & (v47 != 0);
            v42 = (void *)v47;
            v46 = 0;
            if ((v48 & 1) == 0)
            {
              v42 = (void *)v47;
              break;
            }
          }
          v39 = v75;
          v43 = v76;
        }
      }
      else
      {
        v43 = 0;
      }
      if (objc_msgSend(v42, "width") == 2
        && (objc_msgSend(v42, "height") == 2 || objc_msgSend(v42, "height") == 4)
        && (v39 >= 7 && objc_msgSend(v42, "height") == 4 || rand() % 100 <= 89))
      {
        -[NSMutableArray removeObjectAtIndex:](v11, "removeObjectAtIndex:", 0);
        v49 = v42;
        if (v43)
          goto LABEL_78;
      }
      else
      {
        v49 = 0;
        if (v43)
          goto LABEL_78;
      }
      v63 = objc_msgSend(v40, "count");
      if (!v49 && !v63)
        goto LABEL_107;
LABEL_78:
      if ((unint64_t)-[NSMutableArray count](v11, "count") < 2)
      {
        v50 = -[NSMutableArray count](v11, "count");
        if (!v40)
          goto LABEL_90;
      }
      else
      {
        -[PXNewMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns");
        v50 = 2;
        if (!v40)
          goto LABEL_90;
      }
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v77 = v40;
      v51 = v40;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v83;
        do
        {
          for (j = 0; j != v53; ++j)
          {
            if (*(_QWORD *)v83 != v54)
              objc_enumerationMutation(v51);
            -[NSMutableArray insertObject:atIndex:](v11, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j), v50 + j);
          }
          v50 += j;
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
        }
        while (v53);
      }

      v40 = v77;
LABEL_90:
      if (v43 && v49)
      {
        v56 = rand();
        if (v56 % 10)
          v57 = v49;
        else
          v57 = v43;
        if (v56 % 10)
          v58 = v43;
        else
          v58 = v49;
        v59 = v57;

        v60 = v58;
        -[NSMutableArray insertObject:atIndex:](v11, "insertObject:atIndex:", v59, v50);
        -[NSMutableArray insertObject:atIndex:](v11, "insertObject:atIndex:", v60, v50 + 1);

        v42 = v59;
        goto LABEL_107;
      }
      if (v43)
      {
        v61 = v11;
        v62 = v43;
      }
      else
      {
        if (!v49)
        {
LABEL_107:

          goto LABEL_108;
        }
        v61 = v11;
        v62 = v49;
      }
      -[NSMutableArray insertObject:atIndex:](v61, "insertObject:atIndex:", v62, v50);
      goto LABEL_107;
    }
  }
LABEL_108:
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v64 = v11;
  v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
  if (v65)
  {
    v66 = v65;
    v67 = 0;
    v68 = *(_QWORD *)v79;
    while (2)
    {
      for (k = 0; k != v66; ++k)
      {
        if (*(_QWORD *)v79 != v68)
          objc_enumerationMutation(v64);
        *(&a3[v67] + k) = *(id *)(*((_QWORD *)&v78 + 1) + 8 * k);
        if (v67 + k + 1 >= a4)
        {
          v67 += k + 1;
          goto LABEL_119;
        }
      }
      v67 += k;
      v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
      if (v66)
        continue;
      break;
    }
  }
  else
  {
    v67 = 0;
  }
LABEL_119:

  return v67;
}

- (BOOL)checkAndPrintResults:(BOOL)a3
{
  return self->_isPerfectEnding;
}

- (double)tileAspectRatio
{
  return self->_tileAspectRatio;
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)height
{
  return self->_height;
}

- (CGSize)defaultTileSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultTileSize.width;
  height = self->_defaultTileSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)interTileSpacing
{
  return self->_interTileSpacing;
}

- (unint64_t)maxTilesInFrame
{
  return self->_maxTilesInFrame;
}

- (void)setMaxTilesInFrame:(unint64_t)a3
{
  self->_maxTilesInFrame = a3;
}

- (BOOL)layoutFromRightToLeft
{
  return self->_layoutFromRightToLeft;
}

- (void)setLayoutFromRightToLeft:(BOOL)a3
{
  self->_layoutFromRightToLeft = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTempArray, 0);
  objc_storeStrong((id *)&self->_allFrames, 0);
  objc_storeStrong((id *)&self->_cachedTileRects, 0);
}

uint64_t __95__PXNewMagazineLayoutTileMaker__availableFrames_maxReturnCount_forAspectRatio_weight_maxWidth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "aspectRatio");
  v8 = *(double *)(a1 + 32);
  if (v8 < v7)
  {
    v8 = 1.0 / v8;
    v7 = 1.0 / v7;
  }
  v9 = (v8 - v7) / v8;
  objc_msgSend(v6, "aspectRatio");
  v11 = *(double *)(a1 + 32);
  if (v11 < v10)
  {
    v11 = 1.0 / v11;
    v10 = 1.0 / v10;
  }
  v12 = (v11 - v10) / v11;
  v13 = v9 - v12;
  if (v9 - v12 < 0.0)
    v13 = -(v9 - v12);
  if (v13 >= 0.06)
  {
    if (v9 <= v12)
    {
      if (v9 >= v12)
        v16 = 0;
      else
        v16 = -1;
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v14 = objc_msgSend(v5, "numberOfTiles");
    if (v14 <= objc_msgSend(v6, "numberOfTiles"))
      v15 = -1;
    else
      v15 = 1;
    if (*(_BYTE *)(a1 + 40))
      v16 = -v15;
    else
      v16 = v15;
  }

  return v16;
}

uint64_t __52__PXNewMagazineLayoutTileMaker__getAllFramesInOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "aspectRatio");
  v6 = v5;
  objc_msgSend(v4, "aspectRatio");
  v8 = v7;

  if (v6 >= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v6 > v8)
    return 1;
  else
    return v9;
}

@end
