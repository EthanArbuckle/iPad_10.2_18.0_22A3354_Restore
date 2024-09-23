@implementation PXExploreLayoutGenerator

- (CGRect)presentedRectForItemAtIndex:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _OWORD v7[9];
  uint64_t v8;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && self->_isPrepared)
  {
    v8 = 0;
    memset(v7, 0, sizeof(v7));
    -[PXExploreLayoutGenerator getGeometries:inRange:withKind:](self, "getGeometries:inRange:withKind:", v7, a3, 1, 0);
    PXRectWithCenterAndSize();
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v11;
  NSUInteger v14;
  _PXLayoutGeometry *v15;
  __int128 v16;
  __int128 v17;
  CGFloat height;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  void *v24;
  void *v25;
  NSRange v26;

  length = a4.length;
  location = a4.location;
  v11 = -[PXExploreLayoutGenerator itemCount](self, "itemCount");
  if (location >= v11 && length != 0 || location + length > v11)
  {
    v23 = v11;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26.location = location;
    v26.length = length;
    NSStringFromRange(v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 237, CFSTR("range %@ out of bounds (0..<%li)"), v25, v23);

  }
  -[PXExploreLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  if (length)
  {
    v14 = location;
    do
    {
      v15 = &self->_outputGeometries[v14];
      v17 = *(_OWORD *)&v15->var6.origin.y;
      v16 = *(_OWORD *)&v15->var6.size.height;
      height = v15->var7.height;
      *(_OWORD *)&a3->var5 = *(_OWORD *)&v15->var5;
      v19 = *(_OWORD *)&v15->var1.y;
      *(_OWORD *)&a3->var0 = *(_OWORD *)&v15->var0;
      *(_OWORD *)&a3->var1.y = v19;
      v20 = *(_OWORD *)&v15->var2.height;
      v21 = *(_OWORD *)&v15->var3.b;
      v22 = *(_OWORD *)&v15->var3.ty;
      *(_OWORD *)&a3->var3.d = *(_OWORD *)&v15->var3.d;
      *(_OWORD *)&a3->var3.ty = v22;
      *(_OWORD *)&a3->var2.height = v20;
      *(_OWORD *)&a3->var3.b = v21;
      a3->var7.height = height;
      *(_OWORD *)&a3->var6.origin.y = v17;
      *(_OWORD *)&a3->var6.size.height = v16;
      a3->var5 = a5;
      ++a3;
      ++v14;
      --length;
    }
    while (length);
  }
}

- (void)_prepareIfNeeded
{
  int64_t v4;
  int64_t capacity;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(uint8_t *__return_ptr, void *, int64_t);
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *inputItemInfos;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v24;
  __int128 v25;
  __int128 v26;
  int64_t v27;
  uint64_t v28;
  double *v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  double v33;
  CGFloat v34;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGSize v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD aBlock[4];
  id v46;
  uint64_t v47;
  uint8_t buf[16];
  __int128 v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (!self->_isPrepared)
  {
    self->_isPrepared = 1;
    v4 = -[PXExploreLayoutGenerator itemCount](self, "itemCount");
    self->_count = v4;
    if (v4)
    {
      capacity = self->_capacity;
      if (v4 > capacity)
      {
        if (capacity)
        {
          do
          {
            capacity *= 2;
            self->_capacity = capacity;
          }
          while (capacity < self->_count);
        }
        else
        {
          self->_capacity = v4;
        }
        _PXGArrayResize();
        _PXGArrayResize();
        _PXGArrayResize();
        _PXGArrayResize();
      }
      -[PXExploreLayoutGenerator metrics](self, "metrics");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "buildingBlockAspectRatio");
      v8 = v7;
      -[PXExploreLayoutGenerator itemLayoutInfoBlock](self, "itemLayoutInfoBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __44__PXExploreLayoutGenerator__prepareIfNeeded__block_invoke;
      aBlock[3] = &unk_1E5127100;
      v44 = v9;
      v46 = v44;
      v47 = v8;
      v10 = (void (**)(uint8_t *__return_ptr, void *, int64_t))_Block_copy(aBlock);
      v11 = -[PXExploreLayoutGenerator keyItemIndex](self, "keyItemIndex");
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (self->_count >= 1)
        {
          v12 = 0;
          v13 = 0;
          do
          {
            v14 = &self->_inputItemInfos[v12];
            v10[2](buf, v10, v13);
            v15 = *(_OWORD *)buf;
            v16 = v49;
            v14->var4 = v50;
            *(_OWORD *)&v14->var0 = v15;
            *(_OWORD *)&v14->var2 = v16;
            ++v13;
            ++v12;
          }
          while (v13 < self->_count);
        }
      }
      else
      {
        v17 = v11;
        inputItemInfos = self->_inputItemInfos;
        v10[2](buf, v10, v11);
        v19 = *(_OWORD *)buf;
        v20 = v49;
        inputItemInfos->var4 = v50;
        *(_OWORD *)&inputItemInfos->var0 = v19;
        *(_OWORD *)&inputItemInfos->var2 = v20;
        if (v17 >= 1)
        {
          v21 = 0;
          v22 = 1;
          do
          {
            v23 = v21 + 1;
            v24 = &self->_inputItemInfos[v22];
            ((void (*)(uint8_t *__return_ptr, void (**)(uint8_t *__return_ptr, void *, int64_t)))v10[2])(buf, v10);
            v25 = *(_OWORD *)buf;
            v26 = v49;
            v24->var4 = v50;
            *(_OWORD *)&v24->var0 = v25;
            *(_OWORD *)&v24->var2 = v26;
            ++v22;
            v21 = v23;
          }
          while (v17 != v23);
        }
        v27 = v17 + 1;
        if (v17 + 1 < self->_count)
        {
          v28 = 40 * v17 + 40;
          do
          {
            v29 = (double *)((char *)&self->_inputItemInfos->var0 + v28);
            v10[2](buf, v10, v27);
            v30 = *(_OWORD *)buf;
            v31 = v49;
            v29[4] = v50;
            *(_OWORD *)v29 = v30;
            *((_OWORD *)v29 + 1) = v31;
            ++v27;
            v28 += 40;
          }
          while (v27 < self->_count);
        }
      }
      -[PXExploreLayoutGenerator metrics](self, "metrics");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "padding");
      v34 = v33;
      -[PXExploreLayoutGenerator metrics](self, "metrics");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "padding");
      self->_origin.x = v34;
      self->_origin.y = v36;

      self->_row = 0;
      self->_localNumberOfColumns = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v6, "interitemSpacing");
      self->_intercellSpacing.width = v37;
      self->_intercellSpacing.height = v37;
      objc_msgSend(v6, "referenceSize");
      self->_contentSize.width = v38;
      self->_contentSize.height = 0.0;
      *(_QWORD *)&self->_cornerSpriteIndexes.topLeft = -1;
      *(_QWORD *)&self->_cornerSpriteIndexes.bottomLeft = -1;
      v39 = *(CGSize *)off_1E50B8810;
      self->_headerItemSize = *(CGSize *)off_1E50B8810;
      self->_minHeroItemsSize = v39;
      self->_minimumItemSize = v39;
      self->_buildingBlockSize = v39;
      -[PXExploreLayoutGenerator localState](self, "localState");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "prepareWithMetrics:", v6);

      switch(objc_msgSend(v6, "layoutType"))
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 357, CFSTR("Code which should be unreachable has been reached"));

          abort();
        case 1:
          -[PXExploreLayoutGenerator parsePhonePortraitLayout](self, "parsePhonePortraitLayout");
          break;
        case 2:
          -[PXExploreLayoutGenerator parsePhoneLandscapeLayout](self, "parsePhoneLandscapeLayout");
          break;
        case 3:
          -[PXExploreLayoutGenerator parsePadPortraitLayout](self, "parsePadPortraitLayout");
          break;
        case 4:
          -[PXExploreLayoutGenerator parsePadLandscapeLayout](self, "parsePadLandscapeLayout");
          break;
        case 5:
          -[PXExploreLayoutGenerator parseMacLayout](self, "parseMacLayout");
          break;
        default:
          break;
      }
      if (-[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems"))
      {
        PXAssertGetLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          -[PXExploreLayoutGenerator diagnosticDescription](self, "diagnosticDescription");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v42;
          _os_log_error_impl(&dword_1A6789000, v41, OS_LOG_TYPE_ERROR, "couldn't parse all items %@", buf, 0xCu);

        }
        while (-[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 1, -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems")));
      }

    }
  }
}

- (int64_t)presentedNumberOfColumnsAtRow:(int64_t)a3
{
  void *v7;
  void *v8;

  if (!self->_isPrepared)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 907, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row >= 0"));

  }
  if (self->_rowCount <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 908, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row < _rowCount"));

  }
  return self->_outputNumberOfColumnsAtRow[a3];
}

- ($340E233F617FB3D5D9EFCE5A6F22D754)presentedItemLocationForItemAtIndex:(SEL)a3
{
  $340E233F617FB3D5D9EFCE5A6F22D754 *v7;
  _OWORD *v8;
  __int128 v9;
  void *v10;
  void *v11;

  *retstr = *($340E233F617FB3D5D9EFCE5A6F22D754 *)PXLayoutItemLocationNull;
  if (LOBYTE(self[3].var2))
  {
    v7 = self;
    if (a4 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a3, v7, CFSTR("PXExploreLayoutGenerator.m"), 927, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0"));

    }
    if (v7[1].var2 <= a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a3, v7, CFSTR("PXExploreLayoutGenerator.m"), 928, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < _capacity"));

    }
    v8 = (_OWORD *)(v7[2].var2 + 32 * a4);
    v9 = v8[1];
    *(_OWORD *)&retstr->var0 = *v8;
    *(_OWORD *)&retstr->var2 = v9;
  }
  return self;
}

void __44__PXExploreLayoutGenerator__prepareIfNeeded__block_invoke(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void (**v10)(void *, uint64_t, uint64_t);
  uint64_t v11;
  _QWORD aBlock[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(double *)(a1 + 40);
  if (v8 == 0.0)
  {
    objc_msgSend(v6, "size");
    PXSizeGetAspectRatio();
    v8 = v9;
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__PXExploreLayoutGenerator__prepareIfNeeded__block_invoke_2;
  aBlock[3] = &unk_1E51270D8;
  aBlock[4] = &v13;
  v10 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  v10[2](v10, 1, 1);
  v10[2](v10, 2, v8 >= 2.0);
  v10[2](v10, 4, v8 < 0.99009901);
  v10[2](v10, 8, v8 > 1.01);
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = v14[3];
  objc_msgSend(v7, "weight");
  *(_QWORD *)(a3 + 24) = v11;
  *(double *)(a3 + 32) = v8;

  _Block_object_dispose(&v13, 8);
}

uint64_t __44__PXExploreLayoutGenerator__prepareIfNeeded__block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = a2 << 16;
  if (a3)
    v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) |= v3;
  return result;
}

- (int64_t)presentedNumberOfRows
{
  if (self->_isPrepared)
    return self->_row;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)parsePhonePortraitLayout
{
  return -[PXExploreLayoutGenerator _parseThreeColumnLayoutWithOptions:](self, "_parseThreeColumnLayoutWithOptions:", 1);
}

- (_PXCornerSpriteIndexes)cornerSpriteIndexes
{
  uint64_t v3;
  uint64_t v4;
  _PXCornerSpriteIndexes result;

  -[PXExploreLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  v3 = *(_QWORD *)&self->_cornerSpriteIndexes.topLeft;
  v4 = *(_QWORD *)&self->_cornerSpriteIndexes.bottomLeft;
  result.bottomLeft = v4;
  result.bottomRight = HIDWORD(v4);
  result.topLeft = v3;
  result.topRight = HIDWORD(v3);
  return result;
}

- (CGSize)minimumItemSize
{
  double width;
  double height;
  CGSize result;

  -[PXExploreLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  width = self->_minimumItemSize.width;
  height = self->_minimumItemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBuildingBlockColumnSpan:(int64_t)a3 rowSpan:(int64_t)a4 withNumberOfColumns:(int64_t)a5
{
  double v8;
  double v9;
  CGFloat v10;

  -[PXExploreLayoutGenerator _cellSizeForNumberOfColumns:](self, "_cellSizeForNumberOfColumns:", a5);
  v10 = -(self->_intercellSpacing.height - (double)a4 * (v9 + self->_intercellSpacing.height));
  self->_buildingBlockSize.width = -(self->_intercellSpacing.width - (double)a3 * (v8 + self->_intercellSpacing.width));
  self->_buildingBlockSize.height = v10;
}

- (double)_buildingBlockAspectRatioForNumberOfColumns:(int64_t)a3 options:(unint64_t)a4
{
  char v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = a4;
  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildingBlockAspectRatio");
  if (v7 > 0.0)
  {
    objc_msgSend(v6, "buildingBlockAspectRatio");
LABEL_10:
    v9 = v8;
    goto LABEL_11;
  }
  v9 = 1.0;
  if ((v4 & 1) == 0)
  {
    if ((v4 & 4) != 0)
    {
      v8 = PXExploreLayoutCellPreferredAspectRatio(objc_msgSend(v6, "layoutType"), objc_msgSend(v6, "layoutSubtype"));
      goto LABEL_10;
    }
    objc_msgSend(v6, "referenceSize");
    v11 = v10;
    v13 = v12;
    if ((v4 & 2) == 0)
    {
      objc_msgSend(v6, "safeAreaInsets");
      v15 = v14;
      objc_msgSend(v6, "safeAreaInsets");
      v13 = v13 - (v15 + v16);
    }
    v17 = round(v13/ (v11/ (double)a3/ PXExploreLayoutCellPreferredAspectRatio(objc_msgSend(v6, "layoutType"), objc_msgSend(v6, "layoutSubtype"))));
    objc_msgSend(v6, "interitemSpacing");
    v9 = v11 / -(v18 - (v13 + v18) / (double)(uint64_t)v17 * (double)a3);
    if ((*(_QWORD *)&v9 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
      v9 = 1.0;
  }
LABEL_11:

  return v9;
}

- (BOOL)_parseThreeColumnLayoutWithOptions:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _BOOL4 v10;
  _BOOL4 v11;
  PXExploreLayoutGenerator *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PXExploreLayoutGenerator *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXExploreLayoutGenerator _buildingBlockAspectRatioForNumberOfColumns:options:](self, "_buildingBlockAspectRatioForNumberOfColumns:options:", 3, a3);
  objc_msgSend(v5, "setBuildingBlockAspectRatio:");
  v6 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  if (v6 <= 19)
    objc_msgSend(v5, "setEffectiveLargeHeroDensity:", 0);
  -[PXExploreLayoutGenerator setBuildingBlockColumnSpan:rowSpan:withNumberOfColumns:](self, "setBuildingBlockColumnSpan:rowSpan:withNumberOfColumns:", 1, 1, 3);
  v7 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  if (v7 < 1)
  {
    v9 = 0;
  }
  else
  {
    v8 = v7;
    v9 = 0;
    while (2)
    {
      switch(objc_msgSend(v5, "nextRowType"))
      {
        case 0:
          if (v8 != 2)
          {
            v12 = self;
            v13 = 0;
            goto LABEL_20;
          }
          v10 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 1, 2, 0);
          v11 = -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 0, 1);
          if (v10)
            goto LABEL_39;
          if (v11)
          {
            v12 = self;
            v13 = 3;
LABEL_20:
            v14 = 1;
            goto LABEL_38;
          }
          break;
        case 1:
          if (-[PXExploreLayoutGenerator parseThreeColumnGroupWithShortRowFollowedByLargeHero](self, "parseThreeColumnGroupWithShortRowFollowedByLargeHero"))
          {
            goto LABEL_40;
          }
          if (!-[PXExploreLayoutGenerator nextItems:isAny:](self, "nextItems:isAny:", 3, 2))
          {
            v16 = objc_msgSend(v5, "parseLocation");
            switch(v8)
            {
              case 1:
                goto LABEL_52;
              case 2:
                if (v6 == 3)
                {
                  v18 = self;
                  v19 = 2;
                  v20 = 2;
                }
                else
                {
                  v8 = 2;
LABEL_52:
                  v18 = self;
                  v19 = 1;
                  v20 = v8;
                }
                -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](v18, "parseThreeColumnRowWithType:numberOfItems:", v19, v20);
LABEL_54:
                if (objc_msgSend(v5, "parseLocation") <= v16)
                  goto LABEL_58;
                goto LABEL_40;
              case 3:
                goto LABEL_51;
              case 4:
              case 7:
              case 10:
                if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 0x20000, 2, 0))
                {
                  goto LABEL_51;
                }
                -[PXExploreLayoutGenerator parseThreeColumnGroupWithThreeItemsFollowedByOneItemAllowingLargeHeroAtEnd:](self, "parseThreeColumnGroupWithThreeItemsFollowedByOneItemAllowingLargeHeroAtEnd:", (v6 & 0xFFFFFFFFFFFFFFFELL) == 4);
                goto LABEL_54;
              case 5:
                if (-[PXExploreLayoutGenerator nextItems:isAny:](self, "nextItems:isAny:", 5, 2))
                  goto LABEL_51;
                -[PXExploreLayoutGenerator parseThreeColumnGroupWithFiveItems](self, "parseThreeColumnGroupWithFiveItems");
                goto LABEL_54;
              default:
                if (!-[PXExploreLayoutGenerator nextItems:isAny:](self, "nextItems:isAny:", 6, 2))
                {
                  if (-[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows"))
                  {
                    v21 = -[PXExploreLayoutGenerator indexWithinNextItems:having:keyIndex:](self, "indexWithinNextItems:having:keyIndex:", 6, 0, 5);
                    if (v21 <= 2)
                    {
                      -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v21, 3);
                      objc_msgSend(v5, "setDidMoveBestItemOutOfPreviousShortRowIntoHeroRow:", 1);
                    }
                  }
                }
LABEL_51:
                v8 = 3;
                goto LABEL_52;
            }
          }
          LOBYTE(v11) = -[PXExploreLayoutGenerator parseThreeColumnShortRowWithPano](self, "parseThreeColumnShortRowWithPano");
          goto LABEL_39;
        case 2:
          if (-[PXExploreLayoutGenerator nextItems:isAny:](self, "nextItems:isAny:", 3, 2))
          {
            LOBYTE(v11) = -[PXExploreLayoutGenerator parseThreeColumnMediumHeroRowWithPano](self, "parseThreeColumnMediumHeroRowWithPano");
            goto LABEL_39;
          }
          if (v8 != 4)
          {
            if (v8 >= 3)
              v15 = 3;
            else
              v15 = v8;
            if ((unint64_t)(v8 - 5) <= 1)
            {
              if (-[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows"))
              {
                if ((objc_msgSend(v5, "didMoveBestItemOutOfPreviousShortRowIntoHeroRow") & 1) == 0
                  && !-[PXExploreLayoutGenerator nextItems:isAny:](self, "nextItems:isAny:", v8, 2))
                {
                  v17 = -[PXExploreLayoutGenerator indexWithinNextItems:having:keyIndex:](self, "indexWithinNextItems:having:keyIndex:", v8, 0, 0);
                  if (v17 >= 3)
                    -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v17, 2);
                }
              }
            }
            goto LABEL_37;
          }
          if (-[PXExploreLayoutGenerator nextItems:isAny:](self, "nextItems:isAny:", 4, 2))
          {
            v15 = 3;
LABEL_37:
            v12 = self;
            v13 = 2;
            v14 = v15;
            goto LABEL_38;
          }
          LOBYTE(v11) = -[PXExploreLayoutGenerator parseThreeColumnGroupWithThreeItemsFollowedByOneItemAllowingLargeHeroAtEnd:](self, "parseThreeColumnGroupWithThreeItemsFollowedByOneItemAllowingLargeHeroAtEnd:", 0);
LABEL_39:
          if (!v11)
            break;
LABEL_40:
          v8 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
          v9 = 1;
          if (v8 <= 0)
            break;
          continue;
        case 3:
          if (v8 == 2 && !-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 1, 2, 0))
          {
            v12 = self;
            v13 = 2;
            v14 = 2;
LABEL_38:
            LOBYTE(v11) = -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](v12, "parseThreeColumnRowWithType:numberOfItems:", v13, v14);
            goto LABEL_39;
          }
          if (!-[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 3, 1))goto LABEL_58;
          goto LABEL_40;
        default:
          goto LABEL_58;
      }
      break;
    }
  }
