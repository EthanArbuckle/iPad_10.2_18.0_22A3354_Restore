@implementation TUIFeedViewInvalidationContext

- (NSArray)invalidatedIndexPaths
{
  return (NSArray *)self->_invalidatedIndexPaths;
}

- (void)invalidateIndexPath:(id)a3
{
  NSMutableArray *invalidatedIndexPaths;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    invalidatedIndexPaths = self->_invalidatedIndexPaths;
    if (!invalidatedIndexPaths)
    {
      v5 = objc_opt_new(NSMutableArray);
      v6 = self->_invalidatedIndexPaths;
      self->_invalidatedIndexPaths = v5;

      invalidatedIndexPaths = self->_invalidatedIndexPaths;
    }
    -[NSMutableArray addObject:](invalidatedIndexPaths, "addObject:", v7);
  }

}

- (void)invalidateIndexPaths:(id)a3
{
  NSMutableArray *invalidatedIndexPaths;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    invalidatedIndexPaths = self->_invalidatedIndexPaths;
    if (!invalidatedIndexPaths)
    {
      v5 = objc_opt_new(NSMutableArray);
      v6 = self->_invalidatedIndexPaths;
      self->_invalidatedIndexPaths = v5;

      invalidatedIndexPaths = self->_invalidatedIndexPaths;
    }
    -[NSMutableArray addObjectsFromArray:](invalidatedIndexPaths, "addObjectsFromArray:", v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatedIndexPaths, 0);
}

@end
