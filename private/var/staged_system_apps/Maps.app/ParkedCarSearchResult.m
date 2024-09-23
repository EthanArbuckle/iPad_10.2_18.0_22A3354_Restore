@implementation ParkedCarSearchResult

- (ParkedCarSearchResult)initWithParkedCar:(id)a3
{
  id v5;
  void *v6;
  ParkedCarSearchResult *v7;
  objc_super v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  v9.receiver = self;
  v9.super_class = (Class)ParkedCarSearchResult;
  v7 = -[SearchResult initWithMapItem:](&v9, "initWithMapItem:", v6);

  if (v7)
    objc_storeStrong((id *)&v7->_parkedCar, a3);

  return v7;
}

- (id)personalizedItemKey
{
  return +[ParkedCar personalizedItemKey](ParkedCar, "personalizedItemKey");
}

- (id)title
{
  return -[ParkedCar title](self->_parkedCar, "title");
}

- (ParkedCar)parkedCar
{
  return self->_parkedCar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkedCar, 0);
}

@end