LABEL_58:

  return v9 & 1;
}

- (int64_t)numberOfRemainingItems
{
  int64_t count;
  void *v3;
  int64_t v4;

  count = self->_count;
  -[PXExploreLayoutGenerator localState](self, "localState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = count - objc_msgSend(v3, "parseLocation");

  return v4;
}

- (BOOL)parseThreeColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "parseLocation");
  switch(a3)
  {
    case 0:
      -[PXExploreLayoutGenerator _parseThreeColumnHeaderRowWithNumberOfItems:](self, "_parseThreeColumnHeaderRowWithNumberOfItems:", a4);
      break;
    case 1:
      -[PXExploreLayoutGenerator _parseThreeColumnShortRowWithNumberOfItems:](self, "_parseThreeColumnShortRowWithNumberOfItems:", a4);
      break;
    case 2:
      -[PXExploreLayoutGenerator _parseThreeColumnMediumHeroRowWithNumberOfItems:](self, "_parseThreeColumnMediumHeroRowWithNumberOfItems:", a4);
      break;
    case 3:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 3);
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0))
        v9 = 2;
      else
        v9 = 3;
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 1, 0, 0, 3, v9);
      -[PXExploreLayoutGenerator endRowWithType:](self, "endRowWithType:", 3);
      break;
    default:
      break;
  }
  v10 = objc_msgSend(v7, "parseLocation") > v8;

  return v10;
}

- (void)addLocalItemWithType:(int64_t)a3 atColumn:(int64_t)a4 row:(int64_t)a5 columnSpan:(int64_t)a6 rowSpan:(int64_t)a7
{
  void *v13;
  double v14;
  double v15;
  int64_t v16;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v17;
  int64_t var0;
  _PXLayoutGeometry *v19;
  CGFloat v20;
  CGFloat v21;
  __int128 *v22;
  __int128 v23;
  CGPoint v24;
  $340E233F617FB3D5D9EFCE5A6F22D754 *v25;
  int64_t localNumberOfRows;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  int64_t localNumberOfColumns;
  int64_t row;
  int64_t v32;
  CGFloat v33;
  CGFloat v34;
  NSObject *v35;
  CGSize *p_minHeroItemsSize;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  void *v40;
  uint8_t buf[16];

  -[PXExploreLayoutGenerator localState](self, "localState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_localNumberOfColumns == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 399, CFSTR("current row doesn't exists"));

  }
  v14 = -(self->_intercellSpacing.width - (double)a6 * (self->_cellSize.width + self->_intercellSpacing.width));
  v15 = -(self->_intercellSpacing.height - (double)a7 * (self->_cellSize.height + self->_intercellSpacing.height));
  v16 = objc_msgSend(v13, "parseLocation");
  if (v16 >= self->_count)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 410, CFSTR("out of bounds %li"), self->_count);

  }
  v17 = &self->_inputItemInfos[v16];
  var0 = v17->var0;
  v17->var1 = v16;
  PXRectGetCenter();
  v19 = &self->_outputGeometries[var0];
  v19->var0 = var0;
  v19->var1.x = v20;
  v19->var1.y = v21;
  v19->var2.width = v14;
  v19->var2.height = v15;
  v22 = (__int128 *)MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v19->var3.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v23 = *v22;
  *(_OWORD *)&v19->var3.c = v22[1];
  *(_OWORD *)&v19->var3.a = v23;
  *(_QWORD *)&v19->var4 = 0;
  v19->var5 = 0;
  v24 = *(CGPoint *)off_1E50B86D0;
  v19->var6.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
  v19->var6.origin = v24;
  v19->var7.width = v14;
  v19->var7.height = v15;
  self->_outputItemIndexToParseLocation[var0] = v16;
  v25 = &self->_outputItemLocations[var0];
  v25->var0 = self->_row + a5;
  v25->var1 = a4;
  v25->var2 = a7;
  v25->var3 = a6;
  objc_msgSend(v13, "setParseLocation:", objc_msgSend(v13, "parseLocation") + 1);
  localNumberOfRows = self->_localNumberOfRows;
  v27 = a7 + a5;
  if (localNumberOfRows <= a7 + a5)
    v28 = a7 + a5;
  else
    v28 = self->_localNumberOfRows;
  self->_localNumberOfRows = v28;
  v29 = a6 + a4;
  localNumberOfColumns = self->_localNumberOfColumns;
  row = self->_row;
  v32 = -a5;
  if (!a4 && row == v32)
    self->_cornerSpriteIndexes.topLeft = var0;
  if (v29 == localNumberOfColumns && row == v32)
    self->_cornerSpriteIndexes.topRight = var0;
  if (!a4 && v27 >= localNumberOfRows)
    self->_cornerSpriteIndexes.bottomLeft = var0;
  if (v29 == localNumberOfColumns && v27 >= localNumberOfRows)
    self->_cornerSpriteIndexes.bottomRight = var0;
  PXSizeMin();
  self->_minimumItemSize.width = v33;
  self->_minimumItemSize.height = v34;
  if (a3 == 2)
  {
    if ((PXSizeIsNull() & 1) == 0)
    {
      PXAssertGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v35, OS_LOG_TYPE_ERROR, "multiple header items", buf, 2u);
      }

    }
    self->_headerItemSize.width = v14;
    self->_headerItemSize.height = v15;
  }
  else if (a3 != 1)
  {
    goto LABEL_29;
  }
  p_minHeroItemsSize = &self->_minHeroItemsSize;
  PXSizeMin();
  p_minHeroItemsSize->width = v37;
  p_minHeroItemsSize->height = v38;
LABEL_29:

}

- (double)score:(int64_t)a3 forNextItemAtIndex:(int64_t)a4
{
  void *v8;
  int64_t v9;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v10;
  __int128 v11;
  uint64_t v12;
  double (**v13)(_QWORD);
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  __int128 v24;
  __int128 v25;
  double v26;
  _QWORD aBlock[4];
  __int128 v28;
  __int128 v29;
  double v30;
  __int128 v31;
  __int128 v32;
  double var4;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "parseLocation") + a4;

  if (v9 >= self->_count)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 802, CFSTR("score index out of bounds %li, count: %li"), v9, self->_count);

  }
  v10 = &self->_inputItemInfos[v9];
  v11 = *(_OWORD *)&v10->var2;
  v31 = *(_OWORD *)&v10->var0;
  v32 = v11;
  var4 = v10->var4;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PXExploreLayoutGenerator_score_forNextItemAtIndex___block_invoke;
  aBlock[3] = &__block_descriptor_72_e5_d8__0l;
  v30 = var4;
  v28 = v31;
  v29 = v11;
  v13 = (double (**)(_QWORD))_Block_copy(aBlock);
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __53__PXExploreLayoutGenerator_score_forNextItemAtIndex___block_invoke_2;
  v23[3] = &__block_descriptor_72_e5_d8__0l;
  v24 = v31;
  v25 = v32;
  v26 = var4;
  v14 = _Block_copy(v23);
  v15 = v14;
  switch(a3)
  {
    case 0:
      v16 = v13[2](v13);
      goto LABEL_6;
    case 1:
      v16 = (*((double (**)(void *))v14 + 2))(v14);
LABEL_6:
      v17 = v16;
      break;
    case 2:
      v17 = -(*((double (**)(void *))v14 + 2))(v14);
      break;
    case 3:
      v18 = (*((double (**)(void *))v14 + 2))(v14);
      v17 = v18 + v13[2](v13);
      break;
    case 4:
      v19 = (*((double (**)(void *))v14 + 2))(v14);
      v17 = v13[2](v13) - v19;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 826, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }

  return v17;
}

- (id)presentedItemsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  int64_t var0;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (self->_isPrepared)
  {
    PXDistanceBetweenPoints();
    v10 = v9;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    CGRectGetMaxX(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    CGRectGetMaxY(v30);
    PXDistanceBetweenPoints();
    v12 = v11;
    -[PXExploreLayoutGenerator localState](self, "localState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "parseLocation");

    if (v12 >= v10)
    {
      if (v14 >= 1)
      {
        v22 = 0;
        do
        {
          var0 = self->_inputItemInfos[v22].var0;
          PXRectWithCenterAndSize();
          v34.origin.x = v24;
          v34.origin.y = v25;
          v34.size.width = v26;
          v34.size.height = v27;
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          if (CGRectIntersectsRect(v32, v34))
            objc_msgSend(v8, "addIndex:", var0);
          ++v22;
          --v14;
        }
        while (v14);
      }
    }
    else if (v14 >= 1)
    {
      v15 = v14 + 1;
      v16 = 40 * v14 - 40;
      do
      {
        v17 = *(int64_t *)((char *)&self->_inputItemInfos->var0 + v16);
        PXRectWithCenterAndSize();
        v33.origin.x = v18;
        v33.origin.y = v19;
        v33.size.width = v20;
        v33.size.height = v21;
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        if (CGRectIntersectsRect(v31, v33))
          objc_msgSend(v8, "addIndex:", v17);
        --v15;
        v16 -= 40;
      }
      while (v15 > 1);
    }
  }
  return v8;
}

- (PXExploreParsingState)localState
{
  return self->_localState;
}

double __53__PXExploreLayoutGenerator_score_forNextItemAtIndex___block_invoke(uint64_t a1)
{
  return tanh(*(long double *)(a1 + 56));
}

- (BOOL)nextItems:(int64_t)a3 isAny:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  int64_t v9;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *inputItemInfos;
  int64_t v12;
  unint64_t *p_var2;
  unint64_t v14;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "parseLocation");

  v9 = self->_count - v8;
  if (v9 >= a3)
    v9 = a3;
  if (v9 < 1)
    return 0;
  inputItemInfos = self->_inputItemInfos;
  if ((a4 & ~inputItemInfos[v8].var2) == 0)
    return 1;
  v12 = 0;
  p_var2 = &inputItemInfos[v8 + 1].var2;
  while (v9 - 1 != v12)
  {
    v14 = *p_var2;
    p_var2 += 5;
    ++v12;
    if ((a4 & ~v14) == 0)
      return v12 < v9;
  }
  v12 = v9;
  return v12 < v9;
}

- (BOOL)parseThreeColumnGroupWithShortRowFollowedByLargeHero
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  if (!-[PXExploreLayoutGenerator _isShortRowNextFollowedByLargeHero](self, "_isShortRowNextFollowedByLargeHero"))
    return 0;
  v3 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  v4 = 7;
  if (v3 <= 6)
    v4 = 0;
  v5 = 3;
  if (v3 <= 6)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 == 8)
  {
    v4 = 6;
    v5 = 3;
  }
  v6 = v3 == 6 ? 6 : v4;
  v7 = v3 == 6 ? 3 : v5;
  if (-[PXExploreLayoutGenerator nextItems:isAny:](self, "nextItems:isAny:", v6, 2)
    || !-[PXExploreLayoutGenerator prepareNextItems:withLargeHeroIndex:](self, "prepareNextItems:withLargeHeroIndex:", v6, v7))
  {
    return 0;
  }
  v8 = 1;
  -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 1, 3);
  -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 3, 1);
  return v8;
}

- (void)_parseThreeColumnShortRowWithNumberOfItems:(int64_t)a3
{
  PXExploreLayoutGenerator *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 3);
  if (a3 == 2)
  {
    if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0))
    {
      -[PXExploreLayoutGenerator _addTwoItemsForThreeColumnRowPreferringTallVariant:](self, "_addTwoItemsForThreeColumnRowPreferringTallVariant:", 0);
      -[PXExploreLayoutGenerator localState](self, "localState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNextHeroSide:", PXFlippedExploreHeroSide(objc_msgSend(v8, "nextHeroSide")));

      goto LABEL_14;
    }
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 3, 1);
    v5 = self;
    v6 = 1;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0))
    {
      v5 = self;
      v6 = 0;
LABEL_7:
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](v5, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, v6, 3, 1);
      goto LABEL_14;
    }
  }
  else if (a3 < 1)
  {
    goto LABEL_14;
  }
  v7 = 0;
  if (a3 >= 3)
    a3 = 3;
  do
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v7++, 0, 1, 1);
  while (a3 != v7);
LABEL_14:
  -[PXExploreLayoutGenerator endRowWithType:](self, "endRowWithType:", 1);
}

- (BOOL)_isShortRowNextFollowedByLargeHero
{
  void *v3;
  BOOL v4;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nextRowType") == 1
    && -[PXExploreLayoutGenerator preferredRowTypeAfterRowWithType:](self, "preferredRowTypeAfterRowWithType:", objc_msgSend(v3, "nextRowType")) == 3;

  return v4;
}

- (void)endRowWithType:(int64_t)a3
{
  uint64_t v5;
  int64_t *outputNumberOfColumnsAtRow;
  double height;
  CGFloat v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  int64_t rowCapacity;

  if (self->_localNumberOfColumns == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 458, CFSTR("current row doesn't exists"));

  }
  self->_rowCount = self->_localNumberOfRows + self->_row;
  rowCapacity = self->_rowCapacity;
  _PXGArrayCapacityResizeToCount();
  self->_rowCapacity = rowCapacity;
  if (self->_localNumberOfRows >= 1)
  {
    v5 = 0;
    outputNumberOfColumnsAtRow = self->_outputNumberOfColumnsAtRow;
    do
    {
      outputNumberOfColumnsAtRow[v5 + self->_row] = self->_localNumberOfColumns;
      ++v5;
    }
    while (v5 < self->_localNumberOfRows);
  }
  self->_row = self->_rowCount;
  height = self->_intercellSpacing.height;
  v8 = self->_origin.y + (double)self->_localNumberOfRows * (self->_cellSize.height + height);
  self->_origin.y = v8;
  v9 = v8 - height;
  if (self->_contentSize.height >= v9)
    v9 = self->_contentSize.height;
  self->_contentSize.height = v9;
  self->_localNumberOfColumns = 0x7FFFFFFFFFFFFFFFLL;
  -[PXExploreLayoutGenerator localState](self, "localState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNextRowType:", -[PXExploreLayoutGenerator preferredRowTypeAfterRowWithType:](self, "preferredRowTypeAfterRowWithType:", a3));
  if (objc_msgSend(v10, "nextRowType") == 3)
    objc_msgSend(v10, "setNextRowType:", 2);
  switch(a3)
  {
    case 3:
      v11 = v10;
      v12 = 0;
LABEL_16:
      objc_msgSend(v11, "setNumberOfConsecutiveMediumHeroRows:", v12);
      objc_msgSend(v10, "setDidMoveBestItemOutOfPreviousShortRowIntoHeroRow:", 0);
      break;
    case 2:
      objc_msgSend(v10, "setNextHeroSide:", PXFlippedExploreHeroSide(objc_msgSend(v10, "nextHeroSide")));
      v12 = objc_msgSend(v10, "numberOfConsecutiveMediumHeroRows") + 1;
      v11 = v10;
      goto LABEL_16;
    case 1:
      objc_msgSend(v10, "setDidMoveBestItemOutOfNextShortRow:", 0);
      break;
  }

}

