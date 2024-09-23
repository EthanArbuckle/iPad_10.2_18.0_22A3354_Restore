@implementation ContactPlaceItem

- (id)name
{
  MapsLocationOfInterest *locationOfInterest;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  objc_super v12;

  locationOfInterest = self->_locationOfInterest;
  if (locationOfInterest)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest name](locationOfInterest, "name"));
  }
  else
  {
    if (-[ContactPlaceItem isMeCard](self, "isMeCard"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactPlaceItem selectedAddress](self, "selectedAddress"));

      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactPlaceItem selectedAddress](self, "selectedAddress"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "label"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNLabeledValue localizedStringForLabel:](CNLabeledValue, "localizedStringForLabel:", v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "capitalizedString"));

        return v9;
      }
    }
    v12.receiver = self;
    v12.super_class = (Class)ContactPlaceItem;
    v11 = -[ContactPlaceItem name](&v12, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }
  return v4;
}

- (BOOL)isContactPersisted
{
  return 1;
}

- (BOOL)isMeCard
{
  return self->_isMeCard;
}

- (void)setIsMeCard:(BOOL)a3
{
  self->_isMeCard = a3;
}

- (CNLabeledValue)selectedAddress
{
  return self->_selectedAddress;
}

- (void)setSelectedAddress:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAddress, a3);
}

- (MapsLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_locationOfInterest, a3);
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_selectedAddress, 0);
}

@end
