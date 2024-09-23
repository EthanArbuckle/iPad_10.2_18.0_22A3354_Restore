@implementation PXMessagesStackItemsLayout

- (PXMessagesStackItemsLayout)init
{
  PXMessagesStackItemsLayout *v2;
  PXMessagesStackItemsLayout *v3;
  PXMessagesStackItemsLayoutHelper *v4;
  PXMessagesStackItemsLayoutHelper *layoutHelper;
  CGSize v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXMessagesStackItemsLayout;
  v2 = -[PXGItemsLayout init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXGItemsLayout setLazy:](v2, "setLazy:", 1);
    v4 = objc_alloc_init(PXMessagesStackItemsLayoutHelper);
    layoutHelper = v3->_layoutHelper;
    v3->_layoutHelper = v4;

    v3->_stackedItemsCount = 2;
    v3->_decorationInfoBySpriteIndexSize = 27;
    v3->_decorationInfoBySpriteIndex = ($153C3A5BC4E016D58A1B9CA554FFC462 *)malloc_type_calloc(0x1BuLL, 8uLL, 0x100004000313F17uLL);
    v3->_primaryItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    v3->_leadingItemsRange = (_NSRange)xmmword_1A7C0C330;
    v3->_trailingItemsRange = (_NSRange)xmmword_1A7C0C330;
    v3->_trailingHiddenItemsRange = (_NSRange)xmmword_1A7C0C330;
    v3->_firstTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
    v3->_secondTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
    v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v3->_desiredLayoutRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v3->_desiredLayoutRect.size = v6;
    v3->_pageFocus = 0.0;
    v3->_archSide = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_decorationInfoBySpriteIndex);
  self->_decorationInfoBySpriteIndex = 0;
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGItemsLayout dealloc](&v3, sel_dealloc);
}

- (double)closestPageOffsetForHorizontalOffset:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v17;
  uint8_t v19[16];

  -[PXGLayout referenceSize](self, "referenceSize");
  v6 = v5;
  -[PXMessagesStackItemsLayout normalizedPageWidth](self, "normalizedPageWidth");
  v8 = v6 * v7;
  if (v8 <= 0.0)
  {
    PXAssertGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Requested page offset for invalid configuration", v19, 2u);
    }

    return 0.0;
  }
  else
  {
    v9 = fmax(a3, 0.0);
    v10 = floor(v9 / v8);
    v11 = v8 * v10;
    v12 = v8 + v8 * v10;
    v13 = v9 - v8 * v10;
    v14 = v12 - v9;
    v15 = (double)-[PXMessagesStackItemsLayout numberOfPages](self, "numberOfPages");
    if (v14 >= v13 || v10 + 1.0 >= v15)
      return v11;
  }
  return v12;
}

- (double)pageOffsetGreaterThanOffset:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v10;
  uint8_t v11[16];

  -[PXGLayout referenceSize](self, "referenceSize");
  v5 = v4;
  -[PXMessagesStackItemsLayout normalizedPageWidth](self, "normalizedPageWidth");
  v7 = v5 * v6;
  if (v7 <= 0.0)
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Requested page offset for invalid configuration", v11, 2u);
    }

    return 0.0;
  }
  else
  {
    -[PXMessagesStackItemsLayout numberOfPages](self, "numberOfPages");
    PXClamp();
    return v7 * v8;
  }
}

- (double)pageOffsetLessThanOffset:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v10;
  uint8_t v11[16];

  -[PXGLayout referenceSize](self, "referenceSize");
  v5 = v4;
  -[PXMessagesStackItemsLayout normalizedPageWidth](self, "normalizedPageWidth");
  v7 = v5 * v6;
  if (v7 <= 0.0)
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Requested page offset for invalid configuration", v11, 2u);
    }

    return 0.0;
  }
  else
  {
    -[PXMessagesStackItemsLayout numberOfPages](self, "numberOfPages");
    PXClamp();
    return v7 * v8;
  }
}

- (BOOL)getHorizontalOffsetForObjectReference:(id)a3 outOffset:(double *)a4
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;

  v6 = -[PXGItemsLayout itemForObjectReference:](self, "itemForObjectReference:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    v8 = v7;
    -[PXMessagesStackItemsLayout normalizedPageWidth](self, "normalizedPageWidth");
    v10 = v8 * v9;
    -[PXGLayout contentSize](self, "contentSize");
    v12 = v11;
    v13 = v10 * (double)v6;
    v14 = -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection");
    v15 = v12 - v13 - v8;
    if (v14 != 1)
      v15 = v13;
    *a4 = v15;
  }
  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (double)overlayAlphaForSpriteIndex:(unsigned int)a3
{
  uint64_t v4;
  void *v7;

  v4 = a3;
  if (self->_decorationInfoBySpriteIndexSize <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayout.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("spriteIndex < _decorationInfoBySpriteIndexSize"));

  }
  return self->_decorationInfoBySpriteIndex[v4].var0;
}

- (double)selectionOverlayAlphaForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v7;

  v3 = *(_QWORD *)&a3;
  if (self->_decorationInfoBySpriteIndexSize <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayout.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("spriteIndex < _decorationInfoBySpriteIndexSize"));

  }
  if (-[PXGItemsLayout itemForSpriteIndex:](self, "itemForSpriteIndex:", v3) == self->_primaryItemIndex)
    return 0.4;
  else
    return self->_decorationInfoBySpriteIndex[v3].var0;
}