- (int64_t)preferredRowTypeAfterRowWithType:(int64_t)a3
{
  int64_t v3;
  void *v4;
  uint64_t v5;

  switch(a3)
  {
    case 0:
    case 2:
    case 3:
      return 1;
    case 1:
      -[PXExploreLayoutGenerator localState](self, "localState");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "effectiveLargeHeroDensity");
      if (v5 == 1)
      {
        if (objc_msgSend(v4, "numberOfConsecutiveMediumHeroRows") >= 3)
          goto LABEL_12;
      }
      else
      {
        if (v5 != 3)
        {
          if (v5 != 2 || objc_msgSend(v4, "numberOfConsecutiveMediumHeroRows") <= 1)
            goto LABEL_7;
LABEL_12:
          v3 = 3;
          goto LABEL_13;
        }
        if (objc_msgSend(v4, "numberOfConsecutiveMediumHeroRows") > 0)
          goto LABEL_12;
      }
LABEL_7:
      v3 = 2;
LABEL_13:

      return v3;
    default:
      return 0;
  }
}

- (void)sortNextItems:(int64_t)a3 withItemAtIndex:(int64_t)a4 having:(int64_t)a5
{
  int64_t v9;
  void *v11;

  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 716, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

  }
  v9 = -[PXExploreLayoutGenerator indexWithinNextItems:having:keyIndex:](self, "indexWithinNextItems:having:keyIndex:", a3, a5, a4);
  if (v9 != a4 && v9 != 0x7FFFFFFFFFFFFFFFLL)
    -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v9, a4);
}

- (int64_t)indexWithinNextItems:(int64_t)a3 having:(int64_t)a4 keyIndex:(int64_t)a5
{
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  double v11;
  int64_t v12;
  double v13;
  uint64_t v14;
  BOOL v15;

  if (a3 < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = 0;
  v9 = -a5;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = -1.79769313e308;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    -[PXExploreLayoutGenerator score:forNextItemAtIndex:](self, "score:forNextItemAtIndex:", a4, v8);
    v14 = v9 + v8;
    if (v9 + v8 < 0)
      v14 = -v14;
    if (v13 > v11 || (v13 == v11 ? (v15 = v14 < v10) : (v15 = 0), v15))
    {
      v12 = v8;
      v10 = v14;
      v11 = v13;
    }
    ++v8;
  }
  while (a3 != v8);
  return v12;
}

- (BOOL)nextInputItems:(unint64_t)a3
{
  void *v5;
  uint64_t (**v6)(_QWORD);
  uint64_t (**v7)(_QWORD);
  uint64_t *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t *v12;
  _QWORD aBlock[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v21 = objc_msgSend(v5, "parseLocation");
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PXExploreLayoutGenerator_nextInputItems___block_invoke;
  aBlock[3] = &unk_1E5127128;
  aBlock[4] = self;
  aBlock[5] = &v18;
  aBlock[6] = &v14;
  v6 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  v7 = v6;
  if (a3 && ((unsigned int (*)(uint64_t (**)(_QWORD), unint64_t))v6[2])(v6, a3))
  {
    v12 = &v22;
    do
      v8 = v12++;
    while (*v8 && (v7[2](v7) & 1) != 0);
  }
  v9 = v19[3];
  v10 = v9 > objc_msgSend(v5, "parseLocation", v12) && *((_BYTE *)v15 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

uint64_t __43__PXExploreLayoutGenerator_nextInputItems___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[4];
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(_QWORD *)(v2 + 40);
  if ((a2 & 0x10000) == 0)
  {
    if (v4 >= v5 || (a2 & ~*(_QWORD *)(*(_QWORD *)(v2 + 56) + 40 * v4 + 16)) != 0)
      goto LABEL_4;
LABEL_6:
    *(_QWORD *)(v3 + 24) = v4 + 1;
    return 1;
  }
  if (v4 >= v5)
    goto LABEL_6;
LABEL_4:
  v6 = 0;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  return v6;
}

- (BOOL)canReorderItemsAcrossRows
{
  void *v2;
  uint64_t v3;

  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "reorderingTolerance");

  return v3 == 0;
}

- (BOOL)parseThreeColumnGroupWithThreeItemsFollowedByOneItemAllowingLargeHeroAtEnd:(BOOL)a3
{
  uint64_t v5;
  _BOOL4 v6;
  PXExploreLayoutGenerator *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  if (v5 >= 4)
  {
    v6 = -[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows");
    if (v5 != 4 || a3)
    {
      if (v6)
      {
        if ((unint64_t)v5 < 7
          || (v10 = 7, -[PXExploreLayoutGenerator nextItems:isAny:](self, "nextItems:isAny:", 7, 2)))
        {
          v10 = 4;
        }
        -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", v10, 3, 0);
      }
      -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 1, 3);
      v7 = self;
      v8 = 3;
      v9 = 1;
    }
    else
    {
      if (v6)
        -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 4, 0, 0);
      -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 3, 1);
      v7 = self;
      v8 = 1;
      v9 = 3;
    }
    -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](v7, "parseThreeColumnRowWithType:numberOfItems:", v8, v9);
  }
  return v5 > 3;
}

- (void)_parseThreeColumnMediumHeroRowWithNumberOfItems:(int64_t)a3
{
  uint64_t v5;
  PXExploreLayoutGenerator *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (a3 <= 1)
  {
    -[PXExploreLayoutGenerator _parseThreeColumnShortRowWithNumberOfItems:](self, "_parseThreeColumnShortRowWithNumberOfItems:", a3);
    return;
  }
  -[PXExploreLayoutGenerator localState](self, "localState");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v12, "nextHeroSide");
  -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 3);
  if (a3 == 2)
  {
    if (-[PXExploreLayoutGenerator nextItems:areAll:](self, "nextItems:areAll:", 2, 2))
    {
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 3, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 1, 3, 1);
      objc_msgSend(v12, "setNextHeroSide:", PXFlippedExploreHeroSide(v5));
    }
    else
    {
      -[PXExploreLayoutGenerator _addTwoItemsForThreeColumnRowPreferringTallVariant:](self, "_addTwoItemsForThreeColumnRowPreferringTallVariant:", 1);
    }
    goto LABEL_12;
  }
  if (v5 == 1)
  {
    -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 3, 2, 0);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 1, 1);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 1, 1, 1);
    v6 = self;
    v7 = 1;
    v8 = 1;
    v9 = 0;
    v10 = 2;
    v11 = 2;
    goto LABEL_11;
  }
  if (!v5)
  {
    -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 3, 0, 0);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 1, 0, 0, 2, 2);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 0, 1, 1);
    v6 = self;
    v7 = 0;
    v8 = 2;
    v9 = 1;
    v10 = 1;
    v11 = 1;
LABEL_11:
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](v6, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", v7, v8, v9, v10, v11);
  }
LABEL_12:
  -[PXExploreLayoutGenerator endRowWithType:](self, "endRowWithType:", 2);

}

- (void)_parseThreeColumnHeaderRowWithNumberOfItems:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  _BOOL4 v9;
  PXExploreLayoutGenerator *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 3);
  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredFullWidthHeaderAspectRatio");
  v7 = v6;

  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "allowSpecialPanoHeaders"))
  {

    goto LABEL_6;
  }
  v9 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0);

  if (!v9)
  {
LABEL_6:
    if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      -[PXExploreLayoutGenerator addFullWidthItemWithType:atRow:aspectRatio:](self, "addFullWidthItemWithType:atRow:aspectRatio:", 2, 0, v7);
      -[PXExploreLayoutGenerator endFullWidthRowWithType:aspectRatio:](self, "endFullWidthRowWithType:aspectRatio:", 0, v7);
      return;
    }
    v10 = self;
    v11 = 2;
    if (a3 != 2)
    {
      v12 = 0;
      v13 = 3;
      v14 = 3;
      goto LABEL_13;
    }
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 2, 0, 0, 2, 2);
    v10 = self;
    v11 = 0;
    v12 = 2;
    v13 = 1;
LABEL_12:
    v14 = 2;
    goto LABEL_13;
  }
  v10 = self;
  if (a3 != 2)
  {
    v11 = 2;
    v12 = 0;
    v13 = 3;
    goto LABEL_12;
  }
  -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 2, 1);
  v10 = self;
  v11 = 0;
  v12 = 2;
  v13 = 1;
  v14 = 1;
LABEL_13:
  -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](v10, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", v11, v12, 0, v13, v14);
  -[PXExploreLayoutGenerator endRowWithType:](self, "endRowWithType:", 0);
}

- (void)beginRowWithNumberOfColumns:(int64_t)a3
{
  CGFloat v5;
  CGFloat v6;
  void *v8;

  if (self->_localNumberOfColumns != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 381, CFSTR("current row already exists"));

  }
  self->_localNumberOfColumns = a3;
  self->_localNumberOfRows = 0;
  -[PXExploreLayoutGenerator _cellSizeForNumberOfColumns:](self, "_cellSizeForNumberOfColumns:", a3);
  self->_cellSize.width = v5;
  self->_cellSize.height = v6;
}

- (CGSize)_cellSizeForNumberOfColumns:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "referenceSize");
  v7 = v6;

  v8 = (double)a3;
  v9 = (v7 + self->_intercellSpacing.width) / (double)a3 - self->_intercellSpacing.width;
  -[PXExploreLayoutGenerator localState](self, "localState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buildingBlockAspectRatio");
  v12 = (v7 / v11 + self->_intercellSpacing.height) / v8 - self->_intercellSpacing.height;

  v13 = v9;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXExploreLayoutGenerator;
  -[PXExploreLayoutGenerator invalidate](&v3, sel_invalidate);
  self->_isPrepared = 0;
}

- (PXExploreLayoutGenerator)initWithMetrics:(id)a3
{
  PXExploreLayoutGenerator *v3;
  PXExploreParsingState *v4;
  PXExploreParsingState *localState;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXExploreLayoutGenerator;
  v3 = -[PXExploreLayoutGenerator initWithMetrics:](&v7, sel_initWithMetrics_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(PXExploreParsingState);
    localState = v3->_localState;
    v3->_localState = v4;

  }
  return v3;
}

- (CGSize)minHeroItemsSize
{
  double width;
  double height;
  CGSize result;

  -[PXExploreLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  width = self->_minHeroItemsSize.width;
  height = self->_minHeroItemsSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)headerItemSize
{
  double width;
  double height;
  CGSize result;

  -[PXExploreLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  width = self->_headerItemSize.width;
  height = self->_headerItemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  -[PXExploreLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)estimatedSizeForPhonePortrait
{
  double v2;
  double v3;
  CGSize result;

  -[PXExploreLayoutGenerator _estimatedSizeForThreeColumnLayoutWithOptions:](self, "_estimatedSizeForThreeColumnLayoutWithOptions:", 1);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)estimatedSizeForPhoneLandscape
{
  double v2;
  double v3;
  CGSize result;

  -[PXExploreLayoutGenerator _estimatedSizeForSixColumnLayoutWithOptions:](self, "_estimatedSizeForSixColumnLayoutWithOptions:", 2);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)estimatedSizeForPadPortrait
{
  double v2;
  double v3;
  CGSize result;

  -[PXExploreLayoutGenerator _estimatedSizeForFourColumnLayoutWithOptions:](self, "_estimatedSizeForFourColumnLayoutWithOptions:", 2);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)estimatedSizeForPadLandscape
{
  double v2;
  double v3;
  CGSize result;

  -[PXExploreLayoutGenerator _estimatedSizeForSixColumnLayoutWithOptions:](self, "_estimatedSizeForSixColumnLayoutWithOptions:", 2);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_estimatedSizeForThreeColumnLayoutWithOptions:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXExploreLayoutGenerator _estimatedSizeForColumns:headerRows:averageItemsPerBlock:averageRowsPerBlock:withOptions:](self, "_estimatedSizeForColumns:headerRows:averageItemsPerBlock:averageRowsPerBlock:withOptions:", 3, 3, a3, 3.0, 1.5);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_estimatedSizeForFourColumnLayoutWithOptions:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXExploreLayoutGenerator _estimatedSizeForColumns:headerRows:averageItemsPerBlock:averageRowsPerBlock:withOptions:](self, "_estimatedSizeForColumns:headerRows:averageItemsPerBlock:averageRowsPerBlock:withOptions:", 4, 3, a3, 4.0, 2.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_estimatedSizeForSixColumnLayoutWithOptions:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXExploreLayoutGenerator _estimatedSizeForColumns:headerRows:averageItemsPerBlock:averageRowsPerBlock:withOptions:](self, "_estimatedSizeForColumns:headerRows:averageItemsPerBlock:averageRowsPerBlock:withOptions:", 6, 3, a3, 9.0, 4.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_estimatedSizeForSevenColumnLayoutWithOptions:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXExploreLayoutGenerator _estimatedSizeForColumns:headerRows:averageItemsPerBlock:averageRowsPerBlock:withOptions:](self, "_estimatedSizeForColumns:headerRows:averageItemsPerBlock:averageRowsPerBlock:withOptions:", 7, 3, a3, 12.0, 4.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_estimatedSizeForColumns:(int64_t)a3 headerRows:(int64_t)a4 averageItemsPerBlock:(double)a5 averageRowsPerBlock:(double)a6 withOptions:(unint64_t)a7
{
  char v7;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  CGSize result;

  v7 = a7;
  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "referenceSize");
  v15 = v14;

  v16 = -[PXExploreLayoutGenerator itemCount](self, "itemCount");
  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "buildingBlockAspectRatio");
  if (v18 <= 0.0)
  {
    v20 = 1.0;
    if ((v7 & 1) == 0)
    {
      -[PXExploreLayoutGenerator metrics](self, "metrics");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "layoutType");
      -[PXExploreLayoutGenerator metrics](self, "metrics");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = PXExploreLayoutCellPreferredAspectRatio(v22, objc_msgSend(v23, "layoutSubtype"));

    }
  }
  else
  {
    objc_msgSend(v17, "buildingBlockAspectRatio");
    v20 = v19;
  }

  v24 = v15;
  v25 = v15 / (double)a3 / v20 * ((double)a4 + (double)((a3 + v16 - 2) / a3) / a5 * a6);
  result.height = v25;
  result.width = v24;
  return result;
}

- (BOOL)parsePhoneLandscapeLayout
{
  void *v3;
  uint64_t v4;

  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutSubtype");

  if (v4 == 3)
    return -[PXExploreLayoutGenerator _parseSevenColumnLayoutWithOptions:](self, "_parseSevenColumnLayoutWithOptions:", 2);
  else
    return -[PXExploreLayoutGenerator _parseSixColumnLayoutWithOptions:](self, "_parseSixColumnLayoutWithOptions:", 2);
}

- (BOOL)parsePadPortraitLayout
{
  return -[PXExploreLayoutGenerator _parseFourColumnLayoutWithOptions:](self, "_parseFourColumnLayoutWithOptions:", 2);
}

- (BOOL)parsePadLandscapeLayout
{
  void *v3;
  uint64_t v4;

  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutSubtype");

  if (v4 == 3)
    return -[PXExploreLayoutGenerator _parseSevenColumnLayoutWithOptions:](self, "_parseSevenColumnLayoutWithOptions:", 2);
  else
    return -[PXExploreLayoutGenerator _parseSixColumnLayoutWithOptions:](self, "_parseSixColumnLayoutWithOptions:", 2);
}

- (BOOL)parseMacLayout
{
  void *v3;
  uint64_t v4;

  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutSubtype");

  if (v4 == 3)
    return -[PXExploreLayoutGenerator _parseSevenColumnLayoutWithOptions:](self, "_parseSevenColumnLayoutWithOptions:", 4);
  else
    return -[PXExploreLayoutGenerator _parseSixColumnLayoutWithOptions:](self, "_parseSixColumnLayoutWithOptions:", 4);
}

