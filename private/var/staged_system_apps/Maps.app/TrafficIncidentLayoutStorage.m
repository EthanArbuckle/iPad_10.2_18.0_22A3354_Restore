@implementation TrafficIncidentLayoutStorage

+ (id)sharedInstance
{
  if (qword_1014D2500 != -1)
    dispatch_once(&qword_1014D2500, &stru_1011B5DA8);
  return (id)qword_1014D2508;
}

- (void)clearCache
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutStorage _sharedUserDefaults](self, "_sharedUserDefaults"));
  objc_msgSend(v2, "setObject:forKey:", 0, CFSTR("TrafficIncidentVotingDictionary"));
  objc_msgSend(v2, "setObject:forKey:", 0, CFSTR("TrafficIncidentLayoutDictionary"));
  objc_msgSend(v2, "synchronize");

}

- (id)_sharedUserDefaults
{
  return +[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults");
}

- (void)saveIncidentVotingLayout:(id)a3
{
  -[TrafficIncidentLayoutStorage _saveIncidentLayout:withIncidentKey:](self, "_saveIncidentLayout:withIncidentKey:", a3, CFSTR("TrafficIncidentVotingDictionary"));
}

- (void)saveIncidentLayout:(id)a3
{
  -[TrafficIncidentLayoutStorage _saveIncidentLayout:withIncidentKey:](self, "_saveIncidentLayout:withIncidentKey:", a3, CFSTR("TrafficIncidentLayoutDictionary"));
}

- (void)_saveIncidentLayout:(id)a3 withIncidentKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutStorage _sharedUserDefaults](self, "_sharedUserDefaults"));
  v13 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v13));

  v10 = v13;
  if (v10)
  {
    v11 = sub_1004327DC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutStorage error archiving incidentLayout %@", buf, 0xCu);
    }

  }
  objc_msgSend(v8, "setObject:forKey:", v9, v6);
  objc_msgSend(v8, "synchronize");

}

- (id)cachedIncidentVotingLayout
{
  return -[TrafficIncidentLayoutStorage _cachedIncidentLayoutWithIncidentKey:](self, "_cachedIncidentLayoutWithIncidentKey:", CFSTR("TrafficIncidentVotingDictionary"));
}

- (id)cachedIncidentLayout
{
  return -[TrafficIncidentLayoutStorage _cachedIncidentLayoutWithIncidentKey:](self, "_cachedIncidentLayoutWithIncidentKey:", CFSTR("TrafficIncidentLayoutDictionary"));
}

- (id)_cachedIncidentLayoutWithIncidentKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutStorage _sharedUserDefaults](self, "_sharedUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  v14 = 0;
  v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(TrafficIncidentLayout), v6, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v14;
  if (v9)
  {
    v10 = sub_1004327DC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "TrafficIncidentLayoutStorage error decoding incidentLayout %@", buf, 0xCu);
    }

    v12 = 0;
  }
  else
  {
    v12 = v8;
  }

  return v12;
}

@end
