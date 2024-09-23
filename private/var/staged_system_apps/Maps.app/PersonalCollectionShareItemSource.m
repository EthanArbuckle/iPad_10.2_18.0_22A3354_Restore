@implementation PersonalCollectionShareItemSource

- (PersonalCollectionShareItemSource)initWithCollectionHandlerInfo:(id)a3
{
  id v4;
  PersonalCollectionShareItemSource *v5;
  CollectionTextActivityProvider *v6;
  CollectionURLActivityProvider *v7;
  CollectionLinkMetadataProvider *v8;
  PersonalCollectionShareItemSource *v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "canShare"))
  {
    v11.receiver = self;
    v11.super_class = (Class)PersonalCollectionShareItemSource;
    v5 = -[PersonalCollectionShareItemSource init](&v11, "init");
    if (v5)
    {
      v6 = -[CollectionActivityProvider initWithCollectionHandlerInfo:]([CollectionTextActivityProvider alloc], "initWithCollectionHandlerInfo:", v4);
      -[PersonalCollectionShareItemSource setTextProvider:](v5, "setTextProvider:", v6);

      v7 = -[CollectionActivityProvider initWithCollectionHandlerInfo:]([CollectionURLActivityProvider alloc], "initWithCollectionHandlerInfo:", v4);
      -[PersonalCollectionShareItemSource setUrlProvider:](v5, "setUrlProvider:", v7);

      v8 = -[CollectionActivityProvider initWithCollectionHandlerInfo:]([CollectionLinkMetadataProvider alloc], "initWithCollectionHandlerInfo:", v4);
      -[PersonalCollectionShareItemSource setLinkPresentationProvider:](v5, "setLinkPresentationProvider:", v8);

    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSArray)activityProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalCollectionShareItemSource textProvider](self, "textProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalCollectionShareItemSource urlProvider](self, "urlProvider", v3));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalCollectionShareItemSource linkPresentationProvider](self, "linkPresentationProvider"));
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

- (CollectionTextActivityProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_textProvider, a3);
}

- (CollectionURLActivityProvider)urlProvider
{
  return self->_urlProvider;
}

- (void)setUrlProvider:(id)a3
{
  objc_storeStrong((id *)&self->_urlProvider, a3);
}

- (CollectionLinkMetadataProvider)linkPresentationProvider
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
