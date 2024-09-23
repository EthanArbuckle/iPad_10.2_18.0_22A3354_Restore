@implementation PUSectionedGridLayoutData

- (PUSectionedGridLayoutData)init
{
  PUSectionedGridLayoutData *v2;
  PUSectionedGridLayoutData *v3;
  uint64_t v4;
  NSMutableArray *headerLayoutAttributes;
  uint64_t v6;
  NSMutableDictionary *headerLayoutAttributesByVisualSection;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUSectionedGridLayoutData;
  v2 = -[PUSectionedGridLayoutData init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numberOfPagesToCache = 2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    headerLayoutAttributes = v3->_headerLayoutAttributes;
    v3->_headerLayoutAttributes = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    headerLayoutAttributesByVisualSection = v3->_headerLayoutAttributesByVisualSection;
    v3->_headerLayoutAttributesByVisualSection = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void)invalidate
{
  CGSize v3;
  NSMutableArray *v4;
  NSMutableArray *headerLayoutAttributes;
  NSMutableDictionary *v6;
  NSMutableDictionary *headerLayoutAttributesByVisualSection;

  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_currentContentBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_currentContentBounds.size = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  headerLayoutAttributes = self->_headerLayoutAttributes;
  self->_headerLayoutAttributes = v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  headerLayoutAttributesByVisualSection = self->_headerLayoutAttributesByVisualSection;
  self->_headerLayoutAttributesByVisualSection = v6;

}

- (int64_t)numberOfPagesToCache
{
  return self->_numberOfPagesToCache;
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

- (NSMutableArray)headerLayoutAttributes
{
  return self->_headerLayoutAttributes;
}

- (NSMutableDictionary)headerLayoutAttributesByVisualSection
{
  return self->_headerLayoutAttributesByVisualSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLayoutAttributesByVisualSection, 0);
  objc_storeStrong((id *)&self->_headerLayoutAttributes, 0);
}

@end
