@implementation NanoRoutePlanningResponseSnapshot

- (NanoRoutePlanningResponseSnapshot)init
{
  NanoRoutePlanningResponseSnapshot *v2;
  uint64_t v3;
  NSDate *timestamp;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NanoRoutePlanningResponseSnapshot;
  v2 = -[NanoRoutePlanningResponseSnapshot init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSDate *)v3;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot revisionIdentifiers](self, "revisionIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "revisionIdentifiers"));
    if (+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v6, v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot selectedRouteIdentifier](self, "selectedRouteIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedRouteIdentifier"));
      if (+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v8, v9))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot selectedRideIndexes](self, "selectedRideIndexes"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedRideIndexes"));
        v12 = +[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v10, v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)deltaFromSnapshot:(id)a3
{
  id v4;
  uint64_t v5;
  NanoRoutePlanningResponseSnapshot *v6;
  NanoRoutePlanningResponseDelta *v7;
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
  id v18;
  NanoRoutePlanningResponseSnapshot *v19;
  NanoRoutePlanningResponseSnapshot *v20;
  NanoRoutePlanningResponseSnapshot *v21;
  NanoRoutePlanningResponseSnapshot *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NanoRoutePlanningResponseSnapshot *v28;
  id v29;
  void *v30;
  _QWORD v32[4];
  NanoRoutePlanningResponseSnapshot *v33;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(self), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    v6 = (NanoRoutePlanningResponseSnapshot *)v4;
    v7 = objc_alloc_init(NanoRoutePlanningResponseDelta);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot routeIdentifiers](self, "routeIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot routeIdentifiers](v6, "routeIdentifiers"));
    -[NanoRoutePlanningResponseDelta setRoutesChanged:](v7, "setRoutesChanged:", +[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v8, v9) ^ 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot selectedRouteIdentifier](self, "selectedRouteIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot selectedRouteIdentifier](v6, "selectedRouteIdentifier"));
    -[NanoRoutePlanningResponseDelta setSelectedRouteChanged:](v7, "setSelectedRouteChanged:", +[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v10, v11) ^ 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot revisionIdentifiers](self, "revisionIdentifiers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot revisionIdentifiers](v6, "revisionIdentifiers"));
    -[NanoRoutePlanningResponseDelta setRouteRevisionsChanged:](v7, "setRouteRevisionsChanged:", +[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v12, v13) ^ 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot selectedRideIndexes](self, "selectedRideIndexes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot selectedRideIndexes](v6, "selectedRideIndexes"));
    -[NanoRoutePlanningResponseDelta setSelectedRideIndexesChanged:](v7, "setSelectedRideIndexesChanged:", +[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v14, v15) ^ 1);

    if (-[NanoRoutePlanningResponseDelta routeRevisionsChanged](v7, "routeRevisionsChanged"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot timestamp](v6, "timestamp"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot timestamp](self, "timestamp"));
      v18 = objc_msgSend(v16, "compare:", v17);

      if (v18 == (id)-1)
        v19 = v6;
      else
        v19 = self;
      if (v18 == (id)-1)
        v20 = self;
      else
        v20 = v6;
      v21 = v19;
      v22 = v20;
      v23 = objc_alloc((Class)NSMutableOrderedSet);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot revisionIdentifiers](v22, "revisionIdentifiers"));
      v25 = objc_msgSend(v23, "initWithArray:", v24);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot revisionIdentifiers](v21, "revisionIdentifiers"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v26));
      objc_msgSend(v25, "minusSet:", v27);

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100349880;
      v32[3] = &unk_1011B24E0;
      v33 = v22;
      v28 = v22;
      v29 = sub_10039DCD4(v25, v32);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      -[NanoRoutePlanningResponseDelta setIdentifiersForChangedRoutes:](v7, "setIdentifiersForChangedRoutes:", v30);

    }
  }
  else
  {
    v7 = (NanoRoutePlanningResponseDelta *)objc_claimAutoreleasedReturnValue(+[NanoRoutePlanningResponseDelta everythingChanged](NanoRoutePlanningResponseDelta, "everythingChanged"));
  }

  return v7;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NanoRoutePlanningResponseSnapshot;
  v3 = -[NanoRoutePlanningResponseSnapshot description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot routeIdentifiers](self, "routeIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot selectedRouteIdentifier](self, "selectedRouteIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot revisionIdentifiers](self, "revisionIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponseSnapshot selectedRideIndexes](self, "selectedRideIndexes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {\nrouteIdentifiers: %@\nselectedRouteIdentifier: %@\nrevisionIdentifiers: %@\nselectedRideIndexes: %@\n}"), v4, v5, v6, v7, v8));

  return (NSString *)v9;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSArray)routeIdentifiers
{
  return self->_routeIdentifiers;
}

- (void)setRouteIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)revisionIdentifiers
{
  return self->_revisionIdentifiers;
}

- (void)setRevisionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)selectedRouteIdentifier
{
  return self->_selectedRouteIdentifier;
}

- (void)setSelectedRouteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)selectedRideIndexes
{
  return self->_selectedRideIndexes;
}

- (void)setSelectedRideIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedRideIndexes, 0);
  objc_storeStrong((id *)&self->_selectedRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_revisionIdentifiers, 0);
  objc_storeStrong((id *)&self->_routeIdentifiers, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