- ($9C403407A5B624E1CD2E2AFE16A3B680)tapbackConfigurationForProposedConfiguration:(SEL)a3 spriteIndex:(id *)a4
{
  $9C403407A5B624E1CD2E2AFE16A3B680 *v5;
  objc_class *v7;
  unint64_t v8;
  unint64_t v9;
  double pageFocus;
  $9C403407A5B624E1CD2E2AFE16A3B680 *result;
  _NSRange *p_trailingHiddenItemsRange;
  NSUInteger location;
  NSUInteger v14;
  BOOL v15;
  int64_t firstTrailingHiddenItemWithTapback;
  int *v17;
  unint64_t v18;
  void *v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  NSUInteger length;
  double v24;
  double v25;
  $9C403407A5B624E1CD2E2AFE16A3B680 *v27;
  __n128 v28;
  __n128 v29;
  PXMessagesStackItemsLayoutHelper *layoutHelper;
  uint64_t v31;
  double v32;
  __int128 v33;
  CGFloat v34;
  __int128 v35;
  uint64_t v36;
  double v37;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v40;
  float v41;
  float v42;
  float v43;
  float v44;
  uint64_t v45;

  v5 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v7 = -[PXGItemsLayout itemForSpriteIndex:](self, "itemForSpriteIndex:", a4, *(_QWORD *)&a5);
  v8 = -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection");
  v9 = -[PXMessagesStackItemsLayout stackedItemsCount](self, "stackedItemsCount");
  if (v8 == 1)
    pageFocus = -self->_pageFocus;
  else
    pageFocus = self->_pageFocus;
  if (v7 == (objc_class *)(-[PXMessagesStackItemsLayout primaryItemIndex](self, "primaryItemIndex") - 1))
  {
    PXFloatProgressBetween();
    PXFloatSaturate();
  }
  result = ($9C403407A5B624E1CD2E2AFE16A3B680 *)PXFloatByLinearlyInterpolatingFloats();
  p_trailingHiddenItemsRange = &self->_trailingHiddenItemsRange;
  location = self->_trailingHiddenItemsRange.location;
  v15 = (unint64_t)v7 >= location;
  v14 = (NSUInteger)v7 - location;
  v15 = !v15 || v14 >= self->_trailingHiddenItemsRange.length;
  if (!v15)
  {
    firstTrailingHiddenItemWithTapback = self->_firstTrailingHiddenItemWithTapback;
    v17 = &OBJC_IVAR___PXTripsFeedViewLayoutSpec__isFullScreen;
    if (firstTrailingHiddenItemWithTapback == 0x7FFFFFFFFFFFFFFFLL)
    {
      LODWORD(v36) = (_DWORD)v5;
      v18 = v9;
      -[PXGItemsLayout delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = self->_trailingHiddenItemsRange.length + p_trailingHiddenItemsRange->location;
      v21 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
      if (v20 >= v21)
        v20 = v21;
      v22 = p_trailingHiddenItemsRange->location;
      if ((int64_t)p_trailingHiddenItemsRange->location < v20)
      {
        do
        {
          if (objc_msgSend(v19, "stackItemsLayout:itemHasTapback:", self, v22))
          {
            if (self->_firstTrailingHiddenItemWithTapback != 0x7FFFFFFFFFFFFFFFLL)
            {
              self->_secondTrailingHiddenItemWithTapback = v22;
              break;
            }
            self->_firstTrailingHiddenItemWithTapback = v22;
          }
          ++v22;
        }
        while (v20 != v22);
      }
      if (self->_firstTrailingHiddenItemWithTapback == 0x7FFFFFFFFFFFFFFFLL)
        self->_firstTrailingHiddenItemWithTapback = -1;
      v17 = &OBJC_IVAR___PXTripsFeedViewLayoutSpec__isFullScreen;
      v9 = v18;
      if (self->_secondTrailingHiddenItemWithTapback == 0x7FFFFFFFFFFFFFFFLL)
        self->_secondTrailingHiddenItemWithTapback = -1;

      firstTrailingHiddenItemWithTapback = self->_firstTrailingHiddenItemWithTapback;
      v5 = ($9C403407A5B624E1CD2E2AFE16A3B680 *)v36;
    }
    if (v7 == (objc_class *)firstTrailingHiddenItemWithTapback)
    {
      length = self->_trailingHiddenItemsRange.length;
      if (v7 == (objc_class *)(p_trailingHiddenItemsRange->location + length - 1) && length == 22)
      {
        PXFloatSaturate();
        v25 = v24;
      }
      else if (pageFocus < 0.0 && v7 == (objc_class *)p_trailingHiddenItemsRange->location)
      {
        v25 = 0.0;
      }
      else
      {
        v25 = 1.0;
      }
    }
    else
    {
      v25 = 0.0;
      if (v7 == *(objc_class **)((char *)&self->super.super.super.isa + v17[527]))
      {
        v25 = 1.0;
        if (firstTrailingHiddenItemWithTapback != p_trailingHiddenItemsRange->location
          && firstTrailingHiddenItemWithTapback == p_trailingHiddenItemsRange->location + 1)
        {
          PXFloatSaturate();
        }
      }
    }
    result = ($9C403407A5B624E1CD2E2AFE16A3B680 *)-[PXGItemsLayout spriteIndexForItem:](self, "spriteIndexForItem:", p_trailingHiddenItemsRange->location);
    if ((_DWORD)result != -1 && v25 > 0.0)
    {
      v27 = result;
      if (-[PXMessagesStackItemsLayout primaryItemIndex](self, "primaryItemIndex") || pageFocus <= 0.0)
      {
        layoutHelper = self->_layoutHelper;
        if (layoutHelper)
        {
          if (v8 == 1)
            v31 = 1;
          else
            v31 = (2 * v9) | 1;
          layoutHelper = -[PXMessagesStackItemsLayoutHelper baseGeometryForIndex:visibleRect:](layoutHelper, "baseGeometryForIndex:visibleRect:", v31, self->_desiredVisibleRect.origin.x, self->_desiredVisibleRect.origin.y, self->_desiredVisibleRect.size.width, self->_desiredVisibleRect.size.height);
          v29.n128_u64[0] = 0;
          v28.n128_u64[0] = 0;
        }
        else
        {
          v29.n128_u64[0] = 0;
          v28.n128_u64[0] = 0;
        }
        v37 = MEMORY[0x1A85CD660](layoutHelper, 0.75, v28, v29);
        *((double *)&v33 + 1) = v32;
        *(double *)&v33 = -(v37 * 0.5);
        if (v8 != 1)
          *(double *)&v33 = v37 * 0.5;
        v36 = v33;
        *(double *)&v33 = v32 * -0.5;
        v35 = v33;
        PFMessagesStackLayoutGeometryGetScale();
        memset(&v40, 0, sizeof(v40));
        CGAffineTransformMakeScale(&t1, v34, v34);
        CGAffineTransformMakeRotation(&t2, 0.0);
        CGAffineTransformConcat(&v40, &t1, &t2);
        PXPointAdd();
      }
      else
      {
        -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", v27);
        -[PXGLayout styleForSpriteAtIndex:](self, "styleForSpriteAtIndex:", v27);
        _getSpriteGeometryTransformedTopTrailingCorner(v43, v44);
      }
      -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", v5, v35, v36);
      -[PXGLayout styleForSpriteAtIndex:](self, "styleForSpriteAtIndex:", v5);
      _getSpriteGeometryTransformedTopTrailingCorner(v41, v42);
      PXPointSubtract();
      return ($9C403407A5B624E1CD2E2AFE16A3B680 *)PXPointMultiplyWithFloat();
    }
  }
  return result;
}

- (int64_t)primaryItemIndex
{
  return self->_primaryItemIndex;
}

- (double)primaryItemFocus
{
  double result;

  PXClamp();
  return result;
}

- (double)horizontalContentMargin
{
  PXMessagesStackItemsLayoutHelper *layoutHelper;
  double v4;
  double v5;
  double result;

  layoutHelper = self->_layoutHelper;
  -[PXMessagesStackItemsLayout desiredLayoutRect](self, "desiredLayoutRect");
  -[PXMessagesStackItemsLayoutHelper horizontalContentMarginForReferenceSize:itemAspect:](layoutHelper, "horizontalContentMarginForReferenceSize:itemAspect:", v4, v5, 0.75);
  -[PXGLayout displayScale](self, "displayScale");
  PXFloatRoundToPixel();
  return result;
}

- (double)horizontalContentMarginForSize:(CGSize)a3 normalizedVerticalContentInsets:(double)a4
{
  double height;
  double width;
  void *v8;
  id v9;
  double v10;
  double v11;
  _QWORD v13[5];
  id v14;
  double v15;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "_sharedTemplateLayoutHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__PXMessagesStackItemsLayout_horizontalContentMarginForSize_normalizedVerticalContentInsets___block_invoke;
  v13[3] = &unk_1E5119B90;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v9 = v8;
  objc_msgSend(v9, "performChanges:", v13);
  objc_msgSend(v9, "horizontalContentMarginForReferenceSize:itemAspect:", width, height, 0.75);
  -[PXGLayout displayScale](self, "displayScale");
  PXFloatRoundToPixel();
  v11 = v10;

  return v11;
}

- (void)setLeftEdgeInternalHorizontalAlignment:(double)a3
{
  if (self->_leftEdgeInternalHorizontalAlignment != a3)
  {
    self->_leftEdgeInternalHorizontalAlignment = a3;
    -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
  }
}

- (void)setRightEdgeInternalHorizontalAlignment:(double)a3
{
  if (self->_rightEdgeInternalHorizontalAlignment != a3)
  {
    self->_rightEdgeInternalHorizontalAlignment = a3;
    -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
  }
}

- (void)setDesiredLayoutRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_desiredLayoutRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_desiredLayoutRect = &self->_desiredLayoutRect;
  if (!CGRectEqualToRect(self->_desiredLayoutRect, a3))
  {
    p_desiredLayoutRect->origin.x = x;
    p_desiredLayoutRect->origin.y = y;
    p_desiredLayoutRect->size.width = width;
    p_desiredLayoutRect->size.height = height;
    -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
  }
}

