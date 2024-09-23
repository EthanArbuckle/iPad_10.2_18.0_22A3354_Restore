@implementation PXMagazineLayoutTileMaker

- (PXMagazineLayoutTileMaker)initWithReferenceSize:(CGSize)a3 numberOfColumns:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  PXMagazineLayoutTileMaker *v7;
  PXMagazineLayoutTileMaker *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *sharedTempArray;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)PXMagazineLayoutTileMaker;
  v7 = -[PXMagazineLayoutTileMaker init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_referenceSize.width = width;
    v7->_referenceSize.height = height;
    v9 = 36;
    if (a4 < 5)
      v9 = 24;
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

    -[PXMagazineLayoutTileMaker _updateDimensionInfos](v8, "_updateDimensionInfos");
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
  v4.super_class = (Class)PXMagazineLayoutTileMaker;
  -[PXMagazineLayoutTileMaker dealloc](&v4, sel_dealloc);
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_interTileSpacing);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMagazineLayoutTileMaker tileAspectRatio](self, "tileAspectRatio");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxTilesInFrame >> 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Tile Maker = {Columns: %@, InterTileSpacing: %@, TileASP: %.2f, MaxTiles: %@, MaxASP: %.2f, MinASP: %.2f}"), v4, v5, v7, v8, *(_QWORD *)&self->_maxFrameAspectRatio, *(_QWORD *)&self->_minFrameAspectRatio);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)_aspectRatioOfInput:(id)a3
{
  double v3;
  double v4;
  double result;

  objc_msgSend(a3, "size");
  if (v4 <= 0.0 || v3 <= 0.0)
    return 1.0;
  PXSizeGetAspectRatio();
  return result;
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
    -[PXMagazineLayoutTileMaker _updateDimensionInfos](self, "_updateDimensionInfos");
  }
}

- (unint64_t)getMagazineRects:(PXMagazineRect *)a3 withInputs:(id)a4
{
  -[PXMagazineLayoutTileMaker _getFrames:magazineRects:withInputs:](self, "_getFrames:magazineRects:withInputs:", 0, a3, a4);
  return self->_numberOfColumns;
}

- (void)getFrames:(CGRect *)a3 withInputs:(id)a4
{
  -[PXMagazineLayoutTileMaker _getFrames:magazineRects:withInputs:](self, "_getFrames:magazineRects:withInputs:", a3, 0, a4);
}

