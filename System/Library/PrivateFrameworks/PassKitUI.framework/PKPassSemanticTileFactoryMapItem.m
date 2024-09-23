@implementation PKPassSemanticTileFactoryMapItem

- (PKPassSemanticTileFactoryMapItem)initWithMapItem:(id)a3
{
  id v5;
  PKPassSemanticTileFactoryMapItem *v6;
  PKPassSemanticTileFactoryMapItem *v7;
  PKPassSemanticTileFactoryMapItem *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPassSemanticTileFactoryMapItem;
    v6 = -[PKPassSemanticTileFactoryMapItem init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_mapItem, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)beginContentAccess
{
  BOOL v2;

  v2 = self->_mapItem != 0;
  self->_contentBeingAcccessed = v2;
  return v2;
}

- (void)discardContentIfPossible
{
  MKMapItem *mapItem;

  mapItem = self->_mapItem;
  self->_mapItem = 0;

}

- (void)endContentAccess
{
  self->_contentBeingAcccessed = 0;
}

- (BOOL)isContentDiscarded
{
  return self->_mapItem == 0;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
