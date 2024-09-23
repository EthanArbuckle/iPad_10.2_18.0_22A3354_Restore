@implementation PUScrubberTilingLayoutInvalidationContext

- (void)invalidateExpandedItem
{
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](self, "invalidateAllTilesWithKind:", CFSTR("PUTileKindItemContent"));
  -[PUTilingLayoutInvalidationContext invalidateContentBounds](self, "invalidateContentBounds");
  self->_invalidatedExpandedItem = 1;
}

- (BOOL)invalidatedExpandedItem
{
  return self->_invalidatedExpandedItem;
}

@end
