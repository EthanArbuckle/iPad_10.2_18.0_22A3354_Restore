@implementation FMDEventLoggerFacilityDataPeek

+ (id)facilityName
{
  return CFSTR("FMDEventLoggerFacilityDataPeek");
}

- (FMDEventLoggerFacilityDataPeek)init
{
  FMDEventLoggerFacilityDataPeek *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDEventLoggerFacilityDataPeek;
  v2 = -[FMDEventLoggerFacilityDataPeek init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR(".")));
    -[FMDEventLoggerFacilityDataPeek setBaseIdentifierKey:](v2, "setBaseIdentifierKey:", v5);

  }
  return v2;
}

- (id)loggedEvents
{
  return &__NSArray0__struct;
}

- (void)logEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  double v22;

  v4 = a3;
  if (-[FMDEventLoggerFacilityDataPeek shouldLog](self, "shouldLog"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDEventLoggerFacilityDataPeek baseIdentifierKey](self, "baseIdentifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FMDEventLoggerFacilityDataPeekDistributionValue")));

    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      v11 = v10;
      v12 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412546;
        v20 = v7;
        v21 = 2048;
        v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "DataPeek Distribution : %@ %f", (uint8_t *)&v19, 0x16u);
      }

      ADClientPushValueForDistributionKey(v7, v11);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("FMDEventLoggerFacilityDataPeekCompoundScalarValue")));

    if (v15)
    {
      v16 = objc_msgSend(v15, "integerValue");
      v17 = sub_1000031B8();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412546;
        v20 = v7;
        v21 = 2048;
        v22 = *(double *)&v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "DataPeek Compound Scalar : %@ %lli", (uint8_t *)&v19, 0x16u);
      }

      ADClientAddValueForScalarKey(v7, v16);
    }

  }
}

- (BOOL)shouldLog
{
  return 1;
}

- (NSString)baseIdentifierKey
{
  return self->_baseIdentifierKey;
}

- (void)setBaseIdentifierKey:(id)a3
{
  objc_storeStrong((id *)&self->_baseIdentifierKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseIdentifierKey, 0);
}

@end
