@implementation PedestrianARVKFeatureMapEntry

- (PedestrianARVKFeatureMapEntry)initWithFeature:(id)a3 guidanceInfo:(id)a4
{
  id v7;
  id v8;
  PedestrianARVKFeatureMapEntry *v9;
  PedestrianARVKFeatureMapEntry *v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  char *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[PedestrianARVKFeatureMapEntry initWithFeature:guidanceInfo:]";
      v25 = 2080;
      v26 = "PedestrianARVKMapViewMapDelegate.m";
      v27 = 1024;
      v28 = 29;
      v29 = 2080;
      v30 = "feature != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v8)
  {
    v17 = sub_1004318FC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[PedestrianARVKFeatureMapEntry initWithFeature:guidanceInfo:]";
      v25 = 2080;
      v26 = "PedestrianARVKMapViewMapDelegate.m";
      v27 = 1024;
      v28 = 30;
      v29 = 2080;
      v30 = "guidanceInfo != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v24 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)PedestrianARVKFeatureMapEntry;
  v9 = -[PedestrianARVKFeatureMapEntry init](&v22, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feature, a3);
    objc_storeStrong((id *)&v10->_guidanceInfo, a4);
  }

  return v10;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  VKARWalkingFeature *feature;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  feature = self->_feature;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceARInfo mapsShortDescription](self->_guidanceInfo, "mapsShortDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, feature: %@, guidanceInfo: %@>"), v5, self, feature, v7));

  return v8;
}

- (VKARWalkingFeature)feature
{
  return self->_feature;
}

- (MNGuidanceARInfo)guidanceInfo
{
  return self->_guidanceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceInfo, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
