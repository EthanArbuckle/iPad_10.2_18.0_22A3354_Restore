@implementation LookAroundShareItemSource

- (LookAroundShareItemSource)initWithMapItem:(id)a3 muninViewState:(id)a4
{
  id v5;
  LookAroundShareItemSource *v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LookAroundShareItemSource;
  v6 = -[LookAroundShareItemSource init](&v11, "init");
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)MULookAroundTextActivityProvider), "initWithMapItem:", v5);
    -[LookAroundShareItemSource setTextProvider:](v6, "setTextProvider:", v7);

    v8 = objc_msgSend(objc_alloc((Class)MULookAroundURLActivityProvider), "initWithMapItem:", v5);
    -[LookAroundShareItemSource setUrlProvider:](v6, "setUrlProvider:", v8);

    v9 = objc_msgSend(objc_alloc((Class)MULookAroundLinkPresentationActivityProvider), "initWithMapItem:", v5);
    -[LookAroundShareItemSource setLinkPresentationProvider:](v6, "setLinkPresentationProvider:", v9);

  }
  return v6;
}

- (NSArray)activityProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundShareItemSource textProvider](self, "textProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundShareItemSource urlProvider](self, "urlProvider", v3));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundShareItemSource linkPresentationProvider](self, "linkPresentationProvider"));
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

- (void)setActivityProviderDelegate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundShareItemSource textProvider](self, "textProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundShareItemSource textProvider](self, "textProvider"));
    objc_msgSend(v6, "setDelegate:", v9);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundShareItemSource urlProvider](self, "urlProvider"));
    objc_msgSend(v7, "setDelegate:", v9);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundShareItemSource linkPresentationProvider](self, "linkPresentationProvider"));
    objc_msgSend(v8, "setDelegate:", v9);

  }
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (MULookAroundTextActivityProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_textProvider, a3);
}

- (MULookAroundURLActivityProvider)urlProvider
{
  return self->_urlProvider;
}

- (void)setUrlProvider:(id)a3
{
  objc_storeStrong((id *)&self->_urlProvider, a3);
}

- (MULookAroundLinkPresentationActivityProvider)linkPresentationProvider
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
