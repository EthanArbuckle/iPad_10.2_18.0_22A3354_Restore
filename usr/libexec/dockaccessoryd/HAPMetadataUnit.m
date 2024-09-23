@implementation HAPMetadataUnit

- (HAPMetadataUnit)initWithName:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  HAPMetadataUnit *v8;
  HAPMetadataUnit *v9;
  NSString *v10;
  NSString *name;
  NSString *v12;
  HAPMetadataUnit *unitDescription;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HAPMetadataUnit;
  v8 = -[HAPMetadataUnit init](&v15, "init");
  v9 = v8;
  if (v7 && v6)
  {
    if (v8)
    {
      v10 = (NSString *)objc_msgSend(v6, "copy");
      name = v9->_name;
      v9->_name = v10;

      v12 = (NSString *)objc_msgSend(v7, "copy");
      unitDescription = (HAPMetadataUnit *)v9->_unitDescription;
      v9->_unitDescription = v12;
    }
    else
    {
      unitDescription = 0;
    }
  }
  else
  {
    unitDescription = v8;
    v9 = 0;
  }

  return v9;
}

+ (id)init:(id)a3 withDictionary:(id)a4
{
  id v5;
  void *v6;
  HAPMetadataUnit *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "hmf_stringForKey:", CFSTR("DefaultDescription")));
  v7 = -[HAPMetadataUnit initWithName:description:]([HAPMetadataUnit alloc], "initWithName:description:", v5, v6);

  return v7;
}

- (id)generateDictionary
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataUnit unitDescription](self, "unitDescription"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DefaultDescription"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_10023F210, CFSTR("LocalizationKey"));
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataUnit name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataUnit unitDescription](self, "unitDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unit %@ - %@"), v3, v4));

  return v5;
}

- (void)dump
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;

  v3 = sub_10007CCE4(0, (uint64_t)a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = sub_10007CD2C(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataUnit name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataUnit unitDescription](self, "unitDescription"));
    v9 = 138543874;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataUnit %@:  description: %@", (uint8_t *)&v9, 0x20u);

  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)unitDescription
{
  return self->_unitDescription;
}

- (void)setUnitDescription:(id)a3
{
  objc_storeStrong((id *)&self->_unitDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