- (void)setIsSettling:(BOOL)a3
{
  if (self->_isSettling != a3)
  {
    self->_isSettling = a3;
    if (!a3)
      self->_higherPageDirectionTolerance = 1;
  }
}

- (void)scrollToBeginning
{
  self->_scrollToBeginning = 1;
  -[PXMessagesStackItemsLayout _invalidateVisibleRect](self, "_invalidateVisibleRect");
}

- (void)reloadAccessoryItems
{
  ++self->_accessorySpriteMediaVersion;
  -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGItemsLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXMessagesStackItemsLayout.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_preItemLoadingFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  p_preItemLoadingFlags = &self->_preItemLoadingFlags;
  self->_preItemLoadingFlags.willPerformUpdate = 0;
  needsUpdate = self->_preItemLoadingFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_preItemLoadingFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout update]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXMessagesStackItemsLayout.m"), 397, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_preItemLoadingFlags.isPerformingUpdate"));

      needsUpdate = p_preItemLoadingFlags->needsUpdate;
    }
    p_preItemLoadingFlags->isPerformingUpdate = 1;
    p_preItemLoadingFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_preItemLoadingFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXMessagesStackItemsLayout _updateContentSize](self, "_updateContentSize");
      if (!p_preItemLoadingFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout update]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXMessagesStackItemsLayout.m"), 401, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_preItemLoadingFlags.isPerformingUpdate"));

      }
    }
    v5 = p_preItemLoadingFlags->needsUpdate;
    p_preItemLoadingFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_preItemLoadingFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXMessagesStackItemsLayout _updateVisibleRect](self, "_updateVisibleRect");
      v5 = p_preItemLoadingFlags->needsUpdate;
    }
    p_preItemLoadingFlags->isPerformingUpdate = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXMessagesStackItemsLayout.m"), 404, CFSTR("still needing to update %lu after update pass"), p_preItemLoadingFlags->needsUpdate);

    }
  }
  -[PXGItemsLayout updateLoadedItemsIfNeeded](self, "updateLoadedItemsIfNeeded");
  -[PXGItemsLayout updateAccessoryItemsIfNeeded](self, "updateAccessoryItemsIfNeeded");
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  v7 = self->_updateFlags.needsUpdate;
  if (v7)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXMessagesStackItemsLayout.m"), 409, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      v7 = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 4;
    if ((v7 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXMessagesStackItemsLayout _updateLayoutHelper](self, "_updateLayoutHelper");
      if (!self->_updateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout update]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXMessagesStackItemsLayout.m"), 413, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v8 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 8uLL;
    if ((v8 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFF7;
      -[PXMessagesStackItemsLayout _updateSprites](self, "_updateSprites");
      v8 = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout update]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXMessagesStackItemsLayout.m"), 416, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGItemsLayout update](&v21, sel_update);
  -[PXMessagesStackItemsLayout _signalDelegatePostUpdate](self, "_signalDelegatePostUpdate");
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGItemsLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXMessagesStackItemsLayout.m"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (int64_t)numberOfPages
{
  int64_t v3;

  v3 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  return -[PXGItemsLayout numberOfAccessoryItems](self, "numberOfAccessoryItems") + v3;
}

- (void)_clearLayoutProperties
{
  self->_leadingItemsRange = (_NSRange)xmmword_1A7C0C330;
  self->_primaryItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_trailingItemsRange = (_NSRange)xmmword_1A7C0C330;
  self->_trailingHiddenItemsRange = (_NSRange)xmmword_1A7C0C330;
  self->_firstTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
  self->_secondTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
  self->_pageFocus = 0.0;
  self->_archSide = 0;
}

- (void)_updateLayoutProperties
{
  unint64_t primaryItemIndex;
  double *p_pageFocus;
  double pageFocus;
  NSUInteger location;
  NSUInteger length;
  double v9;
  double v10;
  double v12;
  unint64_t v14;

  if (!-[PXMessagesStackItemsLayout numberOfPages](self, "numberOfPages"))
  {
    -[PXMessagesStackItemsLayout _clearLayoutProperties](self, "_clearLayoutProperties");
    return;
  }
  primaryItemIndex = self->_primaryItemIndex;
  p_pageFocus = &self->_pageFocus;
  pageFocus = self->_pageFocus;
  location = self->_trailingHiddenItemsRange.location;
  length = self->_trailingHiddenItemsRange.length;
  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXMessagesStackItemsLayout _getItemsForXOffset:leadingItems:primaryItemIndex:trailingItems:trailingHiddenItems:pageFocus:](self, "_getItemsForXOffset:leadingItems:primaryItemIndex:trailingItems:trailingHiddenItems:pageFocus:", &self->_leadingItemsRange, &self->_primaryItemIndex, &self->_trailingItemsRange, &self->_trailingHiddenItemsRange, &self->_pageFocus);
  if (self->_trailingHiddenItemsRange.location != location || self->_trailingHiddenItemsRange.length != length)
  {
    self->_firstTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
    self->_secondTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_primaryItemIndex == primaryItemIndex)
  {
    v9 = *p_pageFocus;
    if (*p_pageFocus == 0.0)
    {
      self->_archSide = 0;
    }
    else
    {
      v10 = dbl_1A7C0C340[!self->_higherPageDirectionTolerance];
      if (v9 <= 0.0 || pageFocus > v10)
      {
        v12 = -v10;
        if (v9 >= 0.0 || pageFocus < v12)
          goto LABEL_23;
        v14 = 1;
      }
      else
      {
        v14 = 2;
      }
      self->_archSide = v14;
    }
  }
  else
  {
    self->_signalDelegateForPrimaryItemChange = 1;
  }
LABEL_23:
  self->_higherPageDirectionTolerance = 0;
}

- (void)_invalidateContentSize
{
  $F40CD077B40800501ED060B808F886F7 *p_preItemLoadingFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_preItemLoadingFlags = &self->_preItemLoadingFlags;
  needsUpdate = self->_preItemLoadingFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_preItemLoadingFlags.isPerformingUpdate)
    {
LABEL_6:
      p_preItemLoadingFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_preItemLoadingFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout _invalidateContentSize]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXMessagesStackItemsLayout.m"), 484, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_preItemLoadingFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_preItemLoadingFlags.willPerformUpdate;
  p_preItemLoadingFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  unint64_t v8;
  double v9;
  double v10;

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  v7 = -[PXMessagesStackItemsLayout numberOfPages](self, "numberOfPages");
  if (v7)
  {
    v8 = v7 - 1;
    -[PXMessagesStackItemsLayout normalizedPageWidth](self, "normalizedPageWidth");
    v10 = (double)v8 * (v4 * v9) + 0.0;
  }
  else
  {
    v10 = 0.0;
  }
  -[PXGLayout setContentSize:](self, "setContentSize:", v4 + v10, v6);
}

- (void)_invalidateVisibleRect
{
  $F40CD077B40800501ED060B808F886F7 *p_preItemLoadingFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_preItemLoadingFlags = &self->_preItemLoadingFlags;
  needsUpdate = self->_preItemLoadingFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_preItemLoadingFlags.isPerformingUpdate)
    {
LABEL_6:
      p_preItemLoadingFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_preItemLoadingFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout _invalidateVisibleRect]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXMessagesStackItemsLayout.m"), 502, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_preItemLoadingFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_preItemLoadingFlags.willPerformUpdate;
  p_preItemLoadingFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateVisibleRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (self->_scrollToBeginning)
  {
    -[PXGLayout contentSize](self, "contentSize");
    if ((PXSizeIsEmpty() & 1) == 0)
    {
      self->_scrollToBeginning = 0;
      -[PXGLayout referenceSize](self, "referenceSize");
      v4 = v3;
      v6 = v5;
      if (-[PXGLayout userInterfaceDirection](self, "userInterfaceDirection") == 1)
      {
        -[PXGLayout contentSize](self, "contentSize");
        v8 = v7 - v4;
        v9 = 0.0;
      }
      else
      {
        v8 = *MEMORY[0x1E0C9D538];
        v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      }
      -[PXGLayout changeVisibleRectToProposedVisibleRect:](self, "changeVisibleRectToProposedVisibleRect:", v8, v9, v4, v6);
    }
  }
}

