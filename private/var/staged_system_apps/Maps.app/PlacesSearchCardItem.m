@implementation PlacesSearchCardItem

- (PlacesSearchCardItem)initWithMapItem:(id)a3 searchCategory:(id)a4
{
  id v7;
  id v8;
  PlacesSearchCardItem *v9;
  PlacesSearchCardItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PlacesSearchCardItem;
  v9 = -[PlacesSearchCardItem init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeStrong((id *)&v10->_searchCategory, a4);
  }

  return v10;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
