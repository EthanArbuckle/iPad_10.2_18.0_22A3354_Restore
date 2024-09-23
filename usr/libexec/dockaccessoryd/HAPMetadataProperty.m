@implementation HAPMetadataProperty

- (HAPMetadataProperty)initWithType:(id)a3 bitPosition:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  HAPMetadataProperty *v11;
  HAPMetadataProperty *v12;
  NSString *v13;
  NSString *propertyType;
  NSString *v15;
  HAPMetadataProperty *propertyDescription;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HAPMetadataProperty;
  v11 = -[HAPMetadataProperty init](&v18, "init");
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      v13 = (NSString *)objc_msgSend(v8, "copy");
      propertyType = v12->_propertyType;
      v12->_propertyType = v13;

      objc_storeStrong((id *)&v12->_bitPosition, a4);
      v15 = (NSString *)objc_msgSend(v10, "copy");
      propertyDescription = (HAPMetadataProperty *)v12->_propertyDescription;
      v12->_propertyDescription = v15;
    }
    else
    {
      propertyDescription = 0;
    }
  }
  else
  {
    propertyDescription = v11;
    v12 = 0;
  }

  return v12;
}

+ (id)init:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HAPMetadataProperty *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hmf_numberForKey:", CFSTR("Position")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hmf_stringForKey:", CFSTR("DefaultDescription")));

  v9 = -[HAPMetadataProperty initWithType:bitPosition:description:]([HAPMetadataProperty alloc], "initWithType:bitPosition:description:", v6, v7, v8);
  return v9;
}

- (id)generateDictionary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataProperty bitPosition](self, "bitPosition"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Position"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataProperty propertyDescription](self, "propertyDescription"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("DefaultDescription"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_10023F210, CFSTR("LocalizationKey"));
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataProperty propertyType](self, "propertyType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataProperty propertyDescription](self, "propertyDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataProperty bitPosition](self, "bitPosition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unit %@ - %@ - bit %@"), v3, v4, v5));

  return v6;
}

- (void)dump
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;

  v3 = sub_10007CCE4(0, (uint64_t)a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = sub_10007CD2C(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataProperty propertyType](self, "propertyType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataProperty propertyDescription](self, "propertyDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataProperty bitPosition](self, "bitPosition"));
    v10 = 138544130;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataProperty %@:  description: %@  bitPosition: %@", (uint8_t *)&v10, 0x2Au);

  }
}

- (NSString)propertyDescription
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPropertyDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)propertyType
{
  return self->_propertyType;
}

- (void)setPropertyType:(id)a3
{
  objc_storeStrong((id *)&self->_propertyType, a3);
}

- (NSNumber)bitPosition
{
  return self->_bitPosition;
}

- (void)setBitPosition:(id)a3
{
  objc_storeStrong((id *)&self->_bitPosition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitPosition, 0);
  objc_storeStrong((id *)&self->_propertyType, 0);
  objc_storeStrong((id *)&self->_propertyDescription, 0);
}

@end
