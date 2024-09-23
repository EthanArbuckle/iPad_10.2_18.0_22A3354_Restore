@implementation _VUILibrarySeeAllController

- (VUILibraryGridCollectionViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
  objc_storeStrong((id *)&self->_gridViewController, a3);
}

- (int64_t)shelfType
{
  return self->_shelfType;
}

- (void)setShelfType:(int64_t)a3
{
  self->_shelfType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridViewController, 0);
}

@end