- (BOOL)_parseFourColumnLayoutWithOptions:(unint64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  PXExploreLayoutGenerator *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  PXExploreLayoutGenerator *v18;
  uint64_t v19;
  int64_t v20;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXExploreLayoutGenerator _buildingBlockAspectRatioForNumberOfColumns:options:](self, "_buildingBlockAspectRatioForNumberOfColumns:options:", 4, a3);
  objc_msgSend(v5, "setBuildingBlockAspectRatio:");
  v6 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowHeaders");

  v9 = v6 + (v8 ^ 1u);
  if (v9 <= 24)
    objc_msgSend(v5, "setEffectiveLargeHeroDensity:", 0);
  if ((unint64_t)v9 > 0xE || ((1 << v9) & 0x449C) == 0)
  {
    v11 = self;
    v12 = 1;
    v13 = 1;
    v14 = 4;
  }
  else
  {
    objc_msgSend(v5, "setNumberOfColumnsOverride:", 3);
    v11 = self;
    v12 = 4;
    v13 = 3;
    v14 = 12;
  }
  -[PXExploreLayoutGenerator setBuildingBlockColumnSpan:rowSpan:withNumberOfColumns:](v11, "setBuildingBlockColumnSpan:rowSpan:withNumberOfColumns:", v12, v13, v14);
  v15 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  if (v15 >= 1)
  {
    v16 = v15;
    v17 = 0;
    while (2)
    {
      switch(objc_msgSend(v5, "nextRowType"))
      {
        case 0:
          v18 = self;
          v19 = 0;
          if ((unint64_t)v16 > 3)
            v20 = 1;
          else
            v20 = v16;
          goto LABEL_29;
        case 1:
          if (-[PXExploreLayoutGenerator parseFourColumnGroupWithShortRowFollowedByLargeHero](self, "parseFourColumnGroupWithShortRowFollowedByLargeHero"))
          {
            goto LABEL_30;
          }
          if ((unint64_t)v16 <= 0xD
            && ((1 << v16) & 0x2240) != 0
            && objc_msgSend(v5, "numberOfColumnsOverride") == 3)
          {
            v18 = self;
            v19 = 1;
LABEL_21:
            v20 = 3;
          }
          else
          {
            if (v16 >= 4)
              v20 = 4;
            else
              v20 = v16;
            v18 = self;
            v19 = 1;
          }
LABEL_29:
          if (!-[PXExploreLayoutGenerator parseFourColumnRowWithType:numberOfItems:](v18, "parseFourColumnRowWithType:numberOfItems:", v19, v20))goto LABEL_35;
LABEL_30:
          v16 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
          v17 = 1;
          if (v16 <= 0)
            goto LABEL_35;
          continue;
        case 2:
          v20 = -[PXExploreLayoutGenerator numberOfItemsInFourColumnMediumHeroRowForNumberOfRemainingItems:](self, "numberOfItemsInFourColumnMediumHeroRowForNumberOfRemainingItems:", v16);
          v18 = self;
          v19 = 2;
          goto LABEL_29;
        case 3:
          switch(v16)
          {
            case 2:
              v18 = self;
              v19 = 2;
              v20 = 2;
              goto LABEL_29;
            case 3:
            case 6:
            case 7:
              v18 = self;
              v19 = 2;
              goto LABEL_21;
            case 4:
              v18 = self;
              v19 = 2;
              v20 = 4;
              goto LABEL_29;
            default:
              if (-[PXExploreLayoutGenerator parseFourColumnRowWithType:numberOfItems:](self, "parseFourColumnRowWithType:numberOfItems:", 3, 1))
              {
                goto LABEL_30;
              }
              break;
          }
          goto LABEL_35;
        default:
          goto LABEL_35;
      }
    }
  }
  v17 = 0;
LABEL_35:

  return v17 & 1;
}

- (BOOL)_parseSixColumnLayoutWithOptions:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  PXExploreLayoutGenerator *v15;
  uint64_t v17;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXExploreLayoutGenerator _buildingBlockAspectRatioForNumberOfColumns:options:](self, "_buildingBlockAspectRatioForNumberOfColumns:options:", 6, a3);
  objc_msgSend(v5, "setBuildingBlockAspectRatio:");
  objc_msgSend(v5, "setEffectiveLargeHeroDensity:", 0);
  -[PXExploreLayoutGenerator setBuildingBlockColumnSpan:rowSpan:withNumberOfColumns:](self, "setBuildingBlockColumnSpan:rowSpan:withNumberOfColumns:", 1, 1, 6);
  v6 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      v9 = objc_msgSend(v5, "nextRowType");
      v10 = v9;
      if ((unint64_t)(v9 - 2) < 2)
      {
        v17 = 0;
        v13 = -[PXExploreLayoutGenerator numberOfItemsInSixColumnHeroRowForNumberOfRemainingItems:rowOptions:](self, "numberOfItemsInSixColumnHeroRowForNumberOfRemainingItems:rowOptions:", v7, &v17);
        if (!-[PXExploreLayoutGenerator parseSixColumnRowWithType:numberOfItems:options:](self, "parseSixColumnRowWithType:numberOfItems:options:", v10, v13, v17))goto LABEL_25;
      }
      else
      {
        if (v9 == 1)
        {
          v14 = -[PXExploreLayoutGenerator numberOfItemsInSixColumnShortRowForNumberOfRemainingItems:](self, "numberOfItemsInSixColumnShortRowForNumberOfRemainingItems:", v7);
          v15 = self;
        }
        else
        {
          if (v9)
            goto LABEL_25;
          v11 = 0;
          v12 = 3;
          switch(v7)
          {
            case 1:
            case 2:
            case 5:
              goto LABEL_17;
            case 4:
            case 7:
            case 8:
            case 11:
              v11 = 2;
              goto LABEL_16;
            case 6:
              v11 = 4;
              goto LABEL_8;
            case 10:
            case 19:
            case 23:
            case 26:
            case 28:
              v11 = 4;
LABEL_16:
              v7 = 4;
              goto LABEL_17;
            case 14:
              goto LABEL_22;
            case 17:
              v12 = 4;
LABEL_22:
              if (!-[PXExploreLayoutGenerator parseSixColumnRowWithType:numberOfItems:subsequentShortRowItems:options:](self, "parseSixColumnRowWithType:numberOfItems:subsequentShortRowItems:options:", 0, 4, v12, 2))goto LABEL_25;
              v15 = self;
              v14 = v12;
              break;
            default:
              v11 = 0;
LABEL_8:
              v7 = 3;
LABEL_17:
              if (-[PXExploreLayoutGenerator parseSixColumnRowWithType:numberOfItems:subsequentShortRowItems:options:](self, "parseSixColumnRowWithType:numberOfItems:subsequentShortRowItems:options:", 0, v7, 0, v11))
              {
                goto LABEL_18;
              }
              goto LABEL_25;
          }
        }
        if (!-[PXExploreLayoutGenerator parseSixColumnRowWithType:numberOfItems:options:](v15, "parseSixColumnRowWithType:numberOfItems:options:", 1, v14, 0))goto LABEL_25;
      }
LABEL_18:
      v7 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
      v8 = 1;
      if (v7 <= 0)
        goto LABEL_25;
    }
  }
  v8 = 0;
LABEL_25:

  return v8 & 1;
}

- (BOOL)_parseSevenColumnLayoutWithOptions:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXExploreLayoutGenerator _buildingBlockAspectRatioForNumberOfColumns:options:](self, "_buildingBlockAspectRatioForNumberOfColumns:options:", 7, a3);
  objc_msgSend(v5, "setBuildingBlockAspectRatio:");
  objc_msgSend(v5, "setEffectiveLargeHeroDensity:", 0);
  -[PXExploreLayoutGenerator setBuildingBlockColumnSpan:rowSpan:withNumberOfColumns:](self, "setBuildingBlockColumnSpan:rowSpan:withNumberOfColumns:", 1, 1, 7);
  v6 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      v9 = objc_msgSend(v5, "nextRowType");
      if (-[PXExploreLayoutGenerator canUseSingleSevenColumnHeroRowForNumberOfRemainingItems:](self, "canUseSingleSevenColumnHeroRowForNumberOfRemainingItems:", v7)&& v9 == 1)
      {
        v9 = 2;
      }
      if ((unint64_t)(v9 - 2) >= 2)
      {
        if (v9 != 1
          || !-[PXExploreLayoutGenerator parseSevenColumnRowWithType:numberOfItems:options:](self, "parseSevenColumnRowWithType:numberOfItems:options:", 1, -[PXExploreLayoutGenerator numberOfItemsInSevenColumnShortRowForNumberOfRemainingItems:](self, "numberOfItemsInSevenColumnShortRowForNumberOfRemainingItems:", v7), 0))
        {
          goto LABEL_13;
        }
      }
      else if (!-[PXExploreLayoutGenerator parseSevenColumnRowWithType:numberOfItems:options:](self, "parseSevenColumnRowWithType:numberOfItems:options:", v9, -[PXExploreLayoutGenerator numberOfItemsInSevenColumnHeroRowForNumberOfRemainingItems:](self, "numberOfItemsInSevenColumnHeroRowForNumberOfRemainingItems:", v7), 0))
      {
        goto LABEL_13;
      }
      v7 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
      v8 = 1;
      if (v7 <= 0)
        goto LABEL_13;
    }
  }
  v8 = 0;
LABEL_13:

  return v8 & 1;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_inputItemInfos);
  free(self->_outputGeometries);
  free(self->_outputItemIndexToParseLocation);
  free(self->_outputItemLocations);
  free(self->_outputNumberOfColumnsAtRow);
  v3.receiver = self;
  v3.super_class = (Class)PXExploreLayoutGenerator;
  -[PXExploreLayoutGenerator dealloc](&v3, sel_dealloc);
}

- (CGSize)estimatedSize
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  CGSize result;

  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "layoutType");

  switch(v5)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 201, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      -[PXExploreLayoutGenerator estimatedSizeForPhonePortrait](self, "estimatedSizeForPhonePortrait");
      break;
    case 2:
      -[PXExploreLayoutGenerator estimatedSizeForPhoneLandscape](self, "estimatedSizeForPhoneLandscape");
      break;
    case 3:
      -[PXExploreLayoutGenerator estimatedSizeForPadPortrait](self, "estimatedSizeForPadPortrait");
      break;
    case 4:
    case 5:
      -[PXExploreLayoutGenerator estimatedSizeForPadLandscape](self, "estimatedSizeForPadLandscape");
      break;
    default:
      v6 = *MEMORY[0x1E0C9D820];
      v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)buildingBlockSize
{
  double width;
  double height;
  CGSize result;

  -[PXExploreLayoutGenerator _prepareIfNeeded](self, "_prepareIfNeeded");
  width = self->_buildingBlockSize.width;
  height = self->_buildingBlockSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)addFullWidthItemWithType:(int64_t)a3 atRow:(int64_t)a4 aspectRatio:(double)a5
{
  void *v10;
  double width;
  double v12;
  int64_t v13;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v14;
  int64_t var0;
  _PXLayoutGeometry *v16;
  CGFloat v17;
  CGFloat v18;
  __int128 *v19;
  __int128 v20;
  CGPoint v21;
  int64_t localNumberOfColumns;
  $340E233F617FB3D5D9EFCE5A6F22D754 *v23;
  int64_t localNumberOfRows;
  int64_t v25;
  CGFloat v26;
  CGFloat v27;
  NSObject *v28;
  CGSize *p_minHeroItemsSize;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  void *v33;
  uint8_t buf[16];

  -[PXExploreLayoutGenerator localState](self, "localState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_localNumberOfColumns == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 497, CFSTR("current row doesn't exists"));

  }
  width = self->_contentSize.width;
  v12 = floor(width / a5);
  v13 = objc_msgSend(v10, "parseLocation");
  if (v13 >= self->_count)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 507, CFSTR("out of bounds %li"), self->_count);

  }
  v14 = &self->_inputItemInfos[v13];
  var0 = v14->var0;
  v14->var1 = v13;
  PXRectGetCenter();
  v16 = &self->_outputGeometries[var0];
  v16->var0 = var0;
  v16->var1.x = v17;
  v16->var1.y = v18;
  v16->var2.width = width;
  v16->var2.height = v12;
  v19 = (__int128 *)MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v16->var3.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v20 = *v19;
  *(_OWORD *)&v16->var3.c = v19[1];
  *(_OWORD *)&v16->var3.a = v20;
  *(_QWORD *)&v16->var4 = 0;
  v16->var5 = 0;
  v21 = *(CGPoint *)off_1E50B86D0;
  v16->var6.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
  v16->var6.origin = v21;
  self->_outputItemIndexToParseLocation[var0] = v13;
  v16->var7.width = width;
  v16->var7.height = v12;
  localNumberOfColumns = self->_localNumberOfColumns;
  v23 = &self->_outputItemLocations[var0];
  v23->var0 = self->_row + a4;
  *(_OWORD *)&v23->var1 = xmmword_1A7BE4B30;
  v23->var3 = localNumberOfColumns;
  objc_msgSend(v10, "setParseLocation:", objc_msgSend(v10, "parseLocation") + 1);
  localNumberOfRows = self->_localNumberOfRows;
  if (localNumberOfRows <= a4 + 3)
    v25 = a4 + 3;
  else
    v25 = self->_localNumberOfRows;
  self->_localNumberOfRows = v25;
  if (!(self->_row + a4))
  {
    self->_cornerSpriteIndexes.topLeft = var0;
    self->_cornerSpriteIndexes.topRight = var0;
  }
  if (a4 + 3 >= localNumberOfRows)
  {
    self->_cornerSpriteIndexes.bottomLeft = var0;
    self->_cornerSpriteIndexes.bottomRight = var0;
  }
  PXSizeMin();
  self->_minimumItemSize.width = v26;
  self->_minimumItemSize.height = v27;
  if (a3 == 2)
  {
    if ((PXSizeIsNull() & 1) == 0)
    {
      PXAssertGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v28, OS_LOG_TYPE_ERROR, "multiple header items", buf, 2u);
      }

    }
    self->_headerItemSize.width = width;
    self->_headerItemSize.height = v12;
  }
  else if (a3 != 1)
  {
    goto LABEL_21;
  }
  p_minHeroItemsSize = &self->_minHeroItemsSize;
  PXSizeMin();
  p_minHeroItemsSize->width = v30;
  p_minHeroItemsSize->height = v31;
LABEL_21:

}

- (void)endFullWidthRowWithType:(int64_t)a3 aspectRatio:(double)a4
{
  uint64_t v7;
  int64_t *outputNumberOfColumnsAtRow;
  double height;
  double v10;
  CGFloat v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  int64_t rowCapacity;

  if (self->_localNumberOfColumns == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 556, CFSTR("current row doesn't exists"));

  }
  self->_rowCount = self->_localNumberOfRows + self->_row;
  rowCapacity = self->_rowCapacity;
  _PXGArrayCapacityResizeToCount();
  self->_rowCapacity = rowCapacity;
  if (self->_localNumberOfRows >= 1)
  {
    v7 = 0;
    outputNumberOfColumnsAtRow = self->_outputNumberOfColumnsAtRow;
    do
    {
      outputNumberOfColumnsAtRow[v7 + self->_row] = self->_localNumberOfColumns;
      ++v7;
    }
    while (v7 < self->_localNumberOfRows);
  }
  height = self->_contentSize.height;
  v10 = self->_intercellSpacing.height;
  v11 = floor(self->_contentSize.width / a4) + v10 + self->_origin.y;
  self->_row = self->_rowCount;
  self->_origin.y = v11;
  v12 = v11 - v10;
  if (height >= v12)
    v12 = height;
  self->_contentSize.height = v12;
  self->_localNumberOfColumns = 0x7FFFFFFFFFFFFFFFLL;
  -[PXExploreLayoutGenerator localState](self, "localState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNextRowType:", -[PXExploreLayoutGenerator preferredRowTypeAfterRowWithType:](self, "preferredRowTypeAfterRowWithType:", a3));
  if (objc_msgSend(v13, "nextRowType") == 3)
    objc_msgSend(v13, "setNextRowType:", 2);
  switch(a3)
  {
    case 3:
      v14 = v13;
      v15 = 0;
LABEL_16:
      objc_msgSend(v14, "setNumberOfConsecutiveMediumHeroRows:", v15);
      objc_msgSend(v13, "setDidMoveBestItemOutOfPreviousShortRowIntoHeroRow:", 0);
      break;
    case 2:
      objc_msgSend(v13, "setNextHeroSide:", PXFlippedExploreHeroSide(objc_msgSend(v13, "nextHeroSide")));
      v15 = objc_msgSend(v13, "numberOfConsecutiveMediumHeroRows") + 1;
      v14 = v13;
      goto LABEL_16;
    case 1:
      objc_msgSend(v13, "setDidMoveBestItemOutOfNextShortRow:", 0);
      break;
  }

}

- (BOOL)nextItems:(int64_t)a3 areAll:(unint64_t)a4
{
  int64_t v5;
  void *v7;
  uint64_t v8;
  BOOL result;
  unint64_t *p_var2;
  unint64_t v11;

  if (!a3)
    return 0;
  v5 = a3;
  -[PXExploreLayoutGenerator localState](self, "localState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "parseLocation");

  if (v8 + v5 > self->_count)
    return 0;
  if (v5 < 1)
    return 1;
  p_var2 = &self->_inputItemInfos[v8].var2;
  while (1)
  {
    v11 = *p_var2;
    p_var2 += 5;
    result = (v11 & a4) == a4;
    if ((v11 & a4) != a4)
      break;
    if (!--v5)
      return 1;
  }
  return result;
}

- (int64_t)numberOf:(unint64_t)a3 withinNextItems:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t result;
  unint64_t *p_var2;
  unint64_t v12;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "parseLocation");

  v9 = self->_count - v8;
  if (v9 >= a4)
    v9 = a4;
  if (v9 < 1)
    return 0;
  result = 0;
  p_var2 = &self->_inputItemInfos[v8].var2;
  do
  {
    v12 = *p_var2;
    p_var2 += 5;
    if ((a3 & ~v12) == 0)
      ++result;
    --v9;
  }
  while (v9);
  return result;
}