- (void)_getFrames:(CGRect *)a3 magazineRects:(PXMagazineRect *)a4 withInputs:(id)a5
{
  id v9;
  double *v10;
  PXMagazineRectArray *v11;
  PXMagazineRectArray *cachedTileRects;
  uint64_t v13;
  unint64_t v14;
  CGSize *p_size;
  CGFloat MaxY;
  PXMagazineRect *v17;
  PXMagazineRectArray *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  PXMagazineSize v27;
  unint64_t v28;
  double *normalizedWeights;
  void *v30;
  void *v31;
  void *v32;
  _OWORD v33[2];
  PXMagazineOrigin v34;
  PXMagazineSize v35;
  CGRect v36;
  CGRect v37;

  v9 = a5;
  if (self->_normalizedWeights)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMagazineLayoutTileMaker.m"), 162, CFSTR("normalizedWeights Memory leak."));

  }
  -[PXMagazineLayoutTileMaker _resetWithNumberOfAssets:](self, "_resetWithNumberOfAssets:", objc_msgSend(v9, "count"));
  -[PXMagazineLayoutTileMaker _setRandomSeedWithInputs:](self, "_setRandomSeedWithInputs:", v9);
  v10 = -[PXMagazineLayoutTileMaker _normalizeWeightsByInputs:](self, "_normalizeWeightsByInputs:", v9);
  self->_normalizedWeights = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMagazineLayoutTileMaker.m"), 166, CFSTR("Allocate normalizedWeights memory faill."));

  }
  -[PXMagazineLayoutTileMaker _generateTilesWithInputs:](self, "_generateTilesWithInputs:", v9);
  v11 = (PXMagazineRectArray *)objc_claimAutoreleasedReturnValue();
  cachedTileRects = self->_cachedTileRects;
  self->_cachedTileRects = v11;

  v13 = objc_msgSend(v9, "count");
  if (v13 != -[PXMagazineRectArray count](self->_cachedTileRects, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMagazineLayoutTileMaker.m"), 170, CFSTR("The number of cached tiles cannot be != to the number of inputs"));

  }
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    if (-[PXMagazineRectArray count](self->_cachedTileRects, "count"))
    {
      v14 = 0;
      p_size = &a3->size;
      MaxY = 0.0;
      v17 = a4;
      do
      {
        v34 = (PXMagazineOrigin)0;
        v35 = (PXMagazineSize)0;
        v18 = self->_cachedTileRects;
        if (v18)
          -[PXMagazineRectArray rectAtIndex:](v18, "rectAtIndex:", v14);
        v33[0] = v34;
        v33[1] = v35;
        -[PXMagazineLayoutTileMaker _frameFromTileFrame:](self, "_frameFromTileFrame:", v33);
        v23 = v19;
        v24 = v20;
        v25 = v21;
        v26 = v22;
        if (a3)
        {
          p_size[-1].width = v19;
          p_size[-1].height = v20;
          p_size->width = v21;
          p_size->height = v22;
        }
        if (a4)
        {
          v27 = v35;
          v17->var0 = v34;
          v17->var1 = v27;
        }
        v28 = v14 + self->_numberOfColumns;
        if (v28 >= -[PXMagazineRectArray count](self->_cachedTileRects, "count"))
        {
          v36.origin.x = v23;
          v36.origin.y = v24;
          v36.size.width = v25;
          v36.size.height = v26;
          if (CGRectGetMaxY(v36) > MaxY)
          {
            v37.origin.x = v23;
            v37.origin.y = v24;
            v37.size.width = v25;
            v37.size.height = v26;
            MaxY = CGRectGetMaxY(v37);
          }
        }
        ++v14;
        ++v17;
        p_size += 2;
      }
      while (v14 < -[PXMagazineRectArray count](self->_cachedTileRects, "count"));
    }
    else
    {
      MaxY = 0.0;
    }
    self->_height = MaxY;
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
  PXMagazineGrid *v5;
  PXMagazineGrid *tileGrid;
  PXMagazineRectArray *v7;
  PXMagazineRectArray *cachedTileRects;
  NSMutableArray *allFrames;

  v5 = -[PXMagazineGrid initWithNumberOfColumns:size:]([PXMagazineGrid alloc], "initWithNumberOfColumns:size:", self->_numberOfColumns, a3);
  tileGrid = self->_tileGrid;
  self->_tileGrid = v5;

  v7 = -[PXMagazineRectArray initWithSize:]([PXMagazineRectArray alloc], "initWithSize:", a3);
  cachedTileRects = self->_cachedTileRects;
  self->_cachedTileRects = v7;

  allFrames = self->_allFrames;
  self->_allFrames = 0;

  self->_startLastPadding = 0;
}

