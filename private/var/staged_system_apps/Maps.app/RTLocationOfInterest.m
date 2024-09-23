@implementation RTLocationOfInterest

- (void)_maps_hydrateGeoMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RTLocationOfInterest mapItem](self, "mapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoMapItemHandle"));

  if (v6)
  {
    v7 = !-[RTLocationOfInterest type](self, "type")
      || -[RTLocationOfInterest type](self, "type") == (id)1
      || -[RTLocationOfInterest type](self, "type") == (id)2;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[HydrateGeoMapItemCache sharedCache](HydrateGeoMapItemCache, "sharedCache"));
    v8 = objc_claimAutoreleasedReturnValue(-[RTLocationOfInterest mapItem](self, "mapItem"));
    objc_msgSend(v9, "resolveRTMapItem:shouldUpdateAttributes:completionHandler:", v8, v7, v4);

    v4 = (id)v8;
  }
  else
  {
    v9 = objc_alloc_init((Class)NSError);
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

@end
