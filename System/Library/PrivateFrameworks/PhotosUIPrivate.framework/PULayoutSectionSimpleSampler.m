@implementation PULayoutSectionSimpleSampler

- (PULayoutSectionSimpleSampler)initWithNumberOfVisibleItems:(int64_t)a3 numberOfRealItems:(int64_t)a4
{
  PULayoutSectionSimpleSampler *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PULayoutSectionSimpleSampler;
  result = -[PULayoutSectionSimpleSampler init](&v7, sel_init);
  if (result)
  {
    result->_numberOfVisibleItems = a3;
    result->_numberOfRealItems = a4;
  }
  return result;
}

- (int64_t)indexForUnsampledIndex:(int64_t)a3 isMainItem:(BOOL *)a4
{
  int64_t numberOfVisibleItems;
  int64_t numberOfRealItems;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  numberOfVisibleItems = self->_numberOfVisibleItems;
  numberOfRealItems = self->_numberOfRealItems;
  if (numberOfRealItems <= numberOfVisibleItems)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _indexForUnsampledIndex(NSInteger, NSInteger, NSInteger)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PULayoutSectioning.m"), 366, CFSTR("Invalid use"));

  }
  v9 = numberOfVisibleItems * a3 / numberOfRealItems;
  if (a4)
  {
    v10 = self->_numberOfVisibleItems;
    v11 = self->_numberOfRealItems;
    if (v11 <= v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _unsampledIndexForIndex(NSInteger, NSInteger, NSInteger)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PULayoutSectioning.m"), 374, CFSTR("Invalid use"));

    }
    if (v10 - 1 <= v9)
      v12 = v11 - 1;
    else
      v12 = (v10 - 1 + v11 * v9) / v10;
    *a4 = v12 == a3;
  }
  return numberOfVisibleItems * a3 / numberOfRealItems;
}

- (int64_t)unsampledIndexForIndex:(int64_t)a3
{
  int64_t numberOfVisibleItems;
  int64_t numberOfRealItems;
  void *v7;
  void *v8;

  numberOfVisibleItems = self->_numberOfVisibleItems;
  numberOfRealItems = self->_numberOfRealItems;
  if (numberOfRealItems <= numberOfVisibleItems)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _unsampledIndexForIndex(NSInteger, NSInteger, NSInteger)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PULayoutSectioning.m"), 374, CFSTR("Invalid use"));

  }
  if (numberOfVisibleItems - 1 <= a3)
    return numberOfRealItems - 1;
  else
    return (numberOfVisibleItems - 1 + numberOfRealItems * a3) / numberOfVisibleItems;
}

- (void)enumerateUnsampledIndexesForSampledIndexInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  int64_t location;
  void (**v7)(id, int64_t, uint64_t, _BYTE *);
  NSUInteger v8;
  NSUInteger v9;
  int64_t numberOfVisibleItems;
  int64_t numberOfRealItems;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;

  length = a3.length;
  location = a3.location;
  v7 = (void (**)(id, int64_t, uint64_t, _BYTE *))a4;
  v15 = 0;
  if (location < (uint64_t)(location + length))
  {
    v8 = length - 1;
    do
    {
      v9 = v8;
      numberOfVisibleItems = self->_numberOfVisibleItems;
      numberOfRealItems = self->_numberOfRealItems;
      if (numberOfRealItems <= numberOfVisibleItems)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _unsampledIndexForIndex(NSInteger, NSInteger, NSInteger)");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PULayoutSectioning.m"), 374, CFSTR("Invalid use"));

      }
      if (numberOfVisibleItems - 1 <= location)
        v12 = numberOfRealItems - 1;
      else
        v12 = (numberOfVisibleItems - 1 + numberOfRealItems * location) / numberOfVisibleItems;
      v7[2](v7, location, v12, &v15);
      if (v15)
        break;
      ++location;
      v8 = v9 - 1;
    }
    while (v9);
  }

}

- (void)dumpInternalMemory
{
  NSLog(CFSTR("spread %ld items on %ld items"), a2, self->_numberOfVisibleItems, self->_numberOfRealItems);
}

@end
