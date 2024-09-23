@implementation FMDEventLoggerEventDataPeekError

- (void)setError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FMDEventLoggerEventDataPeekError;
  v4 = a3;
  -[FMDEventLoggerEventError setError:](&v14, "setError:", v4);
  v5 = objc_msgSend(v4, "code");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedFailureReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu-%@"), v5, v6));
  -[FMDEventLoggerEventError setObject:forKey:](self, "setObject:forKey:", v7, CFSTR("FMDEventLoggerFacilityDataPeekDistributionValue"));

  v13.receiver = self;
  v13.super_class = (Class)FMDEventLoggerEventDataPeekError;
  v8 = -[FMDEventLoggerEventError eventName](&v13, "eventName");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(".%@"), v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v11));
  -[FMDEventLoggerEventDataPeekError setDataPeekEventName:](self, "setDataPeekEventName:", v12);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDEventLoggerEventDataPeekError)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDEventLoggerEventDataPeekError *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDEventLoggerEventDataPeekError;
  v6 = -[FMDEventLoggerEventError initWithCoder:](&v10, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("dataPeekEventName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[FMDEventLoggerEventDataPeekError setDataPeekEventName:](v6, "setDataPeekEventName:", v8);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDEventLoggerEventDataPeekError;
  v4 = a3;
  -[FMDEventLoggerEventError encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerEventDataPeekError dataPeekEventName](self, "dataPeekEventName", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dataPeekEventName"));

}

- (NSString)dataPeekEventName
{
  return self->_dataPeekEventName;
}

- (void)setDataPeekEventName:(id)a3
{
  objc_storeStrong((id *)&self->_dataPeekEventName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPeekEventName, 0);
}

@end
