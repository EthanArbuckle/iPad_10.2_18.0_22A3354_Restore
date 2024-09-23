@implementation NavTrayWaypointRow

+ (id)waypointRowsFromNavigationService:(id)a3 withWaypoints:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  char *v14;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "stepIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "route"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "steps"));
    objc_msgSend(v8, "count");

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10090D14C;
    v12[3] = &unk_1011DBCB8;
    v14 = (char *)objc_msgSend(v5, "targetLegIndex") + 1;
    v13 = v5;
    v9 = sub_10039DCD4(v6, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)waypointIndex
{
  return self->_waypointIndex;
}

- (void)setWaypointIndex:(unint64_t)a3
{
  self->_waypointIndex = a3;
}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- (void)setWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_waypoint, a3);
}

- (MNDisplayETALegInfo)etaInfo
{
  return self->_etaInfo;
}

- (void)setEtaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_etaInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaInfo, 0);
  objc_storeStrong((id *)&self->_waypoint, 0);
}

@end
