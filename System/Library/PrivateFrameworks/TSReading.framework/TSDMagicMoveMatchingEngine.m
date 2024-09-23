@implementation TSDMagicMoveMatchingEngine

+ (id)matchingEngine
{
  return objc_alloc_init(TSDMagicMoveMatchingEngine);
}

- (TSDMagicMoveMatchingEngine)init
{
  TSDMagicMoveMatchingEngine *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDMagicMoveMatchingEngine;
  v2 = -[TSDMagicMoveMatchingEngine init](&v4, sel_init);
  if (v2)
    v2->_matches = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveMatchingEngine;
  -[TSDMagicMoveMatchingEngine dealloc](&v3, sel_dealloc);
}

- (void)addMatch:(id)a3
{
  -[NSMutableArray addObject:](self->_matches, "addObject:", a3);
}

- (void)addMatches:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_matches, "addObjectsFromArray:", a3);
}

- (id)matchResults
{
  return +[TSDMatchingAlgorithm bestMatchesFromArray:](TSDMatchingAlgorithm, "bestMatchesFromArray:", self->_matches);
}

@end
