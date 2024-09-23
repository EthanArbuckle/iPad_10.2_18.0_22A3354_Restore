@implementation PUStackedAlbumLayout

- (int64_t)zIndexForItemAtIndexPath:(id)a3
{
  id v4;
  NSMutableDictionary *zIndexByIndexPath;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  zIndexByIndexPath = self->_zIndexByIndexPath;
  if (zIndexByIndexPath)
  {
    v6 = zIndexByIndexPath;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v7 = self->_zIndexByIndexPath;
  self->_zIndexByIndexPath = v6;

  -[NSMutableDictionary objectForKey:](self->_zIndexByIndexPath, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "integerValue");
  }
  else
  {
    -[PUStackedAlbumLayout visibleStackedItemLayoutAttributes](self, "visibleStackedItemLayoutAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __49__PUStackedAlbumLayout_zIndexForItemAtIndexPath___block_invoke;
    v25[3] = &unk_1E58A8250;
    v12 = v4;
    v26 = v12;
    v13 = objc_msgSend(v11, "indexOfObjectPassingTest:", v25);

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PUStackedAlbumLayout visibleStackedItemLayoutAttributes](self, "visibleStackedItemLayoutAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      v10 = objc_msgSend(v12, "item");
      if (v15 < 2)
        goto LABEL_9;
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "indexPath");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "item");
      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "indexPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "item");

      if (v23 < v21)
LABEL_9:
        v10 = (v15 + v10) ^ 0x7FFFFFFFFFFFFFFFLL;

    }
    else
    {
      v10 = v13 ^ 0x7FFFFFFFFFFFFFFFLL;
    }
    v18 = self->_zIndexByIndexPath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v19, v12);

  }
  return v10;
}

- (id)_newAdjustedLayoutAttributes:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v8, "setZIndex:", -[PUStackedAlbumLayout zIndexForItemAtIndexPath:](self, "zIndexForItemAtIndexPath:", v6));
  objc_msgSend(v7, "center");
  v10 = v9;
  v12 = v11;

  -[PUStackedAlbumLayout yAdjust](self, "yAdjust");
  objc_msgSend(v8, "setCenter:", v10, v12 + v13);
  objc_msgSend(v8, "setIndexPath:", v6);

  return v8;
}

- (CGSize)collectionViewContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[PUStackedAlbumLayout contentSizeAdjust](self, "contentSizeAdjust");
  v5 = v4;
  v6 = v3;
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[PUStackedAlbumLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v5 = v9;
    v6 = v10;

  }
  v11 = v5;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)prepareLayout
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *visibleLayoutAttributesByIndexPath;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *derivedLayoutAttributesByIndexPath;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PUStackedAlbumLayout visibleStackedItemLayoutAttributes](self, "visibleStackedItemLayoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_visibleLayoutAttributesByIndexPath)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    visibleLayoutAttributesByIndexPath = self->_visibleLayoutAttributesByIndexPath;
    self->_visibleLayoutAttributesByIndexPath = v4;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "indexPath", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](self->_visibleLayoutAttributesByIndexPath, "setObject:forKey:", v11, v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  if (!self->_derivedLayoutAttributesByIndexPath)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    derivedLayoutAttributesByIndexPath = self->_derivedLayoutAttributesByIndexPath;
    self->_derivedLayoutAttributesByIndexPath = v13;

  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStackedAlbumLayout yAdjust](self, "yAdjust");
  v10 = v9;
  -[PUStackedAlbumLayout visibleStackedItemLayoutAttributes](self, "visibleStackedItemLayoutAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PUStackedAlbumLayout_layoutAttributesForElementsInRect___block_invoke;
  v16[3] = &unk_1E58A8278;
  v18 = v10;
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  v16[4] = self;
  v12 = v8;
  v17 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v16);

  v13 = v17;
  v14 = v12;

  return v14;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_derivedLayoutAttributesByIndexPath, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSMutableDictionary objectForKey:](self->_visibleLayoutAttributesByIndexPath, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[PUStackedAlbumLayout referenceItemLayoutAttributes](self, "referenceItemLayoutAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = -[PUStackedAlbumLayout _newAdjustedLayoutAttributes:indexPath:](self, "_newAdjustedLayoutAttributes:indexPath:", v6, v4);

    -[NSMutableDictionary setObject:forKey:](self->_derivedLayoutAttributesByIndexPath, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("PUGridGlobalHeader")))
  {
    -[PUStackedAlbumLayout globalHeaderAttributes](self, "globalHeaderAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUStackedAlbumLayout referenceCenter](self, "referenceCenter");
    objc_msgSend(v8, "setCenter:");
  }
  objc_msgSend(v8, "setAlpha:", 0.0);

  return v8;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  void *v5;
  void *v6;

  +[PULayoutAnimationsHelper stackedTransitionAnimationsForReusableView:toLayoutAttributes:shouldUseSpringAnimations:](PULayoutAnimationsHelper, "stackedTransitionAnimationsForReusableView:toLayoutAttributes:shouldUseSpringAnimations:", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _Block_copy(v5);

  return v6;
}

- (UICollectionViewLayoutAttributes)globalHeaderAttributes
{
  return self->_globalHeaderAttributes;
}

- (void)setGlobalHeaderAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_globalHeaderAttributes, a3);
}

- (NSArray)visibleStackedItemLayoutAttributes
{
  return self->_visibleStackedItemLayoutAttributes;
}

- (void)setVisibleStackedItemLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (UICollectionViewLayoutAttributes)referenceItemLayoutAttributes
{
  return self->_referenceItemLayoutAttributes;
}

- (void)setReferenceItemLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (CGPoint)referenceCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_referenceCenter.x;
  y = self->_referenceCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setReferenceCenter:(CGPoint)a3
{
  self->_referenceCenter = a3;
}

- (double)yAdjust
{
  return self->_yAdjust;
}

- (void)setYAdjust:(double)a3
{
  self->_yAdjust = a3;
}

- (CGSize)contentSizeAdjust
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSizeAdjust.width;
  height = self->_contentSizeAdjust.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSizeAdjust:(CGSize)a3
{
  self->_contentSizeAdjust = a3;
}

- (PUAlbumListTransitionContext)albumListTransitionContext
{
  return self->_albumListTransitionContext;
}

- (void)setAlbumListTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_albumListTransitionContext, a3);
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_isInteractive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumListTransitionContext, 0);
  objc_storeStrong((id *)&self->_referenceItemLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_visibleStackedItemLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_globalHeaderAttributes, 0);
  objc_storeStrong((id *)&self->_zIndexByIndexPath, 0);
  objc_storeStrong((id *)&self->_derivedLayoutAttributesByIndexPath, 0);
  objc_storeStrong((id *)&self->_visibleLayoutAttributesByIndexPath, 0);
}

void __58__PUStackedAlbumLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  CGRect v10;

  v9 = a2;
  objc_msgSend(v9, "frame");
  v10.origin.x = v3;
  v10.size.width = v4;
  v10.size.height = v5;
  v10.origin.y = *(double *)(a1 + 48) + v6;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v10))
  {
    objc_msgSend(v9, "indexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newAdjustedLayoutAttributes:indexPath:", v9, v7);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

  }
}

uint64_t __49__PUStackedAlbumLayout_zIndexForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