- (id)_generateTilesWithInputs:(id)a3
{
  id v4;
  unint64_t v5;
  PXMagazineRectArray *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t i;
  PXMagazineGrid *tileGrid;
  unint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = -[PXMagazineRectArray initWithSize:]([PXMagazineRectArray alloc], "initWithSize:", v5);
  v7 = -[PXMagazineLayoutTileMaker _numberOfInputsForLastPadding](self, "_numberOfInputsForLastPadding");
  v8 = 0;
  while (v8 < v5)
  {
    v9 = v8 + v7;
    if (v8 + v7 < v5)
    {
      -[PXMagazineLayoutTileMaker _findNextChunkWithInputs:fromIndex:outArray:](self, "_findNextChunkWithInputs:fromIndex:outArray:", v4, v8, v6);
      v10 = -[PXMagazineRectArray count](v6, "count");
      v11 = v8 == v10;
      if (v8 != v10)
        v8 = -[PXMagazineRectArray count](v6, "count");
      if (v8 >= v5)
        break;
      v9 = v8 + v7;
      if (v11)
        goto LABEL_9;
    }
    if (v9 >= v5)
    {
LABEL_9:
      objc_msgSend(v4, "subarrayWithRange:", v8, v5 - v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v13 = v5 - v8 >= v7;
      else
        v13 = 1;
      v14 = v13;
      -[PXMagazineLayoutTileMaker _generateLastTilesWithInputs:baseIndex:returnFallback:](self, "_generateLastTilesWithInputs:baseIndex:returnFallback:", v12, v8, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        v16 = 0;
        do
        {
          v27 = 0u;
          v28 = 0u;
          if (v15)
            objc_msgSend(v15, "rectAtIndex:", v16);
          v25 = v27;
          v26 = v28;
          -[PXMagazineRectArray addRect:](v6, "addRect:", &v25);
          ++v16;
        }
        while (v16 < objc_msgSend(v15, "count"));
      }
      if (v15)
        v17 = 1;
      else
        v17 = v14;
      if ((v17 & 1) == 0)
      {
        if (v7 >= v5)
          v18 = v5;
        else
          v18 = v7;
        v19 = v5 - v18;
        objc_msgSend(v4, "subarrayWithRange:", v5 - v18);
        v20 = objc_claimAutoreleasedReturnValue();

        for (i = -[PXMagazineRectArray count](v6, "count") - 1; i >= v19; --i)
        {
          v27 = 0u;
          v28 = 0u;
          if (v6)
            -[PXMagazineRectArray rectAtIndex:](v6, "rectAtIndex:", i);
          tileGrid = self->_tileGrid;
          v25 = v27;
          v26 = v28;
          -[PXMagazineGrid clearArea:](tileGrid, "clearArea:", &v25);
          -[PXMagazineRectArray removeLastRect](v6, "removeLastRect");
        }
        -[PXMagazineLayoutTileMaker _generateLastTilesWithInputs:baseIndex:returnFallback:](self, "_generateLastTilesWithInputs:baseIndex:returnFallback:", v20, v19, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
        {
          v23 = 0;
          do
          {
            v27 = 0u;
            v28 = 0u;
            if (v15)
              objc_msgSend(v15, "rectAtIndex:", v23);
            v25 = v27;
            v26 = v28;
            -[PXMagazineRectArray addRect:](v6, "addRect:", &v25);
            ++v23;
          }
          while (v23 < objc_msgSend(v15, "count"));
        }
        v12 = (void *)v20;
      }

      break;
    }
  }

  return v6;
}

- (unint64_t)_numberOfInputsForLastPadding
{
  if (-[PXMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns") >= 6)
    return 2 * -[PXMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns");
  else
    return 10;
}

- (void)_findNextChunkWithInputs:(id)a3 fromIndex:(unint64_t)a4 outArray:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;

  v12 = a3;
  v8 = a5;
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "editorialLayoutTargetRowsForChunk");

  v11 = -[PXMagazineGrid currentRowsUsed](self->_tileGrid, "currentRowsUsed");
  if (!-[PXMagazineLayoutTileMaker _generateTilesWithInputs:atIndex:forMaxY:reserveNumberForPadding:outArray:](self, "_generateTilesWithInputs:atIndex:forMaxY:reserveNumberForPadding:outArray:", v12, a4, v11 + 2 * v10, 0, v8)&& !-[PXMagazineLayoutTileMaker _generateTilesWithInputs:atIndex:forMaxY:reserveNumberForPadding:outArray:](self, "_generateTilesWithInputs:atIndex:forMaxY:reserveNumberForPadding:outArray:", v12, a4, v11 + 6 * v10, 0, v8))
  {
    -[PXMagazineLayoutTileMaker _generateTilesWithInputs:atIndex:forMaxY:reserveNumberForPadding:outArray:](self, "_generateTilesWithInputs:atIndex:forMaxY:reserveNumberForPadding:outArray:", v12, a4, -1, -[PXMagazineLayoutTileMaker _numberOfInputsForLastPadding](self, "_numberOfInputsForLastPadding"), v8);
  }

}

- (BOOL)_generateTilesWithInputs:(id)a3 atIndex:(unint64_t)a4 forMaxY:(unint64_t)a5 reserveNumberForPadding:(unint64_t)a6 outArray:(id)a7
{
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  PXMagazineGrid *tileGrid;
  PXMagazineGrid *v32;
  void *v34;
  uint64_t v36;
  void *v37;
  BOOL v38;
  unint64_t v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _OWORD v48[6];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v40 = a7;
  v46 = 0;
  v47 = 0;
  v45 = 0;
  objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMagazineLayoutTileMaker _aspectRatioOfInput:](self, "_aspectRatioOfInput:", v12);
  v14 = v13;
  v39 = a4;
  v15 = self->_normalizedWeights[a4];
  v37 = v11;
  v16 = objc_msgSend(v11, "count");
  v17 = 0;
  if (!-[PXMagazineGrid nextEmptyTileX:Y:maxWidth:](self->_tileGrid, "nextEmptyTileX:Y:maxWidth:", &v47, &v46, &v45)
    || v46 > a5)
  {
    goto LABEL_27;
  }
  v34 = v12;
  memset(v48, 0, sizeof(v48));
  v18 = -[PXMagazineLayoutTileMaker _availableFrames:maxReturnCount:forAspectRatio:weight:maxWidth:](self, "_availableFrames:maxReturnCount:forAspectRatio:weight:maxWidth:", v48, 12, v45, v14, v15);
  if (v18 < 1)
  {
    v17 = 0;
    goto LABEL_26;
  }
  v19 = v18;
  v20 = 0;
  v36 = v16 - 1;
  v21 = v14 >= 2.498;
  if (v15 >= 0.7)
    v21 = 1;
  v38 = v21;
  v17 = 1;
  while (1)
  {
    v22 = *((id *)v48 + v20);
    if (objc_msgSend(v22, "height") == 2)
    {
      v23 = objc_msgSend(v22, "width");
      v24 = a5 != -1 && v23 == 2;
      if (v24 && v38)
        goto LABEL_22;
    }
    v26 = v46;
    if (objc_msgSend(v22, "height") + v26 > a5)
      goto LABEL_22;
    v27 = v46;
    v28 = v47;
    v29 = objc_msgSend(v22, "width");
    v30 = objc_msgSend(v22, "height");
    tileGrid = self->_tileGrid;
    v41 = v28;
    v42 = v27;
    v43 = v29;
    v44 = v30;
    -[PXMagazineGrid setTileIdentifier:forArea:](tileGrid, "setTileIdentifier:forArea:", v39, &v41);
    v41 = v28;
    v42 = v27;
    v43 = v29;
    v44 = v30;
    objc_msgSend(v40, "addRect:", &v41);
    if (-[PXMagazineGrid isPerfectEnding](self->_tileGrid, "isPerfectEnding"))
      break;
    if (a6 + v39 == v36)
    {
      if (a5 == -1)
        break;
      goto LABEL_21;
    }
    if (-[PXMagazineLayoutTileMaker _generateTilesWithInputs:atIndex:forMaxY:reserveNumberForPadding:outArray:](self, "_generateTilesWithInputs:atIndex:forMaxY:reserveNumberForPadding:outArray:", v37, v39 + 1, a5, a6, v40))
    {
      break;
    }
LABEL_21:
    v32 = self->_tileGrid;
    v41 = v28;
    v42 = v27;
    v43 = v29;
    v44 = v30;
    -[PXMagazineGrid clearArea:](v32, "clearArea:", &v41);
    objc_msgSend(v40, "removeLastRect");
LABEL_22:

    v17 = ++v20 < v19;
    if (v19 == v20)
      goto LABEL_26;
  }

LABEL_26:
  v12 = v34;
LABEL_27:

  return v17;
}

- (id)_generateLastTilesWithInputs:(id)a3 baseIndex:(unint64_t)a4 returnFallback:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  PXMagazineLayoutCoordinator *v9;
  PXMagazineLayoutCoordinator *v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  self->_startLastPadding = 1;
  v9 = -[PXMagazineLayoutCoordinator initWithPaddingInputs:tileAspectRatio:stopIfAnyGoodLayout:]([PXMagazineLayoutCoordinator alloc], "initWithPaddingInputs:tileAspectRatio:stopIfAnyGoodLayout:", v8, 0, self->_tileAspectRatio);
  if (!-[PXMagazineLayoutTileMaker _findNextTileWithInputs:atIndex:baseIndex:coordinator:](self, "_findNextTileWithInputs:atIndex:baseIndex:coordinator:", v8, 0, a4, v9))
  {
    objc_msgSend((id)objc_opt_class(), "printInputs:", v8);
    if (!v5)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v10 = -[PXMagazineLayoutCoordinator initWithPaddingInputs:tileAspectRatio:stopIfAnyGoodLayout:]([PXMagazineLayoutCoordinator alloc], "initWithPaddingInputs:tileAspectRatio:stopIfAnyGoodLayout:", v8, 1, self->_tileAspectRatio);

    -[PXMagazineLayoutTileMaker _findNextTileWithInputs:atIndex:baseIndex:coordinator:](self, "_findNextTileWithInputs:atIndex:baseIndex:coordinator:", v8, 0, a4, v10);
    v9 = v10;
  }
  -[PXMagazineLayoutCoordinator currentBestLayout](v9, "currentBestLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v11;
}

- (BOOL)_findNextTileWithInputs:(id)a3 atIndex:(unint64_t)a4 baseIndex:(unint64_t)a5 coordinator:(id)a6
{
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  size_t v20;
  double *normalizedWeights;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  PXMagazineGrid *tileGrid;
  unint64_t v30;
  int v31;
  PXMagazineGrid *v32;
  PXMagazineGrid *v33;
  BOOL v34;
  _QWORD v36[2];
  void *v37;
  void *v38;
  unint64_t v39;
  id v40;
  unint64_t v41;
  int v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v51 = 0;
  v52[0] = 0;
  v50 = 0;
  objc_msgSend(a3, "objectAtIndexedSubscript:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMagazineLayoutTileMaker _aspectRatioOfInput:](self, "_aspectRatioOfInput:", v11);
  v13 = v12;
  v14 = objc_msgSend(a3, "count");
  if (-[PXMagazineGrid nextEmptyTileX:Y:maxWidth:](self->_tileGrid, "nextEmptyTileX:Y:maxWidth:", v52, &v51, &v50))
  {
    v37 = v11;
    v40 = a3;
    v15 = objc_msgSend(a3, "count");
    v36[1] = v36;
    v16 = 10;
    if (v15 == 6)
      v16 = 8;
    if (v15 == 7)
      v16 = 6;
    if (v15 <= 7)
      v17 = v16;
    else
      v17 = 5;
    MEMORY[0x1E0C80A78](v15);
    v19 = (id *)((char *)v36 - v18);
    bzero((char *)v36 - v18, v20);
    normalizedWeights = self->_normalizedWeights;
    v41 = a5;
    v44 = a5 + a4;
    v45 = a4;
    v22 = -[PXMagazineLayoutTileMaker _availableFrames:maxReturnCount:forAspectRatio:weight:maxWidth:](self, "_availableFrames:maxReturnCount:forAspectRatio:weight:maxWidth:", v19, v17, v50, v13, normalizedWeights[a5 + a4]);
    v38 = (void *)MEMORY[0x1A85CE17C]();
    objc_msgSend(a6, "currentLayout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(a6, "stopIfAnyGoodLayout");
    if (v22 >= 1)
    {
      v43 = v14 - 1;
      v39 = v45 + 1;
      do
      {
        v24 = *v19;
        v25 = v51;
        v26 = v52[0];
        v27 = objc_msgSend(v24, "width");
        v28 = objc_msgSend(v24, "height");
        tileGrid = self->_tileGrid;
        v46 = v26;
        v47 = v25;
        v48 = v27;
        v49 = v28;
        -[PXMagazineGrid setTileIdentifier:forArea:](tileGrid, "setTileIdentifier:forArea:", v44, &v46);
        v46 = v26;
        v47 = v25;
        v48 = v27;
        v49 = v28;
        objc_msgSend(v23, "addRect:", &v46);
        if (v43 == v45)
        {
          v30 = -[PXMagazineGrid endingType](self->_tileGrid, "endingType");
          if (v30 == 1)
            v31 = v42;
          else
            v31 = 0;
          if (v30 == 2 || v31)
          {
            objc_msgSend(a6, "validateCurrentLayout");
          }
          else if (v42 && !objc_msgSend(a6, "currentLayoutsCount"))
          {
            objc_msgSend(a6, "validateCurrentLayoutAsFallback");
          }
          if ((objc_msgSend(a6, "stop") & 1) != 0)
          {
LABEL_29:

            objc_autoreleasePoolPop(v38);
            goto LABEL_33;
          }
          v33 = self->_tileGrid;
          v46 = v26;
          v47 = v25;
          v48 = v27;
          v49 = v28;
          -[PXMagazineGrid clearArea:](v33, "clearArea:", &v46);
          objc_msgSend(v23, "removeLastRect");
        }
        else
        {
          if (-[PXMagazineLayoutTileMaker _findNextTileWithInputs:atIndex:baseIndex:coordinator:](self, "_findNextTileWithInputs:atIndex:baseIndex:coordinator:", v40, v39, v41, a6))
          {
            goto LABEL_29;
          }
          v32 = self->_tileGrid;
          v46 = v26;
          v47 = v25;
          v48 = v27;
          v49 = v28;
          -[PXMagazineGrid clearArea:](v32, "clearArea:", &v46);
          objc_msgSend(v23, "removeLastRect");
          if ((objc_msgSend(a6, "stop") & 1) != 0)
          {

            break;
          }
        }

        ++v19;
        --v22;
      }
      while (v22);
    }

    objc_autoreleasePoolPop(v38);
    if (v45 || !objc_msgSend(a6, "currentLayoutsCount"))
      v34 = 0;
    else
LABEL_33:
      v34 = 1;
    v11 = v37;
  }
  else
  {
    v34 = 0;
  }

  return v34;
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
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t i;
  double v12;
  PXMagazineFrame *v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  allFrames = self->_allFrames;
  if (!allFrames || !-[NSMutableArray count](allFrames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_allFrames;
    self->_allFrames = v4;

    v6 = -[PXMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns");
    if (self->_numberOfColumns >= 2)
    {
      if (v6 >= 4)
        v7 = 13;
      else
        v7 = 9;
      v8 = 2;
      v9 = 4;
      v40 = 1000.0;
      do
      {
        v10 = v9;
        for (i = 2; i != v7; ++i)
        {
          if (v10 <= self->_maxTilesInFrame)
          {
            v12 = self->_tileAspectRatio * (double)v8 / (double)i;
            if (v12 <= self->_maxFrameAspectRatio && v12 >= self->_minFrameAspectRatio)
            {
              v13 = -[PXMagazineFrame initWithWidth:height:]([PXMagazineFrame alloc], "initWithWidth:height:", v8, i);
              -[PXMagazineFrame setAspectRatio:](v13, "setAspectRatio:", v12);
              v14 = v12 + -1.0;
              if (v12 + -1.0 < 0.0)
                v14 = -(v12 + -1.0);
              v15 = v12 < 2.498 && v12 > 0.402;
              v16 = 1.35;
              if (!v15)
                v16 = 1.25;
              if (v14 >= 0.112)
                v17 = v16;
              else
                v17 = 1.6;
              -[PXMagazineFrame setMinAspectRatio:](v13, "setMinAspectRatio:", v12 / v17, v16, *(_QWORD *)&v40);
              -[PXMagazineFrame setMaxAspectRatio:](v13, "setMaxAspectRatio:", v12 * v17);
              if (v12 >= 2.498)
              {
                -[PXMagazineFrame setMinAspectRatio:](v13, "setMinAspectRatio:", fmin(v12 / 1.25, 2.498));
                -[PXMagazineFrame setMaxAspectRatio:](v13, "setMaxAspectRatio:", v40);
              }
              if (v12 <= 0.402)
              {
                -[PXMagazineFrame setMinAspectRatio:](v13, "setMinAspectRatio:", 0.0);
                v18 = v12 * 1.25;
                if (v12 * 1.25 < 0.402)
                  v18 = 0.402;
                -[PXMagazineFrame setMaxAspectRatio:](v13, "setMaxAspectRatio:", v18);
              }
              -[NSMutableArray addObject:](self->_allFrames, "addObject:", v13);

            }
          }
          v10 += v8;
        }
        ++v8;
        v9 += 2;
      }
      while (v8 <= self->_numberOfColumns);
    }
    -[NSMutableArray sortUsingComparator:](self->_allFrames, "sortUsingComparator:", &__block_literal_global_105850, *(_QWORD *)&v40);
    -[NSMutableArray objectAtIndexedSubscript:](self->_allFrames, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "aspectRatio");
    v21 = v20;

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v22 = self->_allFrames;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v46;
LABEL_33:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v26);
        objc_msgSend(v27, "aspectRatio");
        if (v28 > v21)
          break;
        objc_msgSend(v27, "setMinAspectRatio:", 0.0);
        if (v24 == ++v26)
        {
          v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          if (v24)
            goto LABEL_33;
          break;
        }
      }
    }

    -[NSMutableArray lastObject](self->_allFrames, "lastObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "aspectRatio");
    v31 = v30;

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[NSMutableArray reverseObjectEnumerator](self->_allFrames, "reverseObjectEnumerator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v42;
LABEL_41:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v36);
        objc_msgSend(v37, "aspectRatio");
        if (v38 < v31)
          break;
        objc_msgSend(v37, "setMaxAspectRatio:", 1000.0);
        if (v34 == ++v36)
        {
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v34)
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
  NSMutableArray *v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  uint64_t v28;
  BOOL v29;
  BOOL v30;
  double v31;
  BOOL v32;
  _BOOL4 v33;
  BOOL v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  id *v41;
  uint64_t j;
  void *v43;
  int v44;
  unint64_t v45;
  unint64_t v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  char v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v56;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  BOOL v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_sharedTempArray, "removeAllObjects");
  v12 = self->_sharedTempArray;
  if (1.0 / a5 <= a5)
    v13 = a5;
  else
    v13 = 1.0 / a5;
  -[PXMagazineLayoutTileMaker _getAllFramesInOrder](self, "_getAllFramesInOrder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMagazineLayoutTileMaker.m"), 598, CFSTR("We should never have no frames"));

  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v66 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v20, "aspectRatio");
        v22 = v21;
        objc_msgSend(v20, "minAspectRatio");
        v24 = v23;
        objc_msgSend(v20, "maxAspectRatio");
        v26 = v25;
        v27 = objc_msgSend(v20, "width");
        v28 = objc_msgSend(v20, "height");
        if (v27 <= a7 && (self->_startLastPadding || ((v27 | v28) & 1) == 0))
        {
          v29 = a5 <= 0.402;
          if (v22 >= 0.801)
            v29 = 0;
          v30 = v22 > 1.334 || v22 < 0.8;
          v31 = v13 + -1.0;
          v32 = v30 || v13 + -1.0 > 0.15;
          if (!v32 || v29)
            goto LABEL_40;
          if (v24 > a5)
            goto LABEL_43;
          v31 = 0.9;
          if (a5 >= 0.9 && v27 == 2 && v28 == 2)
            goto LABEL_40;
          v33 = v27 == 2 && a5 < 0.9;
          if (v33 && v28 == 4)
            goto LABEL_40;
          if (v26 >= a5)
          {
            v31 = 0.9;
            v35 = v22 < 0.9;
            if (a5 < 0.9)
              v35 = v22 >= 1.1;
            if (!v35)
LABEL_40:
              -[NSMutableArray addObject:](v12, "addObject:", v20, v31);
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v17);
  }
LABEL_43:

  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __92__PXMagazineLayoutTileMaker__availableFrames_maxReturnCount_forAspectRatio_weight_maxWidth___block_invoke;
  v63[3] = &__block_descriptor_41_e45_q24__0__PXMagazineFrame_8__PXMagazineFrame_16l;
  *(double *)&v63[4] = a5;
  v64 = a6 > 0.7;
  -[NSMutableArray sortUsingComparator:](v12, "sortUsingComparator:", v63);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v36 = v12;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v37)
  {
    v38 = v37;
    v39 = 0;
    v40 = *(_QWORD *)v60;
    v41 = a3;
    while (2)
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v60 != v40)
          objc_enumerationMutation(v36);
        *(&a3[v39] + j) = *(id *)(*((_QWORD *)&v59 + 1) + 8 * j);
        if (v39 + j + 1 >= a4)
        {
          v39 += j + 1;
          goto LABEL_54;
        }
      }
      v39 += j;
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      if (v38)
        continue;
      break;
    }
  }
  else
  {
    v39 = 0;
    v41 = a3;
  }
