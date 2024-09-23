@implementation PULayoutSectionListSampler

- (PULayoutSectionListSampler)initWithNumberOfVisibleItems:(int64_t)a3 numberOfRealItems:(int64_t)a4
{
  PULayoutSectionListSampler *v6;
  PULayoutSectionListSampler *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PULayoutSectionListSampler;
  v6 = -[PULayoutSectionListSampler init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_numberOfVisibleItems = a3;
    v6->_numberOfRealItems = a4;
    v6->_visibleItemIndexes = (int64_t *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    v7->_lastSeenUnsampledIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7->_lastSeenTopUnsampledIndex = 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_visibleItemIndexes);
  v3.receiver = self;
  v3.super_class = (Class)PULayoutSectionListSampler;
  -[PULayoutSectionListSampler dealloc](&v3, sel_dealloc);
}

- (int64_t)visibleItemIndexes
{
  return self->_visibleItemIndexes;
}

- (int64_t)indexForUnsampledIndex:(int64_t)a3 isMainItem:(BOOL *)a4
{
  int64_t *visibleItemIndexes;
  int64_t v9;
  int64_t result;
  int64_t lastSeenUnsampledIndex;
  int64_t v12;
  BOOL v13;
  void *v14;

  if (a3 < 0 || self->_numberOfRealItems <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayoutSectioning.m"), 656, CFSTR("Invalid unsampled index %ld for %ld real items"), a3, self->_numberOfRealItems);

  }
  visibleItemIndexes = self->_visibleItemIndexes;
  v9 = *visibleItemIndexes;
  if (*visibleItemIndexes >= a3)
  {
    result = 0;
LABEL_8:
    if (a4)
      *a4 = v9 == a3;
    return result;
  }
  result = self->_numberOfVisibleItems - 1;
  v9 = visibleItemIndexes[result];
  if (v9 <= a3)
    goto LABEL_8;
  lastSeenUnsampledIndex = self->_lastSeenUnsampledIndex;
  if (lastSeenUnsampledIndex > a3)
  {
LABEL_6:
    result = 0;
    goto LABEL_16;
  }
  result = self->_lastSeenSampledIndex;
  if (self->_lastSeenTopUnsampledIndex > a3)
  {
    if (a4)
      *a4 = lastSeenUnsampledIndex == a3;
    if (result != 0x7FFFFFFFFFFFFFFFLL)
      return result;
    goto LABEL_6;
  }
  ++result;
LABEL_16:
  self->_lastSeenTopUnsampledIndex = 0;
  while (1)
  {
    if (result >= self->_numberOfVisibleItems)
    {
      result = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_27;
    }
    v12 = visibleItemIndexes[result];
    if (v12 == a3)
    {
      self->_lastSeenUnsampledIndex = a3;
      self->_lastSeenTopUnsampledIndex = visibleItemIndexes[result + 1];
      if (!a4)
        goto LABEL_27;
      v13 = 1;
      goto LABEL_26;
    }
    if (v12 > a3)
      break;
    self->_lastSeenUnsampledIndex = v12;
    ++result;
  }
  self->_lastSeenTopUnsampledIndex = v12;
  --result;
  if (!a4)
    goto LABEL_27;
  v13 = 0;
LABEL_26:
  *a4 = v13;
LABEL_27:
  self->_lastSeenSampledIndex = result;
  return result;
}

- (int64_t)unsampledIndexForIndex:(int64_t)a3
{
  return self->_visibleItemIndexes[a3];
}

- (void)enumerateUnsampledIndexesForSampledIndexInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger location;
  NSUInteger v7;
  BOOL v8;
  char v9;

  v9 = 0;
  if ((uint64_t)a3.location < (int64_t)(a3.location + a3.length))
  {
    location = a3.location;
    v7 = a3.length - 1;
    do
    {
      (*((void (**)(id, NSUInteger, int64_t, char *))a4 + 2))(a4, location, self->_visibleItemIndexes[location], &v9);
      ++location;
      if (v9)
        v8 = 1;
      else
        v8 = v7 == 0;
      --v7;
    }
    while (!v8);
  }
}

- (void)dumpInternalMemory
{
  int64_t numberOfVisibleItems;
  int64_t numberOfRealItems;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexes:count:", self->_visibleItemIndexes, self->_numberOfVisibleItems);
  numberOfVisibleItems = self->_numberOfVisibleItems;
  numberOfRealItems = self->_numberOfRealItems;
  objc_msgSend(v6, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("spread %ld items on %ld items with following indexes: %@"), numberOfVisibleItems, numberOfRealItems, v5);

}

@end