- (void)_invalidateLayoutHelper
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout _invalidateLayoutHelper]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXMessagesStackItemsLayout.m"), 520, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateLayoutHelper
{
  -[PXMessagesStackItemsLayout _syncPropertiesToLayoutHelper:](self, "_syncPropertiesToLayoutHelper:", self->_layoutHelper);
}

- (void)_syncPropertiesToLayoutHelper:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PXMessagesStackItemsLayout__syncPropertiesToLayoutHelper___block_invoke;
  v3[3] = &unk_1E5119BB8;
  v3[4] = self;
  objc_msgSend(a3, "performChanges:", v3);
}

- (void)_invalidateSprites
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMessagesStackItemsLayout _invalidateSprites]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXMessagesStackItemsLayout.m"), 539, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSprites
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  unint64_t v18;
  unint64_t v19;
  $153C3A5BC4E016D58A1B9CA554FFC462 *v20;
  NSUInteger length;
  int64_t primaryItemIndex;
  double pageFocus;
  int64_t v24;
  int64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  double MaxX;
  double v31;
  CGFloat v32;
  NSUInteger v33;
  double x;
  double y;
  double width;
  double height;
  BOOL IsNull;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  double v50;
  double v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  NSUInteger v55;
  NSUInteger v56;
  unint64_t v57;
  unint64_t v58;
  PXMessagesStackItemsLayoutHelper *layoutHelper;
  uint64_t v60;
  uint64_t *v61;
  __int128 v62;
  __int128 v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  PXMessagesStackItemsLayoutHelper *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BOOL4 v72;
  BOOL v73;
  void *v74;
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  unsigned __int8 v79;
  unsigned __int8 v80;
  int64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  SEL v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  int v93;
  int v94;
  uint64_t v95;
  _BOOL4 v96;
  uint64_t v97;
  NSUInteger v98;
  unint64_t v99;
  unint64_t archSide;
  uint64_t v101;
  double v102;
  unint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  _QWORD v106[6];
  __int16 v107;
  unsigned __int8 v108;
  unsigned __int8 v109;
  BOOL v110;
  _QWORD v111[4];
  _QWORD v112[4];
  id v113;
  PXMessagesStackItemsLayout *v114;
  _QWORD *v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  BOOL v120;
  char v121;
  char v122;
  BOOL v123;
  _QWORD v124[4];
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;
  NSRange v131;
  NSRange v132;
  CGRect v133;
  CGRect v134;

  v130 = *MEMORY[0x1E0C80C00];
  v4 = -[PXGItemsLayout loadedItems](self, "loadedItems");
  v6 = v5;
  v7 = -[PXGItemsLayout numberOfAccessoryItems](self, "numberOfAccessoryItems");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && v6 != 0 || v7 != 0)
  {
    v95 = v4;
    -[PXGLayout visibleRect](self, "visibleRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v99 = -[PXMessagesStackItemsLayout stackedItemsCount](self, "stackedItemsCount");
    v105 = 2 * v99;
    v18 = 2 * v99 + 23;
    v92 = v18 - v6;
    v89 = a2;
    if (v18 < v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", v89, self, CFSTR("PXMessagesStackItemsLayout.m"), 555, CFSTR("We should never have more loaded item sprites than geometries"));

    }
    v19 = -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection");
    v96 = v19 == 1;
    if (v18 > self->_decorationInfoBySpriteIndexSize)
    {
      self->_decorationInfoBySpriteIndexSize = v18;
      v20 = ($153C3A5BC4E016D58A1B9CA554FFC462 *)malloc_type_realloc(self->_decorationInfoBySpriteIndex, 8 * v18, 0x100004000313F17uLL);
      self->_decorationInfoBySpriteIndex = v20;
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", v89, self, CFSTR("PXMessagesStackItemsLayout.m"), 561, CFSTR("Unable to reallocate memory for overlay alphas"));

      }
    }
    length = self->_leadingItemsRange.length;
    primaryItemIndex = self->_primaryItemIndex;
    pageFocus = self->_pageFocus;
    v24 = -[PXMessagesStackItemsLayout numberOfPages](self, "numberOfPages");
    v25 = v24 - 1;
    v98 = length;
    if (primaryItemIndex == 1)
    {
      v26 = pageFocus >= 0.0;
    }
    else if (primaryItemIndex)
    {
      if (v25 == primaryItemIndex)
      {
        v26 = 3;
        if (pageFocus >= 0.0)
          v26 = 4;
      }
      else if (primaryItemIndex == v24 - 2)
      {
        v26 = 4 * (pageFocus < 0.0);
      }
      else
      {
        v26 = 0;
      }
    }
    else
    {
      v26 = 2;
      if (pageFocus < 0.0)
        v26 = 1;
    }
    v101 = v26;
    v27 = -[PXMessagesStackItemsLayout presentationType](self, "presentationType");
    v28 = -[PXMessagesStackItemsLayout mediaKind](self, "mediaKind");
    -[PXGLayout displayScale](self, "displayScale");
    v97 = v29;
    v93 = v28;
    v94 = v27;
    v102 = pageFocus;
    if (v11 >= 0.0
      && (v133.origin.x = v11,
          v133.origin.y = v13,
          v133.size.width = v15,
          v133.size.height = v17,
          MaxX = CGRectGetMaxX(v133),
          -[PXGLayout contentSize](self, "contentSize"),
          MaxX <= v31))
    {
      v32 = v17;
      archSide = self->_archSide;
    }
    else
    {
      v32 = v17;
      archSide = 0;
    }
    v33 = v105 + 3;
    -[PXMessagesStackItemsLayout desiredLayoutRect](self, "desiredLayoutRect");
    x = v134.origin.x;
    y = v134.origin.y;
    width = v134.size.width;
    height = v134.size.height;
    IsNull = CGRectIsNull(v134);
    if (IsNull)
      v39 = v11;
    else
      v39 = v11 + x;
    if (IsNull)
    {
      v40 = v15;
    }
    else
    {
      v13 = v13 + y;
      v40 = width;
    }
    if (IsNull)
      height = v32;
    if (v19 == 1)
      v41 = v25 - primaryItemIndex;
    else
      v41 = primaryItemIndex;
    if (v19 != 1)
      primaryItemIndex = v25 - primaryItemIndex;
    v42 = 0.0;
    v43 = 0.0;
    v44 = v102;
    if (v41 <= 3)
    {
      PXClamp();
      v43 = 1.0 - v45 / 3.0;
    }
    -[PXMessagesStackItemsLayout leftEdgeInternalHorizontalAlignment](self, "leftEdgeInternalHorizontalAlignment");
    v47 = v39 - v46 * v43;
    if (primaryItemIndex <= 3)
    {
      PXClamp();
      v42 = 1.0 - v48 / 3.0;
    }
    v49 = -[PXMessagesStackItemsLayout rightEdgeInternalHorizontalAlignment](self, "rightEdgeInternalHorizontalAlignment");
    v91 = &v88;
    v51 = v47 + v50 * v42;
    self->_desiredVisibleRect.origin.x = v51;
    self->_desiredVisibleRect.origin.y = v13;
    self->_desiredVisibleRect.size.width = v40;
    self->_desiredVisibleRect.size.height = height;
    MEMORY[0x1E0C80A78](v49);
    v103 = v19;
    v104 = &v88 - 2 * v52;
    v53 = v19 == 1;
    v54 = 20;
    if (v19 == 1)
      v55 = 20;
    else
      v55 = 0;
    if (v53)
      v56 = 0;
    else
      v56 = v33;
    v90 = v105 + 2;
    if (v53)
      v57 = 20;
    else
      v57 = v105 + 2;
    v131.location = v55;
    v131.length = v33;
    v132.location = v56;
    v132.length = 20;
    if (NSIntersectionRange(v131, v132).length)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", v89, self, CFSTR("PXMessagesStackItemsLayout.m"), 636, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSIntersectionRange(mainItemsGeometryRange, trailingHiddenItemGeometryRange).length == 0"));

    }
    if (v33 + 20 != v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", v89, self, CFSTR("PXMessagesStackItemsLayout.m"), 637, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mainItemsGeometryRange.length + trailingHiddenItemGeometryRange.length == geometriesCount"));

    }
    v58 = v55 + v33;
    if (v55 + v33 <= v56 + 20)
      v58 = v56 + 20;
    if (v58 > v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", v89, self, CFSTR("PXMessagesStackItemsLayout.m"), 638, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("MAX(NSMaxRange(mainItemsGeometryRange), NSMaxRange(trailingHiddenItemGeometryRange)) <= geometriesCount"));

    }
    if (v57 >= v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", v89, self, CFSTR("PXMessagesStackItemsLayout.m"), 639, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mainItemToCopy < geometriesCount"));

    }
    -[PXMessagesStackItemsLayoutHelper getGeometries:count:forVisibleRect:focus:archSide:keyframeOverride:](self->_layoutHelper, "getGeometries:count:forVisibleRect:focus:archSide:keyframeOverride:", &v104[10 * v55], v33, archSide, v101, v51, v13, v40, height, v44);
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v125 = 0u;
    layoutHelper = self->_layoutHelper;
    if (layoutHelper)
    {
      if (v103 == 1)
        v60 = 0;
      else
        v60 = v90;
      -[PXMessagesStackItemsLayoutHelper baseGeometryForIndex:visibleRect:](layoutHelper, "baseGeometryForIndex:visibleRect:", v60, v51, v13, v40, height);
    }
    if (v56 < v56 + 20)
    {
      v61 = &v104[10 * v56];
      do
      {
        if (v56 >= v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v102 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          objc_msgSend(*(id *)&v102, "handleFailureInMethod:object:file:lineNumber:description:", v89, self, CFSTR("PXMessagesStackItemsLayout.m"), 647, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("i < geometriesCount"));

        }
        v62 = v128;
        *((_OWORD *)v61 + 2) = v127;
        *((_OWORD *)v61 + 3) = v62;
        *((_OWORD *)v61 + 4) = v129;
        v63 = v126;
        *(_OWORD *)v61 = v125;
        *((_OWORD *)v61 + 1) = v63;
        v61 += 10;
        ++v56;
        --v54;
      }
      while (v54);
    }
    v64 = v99 - v98;
    v65 = v105 - (v99 - v98) + 21;
    if (v103 != 1)
      v65 = v64 + 1;
    v66 = &v104[10 * v65];
    v124[0] = 0;
    v124[1] = v124;
    v124[2] = 0x2020000000;
    v124[3] = v66;
    v67 = self->_layoutHelper;
    -[PXGLayout referenceSize](self, "referenceSize");
    -[PXMessagesStackItemsLayoutHelper maxItemSizeForReferenceSize:](v67, "maxItemSizeForReferenceSize:");
    PXSizeScale();
    v69 = v68;
    v71 = v70;
    v72 = -[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 4);
    v73 = v96;
    if (v72)
    {
      -[PXGItemsLayout delegate](self, "delegate");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if (v74)
      {
        v75 = -[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 8);
LABEL_83:
        v76 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") << 32;
        v77 = MEMORY[0x1E0C809B0];
        v112[0] = MEMORY[0x1E0C809B0];
        v112[1] = 3221225472;
        v112[2] = __44__PXMessagesStackItemsLayout__updateSprites__block_invoke;
        v112[3] = &unk_1E5119BE0;
        v116 = v66;
        v117 = v95;
        v78 = v74;
        v113 = v78;
        v114 = self;
        v120 = v75;
        v118 = v69;
        v119 = v71;
        v121 = v94;
        v122 = v93;
        v123 = v73;
        v115 = v124;
        -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v76, v112);
        v79 = -[PXMessagesStackItemsLayout accessoryPresentationType](self, "accessoryPresentationType");
        v80 = -[PXMessagesStackItemsLayout accessoryMediaKind](self, "accessoryMediaKind");
        LOWORD(v76) = self->_accessorySpriteMediaVersion;
        v111[0] = 0;
        v111[1] = v111;
        v111[2] = 0x2020000000;
        v111[3] = v92 + ~v64;
        v81 = -[PXGItemsLayout numberOfAccessoryItems](self, "numberOfAccessoryItems");
        v106[0] = v77;
        v106[1] = 3221225472;
        v106[2] = __44__PXMessagesStackItemsLayout__updateSprites__block_invoke_2;
        v106[3] = &unk_1E5119C08;
        v108 = v79;
        v109 = v80;
        v107 = v76;
        v106[4] = v124;
        v106[5] = v111;
        v110 = v73;
        -[PXGItemsLayout modifyAccessoryItemSpritesInRange:state:](self, "modifyAccessoryItemSpritesInRange:state:", v81 << 32, v106);
        _Block_object_dispose(v111, 8);

        _Block_object_dispose(v124, 8);
        return;
      }
    }
    else
    {
      v74 = 0;
    }
    v75 = 0;
    goto LABEL_83;
  }
}