LABEL_54:

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "editorialLayoutAvoidSmallestTile");

  v45 = -[PXMagazineLayoutTileMaker numberOfColumns](self, "numberOfColumns");
  if (v39 >= 2 && v44)
  {
    v46 = v45;
    v47 = *v41;
    if (objc_msgSend(v47, "width") != 2 || objc_msgSend(v47, "height") != 2 && objc_msgSend(v47, "height") != 4)
      goto LABEL_76;
    v48 = v41[1];
    v49 = v48;
    if ((unint64_t)v39 < 3 || v46 < 4)
    {
      v54 = v48;
      if (v46 <= 3)
      {
        v50 = 0;
        if ((rand() & 1) == 0)
        {
LABEL_75:

LABEL_76:
          goto LABEL_77;
        }
      }
      else
      {
        v50 = 0;
      }
      v52 = 1;
    }
    else
    {
      v50 = v41[2];
      if (v50)
      {
        v51 = rand();
        if ((v51 & 1) != 0)
          v52 = 2;
        else
          v52 = 1;
        if ((v51 & 1) != 0)
          v53 = v50;
        else
          v53 = v49;
      }
      else
      {
        v52 = 1;
        v53 = v49;
      }
      v54 = v53;
    }
    *v41 = v54;
    v41[v52] = v47;
    goto LABEL_75;
  }
LABEL_77:

  return v39;
}

- (BOOL)checkAndPrintResults:(BOOL)a3
{
  return -[PXMagazineGrid isPerfectEnding](self->_tileGrid, "isPerfectEnding", a3);
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
  objc_storeStrong((id *)&self->_tileGrid, 0);
}

uint64_t __92__PXMagazineLayoutTileMaker__availableFrames_maxReturnCount_forAspectRatio_weight_maxWidth___block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (v13 >= 0.005)
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

uint64_t __49__PXMagazineLayoutTileMaker__getAllFramesInOrder__block_invoke(uint64_t a1, void *a2, void *a3)
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
