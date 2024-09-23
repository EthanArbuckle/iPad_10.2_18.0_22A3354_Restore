@implementation CarSearchWaypointsController

- (CarSearchWaypointsController)initWithSearchResults:(id)a3 selectedIndex:(unint64_t)a4
{
  id v6;
  CarSearchWaypointsController *v7;
  NSArray *v8;
  NSArray *searchResults;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarSearchWaypointsController;
  v7 = -[CarSearchWaypointsController init](&v11, "init");
  if (v7)
  {
    v8 = (NSArray *)objc_msgSend(v6, "copy");
    searchResults = v7->_searchResults;
    v7->_searchResults = v8;

    v7->_selectedIndex = a4;
  }

  return v7;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  if (-[CarSearchWaypointsController totalDestinations](self, "totalDestinations"))
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      a3 = 0;
    }
    else if (-[CarSearchWaypointsController totalDestinations](self, "totalDestinations") <= a3)
    {
      a3 = -[CarSearchWaypointsController totalDestinations](self, "totalDestinations");
    }
  }
  else
  {
    a3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_selectedIndex = a3;
}

- (id)visuallySelectedItem
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchWaypointsController searchResults](self, "searchResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", self->_selectedIndex));

  return v4;
}

- (void)nextPlaceWithTraits:(id)a3
{
  char *v4;
  id v5;

  v5 = a3;
  v4 = (char *)-[CarSearchWaypointsController selectedIndex](self, "selectedIndex") + 1;
  if (-[CarWaypointsController allowLooping](self, "allowLooping")
    && v4 >= (char *)-[CarSearchWaypointsController totalDestinations](self, "totalDestinations"))
  {
    v4 = 0;
  }
  -[CarSearchWaypointsController setSelectedIndex:](self, "setSelectedIndex:", v4);
  -[CarWaypointsController startLoadWithTraits:](self, "startLoadWithTraits:", v5);

}

- (void)previousPlaceWithTraits:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  if (-[CarWaypointsController allowLooping](self, "allowLooping")
    && !-[CarSearchWaypointsController selectedIndex](self, "selectedIndex"))
  {
    v4 = -[CarSearchWaypointsController totalDestinations](self, "totalDestinations");
  }
  else
  {
    v4 = -[CarSearchWaypointsController selectedIndex](self, "selectedIndex");
  }
  -[CarSearchWaypointsController setSelectedIndex:](self, "setSelectedIndex:", v4 - 1);
  -[CarWaypointsController startLoadWithTraits:](self, "startLoadWithTraits:", v5);

}

- (id)destinationSearchResultIfAvailable
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchWaypointsController searchResults](self, "searchResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", -[CarSearchWaypointsController selectedIndex](self, "selectedIndex")));

  return v4;
}

- (id)titleForCurrentDestination
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchWaypointsController destinationSearchResultIfAvailable](self, "destinationSearchResultIfAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return v3;
}

- (id)subtitleForCurrentDestination
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchWaypointsController destinationSearchResultIfAvailable](self, "destinationSearchResultIfAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_addressFormattedAsShortenedAddress"));

  return v4;
}

- (unint64_t)totalDestinations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchWaypointsController searchResults](self, "searchResults"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
}

@end
