@implementation FRPersonalizationConfiguration

- (FCPersonalizationURLMapping)urlMapping
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration lazyURLMapping](self, "lazyURLMapping"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "value"));

  return (FCPersonalizationURLMapping *)v3;
}

- (FCPersonalizationBundleIDMapping)bundleIDMapping
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration lazyBundleIDMapping](self, "lazyBundleIDMapping"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "value"));

  return (FCPersonalizationBundleIDMapping *)v3;
}

- (FCPersonalizationFavorabilityScores)favorabilityScores
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration lazyFavorabilityScores](self, "lazyFavorabilityScores"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "value"));

  return (FCPersonalizationFavorabilityScores *)v3;
}

- (void)setFavorabilityScoresData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("favorability_scores"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration lazyFavorabilityScores](self, "lazyFavorabilityScores"));
  objc_msgSend(v6, "reset");

}

- (void)setWhitelistData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("whitelist"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration lazyWhitelist](self, "lazyWhitelist"));
  objc_msgSend(v6, "reset");

}

- (void)setURLMappingData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("url_mapping"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration lazyURLMapping](self, "lazyURLMapping"));
  objc_msgSend(v6, "reset");

}

- (void)setBundleIDMappingData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("bundle_id_mapping"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration lazyBundleIDMapping](self, "lazyBundleIDMapping"));
  objc_msgSend(v6, "reset");

}

- (NSDate)portraitLastQueryDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSDate, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("portrait_last_query_date")));
  v6 = FCDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSDate *)v7;
}

- (NSDate)coreDuetLastQueryDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSDate, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("core_duet_last_query_date")));
  v6 = FCDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSDate *)v7;
}

- (void)setAutoFavorites:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  v6 = v5;
  if (v4)
  {
    v9 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v9));
    v8 = v9;
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("auto_favorites"));

    if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100082C3C();

  }
  else
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("auto_favorites"));

  }
}

- (FRPersonalizationAutoFavorites)autoFavorites
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v13;

  v3 = objc_opt_class(NSData, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("auto_favorites")));
  v6 = FCDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v13 = 0;
    v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(FRPersonalizationAutoFavorites, v8), v7, &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v13;
    if (v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100082B84();

  }
  else
  {
    v10 = 0;
  }

  return (FRPersonalizationAutoFavorites *)v10;
}

- (FRPersonalizationConfiguration)initWithKeyValueStore:(id)a3
{
  id v5;
  FRPersonalizationConfiguration *v6;
  FRPersonalizationConfiguration *v7;
  id v8;
  id v9;
  NFLazy *v10;
  NFLazy *lazyURLMapping;
  id v12;
  id v13;
  NFLazy *v14;
  NFLazy *lazyBundleIDMapping;
  id v16;
  id v17;
  NFLazy *v18;
  NFLazy *lazyFavorabilityScores;
  id v20;
  NFLazy *v21;
  NFLazy *lazyWhitelist;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  objc_super v32;

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FRPersonalizationConfiguration;
  v6 = -[FRPersonalizationConfiguration init](&v32, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keyValueStore, a3);
    v8 = objc_alloc((Class)NFLazy);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100006368;
    v30[3] = &unk_1000DE470;
    v9 = v5;
    v31 = v9;
    v10 = (NFLazy *)objc_msgSend(v8, "initWithConstructor:", v30);
    lazyURLMapping = v7->_lazyURLMapping;
    v7->_lazyURLMapping = v10;

    v12 = objc_alloc((Class)NFLazy);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000061E4;
    v28[3] = &unk_1000DE470;
    v13 = v9;
    v29 = v13;
    v14 = (NFLazy *)objc_msgSend(v12, "initWithConstructor:", v28);
    lazyBundleIDMapping = v7->_lazyBundleIDMapping;
    v7->_lazyBundleIDMapping = v14;

    v16 = objc_alloc((Class)NFLazy);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100006120;
    v26[3] = &unk_1000DE470;
    v17 = v13;
    v27 = v17;
    v18 = (NFLazy *)objc_msgSend(v16, "initWithConstructor:", v26);
    lazyFavorabilityScores = v7->_lazyFavorabilityScores;
    v7->_lazyFavorabilityScores = v18;

    v20 = objc_alloc((Class)NFLazy);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000B20C;
    v24[3] = &unk_1000DE470;
    v25 = v17;
    v21 = (NFLazy *)objc_msgSend(v20, "initWithConstructor:", v24);
    lazyWhitelist = v7->_lazyWhitelist;
    v7->_lazyWhitelist = v21;

  }
  return v7;
}

