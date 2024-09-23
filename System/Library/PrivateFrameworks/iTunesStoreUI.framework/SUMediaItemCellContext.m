@implementation SUMediaItemCellContext

- (SUMediaItemCellContext)init
{
  SUMediaItemCellContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUMediaItemCellContext;
  result = -[SUItemCellContext init](&v3, sel_init);
  if (result)
  {
    result->_artworkWidth = -1.0;
    result->_itemsHaveArtwork = 1;
  }
  return result;
}

- (double)artworkWidth
{
  return self->_artworkWidth;
}

- (void)setArtworkWidth:(double)a3
{
  self->_artworkWidth = a3;
}

- (int64_t)hiddenMediaIconTypes
{
  return self->_hiddenMediaIconTypes;
}

- (void)setHiddenMediaIconTypes:(int64_t)a3
{
  self->_hiddenMediaIconTypes = a3;
}

- (BOOL)itemsHaveArtwork
{
  return self->_itemsHaveArtwork;
}

- (void)setItemsHaveArtwork:(BOOL)a3
{
  self->_itemsHaveArtwork = a3;
}

@end
