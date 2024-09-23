@implementation HAPMetadataCharacteristic

- (HAPMetadataCharacteristic)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 format:(id)a6 properties:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  v18 = 0;
  if (v12 && v13 && v14 && v15 && v16)
  {
    v29.receiver = self;
    v29.super_class = (Class)HAPMetadataCharacteristic;
    v18 = -[HAPMetadataCharacteristic init](&v29, "init");
    if (v18)
    {
      v19 = objc_msgSend(v12, "copy");
      v20 = (void *)*((_QWORD *)v18 + 1);
      *((_QWORD *)v18 + 1) = v19;

      v21 = objc_msgSend(v13, "copy");
      v22 = (void *)*((_QWORD *)v18 + 3);
      *((_QWORD *)v18 + 3) = v21;

      v23 = objc_msgSend(v14, "copy");
      v24 = (void *)*((_QWORD *)v18 + 2);
      *((_QWORD *)v18 + 2) = v23;

      v25 = objc_msgSend(v15, "copy");
      v26 = (void *)*((_QWORD *)v18 + 5);
      *((_QWORD *)v18 + 5) = v25;

      v27 = v17;
      self = (HAPMetadataCharacteristic *)*((_QWORD *)v18 + 4);
      *((_QWORD *)v18 + 4) = v27;
    }
    else
    {
      self = 0;
    }
  }

  return (HAPMetadataCharacteristic *)v18;
}

- (id)generateDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic uuidStr](self, "uuidStr"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HAPMetadata shortenHAPType:baseUUIDSuffix:](HAPMetadata, "shortenHAPType:baseUUIDSuffix:", v6, v4));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("ShortUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic chrDescription](self, "chrDescription"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("DefaultDescription"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic format](self, "format"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("Format"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic properties](self, "properties"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("Properties"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &stru_10023F210, CFSTR("LocalizationKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic units](self, "units"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic units](self, "units"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("Units"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic valueMetadata](self, "valueMetadata"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "generateDictionary"));
  objc_msgSend(v5, "addEntriesFromDictionary:", v14);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic uuidStr](self, "uuidStr"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic chrDescription](self, "chrDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic format](self, "format"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic properties](self, "properties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HAPMetadataCharacteristic %@(%@) - %@ - format %@, properties %@"), v3, v4, v5, v6, v7));

  return v8;
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
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v3 = sub_10007CCE4(0, (uint64_t)a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = sub_10007CD2C(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic uuidStr](self, "uuidStr"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic chrDescription](self, "chrDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic format](self, "format"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic properties](self, "properties"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristic units](self, "units"));
    v13 = 138544898;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataCharaceristics %@(%@):  description: %@  format: %@  properties: %@  units:%@", (uint8_t *)&v13, 0x48u);

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

- (NSString)chrDescription
{
  return self->_chrDescription;
}

- (void)setChrDescription:(id)a3
{
  objc_storeStrong((id *)&self->_chrDescription, a3);
}

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (void)setUuidStr:(id)a3
{
  objc_storeStrong((id *)&self->_uuidStr, a3);
}

- (NSNumber)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (NSString)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
  objc_storeStrong((id *)&self->_units, a3);
}

- (HAPMetadataCharacteristicValue)valueMetadata
{
  return self->_valueMetadata;
}

- (void)setValueMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_valueMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_chrDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