- (void)_signalDelegatePostUpdate
{
  id v3;

  if (self->_signalDelegateForPrimaryItemChange)
  {
    self->_signalDelegateForPrimaryItemChange = 0;
    -[PXMessagesStackItemsLayout primaryItemDelegate](self, "primaryItemDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "primaryItemDidChangeForStackItemsLayout:", self);

  }
}

- (void)_getItemsForXOffset:(double)a3 leadingItems:(_NSRange *)a4 primaryItemIndex:(unint64_t *)a5 trailingItems:(_NSRange *)a6 trailingHiddenItems:(_NSRange *)a7 pageFocus:(double *)a8
{
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  NSUInteger v33;
  NSUInteger location;
  NSUInteger v35;
  unint64_t v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger length;
  double v40;
  NSRange v41;
  void *v42;
  unint64_t v43;
  unint64_t *v44;
  double *v45;
  NSRange v46;
  NSRange v47;

  v16 = -[PXMessagesStackItemsLayout numberOfPages](self, "numberOfPages");
  if (v16)
  {
    v17 = v16;
    v44 = a5;
    v45 = a8;
    v18 = -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection");
    -[PXGLayout referenceSize](self, "referenceSize");
    v20 = v19;
    -[PXMessagesStackItemsLayout normalizedPageWidth](self, "normalizedPageWidth");
    v22 = v21 * v20;
    -[PXGLayout contentSize](self, "contentSize");
    v24 = v23 - a3 - v20;
    v43 = v18;
    if (v18 != 1)
      v24 = a3;
    v25 = round(v24 / v22);
    PXClamp();
    v27 = v26;
    PXClamp();
    if (v27 < v25)
      v28 = -0.5;
    if (v27 <= v25)
      v29 = v28;
    else
      v29 = 0.5;
    v30 = (unint64_t)v27;
    if (v17 <= (unint64_t)v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v28);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayout.m"), 795, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pageNumber >= 0 && pageNumber < numberOfPages"));

    }
    -[PXMessagesStackItemsLayout stackedItemsCount](self, "stackedItemsCount");
    v31 = -[PXMessagesStackItemsLayout stackedItemsCount](self, "stackedItemsCount");
    if (v31 + 1 < v30)
      v32 = v31 + 1;
    else
      v32 = (unint64_t)v27;
    if (v32)
      v33 = v32;
    else
      v33 = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
    if (v32)
      v35 = v30 - v32;
    else
      v35 = 0x7FFFFFFFFFFFFFFFLL;
    v36 = -[PXMessagesStackItemsLayout stackedItemsCount](self, "stackedItemsCount") + 21;
    if (v36 >= v17 + ~v30)
      v36 = v17 + ~v30;
    if (v36)
      v37 = v36;
    else
      v37 = 0;
    if (v36)
      v38 = v30 + 1;
    else
      v38 = 0x7FFFFFFFFFFFFFFFLL;
    if (v38 == 0x7FFFFFFFFFFFFFFFLL)
    {
      length = 0;
    }
    else
    {
      v46.location = v38 + -[PXMessagesStackItemsLayout stackedItemsCount](self, "stackedItemsCount") - 1;
      v46.length = v37;
      v47.location = v38;
      v47.length = v37;
      v41 = NSIntersectionRange(v46, v47);
      length = v41.length;
      location = v41.location;
    }
    a4->location = v35;
    a4->length = v33;
    *v44 = v30;
    a6->location = v38;
    a6->length = v37;
    v40 = -v29;
    if (v43 != 1)
      v40 = v29;
    a7->location = location;
    a7->length = length;
    a8 = v45;
  }
  else
  {
    *a4 = (_NSRange)xmmword_1A7C0C330;
    *a5 = 0x7FFFFFFFFFFFFFFFLL;
    *a6 = (_NSRange)xmmword_1A7C0C330;
    v40 = 0.0;
  }
  *a8 = v40;
}

