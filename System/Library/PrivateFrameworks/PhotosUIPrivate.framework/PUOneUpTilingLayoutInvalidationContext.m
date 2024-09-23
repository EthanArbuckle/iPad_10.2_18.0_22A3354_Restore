@implementation PUOneUpTilingLayoutInvalidationContext

- (void)_setInvalidatedContentInsets:(BOOL)a3
{
  if (self->_invalidatedContentInsets != a3)
  {
    self->_invalidatedContentInsets = a3;
    if (a3)
      -[PUTilingLayoutInvalidationContext setInvalidatedAnyTile:](self, "setInvalidatedAnyTile:", 1);
  }
}

- (void)_setInvalidatedVideoPlaceholderTile:(BOOL)a3
{
  if (self->_invalidatedVideoPlaceholderTile != a3)
  {
    self->_invalidatedVideoPlaceholderTile = a3;
    if (a3)
      -[PUTilingLayoutInvalidationContext setInvalidatedAnyTile:](self, "setInvalidatedAnyTile:", 1);
  }
}

- (BOOL)invalidatedContentInsets
{
  return self->_invalidatedContentInsets;
}

- (BOOL)invalidatedCommentsTile
{
  return self->_invalidatedCommentsTile;
}

- (BOOL)invalidatedAccessoryTile
{
  return self->_invalidatedAccessoryTile;
}

- (void)_setInvalidatedAccessoryTile:(BOOL)a3
{
  self->_invalidatedAccessoryTile = a3;
}

- (BOOL)invalidatedContentOffset
{
  return self->_invalidatedContentOffset;
}

- (void)_setInvalidatedContentOffset:(BOOL)a3
{
  self->_invalidatedContentOffset = a3;
}

- (BOOL)invalidatedVideoPlaceholderTile
{
  return self->_invalidatedVideoPlaceholderTile;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)_setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
