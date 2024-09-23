@implementation VenueSearchCardItem

- (VenueSearchCardItem)init
{

  return 0;
}

- (VenueSearchCardItem)initWithMapItem:(id)a3 searchCategory:(id)a4
{
  id v7;
  id v8;
  VenueSearchCardItem *v9;
  VenueSearchCardItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VenueSearchCardItem;
  v9 = -[VenueSearchCardItem init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_venueMapItem, a3);
    objc_storeStrong((id *)&v10->_venueSearchCategory, a4);
  }

  return v10;
}

- (unint64_t)venueID
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _venueInfo](self->_venueMapItem, "_venueInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "venueIdentifier"));
  v4 = objc_msgSend(v3, "venueID");

  return (unint64_t)v4;
}

- (unint64_t)venueCardID
{
  return (unint64_t)-[MKMapItem _muid](self->_venueMapItem, "_muid");
}

- (BOOL)isVenueItem
{
  return -[VenueSearchCardItem venueID](self, "venueID") != 0;
}

- (MKMapItem)venueMapItem
{
  return self->_venueMapItem;
}

- (GEOSearchCategory)venueSearchCategory
{
  return self->_venueSearchCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueSearchCategory, 0);
  objc_storeStrong((id *)&self->_venueMapItem, 0);
}

@end
