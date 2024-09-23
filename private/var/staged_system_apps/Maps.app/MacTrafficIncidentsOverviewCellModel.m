@implementation MacTrafficIncidentsOverviewCellModel

- (MacTrafficIncidentsOverviewCellModel)initWithVKTrafficIncidentFeature:(id)a3
{
  id v5;
  MacTrafficIncidentsOverviewCellModel *v6;
  MacTrafficIncidentsOverviewCellModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MacTrafficIncidentsOverviewCellModel;
  v6 = -[MacTrafficIncidentsOverviewCellModel init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_incident, a3);

  return v7;
}

- (NSString)overviewText
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsOverviewCellModel incident](self, "incident"));
  v4 = objc_msgSend(v3, "isRestrictionIncident");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsOverviewCellModel incident](self, "incident"));
  v6 = v5;
  if (!v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
    if (v7)
      goto LABEL_3;
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsOverviewCellModel incident](self, "incident"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subtitle"));

    v8 = 0;
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "restrictionCombinedDetails"));
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v8 = v7;
  v9 = v8;
LABEL_6:

  return (NSString *)v9;
}

- (BOOL)hasDataToShow
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsOverviewCellModel overviewText](self, "overviewText"));
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incident, 0);
}

@end
