@implementation MOContextActivityMetaData

- (MOContextActivityMetaData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOContextActivityMetaData;
  return -[MOContextActivityMetaData init](&v3, sel_init);
}

- (MOContextActivityMetaData)initWithActivityType:(id)a3 activityDuration:(id)a4
{
  id v7;
  id v8;
  MOContextActivityMetaData *v9;
  MOContextActivityMetaData *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MOContextActivityMetaData;
  v9 = -[MOContextActivityMetaData init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityType, a3);
    objc_storeStrong((id *)&v10->_activityDuration, a4);
    _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_243AAA000, v11, OS_LOG_TYPE_INFO, "ActivityMetaData activityType,%@,activityDuration,%@", buf, 0x16u);
    }

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOContextActivityMetaData *v4;
  void *v5;
  void *v6;
  MOContextActivityMetaData *v7;

  v4 = [MOContextActivityMetaData alloc];
  -[MOContextActivityMetaData activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextActivityMetaData activityDuration](self, "activityDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOContextActivityMetaData initWithActivityType:activityDuration:](v4, "initWithActivityType:activityDuration:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *activityType;
  id v5;

  activityType = self->_activityType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", activityType, CFSTR("activityType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activityDuration, CFSTR("activityDuration"));

}

- (MOContextActivityMetaData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MOContextActivityMetaData *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MOContextActivityMetaData initWithActivityType:activityDuration:](self, "initWithActivityType:activityDuration:", v5, v6);
  return v7;
}

- (NSDateInterval)activityDuration
{
  return self->_activityDuration;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityDuration, 0);
}

@end
