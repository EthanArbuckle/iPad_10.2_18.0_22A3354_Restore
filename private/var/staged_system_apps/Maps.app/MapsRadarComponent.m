@implementation MapsRadarComponent

- (MapsRadarComponent)initWithName:(id)a3 version:(id)a4 ID:(id)a5
{
  id v8;
  id v9;
  id v10;
  MapsRadarComponent *v11;
  NSString *v12;
  NSString *name;
  NSString *v14;
  NSString *version;
  NSNumber *v16;
  NSNumber *ID;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  char *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  char *v33;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v19 = sub_1004318FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v36 = "-[MapsRadarComponent initWithName:version:ID:]";
      v37 = 2080;
      v38 = "MapsRadarComponent.m";
      v39 = 1024;
      v40 = 23;
      v41 = 2080;
      v42 = "name != nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v36 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v9)
  {
    v24 = sub_1004318FC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v36 = "-[MapsRadarComponent initWithName:version:ID:]";
      v37 = 2080;
      v38 = "MapsRadarComponent.m";
      v39 = 1024;
      v40 = 24;
      v41 = 2080;
      v42 = "version != nil";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v26 = sub_1004318FC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v36 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v10)
  {
    v29 = sub_1004318FC();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v36 = "-[MapsRadarComponent initWithName:version:ID:]";
      v37 = 2080;
      v38 = "MapsRadarComponent.m";
      v39 = 1024;
      v40 = 25;
      v41 = 2080;
      v42 = "ID != nil";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v31 = sub_1004318FC();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v36 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v34.receiver = self;
  v34.super_class = (Class)MapsRadarComponent;
  v11 = -[MapsRadarComponent init](&v34, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = v12;

    v14 = (NSString *)objc_msgSend(v9, "copy");
    version = v11->_version;
    v11->_version = v14;

    v16 = (NSNumber *)objc_msgSend(v10, "copy");
    ID = v11->_ID;
    v11->_ID = v16;

  }
  return v11;
}

- (NSString)description
{
  MapsRadarComponent *v2;
  id v3;
  void ***v4;
  MapsRadarComponent *v5;
  MapsRadarComponent *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10051B7FC;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[MapsRadarComponent _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarComponent performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v12, v13));

  return (NSString *)v14;
}

- (NSString)debugDescription
{
  MapsRadarComponent *v2;
  id v3;
  void ***v4;
  MapsRadarComponent *v5;
  MapsRadarComponent *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10051B97C;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[MapsRadarComponent _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarComponent performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v12, v13));

  return (NSString *)v14;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(v6, CFSTR("version"), self->_version);
  (*((void (**)(id, const __CFString *, NSNumber *))a3 + 2))(v6, CFSTR("id"), self->_ID);

}

+ (MapsRadarComponent)mapsClientComponent
{
  return -[MapsRadarComponent initWithName:version:ID:]([MapsRadarComponent alloc], "initWithName:version:ID:", CFSTR("Maps Client (New Bugs)"), CFSTR("iOS"), &off_10126D990);
}

+ (MapsRadarComponent)mapsComponent
{
  return -[MapsRadarComponent initWithName:version:ID:]([MapsRadarComponent alloc], "initWithName:version:ID:", CFSTR("Maps"), CFSTR("New Bugs"), &off_10126D9A8);
}

+ (MapsRadarComponent)mapsLookAroundComponent
{
  return -[MapsRadarComponent initWithName:version:ID:]([MapsRadarComponent alloc], "initWithName:version:ID:", CFSTR("Maps Munin Living On"), CFSTR("1.0"), &off_10126D9C0);
}

+ (MapsRadarComponent)mapsGeoServicesComponent
{
  return -[MapsRadarComponent initWithName:version:ID:]([MapsRadarComponent alloc], "initWithName:version:ID:", CFSTR("GeoServices"), CFSTR("All"), &off_10126D9D8);
}

+ (MapsRadarComponent)mapsMapDisplayComponent
{
  return -[MapsRadarComponent initWithName:version:ID:]([MapsRadarComponent alloc], "initWithName:version:ID:", CFSTR("MapDisplay"), CFSTR("All"), &off_10126D9F0);
}

+ (MapsRadarComponent)mapsNavFrameworkComponent
{
  return -[MapsRadarComponent initWithName:version:ID:]([MapsRadarComponent alloc], "initWithName:version:ID:", CFSTR("Maps FW Nav"), CFSTR("iOS"), &off_10126DA08);
}

+ (MapsRadarComponent)mapsAppNavUIWalkingComponent
{
  return -[MapsRadarComponent initWithName:version:ID:]([MapsRadarComponent alloc], "initWithName:version:ID:", CFSTR("Maps App Nav UI Walking"), CFSTR("iOS"), &off_10126DA20);
}

+ (MapsRadarComponent)mapsVisualLocalizationComponent
{
  return -[MapsRadarComponent initWithName:version:ID:]([MapsRadarComponent alloc], "initWithName:version:ID:", CFSTR("Maps Visual Localization"), CFSTR("3DV"), &off_10126DA38);
}

+ (MapsRadarComponent)mapsAppCoreUIComponent
{
  return -[MapsRadarComponent initWithName:version:ID:]([MapsRadarComponent alloc], "initWithName:version:ID:", CFSTR("Maps App Core UI"), CFSTR("All"), &off_10126DA50);
}

+ (MapsRadarComponent)mapsShareETAiOSComponent
{
  return -[MapsRadarComponent initWithName:version:ID:]([MapsRadarComponent alloc], "initWithName:version:ID:", CFSTR("Maps App Share ETA"), CFSTR("iOS"), &off_10126DA68);
}

+ (MapsRadarComponent)mapsShareETACarPlayComponent
{
  return -[MapsRadarComponent initWithName:version:ID:]([MapsRadarComponent alloc], "initWithName:version:ID:", CFSTR("Maps App Share ETA"), CFSTR("CarPlay"), &off_10126DA80);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSNumber)ID
{
  return self->_ID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