- (int64_t)scrollableAxis
{
  return 2;
}

- (BOOL)shouldDecorateUndefinedMediaKind
{
  return 0;
}

- (_NSRange)itemsToLoad
{
  NSRange v3;
  NSRange v4;
  NSUInteger v5;
  NSUInteger primaryItemIndex;
  NSUInteger length;

  -[PXMessagesStackItemsLayout _updateLayoutProperties](self, "_updateLayoutProperties");
  v3.length = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v4.location = 0x7FFFFFFFFFFFFFFFLL;
  if (v3.length)
  {
    v5 = 1;
    if (self->_leadingItemsRange.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      primaryItemIndex = self->_primaryItemIndex;
    }
    else
    {
      v5 = self->_leadingItemsRange.length + 1;
      primaryItemIndex = self->_leadingItemsRange.location;
    }
    if (self->_trailingItemsRange.location == 0x7FFFFFFFFFFFFFFFLL)
      length = 0;
    else
      length = self->_trailingItemsRange.length;
    v4.length = length + v5;
    if (primaryItemIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4.location = primaryItemIndex;
      v3.location = 0;
      return NSIntersectionRange(v4, v3);
    }
  }
  else
  {
    v4.length = 0;
  }
  return v4;
}

- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4 changeMediaVersionHandler:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  objc_super v11;

  v8 = a4;
  v9 = a5;
  v10 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v11.receiver = self;
  v11.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGItemsLayout setNumberOfItems:withChangeDetails:changeMediaVersionHandler:](&v11, sel_setNumberOfItems_withChangeDetails_changeMediaVersionHandler_, a3, v8, v9);

  if (v10 != a3)
    -[PXMessagesStackItemsLayout _clearLayoutProperties](self, "_clearLayoutProperties");
  if (!v8 || objc_msgSend(v8, "hasAnyChanges"))
  {
    -[PXMessagesStackItemsLayout _invalidateContentSize](self, "_invalidateContentSize");
    -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
  }

}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8;
  int64_t v9;
  unsigned int v10;
  id v11;

  v8 = a3;
  v9 = -[PXGItemsLayout itemForObjectReference:options:](self, "itemForObjectReference:options:", v8, a4);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = -1;
  else
    v10 = -[PXGItemsLayout spriteIndexForItem:](self, "spriteIndexForItem:", v9);
  v11 = objc_retainAutorelease(v8);
  *a5 = v11;

  return v10;
}

- (void)numberOfAccessoryItemsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGItemsLayout numberOfAccessoryItemsDidChange](&v3, sel_numberOfAccessoryItemsDidChange);
  -[PXMessagesStackItemsLayout _clearLayoutProperties](self, "_clearLayoutProperties");
  -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
  -[PXMessagesStackItemsLayout _invalidateContentSize](self, "_invalidateContentSize");
}

- (void)accessoryItemsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGItemsLayout accessoryItemsDidChange](&v3, sel_accessoryItemsDidChange);
  -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
  -[PXMessagesStackItemsLayout _invalidateContentSize](self, "_invalidateContentSize");
  -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
  -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
}

- (void)loadedItemsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGItemsLayout loadedItemsDidChange](&v3, sel_loadedItemsDidChange);
  -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
}

- (void)contentSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGLayout contentSizeDidChange](&v3, sel_contentSizeDidChange);
  -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
  -[PXMessagesStackItemsLayout _invalidateVisibleRect](self, "_invalidateVisibleRect");
  -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
}

- (void)userInterfaceDirectionDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  -[PXGLayout userInterfaceDirectionDidChange](&v3, sel_userInterfaceDirectionDidChange);
  -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
  -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
}

- (void)setNormalizedPageWidth:(double)a3
{
  if (self->_normalizedPageWidth != a3)
  {
    self->_normalizedPageWidth = a3;
    -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
    -[PXMessagesStackItemsLayout _invalidateContentSize](self, "_invalidateContentSize");
    -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
  }
}

- (void)setStackedItemsCount:(unint64_t)a3
{
  if (self->_stackedItemsCount != a3)
  {
    self->_stackedItemsCount = a3;
    -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
    -[PXMessagesStackItemsLayout _invalidateLayoutHelper](self, "_invalidateLayoutHelper");
    -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
  }
}

- (void)setNormalizedStackSizeTransform:(double)a3
{
  void *v7;

  if (self->_normalizedStackSizeTransform != a3)
  {
    if (a3 <= 0.0 || a3 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayout.m"), 986, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("normalizedStackSizeTransform > 0.0 && normalizedStackSizeTransform <= 1.0"));

    }
    self->_normalizedStackSizeTransform = a3;
    -[PXMessagesStackItemsLayout _invalidateLayoutHelper](self, "_invalidateLayoutHelper");
  }
}

- (void)setNormalizedStackHorizontalOffsets:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *normalizedStackHorizontalOffsets;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_normalizedStackHorizontalOffsets;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      normalizedStackHorizontalOffsets = self->_normalizedStackHorizontalOffsets;
      self->_normalizedStackHorizontalOffsets = v6;

      -[PXMessagesStackItemsLayout _invalidateLayoutHelper](self, "_invalidateLayoutHelper");
    }
  }

}

- (void)setNormalizedStackVerticalOffset:(double)a3
{
  void *v7;

  if (self->_normalizedStackVerticalOffset != a3)
  {
    if (a3 < 0.0 || a3 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayout.m"), 1003, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("normalizedStackVerticalOffset >= 0.0 && normalizedStackVerticalOffset <= 1.0"));

    }
    self->_normalizedStackVerticalOffset = a3;
    -[PXMessagesStackItemsLayout _invalidateLayoutHelper](self, "_invalidateLayoutHelper");
  }
}

- (void)setNormalizedContentInsets:(double)a3
{
  void *v7;

  if (self->_normalizedContentInsets != a3)
  {
    if (a3 < 0.0 || a3 >= 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayout.m"), 1012, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("normalizedContentInsets >= 0.0 && normalizedContentInsets < 1.0"));

    }
    self->_normalizedContentInsets = a3;
    -[PXMessagesStackItemsLayout _invalidateLayoutHelper](self, "_invalidateLayoutHelper");
  }
}

