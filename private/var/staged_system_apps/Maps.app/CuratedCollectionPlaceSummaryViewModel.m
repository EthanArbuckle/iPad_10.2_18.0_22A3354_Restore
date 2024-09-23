@implementation CuratedCollectionPlaceSummaryViewModel

- (CuratedCollectionPlaceSummaryViewModel)initWithMapItem:(id)a3
{
  id v5;
  CuratedCollectionPlaceSummaryViewModel *v6;
  CuratedCollectionPlaceSummaryViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionPlaceSummaryViewModel;
  v6 = -[CuratedCollectionPlaceSummaryViewModel init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapItem, a3);

  return v7;
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryViewModel mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return (NSString *)v3;
}

- (NSString)category
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryViewModel mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_firstLocalizedCategoryName"));

  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSString)distance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  char v12;

  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryViewModel currentLocation](self, "currentLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryViewModel mapItem](self, "mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString distanceStringFromLocation:toMapItem:showsDistance:](NSString, "distanceStringFromLocation:toMapItem:showsDistance:", v3, v4, &v12));

  if (!v12)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryViewModel mapItem](self, "mapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geoMapItem"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_resultSnippetLocationString"));

    v5 = (void *)v8;
  }
  if (objc_msgSend(v5, "length"))
    v9 = v5;
  else
    v9 = 0;
  v10 = v9;

  return (NSString *)v10;
}

- (NSString)price
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryViewModel mapItem](self, "mapItem"));
  v4 = objc_msgSend(v3, "_hasPriceDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryViewModel mapItem](self, "mapItem"));
  v6 = v5;
  if ((v4 & 1) != 0)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_priceDescription"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_priceRangeString"));
  v8 = (void *)v7;

  if (objc_msgSend(v8, "length"))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (NSAttributedString)hours
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSAttributedStringKey v18;
  void *v19;

  v3 = objc_alloc((Class)_MKLocalizedHoursBuilder);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryViewModel mapItem](self, "mapItem"));
  v5 = objc_msgSend(v3, "initWithMapItem:localizedHoursStringOptions:", v4, 128);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedOperatingHours"));
  v7 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedOpenState"));
  v9 = objc_msgSend(v6, "rangeOfString:", v8);
  v11 = v10;

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedOpenState"));
    if (objc_msgSend(v6, "rangeOfString:", v12) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v5, "updateHoursLabelColorWithDefaultLabelColor:", v13);

    }
    v18 = NSForegroundColorAttributeName;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hoursStateLabelColor"));
    v19 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));

    objc_msgSend(v7, "setAttributes:range:", v15, v9, v11);
  }
  v16 = objc_msgSend(v7, "copy");

  return (NSAttributedString *)v16;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