- (void)moveNextItemAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int64_t count;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v13;
  uint64_t v14;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v15;
  __int128 v16;
  uint64_t v17;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v18;
  __int128 v19;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  double var4;

  if (a3 != a4)
  {
    -[PXExploreLayoutGenerator localState](self, "localState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "parseLocation");

    v10 = v9 + a3;
    v11 = v9 + a4;
    count = self->_count;
    if (v9 + a3 >= count)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 730, CFSTR("out of bounds info fromIndex: %li, count: %li"), v9 + a3, self->_count);

      count = self->_count;
    }
    if (v11 >= count)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 731, CFSTR("out of bounds info toIndex: %li, count: %li"), v9 + a4, self->_count);

    }
    v13 = &self->_inputItemInfos[v10];
    v23 = *(_OWORD *)&v13->var0;
    v24 = *(_OWORD *)&v13->var2;
    var4 = v13->var4;
    if (a4 <= a3)
    {
      if (a3 > a4)
      {
        v17 = v9;
        do
        {
          v18 = &self->_inputItemInfos[a3 + v17];
          --v10;
          v19 = *(_OWORD *)&v18[-1].var2;
          *(_OWORD *)&v18->var0 = *(_OWORD *)&v18[-1].var0;
          *(_OWORD *)&v18->var2 = v19;
          v18->var4 = v18[-1].var4;
          --v17;
        }
        while (v10 > v11);
      }
    }
    else
    {
      v14 = v9;
      do
      {
        v15 = &self->_inputItemInfos[a3 + v14];
        ++v10;
        v16 = *(_OWORD *)&v15[1].var2;
        *(_OWORD *)&v15->var0 = *(_OWORD *)&v15[1].var0;
        *(_OWORD *)&v15->var2 = v16;
        v15->var4 = v15[1].var4;
        ++v14;
      }
      while (v10 < v11);
    }
    v20 = &self->_inputItemInfos[v11];
    *(_OWORD *)&v20->var0 = v23;
    *(_OWORD *)&v20->var2 = v24;
    v20->var4 = var4;
  }
}

- (void)reorderNextItems:(int64_t)a3 usingMapping:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *v11;
  double *v12;
  __int128 v13;
  id v14[2];

  v14[1] = *(id *)MEMORY[0x1E0C80C00];
  v14[0] = a4;
  -[PXExploreLayoutGenerator localState](self, "localState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "parseLocation");

  if (a3 >= 1)
  {
    v8 = v7;
    memcpy((char *)v14 - ((40 * a3 + 15) & 0xFFFFFFFFFFFFFFF0), &self->_inputItemInfos[v7], 40 * a3);
    v9 = 0;
    do
    {
      v10 = (*((uint64_t (**)(id, uint64_t))v14[0] + 2))(v14[0], v9);
      v11 = &self->_inputItemInfos[v8];
      v12 = (double *)((char *)&v14[5 * v10] - ((40 * a3 + 15) & 0xFFFFFFFFFFFFFFF0));
      v11->var4 = v12[4];
      v13 = *((_OWORD *)v12 + 1);
      *(_OWORD *)&v11->var0 = *(_OWORD *)v12;
      *(_OWORD *)&v11->var2 = v13;
      ++v9;
      ++v8;
    }
    while (a3 != v9);
  }

}

- (BOOL)prepareNextItems:(int64_t)a3 withLargeHeroIndex:(int64_t)a4
{
  PXExploreLayoutGenerator *v4;
  uint64_t v6;
  uint64_t v7;

  v4 = self;
  LOBYTE(self) = 0;
  if (a3 >= 1 && a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = -[PXExploreLayoutGenerator indexWithinNextItems:having:keyIndex:](v4, "indexWithinNextItems:having:keyIndex:");
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      LOBYTE(self) = 0;
    }
    else
    {
      v7 = v6;
      LODWORD(self) = -[PXExploreLayoutGenerator isAcceptableLargeHeroNextItemAtIndex:](v4, "isAcceptableLargeHeroNextItemAtIndex:", v6);
      if ((_DWORD)self)
      {
        if (-[PXExploreLayoutGenerator canReorderItemsAcrossRows](v4, "canReorderItemsAcrossRows"))
          -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](v4, "moveNextItemAtIndex:toIndex:", v7, a4);
        LOBYTE(self) = 1;
      }
    }
  }
  return (char)self;
}

- (BOOL)isAcceptableLargeHeroNextItemAtIndex:(int64_t)a3
{
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *inputItemInfos;
  void *v8;
  int64_t var0;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  char v12;

  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acceptableLargeHeroPredicate");
  v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    inputItemInfos = self->_inputItemInfos;
    -[PXExploreLayoutGenerator localState](self, "localState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    var0 = inputItemInfos[objc_msgSend(v8, "parseLocation") + a3].var0;

    -[PXExploreLayoutGenerator itemLayoutInfoBlock](self, "itemLayoutInfoBlock");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, var0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v11);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)getLowestAspectRatio:(double *)a3 highestAspectRatio:(double *)a4 forNextItems:(int64_t)a5
{
  void *v9;
  uint64_t v10;
  double *p_var4;
  double v12;
  double v13;
  double v14;
  double v15;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "parseLocation");

  if (a5 < 1)
  {
    v13 = 1.79769313e308;
    v12 = -1.79769313e308;
    if (a3)
LABEL_9:
      *a3 = v13;
  }
  else
  {
    p_var4 = &self->_inputItemInfos[v10].var4;
    v12 = -1.79769313e308;
    v13 = 1.79769313e308;
    do
    {
      v14 = *p_var4;
      p_var4 += 5;
      v15 = v14;
      if (v13 >= v14)
        v13 = v15;
      if (v12 < v15)
        v12 = v15;
      --a5;
    }
    while (a5);
    if (a3)
      goto LABEL_9;
  }
  if (a4)
    *a4 = v12;
}

- (unint64_t)attributesForNextItemAtIndex:(int64_t)a3
{
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *inputItemInfos;
  void *v5;
  unint64_t var2;

  inputItemInfos = self->_inputItemInfos;
  -[PXExploreLayoutGenerator localState](self, "localState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  var2 = inputItemInfos[objc_msgSend(v5, "parseLocation") + a3].var2;

  return var2;
}

- (NSString)diagnosticDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v10.receiver = self;
  v10.super_class = (Class)PXExploreLayoutGenerator;
  -[PXExploreLayoutGenerator diagnosticDescription](&v10, sel_diagnosticDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXExploreLayoutGenerator localState](self, "localState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@\n\tparsed=%li\n"), v4, objc_msgSend(v5, "parseLocation"));

  if (self->_count >= 1)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("\t%li w=%0.2f ar=%0.2f attr=0x%lx\n"), self->_inputItemInfos[v7].var0, *(_QWORD *)&self->_inputItemInfos[v7].var3, *(_QWORD *)&self->_inputItemInfos[v7].var4, self->_inputItemInfos[v7].var2);
      ++v8;
      ++v7;
    }
    while (v8 < self->_count);
  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (int64_t)itemIndexForPresentedItemIndex:(int64_t)a3
{
  void *v7;
  void *v8;

  if (!self->_isPrepared)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 874, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentedItem >= 0"));

  }
  if (self->_capacity <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 875, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentedItem < _capacity"));

  }
  return self->_inputItemInfos[a3].var0;
}

- (int64_t)itemIndexForItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  int64_t v7;
  uint64_t v8;
  void *v11;

  if (a4 - 7 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExploreLayoutGenerator.m"), 882, CFSTR("Only next/previous directions are supported"));

  }
  if (self->_isPrepared)
  {
    v7 = self->_outputItemIndexToParseLocation[a3];
    if (a4 == 6 && v7 > 0)
    {
      v8 = -1;
      return self->_inputItemInfos[v7 + v8].var0;
    }
    if (a4 == 5 && v7 < self->_capacity - 1)
    {
      v8 = 1;
      return self->_inputItemInfos[v7 + v8].var0;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)presentedItemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  id v7;
  int64_t v8;
  uint64_t v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  double MinY;
  double v24;
  $6DFF3C21D30F365C44AD5B1818B1BFE9 *inputItemInfos;
  int64_t var1;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  int64_t v31;
  int64_t v32;
  double MinX;
  double MaxX;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (self->_isPrepared)
  {
    v8 = a3 & ~(a3 >> 63);
    v9 = -[PXExploreLayoutGenerator itemCount](self, "itemCount");
    if (v9 - 1 < (unint64_t)a4)
      a4 = v9 - 1;
    -[PXExploreLayoutGenerator presentedRectForItemAtIndex:](self, "presentedRectForItemAtIndex:", v8);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[PXExploreLayoutGenerator presentedRectForItemAtIndex:](self, "presentedRectForItemAtIndex:", a4);
    x = v36.origin.x;
    y = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;
    MaxX = CGRectGetMaxX(v36);
    v37.origin.x = v11;
    v37.origin.y = v13;
    v37.size.width = v15;
    v37.size.height = v17;
    MinX = CGRectGetMinX(v37);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    MaxY = CGRectGetMaxY(v38);
    v39.origin.x = v11;
    v39.origin.y = v13;
    v39.size.width = v15;
    v39.size.height = v17;
    MinY = CGRectGetMinY(v39);
    v24 = MaxX;
    if (MaxX > MinX && MaxY > MinY)
    {
      inputItemInfos = self->_inputItemInfos;
      var1 = inputItemInfos[v8].var1;
      v28 = inputItemInfos[a4].var1;
      v29 = var1 - v28;
      if (var1 >= v28)
      {
        if (var1 > v28)
        {
          v32 = v28;
          do
          {
            objc_msgSend(v7, "addIndex:", self->_inputItemInfos[v32++].var0, MinY, v24, *(_QWORD *)&MinX);
            --v29;
          }
          while (v29);
        }
      }
      else
      {
        v30 = v28 - var1;
        v31 = var1;
        do
        {
          objc_msgSend(v7, "addIndex:", self->_inputItemInfos[v31++].var0, MinY, v24, *(_QWORD *)&MinX);
          --v30;
        }
        while (v30);
      }
    }
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localState, 0);
}

double __53__PXExploreLayoutGenerator_score_forNextItemAtIndex___block_invoke_2(uint64_t a1)
{
  return round(*(double *)(a1 + 64) * 4.0) * 10.0;
}

- (void)_addTwoItemsForThreeColumnRowPreferringTallVariant:(BOOL)a3
{
  uint64_t v5;
  char v6;
  double v7;
  char v8;
  double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  id v30;
  id v31;
  BOOL v32;
  _QWORD aBlock[10];
  BOOL v34;
  _QWORD v35[4];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[3];

  v5 = 0;
  v44[2] = *MEMORY[0x1E0C80C00];
  v6 = 1;
  v7 = 1.79769313e308;
  do
  {
    v8 = v6;
    -[PXExploreLayoutGenerator score:forNextItemAtIndex:](self, "score:forNextItemAtIndex:", 0, v5);
    v10 = v9;
    v11 = -[PXExploreLayoutGenerator attributesForNextItemAtIndex:](self, "attributesForNextItemAtIndex:", v5);
    v6 = 0;
    v12 = (v11 >> 3) & 1;
    if ((v11 & 4) != 0)
      v12 = 2;
    *(double *)&v44[v5] = v10;
    if (v10 < v7)
      v7 = v10;
    v43[v5] = v11;
    v42[v5] = v12;
    v5 = 1;
  }
  while ((v8 & 1) != 0);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3010000000;
  v40 = 0;
  v41 = 0;
  v39 = &unk_1A7E74EE7;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0x8000000000000001;
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke;
  aBlock[3] = &unk_1E5143170;
  v34 = a3;
  aBlock[6] = v42;
  aBlock[7] = v43;
  aBlock[8] = v44;
  *(double *)&aBlock[9] = v7;
  aBlock[4] = v35;
  aBlock[5] = &v36;
  v14 = _Block_copy(aBlock);
  -[PXExploreLayoutGenerator localState](self, "localState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "layoutSubtype") != 1;

  v27[0] = v13;
  v27[1] = 3221225472;
  v28 = __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_3;
  v29 = &unk_1E51431C0;
  v18 = v15;
  v30 = v18;
  v32 = v17;
  v19 = v14;
  v31 = v19;
  v20 = v27;
  __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_3((uint64_t)v20, 0);
  v28((uint64_t)v20, 1);

  v21 = v37;
  if (*((_BYTE *)v37 + 41))
  {
    -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", 0, 1);
    v21 = v37;
  }
  objc_msgSend(v18, "setNextHeroSide:", v21[4]);
  v22 = v37[4];
  if (*((_BYTE *)v37 + 40))
  {
    if (v22 == 1)
    {
      v23 = 2;
      v25 = 1;
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 1, 2);
      v24 = 1;
      v26 = 2;
      goto LABEL_18;
    }
    if (!v22)
    {
      v23 = 1;
      v24 = 2;
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 1, 0, 0, 2, 2);
      v25 = 0;
      v26 = 2;
LABEL_18:
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", v25, v24, 0, v23, v26);
    }
  }
  else
  {
    if (v22 == 1)
    {
      v24 = 1;
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 1, 1);
      v25 = 0;
      v23 = 2;
      v26 = 1;
      goto LABEL_18;
    }
    if (!v22)
    {
      v23 = 1;
      v24 = 2;
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 2, 1);
      v25 = 0;
      v26 = 1;
      goto LABEL_18;
    }
  }

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v36, 8);
}

- (BOOL)parseThreeColumnShortRowWithPano
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  _BOOL4 v6;
  BOOL v7;
  PXExploreLayoutGenerator *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "parseLocation");
  v5 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  switch(v5)
  {
    case 1:
      goto LABEL_25;
    case 2:
      v6 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0, v13, v15);
      goto LABEL_3;
    case 3:
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 0))
        goto LABEL_20;
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0x20000, 0x20000, 0)
        || -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 0))
      {
        goto LABEL_15;
      }
      v14 = 0;
      goto LABEL_29;
    case 4:
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 0x20000, 0)&& -[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows"))
      {
        v5 = 3;
        v8 = self;
        v9 = 1;
LABEL_23:
        v10 = 3;
        goto LABEL_24;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 0x20000, 0))
      {
LABEL_20:
        v5 = 2;
        v8 = self;
        v9 = 1;
        v10 = 2;
LABEL_24:
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](v8, "moveNextItemAtIndex:toIndex:", v9, v10);
        goto LABEL_25;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 0x20000, 0))
      {
LABEL_22:
        v5 = 3;
        v8 = self;
        v9 = 2;
        goto LABEL_23;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 2, 0))
      {
        v5 = 2;
        v8 = self;
        v9 = 2;
        v10 = 1;
        goto LABEL_24;
      }
      v7 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0x20000, 0x20000, 0x20000, 0);
LABEL_8:
      if (v7
        || -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 2, 0x20000, 0)
        || -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 2, 0))
      {
LABEL_15:
        v5 = 1;
      }
      else
      {
        v14 = 2;
        v15 = 0;
LABEL_29:
        v6 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 2, v14, v15);
LABEL_3:
        if (v6)
          v5 = 1;
        else
          v5 = 2;
      }
LABEL_25:
      -[PXExploreLayoutGenerator _parseThreeColumnShortRowWithNumberOfItems:](self, "_parseThreeColumnShortRowWithNumberOfItems:", v5);
      v11 = objc_msgSend(v3, "parseLocation") > v4;

      return v11;
    default:
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 0x20000, 0))
      {
        goto LABEL_22;
      }
      v7 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 0x20000, 0);
      goto LABEL_8;
  }
}

- (BOOL)parseThreeColumnMediumHeroRowWithPano
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  _BOOL4 v6;
  PXExploreLayoutGenerator *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v12;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "parseLocation");
  v5 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  switch(v5)
  {
    case 1:
      goto LABEL_22;
    case 2:
      v5 = 2;
      goto LABEL_22;
    case 3:
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 0))
        goto LABEL_10;
      v5 = 2;
      if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 0))
      {
        v6 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 2, 0, v12);
        goto LABEL_6;
      }
      goto LABEL_22;
    case 4:
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 0x20000, 0))
      {
LABEL_10:
        v5 = 1;
        v7 = self;
        v8 = 1;
        v9 = 0;
LABEL_21:
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](v7, "moveNextItemAtIndex:toIndex:", v8, v9);
        goto LABEL_22;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 0x20000, 0))
      {
        v5 = 2;
        v7 = self;
        v8 = 1;
        v9 = 2;
        goto LABEL_21;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 2, 0))
      {
        v5 = 2;
        v7 = self;
        v8 = 2;
        v9 = 1;
        goto LABEL_21;
      }
      if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0x20000, 0x20000, 0x20000, 0)|| -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 2, 0x20000, 0)|| -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 0x20000, 2, 0)|| -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 0x20000, 2, 2, 0))
      {
        v5 = 1;
      }
      else if (-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 2, 2, 2, 2, 0))
      {
        v5 = 1;
      }
      else
      {
        v5 = 2;
      }
LABEL_22:
      -[PXExploreLayoutGenerator _parseThreeColumnShortRowWithNumberOfItems:](self, "_parseThreeColumnShortRowWithNumberOfItems:", v5);
      v10 = objc_msgSend(v3, "parseLocation") > v4;

      return v10;
    default:
      v5 = 2;
      if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 0x20000, 0))
      {
        v5 = 2;
        if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 0x20000, 0))
        {
          v5 = 2;
          if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 2, 0x20000, 0))
          {
            v5 = 2;
            if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 0x20000, 2, 0))
            {
              v5 = 2;
              if (!-[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 0x20000, 2, 2, 0))
              {
                v6 = -[PXExploreLayoutGenerator nextInputItems:](self, "nextInputItems:", 0x20000, 2, 2, 2, 0);
LABEL_6:
                if (v6)
                  v5 = 2;
                else
                  v5 = 1;
              }
            }
          }
        }
      }
      goto LABEL_22;
  }
}

