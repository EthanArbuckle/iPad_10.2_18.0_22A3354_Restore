@implementation TrafficIncidentsDateFormatter

- (TrafficIncidentsDateFormatter)init
{
  TrafficIncidentsDateFormatter *v2;
  TrafficIncidentsDateFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentsDateFormatter;
  v2 = -[TrafficIncidentsDateFormatter init](&v5, "init");
  if (v2)
  {
    if (qword_1014D22E0 != -1)
      dispatch_once(&qword_1014D22E0, &stru_1011B3D50);
    v3 = v2;
  }

  return v2;
}

- (id)dateStringForDate:(id)a3
{
  return objc_msgSend((id)qword_1014D22E8, "stringFromDate:", a3);
}

- (id)timeStringForDate:(id)a3
{
  return objc_msgSend((id)qword_1014D22F0, "stringFromDate:", a3);
}

- (id)lastUpdatedUIStringForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TrafficIncidentLastUpdateDate"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDateFormatter dateStringForDate:](self, "dateStringForDate:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsDateFormatter timeStringForDate:](self, "timeStringForDate:", v4));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v7, v8));
  return v9;
}

@end
