@implementation MOPlaceMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOPlaceMO"));
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOPlaceMO *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  v6 = a3;
  v7 = -[MOPlaceMO initWithContext:]([MOPlaceMO alloc], "initWithContext:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  -[MOPlaceMO setIdentifier:](v7, "setIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeName"));
  -[MOPlaceMO setName:](v7, "setName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  objc_msgSend(v10, "latitude");
  -[MOPlaceMO setLatitude:](v7, "setLatitude:");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  objc_msgSend(v11, "longitude");
  -[MOPlaceMO setLongitude:](v7, "setLongitude:");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  objc_msgSend(v12, "horizontalUncertainty");
  -[MOPlaceMO setRange:](v7, "setRange:");

  -[MOPlaceMO setUserSpecificPlaceType:](v7, "setUserSpecificPlaceType:", objc_msgSend(v6, "placeUserType"));
  -[MOPlaceMO setProposition:](v7, "setProposition:", objc_msgSend(v6, "proposition"));
  -[MOPlaceMO setPlaceType:](v7, "setPlaceType:", objc_msgSend(v6, "placeType"));
  -[MOPlaceMO setLocationMode:](v7, "setLocationMode:", objc_msgSend(v6, "locationMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "poiCategory"));
  -[MOPlaceMO setPoiCategory:](v7, "setPoiCategory:", v13);

  objc_msgSend(v6, "distanceToHomeInMiles");
  -[MOPlaceMO setDistanceToHomeInMiles:](v7, "setDistanceToHomeInMiles:");
  objc_msgSend(v6, "placeNameConfidence");
  -[MOPlaceMO setPlaceNameConfidence:](v7, "setPlaceNameConfidence:");
  objc_msgSend(v6, "familiarityIndexLOI");
  -[MOPlaceMO setFamiliarityIndexLOI:](v7, "setFamiliarityIndexLOI:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enclosingArea"));
  -[MOPlaceMO setCityName:](v7, "setCityName:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  -[MOPlaceMO setStartDate:](v7, "setStartDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
  -[MOPlaceMO setEndDate:](v7, "setEndDate:", v16);

  objc_msgSend(v6, "priorityScore");
  -[MOPlaceMO setPriorityScore:](v7, "setPriorityScore:");
  -[MOPlaceMO setSourceEventAccessType:](v7, "setSourceEventAccessType:", objc_msgSend(v6, "sourceEventAccessType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceEventIdentifier"));

  -[MOPlaceMO setSourceEventIdentifier:](v7, "setSourceEventIdentifier:", v17);
  return v7;
}

- (id)clonedObjectWithContext:(id)a3
{
  id v4;
  MOPlace *v5;
  void *v6;

  v4 = a3;
  v5 = -[MOPlace initWithPlaceMO:]([MOPlace alloc], "initWithPlaceMO:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOPlaceMO managedObjectWithObject:inManagedObjectContext:](MOPlaceMO, "managedObjectWithObject:inManagedObjectContext:", v5, v4));

  return v6;
}

@end
