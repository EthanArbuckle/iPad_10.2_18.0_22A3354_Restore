@implementation CuratedCollectionShareItemSource

- (CuratedCollectionShareItemSource)initWithPlaceCollection:(id)a3 refinedMapItems:(id)a4
{
  id v6;
  id v7;
  CuratedCollectionShareItemSource *v8;
  CuratedCollectionTextActivityProvider *v9;
  CuratedCollectionURLActivityProvider *v10;
  CuratedCollectionLinkMetadataProvider *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CuratedCollectionShareItemSource;
  v8 = -[CuratedCollectionShareItemSource init](&v13, "init");
  if (v8)
  {
    v9 = -[CuratedCollectionActivityProvider initWithCuratedCollection:refinedMapItems:]([CuratedCollectionTextActivityProvider alloc], "initWithCuratedCollection:refinedMapItems:", v6, v7);
    -[CuratedCollectionShareItemSource setTextProvider:](v8, "setTextProvider:", v9);

    v10 = -[CuratedCollectionActivityProvider initWithCuratedCollection:refinedMapItems:]([CuratedCollectionURLActivityProvider alloc], "initWithCuratedCollection:refinedMapItems:", v6, v7);
    -[CuratedCollectionShareItemSource setUrlProvider:](v8, "setUrlProvider:", v10);

    v11 = -[CuratedCollectionLinkMetadataProvider initWithCuratedCollection:refinedMapItems:]([CuratedCollectionLinkMetadataProvider alloc], "initWithCuratedCollection:refinedMapItems:", v6, v7);
    -[CuratedCollectionShareItemSource setLinkPresentationProvider:](v8, "setLinkPresentationProvider:", v11);

  }
  return v8;
}

- (CuratedCollectionShareItemSource)initWithPublisher:(id)a3
{
  id v4;
  CuratedCollectionShareItemSource *v5;
  CuratedCollectionTextActivityProvider *v6;
  CuratedCollectionURLActivityProvider *v7;
  CuratedCollectionLinkMetadataProvider *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionShareItemSource;
  v5 = -[CuratedCollectionShareItemSource init](&v10, "init");
  if (v5)
  {
    v6 = -[CuratedCollectionActivityProvider initWithPublisher:]([CuratedCollectionTextActivityProvider alloc], "initWithPublisher:", v4);
    -[CuratedCollectionShareItemSource setTextProvider:](v5, "setTextProvider:", v6);

    v7 = -[CuratedCollectionActivityProvider initWithPublisher:]([CuratedCollectionURLActivityProvider alloc], "initWithPublisher:", v4);
    -[CuratedCollectionShareItemSource setUrlProvider:](v5, "setUrlProvider:", v7);

    v8 = -[CuratedCollectionActivityProvider initWithPublisher:]([CuratedCollectionLinkMetadataProvider alloc], "initWithPublisher:", v4);
    -[CuratedCollectionShareItemSource setLinkPresentationProvider:](v5, "setLinkPresentationProvider:", v8);

  }
  return v5;
}

- (NSArray)activityProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionShareItemSource textProvider](self, "textProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionShareItemSource urlProvider](self, "urlProvider", v3));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionShareItemSource linkPresentationProvider](self, "linkPresentationProvider"));
  v8[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));

  return (NSArray *)v6;
}

- (NSData)pushSubmissionData
{
  return 0;
}

- (NSArray)applicationActivities
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)excludedActivityTypes
{
  UIActivityType v3;

  v3 = UIActivityTypeAddToReadingList;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (NSArray)includedActivityTypes
{
  return 0;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (CuratedCollectionTextActivityProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_textProvider, a3);
}

- (CuratedCollectionURLActivityProvider)urlProvider
{
  return self->_urlProvider;
}

- (void)setUrlProvider:(id)a3
{
  objc_storeStrong((id *)&self->_urlProvider, a3);
}

- (CuratedCollectionLinkMetadataProvider)linkPresentationProvider
{
  return self->_linkPresentationProvider;
}

- (void)setLinkPresentationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_linkPresentationProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkPresentationProvider, 0);
  objc_storeStrong((id *)&self->_urlProvider, 0);
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
