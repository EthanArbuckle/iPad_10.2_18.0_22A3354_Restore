@implementation PXTilingEnumerationOptions

- (NSIndexSet)tileGroups
{
  return self->_tileGroups;
}

- (void)setTileGroups:(id)a3
{
  objc_storeStrong((id *)&self->_tileGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileGroups, 0);
}

@end
