@implementation RTLocationOfInterest(RTHistoryEntry)

- (id)initWithHistoryEntryRoute:()RTHistoryEntry
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "destinationLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationMapItem");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(a1, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v5, v9, -1, 0, 0, 0, 1.0, v7);

    a1 = v8;
  }

  return v8;
}

- (id)initWithHistoryEntryPlaceDisplay:()RTHistoryEntry
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapItem");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(a1, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v5, v9, -1, 0, 0, 0, 1.0, v7);

    a1 = v8;
  }

  return v8;
}

@end