- (void)setRotationAngle:(double)a3
{
  void *v6;

  if (self->_rotationAngle != a3)
  {
    if (a3 < 0.0 || a3 > 1.57079633)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMessagesStackItemsLayout.m"), 1021, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rotationAngle >= 0.0 && rotationAngle <= (M_PI / 2.0)"));

    }
    self->_rotationAngle = a3;
    -[PXMessagesStackItemsLayout _invalidateLayoutHelper](self, "_invalidateLayoutHelper");
  }
}

- (void)setPresentationType:(unsigned __int8)a3
{
  if (self->_presentationType != a3)
  {
    self->_presentationType = a3;
    -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
  }
}

- (void)setMediaKind:(unsigned __int8)a3
{
  if (self->_mediaKind != a3)
  {
    self->_mediaKind = a3;
    -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
  }
}

- (void)setAccessoryPresentationType:(unsigned __int8)a3
{
  if (self->_accessoryPresentationType != a3)
  {
    self->_accessoryPresentationType = a3;
    -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
  }
}

- (void)setAccessoryMediaKind:(unsigned __int8)a3
{
  if (self->_accessoryMediaKind != a3)
  {
    self->_accessoryMediaKind = a3;
    -[PXMessagesStackItemsLayout _invalidateSprites](self, "_invalidateSprites");
  }
}

- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  return a3;
}

- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (PXMessagesStackItemsLayoutPrimaryItemDelegate)primaryItemDelegate
{
  return (PXMessagesStackItemsLayoutPrimaryItemDelegate *)objc_loadWeakRetained((id *)&self->_primaryItemDelegate);
}

- (void)setPrimaryItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_primaryItemDelegate, a3);
}

- (CGRect)desiredLayoutRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_desiredLayoutRect.origin.x;
  y = self->_desiredLayoutRect.origin.y;
  width = self->_desiredLayoutRect.size.width;
  height = self->_desiredLayoutRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)normalizedPageWidth
{
  return self->_normalizedPageWidth;
}

- (unint64_t)stackedItemsCount
{
  return self->_stackedItemsCount;
}

- (double)normalizedStackSizeTransform
{
  return self->_normalizedStackSizeTransform;
}

- (NSArray)normalizedStackHorizontalOffsets
{
  return self->_normalizedStackHorizontalOffsets;
}

- (double)normalizedStackVerticalOffset
{
  return self->_normalizedStackVerticalOffset;
}

- (double)normalizedContentInsets
{
  return self->_normalizedContentInsets;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (unsigned)mediaKind
{
  return self->_mediaKind;
}

- (unsigned)accessoryPresentationType
{
  return self->_accessoryPresentationType;
}

- (unsigned)accessoryMediaKind
{
  return self->_accessoryMediaKind;
}

- (BOOL)isSettling
{
  return self->_isSettling;
}

- (BOOL)keepItemAspectRatioConstant
{
  return self->_keepItemAspectRatioConstant;
}

- (void)setKeepItemAspectRatioConstant:(BOOL)a3
{
  self->_keepItemAspectRatioConstant = a3;
}

- (double)leftEdgeInternalHorizontalAlignment
{
  return self->_leftEdgeInternalHorizontalAlignment;
}

- (double)rightEdgeInternalHorizontalAlignment
{
  return self->_rightEdgeInternalHorizontalAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedStackHorizontalOffsets, 0);
  objc_destroyWeak((id *)&self->_primaryItemDelegate);
  objc_storeStrong((id *)&self->_layoutHelper, 0);
}

uint64_t __44__PXMessagesStackItemsLayout__updateSprites__block_invoke(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, int8x8_t *a5)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v11;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  float32x4_t v24;
  float64_t v25;
  float64x2_t v26;
  float64_t v27;
  float64x2_t v28;
  double v29;
  float64x2_t v30;
  float v31;
  double v32;
  float64_t v33;
  float64x2_t v34;
  double v35;
  __int8 v36;
  double v37;
  double v38;
  float v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  float32x4_t v52;
  float32x4_t v53;

  v5 = result;
  v6 = HIDWORD(a2);
  v7 = *(_QWORD *)(result + 56);
  if (HIDWORD(a2))
  {
    v11 = a2;
    v52 = *(float32x4_t *)off_1E50B8218;
    __asm { FMOV            V10.2S, #1.0 }
    v50 = *((_OWORD *)off_1E50B83A0 + 3);
    v51 = *((_OWORD *)off_1E50B83A0 + 2);
    v48 = *((_OWORD *)off_1E50B83A0 + 7);
    v49 = *((_OWORD *)off_1E50B83A0 + 6);
    v46 = *((_OWORD *)off_1E50B83A0 + 9);
    v47 = *((_OWORD *)off_1E50B83A0 + 8);
    v44 = *((_OWORD *)off_1E50B83A0 + 5);
    v45 = *((_OWORD *)off_1E50B83A0 + 4);
    __asm { FMOV            V1.4S, #20.0 }
    v42 = *(_OWORD *)off_1E50B83A0;
    v43 = _Q1;
    v41 = *((_OWORD *)off_1E50B83A0 + 1);
    do
    {
      v18 = *(_QWORD *)(v5 + 64);
      v19 = v18 + v11;
      v20 = *(void **)(v5 + 32);
      if (v20)
        objc_msgSend(v20, "itemsLayout:aspectRatioForItem:", *(_QWORD *)(v5 + 40), v18 + v11);
      v21 = PXClamp();
      v23 = v22;
      v24 = v52;
      if (*(_BYTE *)(v5 + 88))
      {
        v21 = objc_msgSend(*(id *)(v5 + 32), "itemsLayout:bestCropRectForItem:withAspectRatio:", *(_QWORD *)(v5 + 40), v19, v23);
        v26.f64[1] = v25;
        v28.f64[1] = v27;
        v24 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v28), v26);
      }
      v53 = v24;
      if (!*(_BYTE *)(*(_QWORD *)(v5 + 40) + 1273))
      {
        v21 = PXFloatByLinearlyInterpolatingFloats();
        v23 = v29;
      }
      v30.f64[0] = MEMORY[0x1A85CD660](v21, v23, *(double *)(v7 + 16), *(double *)(v7 + 24));
      v31 = *(double *)(v7 + 32);
      v32 = v31;
      v30.f64[1] = v33;
      *(_OWORD *)a3 = *(_OWORD *)v7;
      *(double *)(a3 + 16) = v32;
      *(float32x2_t *)(a3 + 24) = vcvt_f32_f64(v30);
      v34 = *(float64x2_t *)(v5 + 72);
      a5->i8[0] = *(_BYTE *)(v5 + 89);
      v35 = *(double *)(v7 + 48);
      if (v35 <= 0.0)
        v36 = 0;
      else
        v36 = *(_BYTE *)(v5 + 90);
      a5->i8[1] = v36;
      LOBYTE(v35) = *(_BYTE *)(v5 + 90);
      LODWORD(v32) = 5;
      a5[1] = vbsl_s8(vdup_lane_s8(vceq_s8(*(int8x8_t *)&v35, *(int8x8_t *)&v32), 0), _D10, (int8x8_t)vcvt_f32_f64(v34));
      *(_OWORD *)(a4 + 32) = v51;
      *(_OWORD *)(a4 + 48) = v50;
      *(_OWORD *)(a4 + 96) = v49;
      *(_OWORD *)(a4 + 112) = v48;
      *(_OWORD *)(a4 + 128) = v47;
      *(_OWORD *)(a4 + 144) = v46;
      *(_OWORD *)(a4 + 64) = v45;
      *(_OWORD *)(a4 + 80) = v44;
      *(_OWORD *)a4 = v42;
      *(_OWORD *)(a4 + 16) = v41;
      *(_OWORD *)(a4 + 36) = v43;
      result = PFMessagesStackLayoutGeometryGetScale();
      *(float *)&v37 = v37;
      v38 = *(double *)(v7 + 48);
      v39 = *(double *)(v7 + 40);
      *(float *)(a4 + 56) = v39;
      *(_DWORD *)(a4 + 60) = LODWORD(v37);
      *(float *)&v37 = v38;
      *(_DWORD *)a4 = LODWORD(v37);
      *(float32x4_t *)(a4 + 4) = v53;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 1256) + 8 * v11) = *(_QWORD *)(v7 + 56);
      if (*(_BYTE *)(v5 + 91))
        v40 = -80;
      else
        v40 = 80;
      v7 += v40;
      ++v11;
      a3 += 32;
      a5 += 5;
      a4 += 160;
      LODWORD(v6) = v6 - 1;
    }
    while ((_DWORD)v6);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 24) = v7;
  return result;
}