- (BOOL)parseFourColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  PXExploreLayoutGenerator *v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  BOOL v15;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "parseLocation");
  if ((unint64_t)(a3 - 2) < 2)
  {
    v12 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
    if ((unint64_t)(v12 - a4 - 3) >= 2)
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v13 = v12 - a4;
    if (v12 - a4 >= 1 && v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows"))
      {
        if ((objc_msgSend(v7, "didMoveBestItemOutOfPreviousShortRowIntoHeroRow") & 1) == 0)
        {
          v14 = -[PXExploreLayoutGenerator indexWithinNextItems:having:keyIndex:](self, "indexWithinNextItems:having:keyIndex:", v13 + a4, 0, 0);
          if (v14 >= a4)
            -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v14, a4 - 1);
        }
      }
    }
    v9 = self;
    v10 = a3;
    v11 = 1;
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    -[PXExploreLayoutGenerator _parseFourColumnShortRowWithNumberOfItems:](self, "_parseFourColumnShortRowWithNumberOfItems:", a4);
    goto LABEL_17;
  }
  if (!a3)
  {
    v9 = self;
    v10 = 0;
    v11 = 2;
LABEL_15:
    -[PXExploreLayoutGenerator _parseFourColumnHeroRowWithType:heroItemType:numberOfItems:](v9, "_parseFourColumnHeroRowWithType:heroItemType:numberOfItems:", v10, v11, a4);
  }
LABEL_17:
  v15 = objc_msgSend(v7, "parseLocation") > v8;

  return v15;
}

- (void)_parseFourColumnShortRowWithNumberOfItems:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  PXExploreLayoutGenerator *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v5 = -[PXExploreLayoutGenerator numberOfItemsInFourColumnMediumHeroRowForNumberOfRemainingItems:](self, "numberOfItemsInFourColumnMediumHeroRowForNumberOfRemainingItems:", -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems") - a3);
  if (v5 >= 1)
  {
    v6 = v5;
    if (-[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows"))
    {
      v7 = -[PXExploreLayoutGenerator indexWithinNextItems:having:keyIndex:](self, "indexWithinNextItems:having:keyIndex:", v6 + a3, 0, v6 + a3 - 1);
      if (v7 < a3)
      {
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v7, a3);
        -[PXExploreLayoutGenerator localState](self, "localState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setDidMoveBestItemOutOfPreviousShortRowIntoHeroRow:", 1);

      }
    }
  }
  if (a3 == 3)
  {
    -[PXExploreLayoutGenerator localState](self, "localState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numberOfColumnsOverride");

    if (v11 != 3)
    {
      -[PXExploreLayoutGenerator parseFourColumnRowWithType:numberOfItems:](self, "parseFourColumnRowWithType:numberOfItems:", 2, 3);
      return;
    }
    -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 12);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 4, 3);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 4, 3);
    v12 = self;
    v13 = 8;
    v14 = 4;
    v15 = 3;
    goto LABEL_18;
  }
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      PLCuratedLibraryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "four-column layout shouldn't contain any short row with 1 item", buf, 2u);
      }

      -[PXExploreLayoutGenerator parseFourColumnRowWithType:numberOfItems:](self, "parseFourColumnRowWithType:numberOfItems:", 3, 1);
      return;
    }
    -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 4);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 1, 1);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 1, 0, 1, 1);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 0, 1, 1);
    v12 = self;
    v13 = 3;
    v14 = 1;
    v15 = 1;
LABEL_18:
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](v12, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v13, 0, v14, v15);
    -[PXExploreLayoutGenerator endRowWithType:](self, "endRowWithType:", 1);
    return;
  }
  PLCuratedLibraryGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "four-column layout shouldn't contain any short row with 2 items", v17, 2u);
  }

  -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 4);
  -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 2, 2);
  -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 0, 2, 2);
  -[PXExploreLayoutGenerator endRowWithType:](self, "endRowWithType:", 1);
}

- (int64_t)numberOfItemsInFourColumnMediumHeroRowForNumberOfRemainingItems:(int64_t)a3
{
  void *v3;
  uint64_t v4;

  if (a3 < 1)
    return 0;
  switch(a3)
  {
    case 1:
      return a3;
    case 2:
      a3 = 2;
      break;
    case 4:
    case 8:
    case 12:
    case 16:
      a3 = 4;
      break;
    case 5:
    case 9:
      a3 = 5;
      break;
    case 10:
      -[PXExploreLayoutGenerator localState](self, "localState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "numberOfColumnsOverride");

      if (v4 == 3)
        a3 = 4;
      else
        a3 = 3;
      break;
    default:
      a3 = 3;
      break;
  }
  return a3;
}

- (void)_parseFourColumnHeroRowWithType:(int64_t)a3 heroItemType:(int64_t)a4 numberOfItems:(int64_t)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  PXExploreLayoutGenerator *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  PXExploreLayoutGenerator *v33;
  int64_t v34;
  int v35;
  int64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[PXExploreLayoutGenerator localState](self, "localState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "nextHeroSide");

  v11 = 3;
  v12 = 16;
  if (v10)
  {
    v12 = 0;
    v11 = 0;
  }
  if (v10 == 1)
    v13 = a5 - 1;
  else
    v13 = 0;
  if (v10 == 1)
    v14 = 0;
  else
    v14 = v12;
  if (v10 == 1)
    v15 = 0;
  else
    v15 = v11;
  v16 = v10 == 1;
  switch(a5)
  {
    case 1:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 4);
      v17 = self;
      v18 = a4;
      v19 = 0;
      v20 = 0;
      v21 = 4;
      v22 = 3;
      goto LABEL_44;
    case 2:
      if (a3)
      {
        -[PXExploreLayoutGenerator localState](self, "localState");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "numberOfColumnsOverride");

        if (v25 == 3)
        {
          -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 24);
          -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 2, v13, 0);
          -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v13, 0);
          -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 8 * v16, 0, 16, 12);
          v17 = self;
          v18 = 0;
          v19 = v14;
          v20 = 0;
          v21 = 8;
          v22 = 12;
        }
        else
        {
          -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 8);
          -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 2, v13, 0);
          -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v13, 0);
          -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 2 * v16, 0, 6, 4);
          v19 = 2 * v15;
          v17 = self;
          v18 = 0;
          v20 = 0;
          v21 = 2;
          v22 = 4;
        }
LABEL_44:
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](v17, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", v18, v19, v20, v21, v22);
        v33 = self;
        v34 = a3;
      }
      else
      {
        -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 4);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 0, 4, 3);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 1, 0, 3, 4, 3);
        v33 = self;
        v34 = 0;
      }
      -[PXExploreLayoutGenerator endRowWithType:](v33, "endRowWithType:", v34);
      return;
    case 3:
      -[PXExploreLayoutGenerator localState](self, "localState");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "numberOfColumnsOverride");

      if (v27 == 3)
      {
        -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 24);
        if (a3)
        {
          -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 3, v13, 0);
          v28 = 6;
        }
        else
        {
          v28 = 9;
        }
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v13, 0);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 8 * v16, 0, 16, 2 * v28);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v14, 0, 8, v28);
        v17 = self;
        v18 = 0;
        v19 = v14;
        v20 = v28;
        v21 = 8;
        v22 = v28;
      }
      else
      {
        -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 8);
        if (a3)
        {
          -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 3, v13, 0);
          v32 = 2;
        }
        else
        {
          v32 = 3;
        }
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v13, 0);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 2 * v16, 0, 6, 2 * v32);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2 * v15, 0, 2, v32);
        v17 = self;
        v18 = 0;
        v19 = 2 * v15;
        v20 = v32;
        v21 = 2;
        v22 = v32;
      }
      goto LABEL_44;
    case 4:
      -[PXExploreLayoutGenerator localState](self, "localState");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "numberOfColumnsOverride");

      if (v30 == 3)
      {
        -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 24);
        if (a3)
          -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 4, v13, 0);
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v13, 0);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 8 * v16, 0, 16, 18);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v14, 0, 8, 6);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v14, 6, 8, 6);
        v17 = self;
        v18 = 0;
        v19 = v14;
        v20 = 12;
        v21 = 8;
        v22 = 6;
      }
      else
      {
        -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 4);
        if (a3)
          -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 4, v13, 0);
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v13, 0);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, v16, 0, 3, 3);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v15, 0, 1, 1);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v15, 1, 1, 1);
        v17 = self;
        v18 = 0;
        v19 = v15;
        v20 = 2;
        v21 = 1;
        v22 = 1;
      }
      goto LABEL_44;
    case 5:
      PXAssertGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v35 = 138412290;
        v36 = (int64_t)self;
        _os_log_error_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "module with 5-item hero row with 4-column layout shouldn't be used %@", (uint8_t *)&v35, 0xCu);
      }

      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 4);
      if (a3)
        -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 5, v13, 0);
      -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v13, 0);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, v16, 0, 3, 4);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v15, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v15, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v15, 2, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v15, 3, 1, 1);
      -[PXExploreLayoutGenerator endRowWithType:](self, "endRowWithType:", a3);
      return;
    case 6:
      -[PXExploreLayoutGenerator _parseFourColumnHeroRowWithType:heroItemType:numberOfItems:](self, "_parseFourColumnHeroRowWithType:heroItemType:numberOfItems:", a3, a4, 3);
      -[PXExploreLayoutGenerator _parseFourColumnHeroRowWithType:heroItemType:numberOfItems:](self, "_parseFourColumnHeroRowWithType:heroItemType:numberOfItems:", a3, a4, 3);
      return;
    default:
      PLCuratedLibraryGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v35 = 134217984;
        v36 = a5;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "four-column layout shouldn't have to parse a hero row with %li items", (uint8_t *)&v35, 0xCu);
      }

      -[PXExploreLayoutGenerator _parseFourColumnHeroRowWithType:heroItemType:numberOfItems:](self, "_parseFourColumnHeroRowWithType:heroItemType:numberOfItems:", a3, a4, 3);
      return;
  }
}

- (BOOL)parseThreeColumnGroupWithFiveItems
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  PXExploreLayoutGenerator *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v3 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  if (v3 < 5)
    return v3 > 4;
  v4 = 0;
  v5 = 4;
  v6 = 1.79769313e308;
  v7 = -1.79769313e308;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    -[PXExploreLayoutGenerator score:forNextItemAtIndex:](self, "score:forNextItemAtIndex:", 0, v5);
    v11 = v10;
    v12 = -[PXExploreLayoutGenerator attributesForNextItemAtIndex:](self, "attributesForNextItemAtIndex:", v5);
    if ((v12 & 8) != 0)
      v13 = v5;
    else
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v12 & 8) != 0)
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v14 = v5;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      v13 = v8;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      v14 = v9;
    if (v11 != v7)
    {
      v14 = v9;
      v13 = v8;
    }
    if ((v12 & 8) != 0)
      v15 = v5;
    else
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v12 & 8) != 0)
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v16 = v5;
    if (v11 > v7)
      v9 = v16;
    else
      v9 = v14;
    if (v11 > v7)
      v8 = v15;
    else
      v8 = v13;
    if (v11 > v7)
      v7 = v11;
    if (v6 >= v11)
      v6 = v11;
    if ((v12 & 4) != 0)
    {
      if (!v4)
        v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      objc_msgSend(v4, "addIndex:", v5);
    }
    --v5;
  }
  while (v5 != -1);
  -[PXExploreLayoutGenerator localState](self, "localState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "parseLocation");
  if (v6 == v7 || !-[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows"))
    goto LABEL_50;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8 <= 2)
      -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v8, 3);
LABEL_50:
    -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 1, 3);
    -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 2, 2);
    goto LABEL_51;
  }
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v19, "removeIndex:", v9);
    if (objc_msgSend(v19, "count"))
    {
      v20 = objc_msgSend(v19, "lastIndex");
      if (v9 <= v20)
        v21 = v20;
      else
        v21 = v9;
      if (v9 >= v20)
        v22 = v20;
      else
        v22 = v9;
      -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v21, 4);
      -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v22, 3);
      -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 1, 3);
      v23 = self;
      v24 = 2;
    }
    else
    {
      -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v9, 2);
      v26 = 0;
      v27 = 0x7FFFFFFFFFFFFFFFLL;
      v28 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        if (v26 != 2)
        {
          v29 = -[PXExploreLayoutGenerator attributesForNextItemAtIndex:](self, "attributesForNextItemAtIndex:", v26);
          v30 = v28 == 0x7FFFFFFFFFFFFFFFLL ? v26 : v28;
          if ((v29 & 8) != 0)
          {
            v28 = v30;
            v27 = v26;
          }
        }
        ++v26;
      }
      while (v26 != 5);
      if (v28 == 0x7FFFFFFFFFFFFFFFLL || v27 == v28)
      {
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", 2, v9);
        goto LABEL_74;
      }
      if (v28 > 2)
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v28, 1);
      if (v27 < 2)
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v27, 3);
      -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 1, 2);
      -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 3, 1);
      v23 = self;
      v24 = 1;
    }
    -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](v23, "parseThreeColumnRowWithType:numberOfItems:", v24, 2);
LABEL_74:

  }
LABEL_51:
  if (objc_msgSend(v17, "parseLocation") == v18)
  {
    if (-[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows") && v9 <= 2)
      -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v9, 3);
    -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 1, 3);
    -[PXExploreLayoutGenerator parseThreeColumnRowWithType:numberOfItems:](self, "parseThreeColumnRowWithType:numberOfItems:", 2, 2);
  }

  return v3 > 4;
}

- (BOOL)parseFourColumnGroupWithShortRowFollowedByLargeHero
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  if (!-[PXExploreLayoutGenerator _isShortRowNextFollowedByLargeHero](self, "_isShortRowNextFollowedByLargeHero"))
    return 0;
  v3 = -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems");
  v4 = v3 <= 8 ? 0 : 9;
  v5 = v3 + ~v4;
  if (v5 < 9 && ((0x113u >> v5) & 1) != 0)
    return 0;
  if (!-[PXExploreLayoutGenerator prepareNextItems:withLargeHeroIndex:](self, "prepareNextItems:withLargeHeroIndex:"))
    return 0;
  v6 = 1;
  -[PXExploreLayoutGenerator parseFourColumnRowWithType:numberOfItems:](self, "parseFourColumnRowWithType:numberOfItems:", 1, 4);
  -[PXExploreLayoutGenerator parseFourColumnRowWithType:numberOfItems:](self, "parseFourColumnRowWithType:numberOfItems:", 3, 1);
  return v6;
}

- (int64_t)numberOfItemsInSixColumnShortRowForNumberOfRemainingItems:(int64_t)a3
{
  int64_t v3;
  NSObject *v6;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  PXExploreLayoutGenerator *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
    case 2:
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v13;
        v17 = 2048;
        v18 = v3;
        v19 = 2112;
        v20 = self;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "no specs for %@:%li %@", (uint8_t *)&v15, 0x20u);

      }
      return v3;
    case 3:
    case 7:
      goto LABEL_18;
    case 4:
      return 4;
    case 5:
      PXAssertGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v11;
      v17 = 2048;
      v18 = 5;
      v19 = 2112;
      v20 = self;
      goto LABEL_20;
    case 8:
    case 11:
      PXAssertGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v14;
        v17 = 2048;
        v18 = v3;
        v19 = 2112;
        v20 = self;
        _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "no specs for %@:%li %@", (uint8_t *)&v15, 0x20u);

      }
      return 4;
    case 14:
      PXAssertGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v11;
      v17 = 2048;
      v18 = 14;
      v19 = 2112;
      v20 = self;
LABEL_20:
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "no specs for %@:%li %@", (uint8_t *)&v15, 0x20u);

LABEL_17:
LABEL_18:
      v3 = 3;
      break;
    case 16:
    case 20:
    case 23:
    case 25:
      PXAssertGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v12;
        v17 = 2048;
        v18 = v3;
        v19 = 2112;
        v20 = self;
        _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "no specs for %@:%li %@", (uint8_t *)&v15, 0x20u);

      }
      goto LABEL_5;
    default:
LABEL_5:
      v3 = 6;
      break;
  }
  return v3;
}

- (int64_t)numberOfItemsInSixColumnHeroRowForNumberOfRemainingItems:(int64_t)a3 rowOptions:(unint64_t *)a4
{
  unint64_t v5;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  PXExploreLayoutGenerator *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  switch(a3)
  {
    case 0:
      goto LABEL_9;
    case 1:
    case 5:
      v5 = 0;
LABEL_9:
      if (a4)
        goto LABEL_10;
      return a3;
    case 2:
      PXAssertGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412802;
        v12 = v10;
        v13 = 2048;
        v14 = 2;
        v15 = 2112;
        v16 = self;
        _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "no specs for %@: %li %@", (uint8_t *)&v11, 0x20u);

      }
      v5 = 0;
      a3 = 2;
      if (!a4)
        return a3;
      goto LABEL_10;
    case 4:
    case 7:
    case 8:
    case 11:
    case 14:
    case 17:
      v5 = 2;
      a3 = 4;
      if (!a4)
        return a3;
      goto LABEL_10;
    case 10:
    case 23:
    case 26:
    case 28:
      a3 = 4;
      v5 = 4;
      if (!a4)
        return a3;
      goto LABEL_10;
    default:
      v5 = 0;
      a3 = 3;
      if (!a4)
        return a3;
LABEL_10:
      *a4 = v5;
      return a3;
  }
}

- (BOOL)parseSixColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 options:(unint64_t)a5
{
  return -[PXExploreLayoutGenerator parseSixColumnRowWithType:numberOfItems:subsequentShortRowItems:options:](self, "parseSixColumnRowWithType:numberOfItems:subsequentShortRowItems:options:", a3, a4, 0, a5);
}

