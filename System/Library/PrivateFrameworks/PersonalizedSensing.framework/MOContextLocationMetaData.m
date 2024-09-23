@implementation MOContextLocationMetaData

- (MOContextLocationMetaData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOContextLocationMetaData;
  return -[MOContextLocationMetaData init](&v3, sel_init);
}

- (MOContextLocationMetaData)initWithPlace:(id)a3 city:(id)a4 visitTimeWindow:(id)a5
{
  id v9;
  id v10;
  id v11;
  MOContextLocationMetaData *v12;
  MOContextLocationMetaData *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MOContextLocationMetaData;
  v12 = -[MOContextLocationMetaData init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_place, a3);
    objc_storeStrong((id *)&v13->_city, a4);
    objc_storeStrong((id *)&v13->_visitTimeWindow, a5);
    _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_243AAA000, v14, OS_LOG_TYPE_INFO, "LocationMetaData place,%@,city,%@,visitTimeWindow,%@", buf, 0x20u);
    }

  }
  return v13;
}

- (MOContextLocationMetaData)initWithPlace:(id)a3 city:(id)a4
{
  id v7;
  id v8;
  MOContextLocationMetaData *v9;
  MOContextLocationMetaData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOContextLocationMetaData;
  v9 = -[MOContextLocationMetaData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_place, a3);
    objc_storeStrong((id *)&v10->_city, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOContextLocationMetaData *v4;
  void *v5;
  void *v6;
  void *v7;
  MOContextLocationMetaData *v8;

  v4 = [MOContextLocationMetaData alloc];
  -[MOContextLocationMetaData place](self, "place");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextLocationMetaData city](self, "city");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextLocationMetaData visitTimeWindow](self, "visitTimeWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MOContextLocationMetaData initWithPlace:city:visitTimeWindow:](v4, "initWithPlace:city:visitTimeWindow:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *place;
  id v5;

  place = self->_place;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", place, CFSTR("place"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_city, CFSTR("city"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_visitTimeWindow, CFSTR("visitTimeWindow"));

}

- (MOContextLocationMetaData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MOContextLocationMetaData *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("place"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("city"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visitTimeWindow"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MOContextLocationMetaData initWithPlace:city:visitTimeWindow:](self, "initWithPlace:city:visitTimeWindow:", v5, v6, v7);
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MOContextLocationMetaData place](self, "place");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextLocationMetaData city](self, "city");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextLocationMetaData visitTimeWindow](self, "visitTimeWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("place, %@, city, %@, visit time window %@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDateInterval)visitTimeWindow
{
  return self->_visitTimeWindow;
}

- (NSString)place
{
  return self->_place;
}

- (NSString)city
{
  return self->_city;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_visitTimeWindow, 0);
}

@end
