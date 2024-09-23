@implementation MacTrafficIncidentsDetailsCellModel

- (MacTrafficIncidentsDetailsCellModel)initWithVKTrafficIncidentFeature:(id)a3
{
  id v5;
  MacTrafficIncidentsDetailsCellModel *v6;
  MacTrafficIncidentsDetailsCellModel *v7;
  TrafficIncidentsDateFormatter *v8;
  TrafficIncidentsDateFormatter *dateFormatter;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MacTrafficIncidentsDetailsCellModel;
  v6 = -[MacTrafficIncidentsDetailsCellModel init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_incident, a3);
    v8 = objc_alloc_init(TrafficIncidentsDateFormatter);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;

  }
  return v7;
}

- (NSString)dateText
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  __CFString *v7;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCellModel incident](self, "incident"));
  v4 = objc_msgSend(v3, "isRestrictionIncident");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCellModel incident](self, "incident"));
  v6 = v5;
  if (v4)
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "restrictionEffectiveTimeRange"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));

    if (!v8)
    {
      v7 = &stru_1011EB268;
      return (NSString *)v7;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TrafficIncidentEndDate"), CFSTR("localized string not found"), 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCellModel dateFormatter](self, "dateFormatter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCellModel incident](self, "incident"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateStringForDate:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCellModel dateFormatter](self, "dateFormatter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCellModel incident](self, "incident"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeStringForDate:", v16));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v13, v17));

  }
  return (NSString *)v7;
}

- (BOOL)hasDataToShow
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCellModel dateText](self, "dateText"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (VKTrafficIncidentFeature)incident
{
  return self->_incident;
}

- (void)setIncident:(id)a3
{
  objc_storeStrong((id *)&self->_incident, a3);
}

- (TrafficIncidentsDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_incident, 0);
}

@end
