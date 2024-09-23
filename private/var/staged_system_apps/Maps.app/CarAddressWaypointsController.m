@implementation CarAddressWaypointsController

- (CarAddressWaypointsController)initWithAddress:(id)a3 overridingTitle:(id)a4
{
  id v7;
  id v8;
  CarAddressWaypointsController *v9;
  CarAddressWaypointsController *v10;
  SearchResult *v11;
  void *v12;
  SearchResult *v13;
  SearchResult *searchResult;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CarAddressWaypointsController;
  v9 = -[CarAddressWaypointsController init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_address, a3);
    objc_storeStrong((id *)&v10->_titleOverride, a4);
    v11 = [SearchResult alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddressWaypointsController address](v10, "address"));
    v13 = -[SearchResult initWithSearchResult:address:](v11, "initWithSearchResult:address:", 0, v12);
    searchResult = v10->_searchResult;
    v10->_searchResult = v13;

  }
  return v10;
}

- (CarAddressWaypointsController)initWithAddress:(id)a3
{
  return -[CarAddressWaypointsController initWithAddress:overridingTitle:](self, "initWithAddress:overridingTitle:", a3, 0);
}

- (id)titleForCurrentDestination
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddressWaypointsController titleOverride](self, "titleOverride"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddressWaypointsController address](self, "address"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "compositeName"));

  }
  return v5;
}

- (id)subtitleForCurrentDestination
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarAddressWaypointsController address](self, "address"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "singleLineAddress"));

  return v3;
}

- (AddressBookAddress)address
{
  return self->_address;
}

- (NSString)titleOverride
{
  return self->_titleOverride;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_titleOverride, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
