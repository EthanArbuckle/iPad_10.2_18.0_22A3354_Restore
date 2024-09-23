@implementation PUCollectionViewData

- (PUCollectionViewData)init
{
  PUCollectionViewData *v2;
  PUCollectionViewData *v3;
  uint64_t v4;
  NSMutableArray *itemLayoutAttributes;
  uint64_t v6;
  NSMutableDictionary *itemLayoutAttributesByIndexPath;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUCollectionViewData;
  v2 = -[PUCollectionViewData init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cachedPageCount = 2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    itemLayoutAttributes = v3->_itemLayoutAttributes;
    v3->_itemLayoutAttributes = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    itemLayoutAttributesByIndexPath = v3->_itemLayoutAttributesByIndexPath;
    v3->_itemLayoutAttributesByIndexPath = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void)invalidate
{
  CGSize v3;
  NSMutableArray *v4;
  NSMutableArray *itemLayoutAttributes;
  NSMutableDictionary *v6;
  NSMutableDictionary *itemLayoutAttributesByIndexPath;

  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_currentContentBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_currentContentBounds.size = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  itemLayoutAttributes = self->_itemLayoutAttributes;
  self->_itemLayoutAttributes = v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  itemLayoutAttributesByIndexPath = self->_itemLayoutAttributesByIndexPath;
  self->_itemLayoutAttributesByIndexPath = v6;

}

- (BOOL)hasReferenceIndexPath
{
  return -[NSMutableArray count](self->_itemLayoutAttributes, "count") != 0;
}

- (int64_t)cachedPageCount
{
  return self->_cachedPageCount;
}

- (CGRect)currentContentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentContentBounds.origin.x;
  y = self->_currentContentBounds.origin.y;
  width = self->_currentContentBounds.size.width;
  height = self->_currentContentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentContentBounds:(CGRect)a3
{
  self->_currentContentBounds = a3;
}

- (NSMutableArray)itemLayoutAttributes
{
  return self->_itemLayoutAttributes;
}

- (NSMutableDictionary)itemLayoutAttributesByIndexPath
{
  return self->_itemLayoutAttributesByIndexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemLayoutAttributesByIndexPath, 0);
  objc_storeStrong((id *)&self->_itemLayoutAttributes, 0);
}

@end