- (BOOL)parseSixColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6
{
  void *v11;
  uint64_t v12;
  unint64_t v13;
  PXExploreLayoutGenerator *v14;
  int64_t v15;
  uint64_t v16;
  int64_t v17;
  BOOL v18;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "parseLocation");
  if ((unint64_t)(a3 - 2) < 2)
  {
    v14 = self;
    v15 = a4;
    v16 = 1;
    v17 = a5;
    v13 = a6;
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    -[PXExploreLayoutGenerator _parseSixColumnShortRowWithNumberOfItems:](self, "_parseSixColumnShortRowWithNumberOfItems:", a4);
    goto LABEL_8;
  }
  if (!a3)
  {
    v13 = a6 | 1;
    v14 = self;
    v15 = a4;
    v16 = 2;
    v17 = a5;
LABEL_6:
    -[PXExploreLayoutGenerator _parseSixColumnHeroRowWithNumberOfItems:heroItemType:subsequentShortRowItems:options:](v14, "_parseSixColumnHeroRowWithNumberOfItems:heroItemType:subsequentShortRowItems:options:", v15, v16, v17, v13);
  }
LABEL_8:
  v18 = objc_msgSend(v11, "parseLocation") > v12;

  return v18;
}

- (void)_parseSixColumnHeroRowWithNumberOfItems:(int64_t)a3 heroItemType:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6
{
  void *v11;
  uint64_t v12;
  int64_t v13;
  PXExploreLayoutGenerator *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  PXExploreLayoutGenerator *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  uint64_t v29;
  uint8_t buf[4];
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[PXExploreLayoutGenerator localState](self, "localState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v12 = objc_msgSend(v11, "nextHeroSide");
  if (!a5)
    a5 = -[PXExploreLayoutGenerator numberOfItemsInSixColumnShortRowForNumberOfRemainingItems:](self, "numberOfItemsInSixColumnShortRowForNumberOfRemainingItems:", -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems") - a3);
  if (a5 >= 1)
  {
    if (-[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows"))
    {
      v13 = -[PXExploreLayoutGenerator indexWithinNextItems:having:keyIndex:](self, "indexWithinNextItems:having:keyIndex:", a5 + a3, 0, 0);
      if (v13 >= a3)
      {
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v13, a3 - 1);
        objc_msgSend(v11, "setDidMoveBestItemOutOfNextShortRow:", 1);
      }
    }
  }
  switch(a3)
  {
    case 1:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 6);
      v14 = self;
      v15 = a4;
      v16 = 0;
      v17 = 0;
      v18 = 6;
      goto LABEL_47;
    case 2:
      if (a4 == 2)
      {
        -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 2);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 2, 0, 0, 1, 1);
        v14 = self;
        v15 = 1;
        v16 = 1;
        v17 = 0;
        goto LABEL_21;
      }
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 6);
      if (v12 == 1)
      {
        if ((a6 & 1) == 0)
          -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 2, 1, 0);
        v23 = self;
        v24 = 0;
        v25 = 0;
        v26 = 2;
        v27 = 3;
        goto LABEL_46;
      }
      if (v12)
        goto LABEL_49;
      if ((a6 & 1) == 0)
        -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 2, 0, 0);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 0, 4, 3);
      v14 = self;
      v15 = 0;
      v16 = 4;
      v17 = 0;
      v18 = 2;
      goto LABEL_47;
    case 3:
      -[PXExploreLayoutGenerator _addThreeItemsToSixColumnRowWithHeroItemType:options:rowType:](self, "_addThreeItemsToSixColumnRowWithHeroItemType:options:rowType:", a4, a6, &v29);
      goto LABEL_49;
    case 4:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 6);
      if ((a6 & 4) == 0)
      {
        if (v12 != 1)
        {
          if (v12)
            goto LABEL_49;
          if ((a6 & 1) == 0)
            -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 4, 0, 0);
          -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 0, 4, 3);
          -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 3, 0, 0);
          -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 2, 2);
          -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 2, 1, 1);
          v14 = self;
          v15 = 0;
          v16 = 5;
          v17 = 2;
LABEL_21:
          v18 = 1;
          v20 = 1;
          goto LABEL_48;
        }
        if ((a6 & 1) == 0)
          -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 4, 3, 0);
        -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 3, 0, 0);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 2, 2);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 2, 1, 1);
        v23 = self;
        v24 = 1;
        v25 = 2;
        v26 = 1;
        v27 = 1;
LABEL_46:
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](v23, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v24, v25, v26, v27);
        v14 = self;
        v15 = a4;
        v16 = 2;
        v17 = 0;
        v18 = 4;
LABEL_47:
        v20 = 3;
        goto LABEL_48;
      }
      if (v12 == 1)
      {
        if ((a6 & 1) == 0)
          -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 4, 3, 0);
        -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 3, 2, 0);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 1, 1);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 1, 0, 1, 1);
        v23 = self;
        v24 = 0;
        v25 = 1;
        v26 = 2;
        v27 = 2;
        goto LABEL_46;
      }
      if (v12)
        goto LABEL_49;
      if ((a6 & 1) == 0)
        -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 4, 0, 0);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 0, 4, 3);
      -[PXExploreLayoutGenerator sortNextItems:withItemAtIndex:having:](self, "sortNextItems:withItemAtIndex:having:", 3, 2, 0);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 0, 1, 1);
      v14 = self;
      v15 = 0;
      v16 = 4;
      v17 = 1;
      v18 = 2;
      v20 = 2;
LABEL_48:
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](v14, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", v15, v16, v17, v18, v20);
LABEL_49:
      -[PXExploreLayoutGenerator endRowWithType:](self, "endRowWithType:", 2);
      objc_msgSend(v11, "setLastHeroRowTag:", v29);

      return;
    case 5:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 12);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __119__PXExploreLayoutGenerator_Rows___parseSixColumnHeroRowWithNumberOfItems_heroItemType_subsequentShortRowItems_options___block_invoke;
      v28[3] = &unk_1E51438B0;
      v28[4] = self;
      v21 = _Block_copy(v28);
      v22 = (void (**)(_QWORD, _QWORD))v21;
      if (v12 == 1)
      {
        (*((void (**)(void *, _QWORD))v21 + 2))(v21, 0);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 4, 0, 8, 6);
      }
      else if (!v12)
      {
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 0, 8, 6);
        v22[2](v22, 8);
      }

      goto LABEL_49;
    default:
      PXAssertGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v31 = a3;
        _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "no specs for six-column hero row with %li items", buf, 0xCu);
      }

      goto LABEL_49;
  }
}

- (void)_addThreeItemsToSixColumnRowWithHeroItemType:(int64_t)a3 options:(unint64_t)a4 rowType:(int64_t *)a5
{
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  char v22;
  void *v23;
  BOOL v24;
  id v25;
  id v26;
  _QWORD *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  _QWORD v42[2];
  uint64_t (*v43)(uint64_t, uint64_t);
  void *v44;
  id v45;
  id v46;
  char v47;
  BOOL v48;
  _QWORD v49[4];
  id v50;
  _QWORD *v51;
  uint64_t *v52;
  _QWORD *v53;
  _QWORD *v54;
  double v55;
  double v56;
  unint64_t v57;
  char v58;
  _QWORD v59[4];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  void *v63;
  __int128 v64;
  uint64_t v65;
  _QWORD aBlock[6];
  _QWORD v67[3];
  _QWORD v68[5];

  v10 = 0;
  v68[3] = *MEMORY[0x1E0C80C00];
  v11 = -1.79769313e308;
  v12 = 1.79769313e308;
  do
  {
    -[PXExploreLayoutGenerator score:forNextItemAtIndex:](self, "score:forNextItemAtIndex:", 0, v10);
    v14 = v13;
    v15 = -[PXExploreLayoutGenerator attributesForNextItemAtIndex:](self, "attributesForNextItemAtIndex:", v10);
    v16 = (v15 >> 3) & 1;
    if ((v15 & 4) != 0)
      v16 = 2;
    if (v14 < v12)
      v12 = v14;
    if (v14 >= v11)
      v11 = v14;
    *(double *)&v68[v10] = v14;
    v67[v10++] = v16;
  }
  while (v10 != 3);
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke;
  aBlock[3] = &unk_1E51431E8;
  aBlock[4] = self;
  aBlock[5] = a2;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3810000000;
  v63 = &unk_1A7E74EE7;
  v65 = 0;
  v64 = xmmword_1A7C0BA88;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0x8000000000000001;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_2;
  v49[3] = &unk_1E5143238;
  v18 = _Block_copy(aBlock);
  v54 = v68;
  v55 = v12;
  v56 = v11;
  v58 = a4 & 1;
  v57 = a4;
  v50 = v18;
  v51 = v59;
  v52 = &v60;
  v53 = v67;
  v19 = _Block_copy(v49);
  -[PXExploreLayoutGenerator localState](self, "localState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "canIgnoreNextHeroSide");
  if (a3 == 2)
    v22 = 0;
  else
    v22 = v21;
  -[PXExploreLayoutGenerator metrics](self, "metrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "layoutSubtype") != 1;

  v42[0] = v17;
  v42[1] = 3221225472;
  v43 = __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_4;
  v44 = &unk_1E5143260;
  v25 = v20;
  v45 = v25;
  v47 = v22;
  v48 = v24;
  v26 = v19;
  v46 = v26;
  v27 = v42;
  __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_4((uint64_t)v27, 0);
  v43((uint64_t)v27, 1);

  v39[0] = v17;
  v39[1] = 3221225472;
  v39[2] = __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_5;
  v39[3] = &unk_1E5143288;
  v28 = v18;
  v40 = v28;
  v41 = &v60;
  -[PXExploreLayoutGenerator reorderNextItems:usingMapping:](self, "reorderNextItems:usingMapping:", 3, v39);
  v29 = v61;
  switch(v61[5])
  {
    case 0:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 6);
      v29 = v61;
      v30 = v61[4];
      if (v30 == 1)
      {
        v37 = 2;
        v38 = 1;
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 2, 1);
        goto LABEL_26;
      }
      if (!v30)
      {
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a3, 0, 0, 4, 3);
        v31 = 2;
        v32 = 1;
        v33 = 4;
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 2, 1);
        a3 = 0;
        v34 = 2;
        goto LABEL_27;
      }
      break;
    case 1:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 12);
      v29 = v61;
      v35 = v61[4];
      if (v35 == 1)
      {
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 4, 3);
        v33 = 4;
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 3, 4, 3);
        v32 = 0;
        v34 = 6;
        v31 = 8;
        goto LABEL_27;
      }
      if (!v35)
      {
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a3, 0, 0, 8, 6);
        v31 = 4;
        v32 = 3;
        v33 = 8;
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 8, 0, 4, 3);
        a3 = 0;
        v34 = 3;
        goto LABEL_27;
      }
      break;
    case 2:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 6);
      v29 = v61;
      v36 = v61[4];
      if (v36 == 1)
      {
        v38 = 2;
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 2, 2);
        v37 = 1;
LABEL_26:
        v33 = 2;
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, v38, 2, v37);
        v32 = 0;
        v34 = 3;
        v31 = 4;
        goto LABEL_27;
      }
      if (!v36)
      {
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a3, 0, 0, 4, 3);
        v32 = 2;
        v33 = 4;
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 2, 2);
        a3 = 0;
        v34 = 1;
        v31 = 2;
        goto LABEL_27;
      }
      break;
    case 3:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 6);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 2, 3);
      v34 = 3;
      v31 = 2;
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 0, 2, 3);
      a3 = 0;
      v32 = 0;
      v33 = 4;
LABEL_27:
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a3, v33, v32, v31, v34);
      v29 = v61;
      break;
    default:
      break;
  }
  objc_msgSend(v25, "setNextHeroSide:", v29[4]);
  if (a5)
    *a5 = v61[5];

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(&v60, 8);

}

- (void)_parseSixColumnShortRowWithNumberOfItems:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  int64_t v9;
  PXExploreLayoutGenerator *v10;
  uint64_t v11;
  uint64_t v12;
  PXExploreLayoutGenerator *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[PXExploreLayoutGenerator numberOfItemsInSixColumnHeroRowForNumberOfRemainingItems:rowOptions:](self, "numberOfItemsInSixColumnHeroRowForNumberOfRemainingItems:rowOptions:", -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems") - a3, 0);
  if (v5 >= 1)
  {
    v6 = v5;
    -[PXExploreLayoutGenerator localState](self, "localState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "didMoveBestItemOutOfNextShortRow"))
    {

    }
    else
    {
      v8 = -[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows");

      if (v8)
      {
        v9 = -[PXExploreLayoutGenerator indexWithinNextItems:having:keyIndex:](self, "indexWithinNextItems:having:keyIndex:", v6 + a3, 0, v6 + a3 - 1);
        if (v9 < a3)
          -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v9, a3);
      }
    }
  }
  -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 6);
  switch(a3)
  {
    case 6:
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 1, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 0, 1, 1);
      v13 = self;
      v14 = 3;
      v15 = 1;
LABEL_13:
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](v13, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v14, 0, v15, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 1, 1);
      v10 = self;
      v11 = 5;
      v12 = 1;
      goto LABEL_14;
    case 4:
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 2, 1);
      v13 = self;
      v14 = 2;
      v15 = 2;
      goto LABEL_13;
    case 3:
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 2, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 0, 2, 1);
      v10 = self;
      v11 = 4;
      v12 = 2;
LABEL_14:
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](v10, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v11, 0, v12, 1);
      goto LABEL_18;
  }
  PXAssertGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = 134217984;
    v18 = a3;
    _os_log_error_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "no specs for six-column short row with %li items", (uint8_t *)&v17, 0xCu);
  }

LABEL_18:
  -[PXExploreLayoutGenerator endRowWithType:](self, "endRowWithType:", 1);
}

- (int64_t)numberOfItemsInSevenColumnShortRowForNumberOfRemainingItems:(int64_t)a3
{
  int64_t result;

  if ((unint64_t)a3 > 0x19)
    return 7;
  result = a3;
  if (((1 << a3) & 0x3224000) != 0)
    return 6;
  if (a3 && a3 != 6)
    return 7;
  return result;
}

- (int64_t)numberOfItemsInSevenColumnHeroRowForNumberOfRemainingItems:(int64_t)a3
{
  if ((unint64_t)a3 > 0x26)
    return 23;
  else
    return qword_1A7C0BAA0[a3];
}

- (BOOL)parseSevenColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 options:(unint64_t)a5
{
  return -[PXExploreLayoutGenerator parseSevenColumnRowWithType:numberOfItems:subsequentShortRowItems:options:](self, "parseSevenColumnRowWithType:numberOfItems:subsequentShortRowItems:options:", a3, a4, 0, a5);
}

- (BOOL)parseSevenColumnRowWithType:(int64_t)a3 numberOfItems:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6
{
  void *v11;
  uint64_t v12;
  unint64_t v13;
  PXExploreLayoutGenerator *v14;
  int64_t v15;
  uint64_t v16;
  int64_t v17;
  BOOL v18;

  -[PXExploreLayoutGenerator localState](self, "localState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "parseLocation");
  if ((unint64_t)(a3 - 2) < 2)
  {
    v14 = self;
    v15 = a4;
    v16 = 1;
    v17 = a5;
    v13 = a6;
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    -[PXExploreLayoutGenerator _parseSevenColumnShortRowWithNumberOfItems:](self, "_parseSevenColumnShortRowWithNumberOfItems:", a4);
    goto LABEL_8;
  }
  if (!a3)
  {
    v13 = a6 | 1;
    v14 = self;
    v15 = a4;
    v16 = 2;
    v17 = a5;
LABEL_6:
    -[PXExploreLayoutGenerator _parseSevenColumnHeroRowWithNumberOfItems:heroItemType:subsequentShortRowItems:options:](v14, "_parseSevenColumnHeroRowWithNumberOfItems:heroItemType:subsequentShortRowItems:options:", v15, v16, v17, v13);
  }
LABEL_8:
  v18 = objc_msgSend(v11, "parseLocation") > v12;

  return v18;
}

- (void)_parseSevenColumnHeroRowWithNumberOfItems:(int64_t)a3 heroItemType:(int64_t)a4 subsequentShortRowItems:(int64_t)a5 options:(unint64_t)a6
{
  int64_t v6;
  void *v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PXExploreLayoutGenerator *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[5];
  uint8_t buf[4];
  int64_t v25;
  uint64_t v26;

  v6 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  -[PXExploreLayoutGenerator localState](self, "localState", a3, a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = -[PXExploreLayoutGenerator numberOfItemsInSevenColumnShortRowForNumberOfRemainingItems:](self, "numberOfItemsInSevenColumnShortRowForNumberOfRemainingItems:", -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems") - a3);
  if (v6 >= 1)
  {
    if (-[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows"))
    {
      v11 = -[PXExploreLayoutGenerator indexWithinNextItems:having:keyIndex:](self, "indexWithinNextItems:having:keyIndex:", v6 + a3, 0, 0);
      if (v11 >= a3)
      {
        -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v11, a3 - 1);
        objc_msgSend(v10, "setDidMoveBestItemOutOfNextShortRow:", 1);
      }
    }
  }
  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 7);
      v12 = 0;
      do
      {
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v12 % 7);
        ++v12;
      }
      while (a3 != v12);
      goto LABEL_38;
    case 9:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 7);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 0, 3, 2);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 6, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 1, 1, 1);
      v15 = self;
      v16 = 0;
      v17 = 6;
      v18 = 1;
      goto LABEL_36;
    case 11:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 7);
      if (v6)
      {
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 0, 3, 2);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 0, 1, 1);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 1, 1);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 0, 1, 1);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 6, 0, 1, 1);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 1, 1, 1);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 2, 1, 1);
LABEL_30:
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 1, 2, 1, 1);
LABEL_31:
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 2, 1, 1);
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 2, 1, 1);
        v15 = self;
        v16 = a4;
        v17 = 4;
        v18 = 1;
        v19 = 3;