uint64_t __44__PXMessagesStackItemsLayout__updateSprites__block_invoke_2(uint64_t result, unint64_t a2, float32x2_t *a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  float32x2_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v18;
  uint64_t v19;
  float64x2_t v20;
  float64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double v27;
  double v28;
  float v29;
  float v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v7 = result;
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
    v9 = a3 + 3;
    v10 = a5 + 8;
    v38 = *((_OWORD *)off_1E50B8398 + 1);
    v39 = *(_OWORD *)off_1E50B8398;
    v11 = *((_QWORD *)off_1E50B8398 + 4);
    __asm
    {
      FMOV            V8.2S, #1.0
      FMOV            V0.4S, #20.0
    }
    v37 = _Q0;
    do
    {
      *(_OWORD *)(v10 - 8) = v39;
      *(_OWORD *)(v10 + 8) = v38;
      *(_QWORD *)(v10 + 24) = v11;
      *(_BYTE *)(v10 - 8) = *(_BYTE *)(v7 + 50);
      *(_BYTE *)(v10 - 7) = *(_BYTE *)(v7 + 51);
      *(_WORD *)(v10 + 24) = *(_WORD *)(v7 + 48);
      v18 = *(_QWORD *)(*(_QWORD *)(v7 + 40) + 8);
      v19 = *(_QWORD *)(v18 + 24);
      if (v19)
      {
        *(_QWORD *)(v18 + 24) = v19 - 1;
        v20.f64[0] = MEMORY[0x1A85CD660](0.75, *(double *)(v8 + 16), *(double *)(v8 + 24));
        v20.f64[1] = v21;
        *(float *)&v21 = *(double *)(v8 + 32);
        *(_OWORD *)v9[-3].f32 = *(_OWORD *)v8;
        *(double *)&v9[-1] = *(float *)&v21;
        *v9 = vcvt_f32_f64(v20);
        *(_QWORD *)v10 = _D8;
        v22 = *((_OWORD *)off_1E50B83A0 + 3);
        *(_OWORD *)(a4 + 32) = *((_OWORD *)off_1E50B83A0 + 2);
        *(_OWORD *)(a4 + 48) = v22;
        v23 = *((_OWORD *)off_1E50B83A0 + 7);
        *(_OWORD *)(a4 + 96) = *((_OWORD *)off_1E50B83A0 + 6);
        *(_OWORD *)(a4 + 112) = v23;
        v24 = *((_OWORD *)off_1E50B83A0 + 9);
        *(_OWORD *)(a4 + 128) = *((_OWORD *)off_1E50B83A0 + 8);
        *(_OWORD *)(a4 + 144) = v24;
        v25 = *((_OWORD *)off_1E50B83A0 + 5);
        *(_OWORD *)(a4 + 64) = *((_OWORD *)off_1E50B83A0 + 4);
        *(_OWORD *)(a4 + 80) = v25;
        v26 = *((_OWORD *)off_1E50B83A0 + 1);
        *(_OWORD *)a4 = *(_OWORD *)off_1E50B83A0;
        *(_OWORD *)(a4 + 16) = v26;
        *(_OWORD *)(a4 + 36) = v37;
        result = PFMessagesStackLayoutGeometryGetScale();
        *(float *)&v27 = v27;
        v28 = *(double *)(v8 + 48);
        v29 = *(double *)(v8 + 40);
        *(float *)(a4 + 56) = v29;
        *(_DWORD *)(a4 + 60) = LODWORD(v27);
        v30 = v28;
      }
      else
      {
        v31 = *((_OWORD *)off_1E50B83A0 + 7);
        *(_OWORD *)(a4 + 96) = *((_OWORD *)off_1E50B83A0 + 6);
        *(_OWORD *)(a4 + 112) = v31;
        v32 = *((_OWORD *)off_1E50B83A0 + 9);
        *(_OWORD *)(a4 + 128) = *((_OWORD *)off_1E50B83A0 + 8);
        *(_OWORD *)(a4 + 144) = v32;
        v33 = *((_OWORD *)off_1E50B83A0 + 3);
        *(_OWORD *)(a4 + 32) = *((_OWORD *)off_1E50B83A0 + 2);
        *(_OWORD *)(a4 + 48) = v33;
        v34 = *((_OWORD *)off_1E50B83A0 + 5);
        *(_OWORD *)(a4 + 64) = *((_OWORD *)off_1E50B83A0 + 4);
        *(_OWORD *)(a4 + 80) = v34;
        v35 = *((_OWORD *)off_1E50B83A0 + 1);
        *(_OWORD *)a4 = *(_OWORD *)off_1E50B83A0;
        *(_OWORD *)(a4 + 16) = v35;
        v30 = 0.0;
      }
      *(float *)a4 = v30;
      a4 += 160;
      if (*(_BYTE *)(v7 + 52))
        v36 = -80;
      else
        v36 = 80;
      v8 += v36;
      v9 += 4;
      v10 += 40;
      LODWORD(v5) = v5 - 1;
    }
    while ((_DWORD)v5);
  }
  return result;
}

void __60__PXMessagesStackItemsLayout__syncPropertiesToLayoutHelper___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setStackedItemsCount:", objc_msgSend(v3, "stackedItemsCount"));
  objc_msgSend(*(id *)(a1 + 32), "normalizedStackSizeTransform");
  objc_msgSend(v5, "setNormalizedStackSizeTransform:");
  objc_msgSend(*(id *)(a1 + 32), "normalizedStackHorizontalOffsets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNormalizedStackHorizontalOffsets:", v4);

  objc_msgSend(*(id *)(a1 + 32), "normalizedStackVerticalOffset");
  objc_msgSend(v5, "setNormalizedStackVerticalOffset:");
  objc_msgSend(*(id *)(a1 + 32), "normalizedContentInsets");
  objc_msgSend(v5, "setNormalizedContentInsets:");
  objc_msgSend(*(id *)(a1 + 32), "rotationAngle");
  objc_msgSend(v5, "setRotationAngle:");

}

void __93__PXMessagesStackItemsLayout_horizontalContentMarginForSize_normalizedVerticalContentInsets___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_syncPropertiesToLayoutHelper:", v4);
  objc_msgSend(v5, "setNormalizedContentInsets:", *(double *)(a1 + 48));

}

+ (id)_sharedTemplateLayoutHelper
{
  if (_sharedTemplateLayoutHelper_onceToken != -1)
    dispatch_once(&_sharedTemplateLayoutHelper_onceToken, &__block_literal_global_22617);
  return (id)_sharedTemplateLayoutHelper__layoutHelper;
}

void __57__PXMessagesStackItemsLayout__sharedTemplateLayoutHelper__block_invoke()
{
  PXMessagesStackItemsLayoutHelper *v0;
  void *v1;

  v0 = objc_alloc_init(PXMessagesStackItemsLayoutHelper);
  v1 = (void *)_sharedTemplateLayoutHelper__layoutHelper;
  _sharedTemplateLayoutHelper__layoutHelper = (uint64_t)v0;

}

@end
