@implementation PGHolidayDetectionCache

- (PGHolidayDetectionCache)init
{
  PGHolidayDetectionCache *v2;
  NSMutableArray *v3;
  NSMutableArray *holidayDateNodes;
  NSMutableArray *v5;
  NSMutableArray *positivelyClassifiedMomentNodes;
  NSMutableArray *v7;
  NSMutableArray *negativelyClassifiedMomentNodes;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PGHolidayDetectionCache;
  v2 = -[PGHolidayDetectionCache init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    holidayDateNodes = v2->_holidayDateNodes;
    v2->_holidayDateNodes = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    positivelyClassifiedMomentNodes = v2->_positivelyClassifiedMomentNodes;
    v2->_positivelyClassifiedMomentNodes = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    negativelyClassifiedMomentNodes = v2->_negativelyClassifiedMomentNodes;
    v2->_negativelyClassifiedMomentNodes = v7;

  }
  return v2;
}

- (void)addHolidayWithDateNode:(id)a3
{
  -[NSMutableArray addObject:](self->_holidayDateNodes, "addObject:", a3);
}

- (void)addPositivelyClassifiedMomentNode:(id)a3
{
  -[NSMutableArray addObject:](self->_positivelyClassifiedMomentNodes, "addObject:", a3);
}

- (void)addNegativelyClassifiedMomentNode:(id)a3
{
  -[NSMutableArray addObject:](self->_negativelyClassifiedMomentNodes, "addObject:", a3);
}

- (NSArray)holidayDateNodes
{
  return &self->_holidayDateNodes->super;
}

- (NSArray)positivelyClassifiedMomentNodes
{
  return &self->_positivelyClassifiedMomentNodes->super;
}

- (NSArray)negativelyClassifiedMomentNodes
{
  return &self->_negativelyClassifiedMomentNodes->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativelyClassifiedMomentNodes, 0);
  objc_storeStrong((id *)&self->_positivelyClassifiedMomentNodes, 0);
  objc_storeStrong((id *)&self->_holidayDateNodes, 0);
}

@end