LABEL_32:
        v21 = 2;
LABEL_37:
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](v15, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", v16, v17, v18, v19, v21);
      }
      else
      {
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 0, 2, 2);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __121__PXExploreLayoutGenerator_Rows___parseSevenColumnHeroRowWithNumberOfItems_heroItemType_subsequentShortRowItems_options___block_invoke;
        aBlock[3] = &unk_1E51438B0;
        aBlock[4] = self;
        v22 = (uint64_t)_Block_copy(aBlock);
        (*(void (**)(uint64_t, _QWORD))(v22 + 16))(v22, 0);
        (*(void (**)(uint64_t, uint64_t))(v22 + 16))(v22, 1);
LABEL_40:

      }
LABEL_38:
      -[PXExploreLayoutGenerator endRowWithType:](self, "endRowWithType:", 2);
      objc_msgSend(v10, "setLastHeroRowTag:", 0);

      return;
    case 12:
    case 13:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 7);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 2, 2);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 6, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 1, 1, 1);
      if (a3 == 12)
        v13 = 2;
      else
        v13 = 1;
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 2, v13, 1);
      if (a3 != 13)
        goto LABEL_31;
      goto LABEL_30;
    case 14:
    case 15:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 7);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 0, 2, 2);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 6, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 1, 1, 1);
      if (a3 == 14)
        v14 = 2;
      else
        v14 = 1;
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 2, v14, 1);
      if (a3 == 15)
        -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 1, 2, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 2, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 2, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 2, 1, 1);
      v15 = self;
      v16 = a4;
      v17 = 5;
      v18 = 1;
      v19 = 2;
      goto LABEL_32;
    case 18:
    case 19:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 7);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 0, 2, 2);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 6, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 5, 1, 2, 2);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 2, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 1, 2, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 3, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 1, 3, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 2, 2, 2, 2);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 2, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 3, 1, 1);
      if (a3 == 18)
        v20 = 2;
      else
        v20 = 1;
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 3, v20, 1);
      if (a3 != 19)
        goto LABEL_38;
      v15 = self;
      v16 = 0;
      v17 = 6;
      v18 = 3;
LABEL_36:
      v19 = 1;
      v21 = 1;
      goto LABEL_37;
    case 23:
      -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 7);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 0, 2, 2);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 6, 0, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 1, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 5, 1, 2, 2);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 2, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 1, 2, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 2, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 3, 2, 2, 2);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 3, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 6, 3, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", a4, 0, 3, 2, 2);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 3, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 4, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 4, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 4, 1, 1);
      -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 4, 1, 1);
      v15 = self;
      v16 = 0;
      v17 = 6;
      v18 = 4;
      goto LABEL_36;
    default:
      PXAssertGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v25 = a3;
        _os_log_error_impl(&dword_1A6789000, (os_log_t)v22, OS_LOG_TYPE_ERROR, "no specs for seven-column hero row with %li items", buf, 0xCu);
      }
      goto LABEL_40;
  }
}

- (void)_parseSevenColumnShortRowWithNumberOfItems:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  int64_t v9;
  PXExploreLayoutGenerator *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = -[PXExploreLayoutGenerator numberOfItemsInSevenColumnHeroRowForNumberOfRemainingItems:](self, "numberOfItemsInSevenColumnHeroRowForNumberOfRemainingItems:", -[PXExploreLayoutGenerator numberOfRemainingItems](self, "numberOfRemainingItems") - a3);
  if (v5 >= 1)
  {
    v6 = v5;
    -[PXExploreLayoutGenerator localState](self, "localState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "didMoveBestItemOutOfNextShortRow"))
    {

    }
    else
    {
      v8 = -[PXExploreLayoutGenerator canReorderItemsAcrossRows](self, "canReorderItemsAcrossRows");

      if (v8)
      {
        v9 = -[PXExploreLayoutGenerator indexWithinNextItems:having:keyIndex:](self, "indexWithinNextItems:having:keyIndex:", v6 + a3, 0, v6 + a3 - 1);
        if (v9 < a3)
          -[PXExploreLayoutGenerator moveNextItemAtIndex:toIndex:](self, "moveNextItemAtIndex:toIndex:", v9, a3);
      }
    }
  }
  -[PXExploreLayoutGenerator beginRowWithNumberOfColumns:](self, "beginRowWithNumberOfColumns:", 7);
  if (a3 == 7)
  {
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 1, 1);
    v10 = self;
    v11 = 1;
    v12 = 1;
    goto LABEL_11;
  }
  if (a3 == 6)
  {
    v10 = self;
    v11 = 0;
    v12 = 2;
LABEL_11:
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](v10, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v11, 0, v12, 1);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 0, 1, 1);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, 0, 1, 1);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, 0, 1, 1);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, 0, 1, 1);
    -[PXExploreLayoutGenerator addLocalItemWithType:atColumn:row:columnSpan:rowSpan:](self, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 6, 0, 1, 1);
    goto LABEL_15;
  }
  PXAssertGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = 134217984;
    v15 = a3;
    _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "no specs for seven-column short row with %li items", (uint8_t *)&v14, 0xCu);
  }

LABEL_15:
  -[PXExploreLayoutGenerator endRowWithType:](self, "endRowWithType:", 1);
}

- (BOOL)canUseSingleSevenColumnHeroRowForNumberOfRemainingItems:(int64_t)a3
{
  return ((unint64_t)a3 < 0x18) & (0x8CF800u >> a3);
}

uint64_t __121__PXExploreLayoutGenerator_Rows___parseSevenColumnHeroRowWithNumberOfItems_heroItemType_subsequentShortRowItems_options___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, a2, 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 3, a2, 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 4, a2, 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 5, a2, 1, 1);
  return objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 6, a2, 1, 1);
}

uint64_t __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return qword_1A7C0B9F8[3 * a3 + a2];
}

void __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void (*v11)(void *, _QWORD, uint64_t, uint64_t);
  void (*v12)(void *, _QWORD, _QWORD, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void *, _QWORD, _QWORD, uint64_t);
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD aBlock[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  char v35;
  uint64_t v36;
  _QWORD v37[3];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[3];

  v46 = 0;
  v47[0] = &v46;
  v47[1] = 0x2020000000;
  v47[2] = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v36 = 0;
  v37[0] = &v36;
  v37[1] = 0x2020000000;
  v37[2] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_3;
  aBlock[3] = &unk_1E5143210;
  v27 = *(id *)(a1 + 32);
  v28 = &v42;
  v8 = *(_OWORD *)(a1 + 72);
  v33 = *(_OWORD *)(a1 + 56);
  v34 = v8;
  v35 = *(_BYTE *)(a1 + 96);
  v29 = &v38;
  v30 = &v46;
  v31 = &v36;
  v32 = a4;
  v9 = _Block_copy(aBlock);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v9;
  switch(a3)
  {
    case 0:
      v11 = (void (*)(void *, _QWORD, uint64_t, uint64_t))*((_QWORD *)v9 + 2);
      if (a2)
      {
        v11(v9, 0, 1, 0);
        v10[2](v10, 1, 0, 1);
        goto LABEL_8;
      }
      v11(v9, 0, 0, 2);
      v18 = 1;
      v10[2](v10, 1, 1, 0);
      v19 = 0;
      goto LABEL_17;
    case 1:
      v12 = (void (*)(void *, _QWORD, _QWORD, uint64_t))*((_QWORD *)v9 + 2);
      if (a2)
      {
        v12(v9, 0, 0, 1);
        v10[2](v10, 1, 0, 1);
        v10[2](v10, 2, 0, 2);
        v13 = 0;
        v14 = 1;
      }
      else
      {
        v12(v9, 0, 0, 2);
        v10[2](v10, 1, 0, 1);
        v13 = 1;
        v14 = 2;
        v10[2](v10, 2, 0, 1);
      }
      if (*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v13) != *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v14))
        goto LABEL_18;
      v16 = v37;
      v17 = 2;
      break;
    case 2:
      v15 = (void (*)(void *, _QWORD, _QWORD, uint64_t))*((_QWORD *)v9 + 2);
      if (a2)
      {
        v15(v9, 0, 0, 1);
        v10[2](v10, 1, 1, 0);
LABEL_8:
        v10[2](v10, 2, 0, 2);
      }
      else
      {
        v15(v9, 0, 0, 2);
        v19 = 1;
        v10[2](v10, 1, 0, 1);
        v18 = 0;
LABEL_17:
        v10[2](v10, 2, v19, v18);
        a2 = 0;
      }
      goto LABEL_18;
    case 3:
      (*((void (**)(void *, _QWORD, uint64_t, uint64_t))v9 + 2))(v9, 0, 2, 1);
      v10[2](v10, 1, 2, 1);
      v10[2](v10, 2, 2, 1);
      a2 = PXFlippedExploreHeroSide(a2);
      if (!*(_BYTE *)(a1 + 96))
        goto LABEL_18;
      v16 = v47;
      v17 = 1;
      break;
    default:
      goto LABEL_18;
  }
  *(_QWORD *)(*v16 + 24) += v17;
LABEL_18:
  v20 = *(_QWORD *)(a1 + 88);
  v21 = (v20 >> 1) & 1;
  if (a3 == 2)
    LODWORD(v21) = 0;
  v22 = (v20 >> 2) & 1;
  if (!a3)
    LODWORD(v22) = 0;
  v23 = (a4 == 0) | (10
                   * (((v22 | v21 | (unint64_t)(10
                                                                                 * (*(_QWORD *)(v37[0] + 24)
                                                                                  + 10
                                                                                  * (v39[3]
                                                                                   + 10
                                                                                   * (10
                                                                                    * (3 - *(_QWORD *)(v47[0] + 24))
                                                                                    - v43[3])))))
                     + 3000) ^ 1));
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v23 > *(_QWORD *)(v24 + 24))
  {
    *(_QWORD *)(v24 + 24) = v23;
    v25 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
    v25[4] = a2;
    v25[5] = a3;
    v25[6] = a4;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

uint64_t __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t i;
  uint64_t j;

  result = objc_msgSend(*(id *)(a1 + 32), "nextHeroSide");
  if (result == a2 || *(_BYTE *)(a1 + 48))
  {
    for (i = 0; i != 6; ++i)
    {
      if (!i || *(_BYTE *)(a1 + 49))
      {
        for (j = 0; j != 4; ++j)
        {
          if (j == 3)
          {
            result = objc_msgSend(*(id *)(a1 + 32), "lastHeroRowTag");
            if (result == 3)
              break;
          }
          result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
      }
    }
  }
  return result;
}

uint64_t __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
}

uint64_t __95__PXExploreLayoutGenerator_Rows___addThreeItemsToSixColumnRowWithHeroItemType_options_rowType___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a3 == 1)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8 * result) == 1)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (a3 == 2 && *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8 * result) != 2)
LABEL_6:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
LABEL_7:
  if (a4 != 2)
  {
    if (a4 != 1 || *(double *)(*(_QWORD *)(a1 + 88) + 8 * result) <= *(double *)(a1 + 96))
      goto LABEL_20;
    v9 = a1 + 48;
    goto LABEL_19;
  }
  v10 = *(double *)(*(_QWORD *)(a1 + 88) + 8 * result);
  if (v10 > *(double *)(a1 + 96))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(_QWORD *)(v11 + 24);
    if (v10 == *(double *)(a1 + 104))
      v13 = v12 + 3;
    else
      v13 = v12 + 1;
    *(_QWORD *)(v11 + 24) = v13;
  }
  if (*(_BYTE *)(a1 + 112) && result != a2)
  {
    v9 = a1 + 56;
LABEL_19:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24);
  }
LABEL_20:
  if (*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8 * result) == a3)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  return result;
}

uint64_t __119__PXExploreLayoutGenerator_Rows___parseSixColumnHeroRowWithNumberOfItems_heroItemType_subsequentShortRowItems_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "nextItems:isAny:", 4, 8) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "numberOf:withinNextItems:", 4, 4) < 1)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "numberOf:withinNextItems:", 8, 4) == 1
      && objc_msgSend(*(id *)(a1 + 32), "numberOf:withinNextItems:", 4, 4) >= 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "sortNextItems:withItemAtIndex:having:", 4, 0, 1);
      v8 = *(void **)(a1 + 32);
      if (a2)
      {
        objc_msgSend(v8, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, a2, 0, 4, 2);
        objc_msgSend(*(id *)(a1 + 32), "sortNextItems:withItemAtIndex:having:", 3, 2, 2);
        objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, a2, 2, 2, 2);
        objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, a2, 4, 2, 2);
        v4 = *(void **)(a1 + 32);
        v5 = a2 + 2;
        v6 = 2;
        v7 = 4;
        return objc_msgSend(v4, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v5, v6, 2, v7);
      }
      objc_msgSend(v8, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 0, 4, 2);
      objc_msgSend(*(id *)(a1 + 32), "sortNextItems:withItemAtIndex:having:", 3, 0, 2);
      objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 0, 2, 2, 4);
      objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, 2, 2, 2, 2);
      v4 = *(void **)(a1 + 32);
      v5 = 2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "sortNextItems:withItemAtIndex:having:", 4, 0, 1);
      objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, a2, 0, 4, 2);
      objc_msgSend(*(id *)(a1 + 32), "sortNextItems:withItemAtIndex:having:", 3, 1, 2);
      objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, a2, 2, 4, 2);
      objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, a2, 4, 2, 2);
      v4 = *(void **)(a1 + 32);
      v5 = a2 + 2;
    }
    v6 = 4;
    v7 = 2;
    return objc_msgSend(v4, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v5, v6, 2, v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, a2, 0, 2, 3);
  objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, a2 + 2, 0, 2, 3);
  objc_msgSend(*(id *)(a1 + 32), "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, a2, 3, 2, 3);
  v4 = *(void **)(a1 + 32);
  v5 = a2 + 2;
  v6 = 3;
  v7 = 3;
  return objc_msgSend(v4, "addLocalItemWithType:atColumn:row:columnSpan:rowSpan:", 0, v5, v6, 2, v7);
}

void __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void (*v11)(void *, _QWORD, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[7];
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v8 = *(unsigned __int8 *)(a1 + 80);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_2;
  aBlock[3] = &unk_1E5143148;
  v18 = *(_OWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 64);
  v20 = *(_QWORD *)(a1 + 72);
  aBlock[4] = &v29;
  aBlock[5] = &v25;
  aBlock[6] = &v21;
  v9 = _Block_copy(aBlock);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v9;
  v11 = (void (*)(void *, _QWORD, uint64_t, uint64_t))*((_QWORD *)v9 + 2);
  if (a3)
  {
    if (a2)
    {
      v11(v9, a4, 2, 0);
      v12 = 0;
LABEL_6:
      v13 = 1;
      goto LABEL_9;
    }
    v11(v9, a4, 0, 1);
    v13 = 0;
    v12 = 2;
  }
  else
  {
    if (a2)
    {
      v11(v9, a4, 0, 0);
      v12 = 1;
      goto LABEL_6;
    }
    v11(v9, a4, 1, 1);
    v12 = 0;
    v13 = 0;
  }
LABEL_9:
  v10[2](v10, a4 ^ 1, v12, v13);
  v14 = a4 ^ 1 | (10 * ((v8 == a3) | (unint64_t)(10 * (v22[3] + 10 * (v26[3] + 10 * (2 - v30[3]))))));
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v14 > *(_QWORD *)(v15 + 24))
  {
    *(_QWORD *)(v15 + 24) = v14;
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v16 + 32) = a2;
    *(_BYTE *)(v16 + 40) = a3;
    *(_BYTE *)(v16 + 41) = a4;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

void __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4;
  _QWORD v5[6];
  char v6;

  if (objc_msgSend(*(id *)(a1 + 32), "nextHeroSide") == a2
    || objc_msgSend(*(id *)(a1 + 32), "canIgnoreNextHeroSide"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_4;
    v5[3] = &unk_1E5143198;
    v6 = *(_BYTE *)(a1 + 48);
    v4 = *(id *)(a1 + 40);
    v5[4] = v4;
    v5[5] = a2;
    __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_4((uint64_t)v5, 0);
    __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_4((uint64_t)v5, 1);

  }
}

void __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_4(uint64_t a1, int a2)
{
  char v2;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  v2 = a2;
  if (!a2 || *(_BYTE *)(a1 + 48))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_5;
    v6[3] = &unk_1E5143198;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    v8 = v5;
    v9 = v2;
    __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_5((uint64_t)v6, 0);
    __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_5((uint64_t)v6, 1);

  }
}

uint64_t __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 48));
}

uint64_t __85__PXExploreLayoutGenerator_Rows___addTwoItemsForThreeColumnRowPreferringTallVariant___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(result + 56);
  v5 = *(_QWORD *)(v4 + 8 * a2);
  if (a3 == 1 && v5 == 2 || a3 == 2 && v5 == 1 || !a3 && (*(_QWORD *)(*(_QWORD *)(result + 64) + 8 * a2) & 2) != 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  if (a4 == 1 && *(double *)(*(_QWORD *)(result + 72) + 8 * a2) > *(double *)(result + 80))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  if (*(_QWORD *)(v4 + 8 * a2) == a3)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24);
  return result;
}

@end
