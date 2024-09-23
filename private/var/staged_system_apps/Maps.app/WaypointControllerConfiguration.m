@implementation WaypointControllerConfiguration

- (WaypointControllerConfiguration)initWithRequests:(id)a3 traits:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  WaypointControllerConfiguration *v14;
  WaypointControllerConfiguration *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;

  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    v9 = sub_10043214C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = (objc_class *)objc_opt_class(self);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%@ is being initialized with insufficient waypoints(%@). This is not supported.", buf, 0x16u);

    }
  }
  v17.receiver = self;
  v17.super_class = (Class)WaypointControllerConfiguration;
  v14 = -[WaypointControllerConfiguration init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requests, a3);
    objc_storeStrong((id *)&v15->_traits, a4);
  }

  return v15;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v9;

  v3 = objc_alloc((Class)NSMutableString);
  v9.receiver = self;
  v9.super_class = (Class)WaypointControllerConfiguration;
  v4 = -[WaypointControllerConfiguration description](&v9, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithString:", v5);

  objc_msgSend(v6, "appendFormat:", CFSTR("\nrequests:(%@)"), self->_requests);
  v7 = objc_msgSend(v6, "copy");

  return v7;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  id v8;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointControllerConfiguration description](self, "description"));
  v5 = objc_msgSend(v3, "initWithString:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v7 = objc_msgSend(v6, "isInternalInstall");

  if (v7)
    objc_msgSend(v5, "appendFormat:", CFSTR("\ntraits:(%@)"), self->_traits);
  v8 = objc_msgSend(v5, "copy");

  return v8;
}

- (WaypointRequest)origin
{
  return (WaypointRequest *)-[NSArray firstObject](self->_requests, "firstObject");
}

- (WaypointRequest)destination
{
  return (WaypointRequest *)-[NSArray lastObject](self->_requests, "lastObject");
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (NSArray)requests
{
  return self->_requests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_traits, 0);
}

@end
