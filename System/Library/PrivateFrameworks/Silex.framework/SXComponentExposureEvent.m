@implementation SXComponentExposureEvent

- (SXComponentExposureEvent)initWithComponent:(id)a3
{
  id v4;
  SXComponentExposureEvent *v5;
  uint64_t v6;
  NSString *componentIdentifier;
  void *v8;
  uint64_t v9;
  NSString *componentRole;
  uint64_t v11;
  NSString *componentType;
  void *v13;
  uint64_t v14;
  NSDictionary *metaData;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SXComponentExposureEvent;
  v5 = -[SXAnalyticsEvent init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    componentIdentifier = v5->_componentIdentifier;
    v5->_componentIdentifier = (NSString *)v6;

    objc_msgSend(v4, "classification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "roleString");
    v9 = objc_claimAutoreleasedReturnValue();
    componentRole = v5->_componentRole;
    v5->_componentRole = (NSString *)v9;

    objc_msgSend(v4, "type");
    v11 = objc_claimAutoreleasedReturnValue();
    componentType = v5->_componentType;
    v5->_componentType = (NSString *)v11;

    objc_msgSend(v4, "analytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "jsonDictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    metaData = v5->_metaData;
    v5->_metaData = (NSDictionary *)v14;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentExposureEvent componentType](self, "componentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; type: %@"), v4);

  -[SXComponentExposureEvent componentIdentifier](self, "componentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; identifier: %@"), v5);

  -[SXAnalyticsEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SXAnalyticsEvent endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = v8;
    -[SXAnalyticsEvent startDate](self, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "appendFormat:", CFSTR("; duration: %f"), v9 - v11);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("; duration: undetermined"));
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSString)componentIdentifier
{
  return self->_componentIdentifier;
}

- (NSString)componentType
{
  return self->_componentType;
}

- (NSString)componentRole
{
  return self->_componentRole;
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_componentRole, 0);
  objc_storeStrong((id *)&self->_componentType, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
}

@end
