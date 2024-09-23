@implementation CuratedCollectionHandler

- (CuratedCollectionHandler)initWithCollection:(id)a3
{
  id v4;
  CuratedCollectionHandler *v5;
  CuratedCollectionHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CuratedCollectionHandler;
  v5 = -[CollectionHandler initWithCollection:](&v8, "initWithCollection:", v4);
  v6 = v5;
  if (v5)
    -[CuratedCollectionHandler setCuratedCollection:](v5, "setCuratedCollection:", v4);

  return v6;
}

- (void)updateWithMapsSyncCachedCuratedCollection:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
    -[CuratedCollectionHandler setCollection:](self, "setCollection:", v6);

}

- (int64_t)handlerType
{
  return 4;
}

- (void)setCollection:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CuratedCollectionHandler;
  v4 = a3;
  -[CollectionHandler setCollection:](&v5, "setCollection:", v4);
  -[CuratedCollectionHandler setCuratedCollection:](self, "setCuratedCollection:", v4, v5.receiver, v5.super_class);

}

- (void)setCuratedCollection:(id)a3
{
  MSCachedCuratedCollection *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = (MSCachedCuratedCollection *)a3;
  if (self->_curatedCollection != v5)
  {
    objc_storeStrong((id *)&self->_curatedCollection, a3);
    -[CollectionHandler loadImage](self, "loadImage");
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler publisherAttribution](self, "publisherAttribution"));
    v8 = objc_msgSend(v7, "iconIdentifier");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100970478;
    v9[3] = &unk_1011ADDF0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v6, "getImageForPublisherWithIconIdentifier:completion:", v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (MKMapItemIdentifier)curatedCollectionIdentifier
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v3 = objc_alloc((Class)MKMapItemIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler curatedCollection](self, "curatedCollection"));
  v5 = objc_msgSend(v4, "curatedCollectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler curatedCollection](self, "curatedCollection"));
  v7 = objc_msgSend(v6, "resultProviderIdentifier");
  v8 = objc_msgSend(v3, "initWithMUID:resultProviderID:coordinate:", v5, v7, MKCoordinateInvalid[0], MKCoordinateInvalid[1]);

  return (MKMapItemIdentifier *)v8;
}

- (id)identifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));

  return v4;
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return v3;
}

- (id)subtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler publisherAttribution](self, "publisherAttribution"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Number of places [Curated Collection]"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler curatedCollection](self, "curatedCollection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, objc_msgSend(v7, "placesCount")));

  if (v4)
  {
    v14[0] = v4;
    v14[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    v10 = objc_msgSend((id)objc_opt_class(self), "_delimiterString");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", v11));

  }
  else
  {
    v12 = v8;
  }

  return v12;
}

- (id)badgeImage
{
  return -[CuratedCollectionHandler publisherImage](self, "publisherImage");
}

- (BOOL)containsItem:(id)a3
{
  return 0;
}

- (id)publisherAttribution
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  GEOCollectionPublisherAttribution *v7;
  GEOCollectionPublisherAttribution *publisherAttribution;

  if (!self->_publisherAttribution)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler curatedCollection](self, "curatedCollection"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCollectionPublisherAttributionManager sharedInstance](GEOCollectionPublisherAttributionManager, "sharedInstance"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler curatedCollection](self, "curatedCollection"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publisherAttribution"));
      v7 = (GEOCollectionPublisherAttribution *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bestAttributionForPublisher:", v6));
      publisherAttribution = self->_publisherAttribution;
      self->_publisherAttribution = v7;

    }
  }
  return self->_publisherAttribution;
}

- (void)deleteCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler curatedCollection](self, "curatedCollection"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009708B0;
  v8[3] = &unk_1011ADA00;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "removeSavedMapsSyncCuratedCollection:completion:", v6, v8);

}

- (id)sharingURL
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler curatedCollection](self, "curatedCollection"));
  v4 = objc_msgSend(v3, "curatedCollectionIdentifier");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler curatedCollection](self, "curatedCollection"));
  v6 = objc_msgSend(v5, "resultProviderIdentifier");

  return +[GEOMapURLBuilder URLForCuratedCollection:provider:](GEOMapURLBuilder, "URLForCuratedCollection:provider:", v4, v6);
}

- (BOOL)canShare
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler sharingURL](self, "sharingURL"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canDelete
{
  return 1;
}

- (void)retrieveGeoCollectionWithRefinedItems:(id)a3
{
  id v4;
  CuratedCollectionResolver *v5;
  void *v6;
  id v7;
  CuratedCollectionResolver *v8;
  CuratedCollectionResolver *resolver;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = [CuratedCollectionResolver alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHandler curatedCollectionIdentifier](self, "curatedCollectionIdentifier"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100970A30;
  v10[3] = &unk_1011DCF00;
  v11 = v4;
  v7 = v4;
  v8 = -[CuratedCollectionResolver initWithCuratedCollectionIdentifier:handler:](v5, "initWithCuratedCollectionIdentifier:handler:", v6, v10);
  resolver = self->_resolver;
  self->_resolver = v8;

  -[CuratedCollectionResolver resolveCollection](self->_resolver, "resolveCollection");
}

+ (id)_delimiterString
{
  if (qword_1014D3AB8 != -1)
    dispatch_once(&qword_1014D3AB8, &stru_1011DCF20);
  return (id)qword_1014D3AB0;
}

- (MSCachedCuratedCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (UIImage)publisherImage
{
  return self->_publisherImage;
}

- (void)setPublisherImage:(id)a3
{
  objc_storeStrong((id *)&self->_publisherImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherImage, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_publisherAttribution, 0);
}

@end
