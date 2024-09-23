@implementation APAdRequestParameters

- (int64_t)placementType
{
  return self->_placementType;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (APContext)context
{
  return self->_context;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (APAdRequestParameters)initWithContext:(id)a3 bundleID:(id)a4 identifier:(id)a5 placement:(int64_t)a6 completionHandler:(id)a7
{
  APContext *v12;
  NSString *v13;
  NSUUID *v14;
  id v15;
  APAdRequestParameters *v16;
  APContext *context;
  APContext *v18;
  NSString *bundleID;
  NSString *v20;
  NSUUID *identifier;
  NSUUID *v22;
  id v23;
  id completionHandler;
  objc_super v26;

  v12 = (APContext *)a3;
  v13 = (NSString *)a4;
  v14 = (NSUUID *)a5;
  v26.receiver = self;
  v26.super_class = (Class)APAdRequestParameters;
  v15 = a7;
  v16 = -[APAdRequestParameters init](&v26, "init");
  context = v16->_context;
  v16->_context = v12;
  v18 = v12;

  bundleID = v16->_bundleID;
  v16->_bundleID = v13;
  v20 = v13;

  identifier = v16->_identifier;
  v16->_identifier = v14;
  v22 = v14;

  v16->_placementType = a6;
  v23 = objc_retainBlock(v15);

  completionHandler = v16->_completionHandler;
  v16->_completionHandler = v23;

  v16->_timestamp = CFAbsoluteTimeGetCurrent();
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APAdRequestParameters)initWithCoder:(id)a3
{
  id v4;
  APAdRequestParameters *v5;
  id v6;
  uint64_t v7;
  APContext *context;
  id v9;
  uint64_t v10;
  NSUUID *identifier;
  id v12;
  uint64_t v13;
  NSString *bundleID;
  double v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APAdRequestParameters;
  v5 = -[APAdRequestParameters init](&v17, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(APContext), CFSTR("context"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    context = v5->_context;
    v5->_context = (APContext *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v10;

    v5->_placementType = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("placementType"));
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bundleID"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v13;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequestParameters context](self, "context"));
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("context"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequestParameters identifier](self, "identifier"));
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[APAdRequestParameters placementType](self, "placementType"), CFSTR("placementType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APAdRequestParameters bundleID](self, "bundleID"));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("bundleID"));

  -[APAdRequestParameters timestamp](self, "timestamp");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("timestamp"));

}

- (NSString)bundleID
{
  return self->_bundleID;
}

@end
