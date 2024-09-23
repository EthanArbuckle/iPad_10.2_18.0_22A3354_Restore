@implementation GEORPDetails

- (id)directionsRequest
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItemsForPlacesInDetails:", self));

  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v5 = objc_alloc_init((Class)MKDirectionsRequest);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    objc_msgSend(v5, "setSource:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
    objc_msgSend(v5, "setDestination:", v7);

    v8 = -[GEORPDetails directionsType](self, "directionsType");
    v9 = 1;
    if (v8 == 2)
      v9 = 2;
    if (v8 == 1)
      v10 = 4;
    else
      v10 = v9;
    objc_msgSend(v5, "setTransportType:", v10);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
