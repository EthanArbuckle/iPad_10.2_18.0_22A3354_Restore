@implementation ACCNavigationInfoBuilder

+ (id)accNavigationLaneGuidanceInfoFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new(ACCNavigationLaneGuidanceInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accNavFormat"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1008B74DC;
  v12[3] = &unk_1011DA798;
  v13 = v4;
  v15 = a1;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

+ (id)accNavigationLaneGuidanceLaneInfoFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_opt_new(ACCNavigationLaneGuidanceLaneInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accNavFormat"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008B7700;
  v8[3] = &unk_1011BA738;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

+ (id)accNavigationManeuverUpdateInfoFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_opt_new(ACCNavigationManeuverUpdateInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accNavFormat"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008B77FC;
  v8[3] = &unk_1011BA738;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

+ (id)accNavigationRouteGuidanceUpdateInfoFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_opt_new(ACCNavigationRouteGuidanceUpdateInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accNavFormat"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008B78F8;
  v8[3] = &unk_1011BA738;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

@end
