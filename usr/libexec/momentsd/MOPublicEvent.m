@implementation MOPublicEvent

- (MOPublicEvent)initWithName:(id)a3 performers:(id)a4 venue:(id)a5
{
  id v8;
  id v9;
  id v10;
  MOPublicEvent *v11;
  NSString *v12;
  NSString *name;
  NSArray *v14;
  NSArray *performers;
  NSString *v16;
  NSString *venue;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MOPublicEvent;
  v11 = -[MOPublicEvent init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = v12;

    v14 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", v9, 1);
    performers = v11->_performers;
    v11->_performers = v14;

    v16 = (NSString *)objc_msgSend(v10, "copy");
    venue = v11->_venue;
    v11->_venue = v16;

  }
  return v11;
}

- (MOPublicEvent)initWithEventDictionary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  MOPublicEvent *v9;
  id os_log;
  NSObject *v11;
  void *v12;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("name")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("performers")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("venue")));

  if (v6)
  {
    self = -[MOPublicEvent initWithName:performers:venue:](self, "initWithName:performers:venue:", v6, v7, v8);
    v9 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MOPublicEvent initWithEventDictionary:].cold.1(v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventExtendedAtrributes.m"), 47, CFSTR("Invalid parameter not satisfying: name"));

    v9 = 0;
  }

  return v9;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MOPublicEvent name](self, "name")));
  v4 = objc_msgSend(v3, "UTF8String");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOPublicEvent performers](self, "performers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOPublicEvent venue](self, "venue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOPublicEvent name, %s, performers, %@, venue, %@, >"), v4, v5, v6));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_performers, CFSTR("performers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_venue, CFSTR("venue"));

}

- (MOPublicEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  MOPublicEvent *v17;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_opt_class(NSArray, v8);
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(NSString, v10), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("performers")));

  v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v14), CFSTR("venue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = -[MOPublicEvent initWithName:performers:venue:](self, "initWithName:performers:venue:", v7, v13, v16);
  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)performers
{
  return self->_performers;
}

- (void)setPerformers:(id)a3
{
  objc_storeStrong((id *)&self->_performers, a3);
}

- (NSString)venue
{
  return self->_venue;
}

- (void)setVenue:(id)a3
{
  objc_storeStrong((id *)&self->_venue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venue, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithEventDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", v1, 2u);
}

@end
