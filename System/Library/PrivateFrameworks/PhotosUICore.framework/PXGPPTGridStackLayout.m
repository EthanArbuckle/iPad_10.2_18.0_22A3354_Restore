@implementation PXGPPTGridStackLayout

- (PXGPPTGridStackLayout)initWithSettings:(id)a3
{
  id v4;
  PXGPPTGridStackLayout *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  uint64_t v10;
  UIColor *spriteColor;

  v4 = a3;
  v5 = -[PXGStackLayout init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "numberOfSections");
    v5->_numberOfItemsPerSection = (v6 + objc_msgSend(v4, "numberOfItems") - 1) / v6;
    v5->_numberOfColumns = objc_msgSend(v4, "numberOfColumns");
    v5->_useAssetBadgeDecoration = objc_msgSend(v4, "useAssetBadgeDecoration");
    v7 = objc_msgSend(v4, "selectionDecorationStlye");
    v5->_selectionDecorationStyle = v7;
    v8 = !v5->_useAssetBadgeDecoration && v7 == 0;
    v9 = !v8;
    v5->_decorated = v9;
    v5->_estimatedNumberOfRowsPerSection = (v5->_numberOfItemsPerSection + v5->_numberOfColumns - 1)
                                         / v5->_numberOfColumns;
    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v10 = objc_claimAutoreleasedReturnValue();
    spriteColor = v5->_spriteColor;
    v5->_spriteColor = (UIColor *)v10;

    -[PXGPPTGridStackLayout _initializeSelectedItems](v5, "_initializeSelectedItems");
    -[PXGPPTGridStackLayout _initializeBadgeInfos](v5, "_initializeBadgeInfos");
    -[PXGStackLayout setAxis:](v5, "setAxis:", 1);
    -[PXGStackLayout setInterlayoutSpacing:](v5, "setInterlayoutSpacing:", 50.0);
    -[PXGStackLayout insertSublayoutProvider:inRange:](v5, "insertSublayoutProvider:inRange:", v5, 0, v6);
  }

  return v5;
}

- (void)_initializeSelectedItems
{
  id v3;
  int64_t v4;
  NSIndexSet *v5;
  NSIndexSet *selectedItemsPerSection;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v7 = v3;
  if (self->_numberOfItemsPerSection >= 1)
  {
    v4 = 0;
    do
    {
      objc_msgSend(v7, "addIndexesInRange:", v4, 4);
      v3 = v7;
      v4 += 5;
    }
    while (v4 < self->_numberOfItemsPerSection);
  }
  v5 = (NSIndexSet *)objc_msgSend(v3, "copy");
  selectedItemsPerSection = self->_selectedItemsPerSection;
  self->_selectedItemsPerSection = v5;

}

- (void)_initializeBadgeInfos
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  int64_t *p_count;
  __int128 v6;
  int64_t v7;
  int v8;
  double v9;

  v2 = 0;
  v3 = *(_QWORD *)off_1E50B7E20;
  v4 = *((double *)off_1E50B7E20 + 1);
  p_count = &self->_assetBadgeInfos[0].count;
  v6 = *((_OWORD *)off_1E50B7E20 + 1);
  do
  {
    v7 = v3 | ((v2 & 1) == 0);
    v8 = 3 * ((1431655766 * (unint64_t)v2) >> 32);
    if (v2 == v8)
      v7 |= 2uLL;
    v9 = 42.0;
    if (v2 - v8 != 1)
      v9 = v4;
    if ((v2 & 3) == 0)
      v7 |= 0x20uLL;
    *(p_count - 2) = v7;
    *((double *)p_count - 1) = v9;
    *(_OWORD *)p_count = v6;
    p_count += 4;
    ++v2;
  }
  while (v2 != 12);
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result
{
  double v5;

  v5 = result.width / (double)self->_numberOfColumns * (double)self->_estimatedNumberOfRowsPerSection;
  result.height = v5;
  return result;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  PXGGridLayout *v5;
  PXGGridLayout *v6;
  _BOOL4 decorated;
  PXGDecoratingLayout *v8;

  v5 = objc_alloc_init(PXGGridLayout);
  -[PXGLayout setContentSource:](v5, "setContentSource:", self);
  -[PXGGridLayout setNumberOfColumns:](v5, "setNumberOfColumns:", self->_numberOfColumns);
  -[PXGItemsLayout setNumberOfItems:](v5, "setNumberOfItems:", self->_numberOfItemsPerSection);
  -[PXGGridLayout setMediaKind:](v5, "setMediaKind:", 5);
  -[PXGItemsLayout setLazy:](v5, "setLazy:", 1);
  v6 = v5;
  decorated = self->_decorated;
  v8 = (PXGDecoratingLayout *)v6;
  if (decorated)
  {
    v8 = -[PXGDecoratingLayout initWithDecoratedLayout:]([PXGDecoratingLayout alloc], "initWithDecoratedLayout:", v6);

  }
  return v8;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return self->_spriteColor;
}

- (BOOL)wantsAssetBadgeDecorationsInLayout:(id)a3
{
  return self->_useAssetBadgeDecoration;
}

- (BOOL)wantsInteractiveFavoriteBadgesInLayout:(id)a3
{
  return self->_useAssetBadgeDecoration;
}

- (BOOL)wantsFileSizeBadgesInLayout:(id)a3
{
  return 0;
}

- (PXGAssetDecorationInfo)assetDecorationInfoForAsset:(SEL)a3 atSpriteIndex:(id)a4 inLayout:(unsigned int)a5
{
  PXGAssetDecorationInfo *v6;
  double var1;

  v6 = &self[a5 % 0xC + 36];
  var1 = v6->var1;
  retstr->var0 = v6->var0;
  retstr->var1 = var1;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&v6->var2;
  return self;
}

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  return self->_selectionDecorationStyle;
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  return 0;
}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  return self->_selectedItemsPerSection;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v4 = *(float *)off_1E50B8290;
  v5 = *((float *)off_1E50B8290 + 1);
  v6 = *((float *)off_1E50B8290 + 2);
  v7 = *((float *)off_1E50B8290 + 3);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedItemsPerSection, 0);
  objc_storeStrong((id *)&self->_spriteColor, 0);
}

@end
