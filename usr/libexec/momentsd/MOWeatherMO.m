@implementation MOWeatherMO

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOWeatherMO *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = a3;
  v7 = -[MOWeatherMO initWithContext:]([MOWeatherMO alloc], "initWithContext:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "weatherIdentifier"));
  -[MOWeatherMO setWeatherIdentifier:](v7, "setWeatherIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  -[MOWeatherMO setStartDate:](v7, "setStartDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
  -[MOWeatherMO setEndDate:](v7, "setEndDate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "weatherSummary"));
  -[MOWeatherMO setWeatherSummary:](v7, "setWeatherSummary:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "weatherSymbolName"));
  -[MOWeatherMO setWeatherSymbolName:](v7, "setWeatherSymbolName:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "temperature"));
  -[MOWeatherMO setTemperature:](v7, "setTemperature:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windSpeed"));
  -[MOWeatherMO setWindSpeed:](v7, "setWindSpeed:", v14);

  -[MOWeatherMO setSourceEventAccessType:](v7, "setSourceEventAccessType:", objc_msgSend(v6, "sourceEventAccessType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceEventIdentifier"));

  -[MOWeatherMO setSourceEventIdentifier:](v7, "setSourceEventIdentifier:", v15);
  return v7;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOWeatherMO"));
}

@end