- (FCPersonalizationWhitelist)whitelist
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration lazyWhitelist](self, "lazyWhitelist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "value"));

  return (FCPersonalizationWhitelist *)v3;
}

- (NFLazy)lazyWhitelist
{
  return self->_lazyWhitelist;
}

- (NFLazy)lazyURLMapping
{
  return self->_lazyURLMapping;
}

- (NFLazy)lazyFavorabilityScores
{
  return self->_lazyFavorabilityScores;
}

- (NFLazy)lazyBundleIDMapping
{
  return self->_lazyBundleIDMapping;
}

- (FCKeyValueStore)keyValueStore
{
  return self->_keyValueStore;
}

- (BOOL)hasUrlMapping
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  v3 = objc_msgSend(v2, "containsObjectForKey:", CFSTR("url_mapping"));

  return v3;
}

- (BOOL)hasAutoFavorites
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  v3 = objc_msgSend(v2, "containsObjectForKey:", CFSTR("auto_favorites"));

  return v3;
}

- (BOOL)hasBundleIDMapping
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  v3 = objc_msgSend(v2, "containsObjectForKey:", CFSTR("bundle_id_mapping"));

  return v3;
}

- (FCPersonalizationTodaySectionMapping)todaySectionMapping
{
  FCPersonalizationTodaySectionMapping *todaySectionMapping;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  FCPersonalizationTodaySectionMapping *v11;
  id v12;
  FCPersonalizationTodaySectionMapping *v13;
  id v15;

  todaySectionMapping = self->_todaySectionMapping;
  if (!todaySectionMapping)
  {
    v4 = objc_opt_class(NSData, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("today_section_mapping")));
    v7 = FCDynamicCast(v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
    {
      v15 = 0;
      v10 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(FCPersonalizationTodaySectionMapping, v9), v8, &v15);
      v11 = (FCPersonalizationTodaySectionMapping *)objc_claimAutoreleasedReturnValue(v10);
      v12 = v15;
      if (v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100082A14();

    }
    else
    {
      v11 = 0;
    }
    v13 = self->_todaySectionMapping;
    self->_todaySectionMapping = v11;

    todaySectionMapping = self->_todaySectionMapping;
  }
  return todaySectionMapping;
}

- (void)setTodaySectionMapping:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  objc_storeStrong((id *)&self->_todaySectionMapping, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  v9 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v9));
  v8 = v9;
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("today_section_mapping"));

  if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082ACC();

}

- (void)setCoreDuetLastQueryDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("core_duet_last_query_date"));

}

- (void)setPortraitLastQueryDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRPersonalizationConfiguration keyValueStore](self, "keyValueStore"));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("portrait_last_query_date"));

}

- (id)jsonEncodableObject
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10006B920;
  v3[3] = &unk_1000DB0C0;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary fc_dictionary:](NSDictionary, "fc_dictionary:", v3));
}

- (void)setKeyValueStore:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyWhitelist, 0);
  objc_storeStrong((id *)&self->_lazyFavorabilityScores, 0);
  objc_storeStrong((id *)&self->_lazyBundleIDMapping, 0);
  objc_storeStrong((id *)&self->_lazyURLMapping, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_todaySectionMapping, 0);
}

@end
