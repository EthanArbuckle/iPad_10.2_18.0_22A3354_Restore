@implementation HAPMetadata

- (HAPMetadata)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  HAPMetadata *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSDictionary *v14;
  uint64_t v15;
  NSDictionary *rawPlist;
  HAPMetadata *v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;

  v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HAPMetadata;
  v7 = -[HAPMetadata init](&v33, "init");
  if (!v7)
    goto LABEL_6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[HAPMetadata setParsedUUIDs:](v7, "setParsedUUIDs:", v8);

  if (!-[HAPMetadata parseVersion:](v7, "parseVersion:", v6))
  {
    v18 = sub_10007CCE4(0, v9);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = sub_10007CD2C(0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138543362;
      v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse version information", buf, 0xCu);

    }
    if (!a4)
      goto LABEL_21;
    v22 = 23;
    goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata schemaVersion](v7, "schemaVersion"));
  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  v12 = qword_10026B2C8;

  if (v11 != (id)v12)
  {
    v23 = sub_10007CCE4(0, v13);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = sub_10007CD2C(0);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata schemaVersion](v7, "schemaVersion"));
      *(_DWORD *)buf = 138543874;
      v35 = v26;
      v36 = 2112;
      v37 = v27;
      v38 = 2048;
      v39 = qword_10026B2C8;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@Newer schema version %@, current %lu", buf, 0x20u);

    }
    if (!a4)
      goto LABEL_21;
    v22 = 25;
LABEL_15:
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), v22, 0));
    goto LABEL_22;
  }
  v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("HAP")));
  if (!-[HAPMetadata parseMetadata:](v7, "parseMetadata:", v14))
  {
    v28 = sub_10007CCE4(0, v15);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = sub_10007CD2C(0);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      *(_DWORD *)buf = 138543362;
      v35 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP metadata", buf, 0xCu);

    }
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 23, 0));

LABEL_21:
    v17 = 0;
    goto LABEL_22;
  }
  -[HAPMetadata setParsedUUIDs:](v7, "setParsedUUIDs:", 0);
  rawPlist = v7->_rawPlist;
  v7->_rawPlist = v14;

LABEL_6:
  v17 = v7;
LABEL_22:

  return v17;
}

+ (void)setCurrentMetadataHook:(id)a3
{
  id v3;
  void *v4;

  v3 = objc_retainBlock(a3);
  v4 = (void *)qword_100271640;
  qword_100271640 = (uint64_t)v3;

}

+ (id)getSharedInstance
{
  void *v2;
  uint64_t v3;

  v2 = (void *)qword_100271640;
  if (qword_100271640)
  {
    v3 = (*(uint64_t (**)(void))(qword_100271640 + 16))();
    v2 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  return v2;
}

- (BOOL)parseVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_numberForKey:", CFSTR("Version")));
  -[HAPMetadata setVersion:](self, "setVersion:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_numberForKey:", CFSTR("SchemaVersion")));
  -[HAPMetadata setSchemaVersion:](self, "setSchemaVersion:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata version](self, "version"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata schemaVersion](self, "schemaVersion"));
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)parseUnits:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  HAPMetadataUnit *v13;
  uint64_t v14;
  HAPMetadataUnit *v15;
  id v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hmf_dictionaryForKey:", v10, (_QWORD)v22));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hmf_stringForKey:", CFSTR("DefaultDescription")));
        v13 = -[HAPMetadataUnit initWithName:description:]([HAPMetadataUnit alloc], "initWithName:description:", v10, v12);
        if (!v13)
        {
          v17 = sub_10007CCE4(0, v14);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = sub_10007CD2C(0);
            v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            *(_DWORD *)buf = 138543874;
            v27 = v20;
            v28 = 2112;
            v29 = v10;
            v30 = 2112;
            v31 = v12;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP unit %@  description %@", buf, 0x20u);

          }
          v16 = 0;
          goto LABEL_13;
        }
        v15 = v13;
        objc_msgSend(v4, "setObject:forKey:", v13, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v7)
        continue;
      break;
    }
  }

  v16 = objc_msgSend(v4, "copy");
LABEL_13:

  return v16;
}

- (id)parseProperties:(id)a3
{
  id v3;
  id v4;
  __int128 v5;
  const __CFString *v6;
  const __CFString *v7;
  int *v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  const __CFString *v16;
  const __CFString *v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  id v22;
  __int128 v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];

  v3 = a3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = v3;
  v28 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v30;
    v6 = CFSTR("Position");
    v7 = CFSTR("DefaultDescription");
    v8 = &OBJC_IVAR___HAPAccessory__identifier;
    *(_QWORD *)&v5 = 138544130;
    v24 = v5;
    v25 = v4;
    while (2)
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_dictionaryForKey:", v10, v24));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hmf_numberForKey:", v6));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hmf_stringForKey:", v7));
        v15 = objc_msgSend(objc_alloc((Class)(v8 + 428)), "initWithType:bitPosition:description:", v10, v12, v13);
        if (v15)
        {
          objc_msgSend(v26, "setObject:forKey:", v15, v10);
        }
        else
        {
          v16 = v7;
          v17 = v6;
          v18 = sub_10007CCE4(0, v14);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = sub_10007CD2C(0);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            *(_DWORD *)buf = v24;
            v34 = v21;
            v35 = 2112;
            v36 = v10;
            v37 = 2112;
            v38 = v12;
            v39 = 2112;
            v40 = v13;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP property %@  bitPosition %@ description %@", buf, 0x2Au);

            v4 = v25;
          }

          v6 = v17;
          v7 = v16;
          v8 = &OBJC_IVAR___HAPAccessory__identifier;
        }

        if (!v15)
        {

          v22 = 0;
          goto LABEL_16;
        }
      }
      v28 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      if (v28)
        continue;
      break;
    }
  }

  v22 = objc_msgSend(v26, "copy");
LABEL_16:

  return v22;
}

- (id)parseCharacteristicValue:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  HAPMetadataCharacteristicValue *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  HAPMetadataCharacteristicValue *v16;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MinLength")));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MaxLength")));
  if (v4 | v5)
    v6 = -[HAPMetadataCharacteristicValue initWithMinLength:maxLength:]([HAPMetadataCharacteristicValue alloc], "initWithMinLength:maxLength:", v4, v5);
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MinValue")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MaxValue")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_numberForKey:", CFSTR("StepValue")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_arrayForKey:", CFSTR("ValidValues")));
  if (v7 || v8 || v9)
  {
    if (v6)
    {
      v12 = sub_10007CCE4(0, v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = sub_10007CD2C(0);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138544898;
        v20 = v18;
        v21 = 2112;
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_stringForKey:", CFSTR("ShortUUID")));
        v15 = (void *)v22;
        v23 = 2112;
        v24 = v4;
        v25 = 2112;
        v26 = v5;
        v27 = 2112;
        v28 = v7;
        v29 = 2112;
        v30 = v5;
        v31 = 2112;
        v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Characteristic %@ has both length and value metadata: minLength %@  maxLength %@  minValue %@  maxValue %@  stepValue %@", buf, 0x48u);

      }
    }
    v16 = -[HAPMetadataCharacteristicValue initWithMinValue:maxValue:stepValue:validValues:]([HAPMetadataCharacteristicValue alloc], "initWithMinValue:maxValue:stepValue:validValues:", v7, v8, v9, v11);

    v6 = v16;
  }

  return v6;
}

- (id)parseCharacteristics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  HAPMetadataCharacteristic *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  __CFString *v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  __CFString *v35;
  void *v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  id v40;
  __CFString *v41;
  __int128 v43;
  void *v44;
  void *v45;
  void *v46;
  HAPMetadata *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v7 = v4;
  v49 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v53;
    *(_QWORD *)&v8 = 138544130;
    v43 = v8;
    v45 = v6;
    v46 = v5;
    v47 = self;
    v48 = v7;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v50)
        objc_enumerationMutation(v7);
      v10 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hmf_dictionaryForKey:", v10, v43));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hmf_stringForKey:", CFSTR("ShortUUID")));
      v13 = objc_msgSend(v12, "length");
      if (v13 != (id)kMetadataShortUUIDLength)
        break;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parsedUUIDs](self, "parsedUUIDs"));
      v16 = objc_msgSend(v15, "containsObject:", v12);

      if (v16)
      {
        v40 = sub_10007CCE4(0, v17);
        v34 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v41 = sub_10007CD2C(0);
          v36 = (void *)objc_claimAutoreleasedReturnValue(v41);
          *(_DWORD *)buf = 138543874;
          v57 = v36;
          v58 = 2112;
          v59 = v10;
          v60 = 2112;
          v61 = v12;
          v37 = "%{public}@characteristic %@: UUID %@ is already defined in the metadata";
          v38 = v34;
          v39 = 32;
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);

        }
        goto LABEL_24;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parsedUUIDs](self, "parsedUUIDs"));
      objc_msgSend(v18, "addObject:", v12);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hmf_stringForKey:", CFSTR("DefaultDescription")));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hmf_stringForKey:", CFSTR("Format")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hmf_numberForKey:", CFSTR("Properties")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", v22));

      v51 = (void *)v20;
      v24 = -[HAPMetadataCharacteristic initWithName:uuid:description:format:properties:]([HAPMetadataCharacteristic alloc], "initWithName:uuid:description:format:properties:", v10, v23, v19, v20, v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hmf_stringForKey:", CFSTR("Units")));
      -[HAPMetadataCharacteristic setUnits:](v24, "setUnits:", v25);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parseCharacteristicValue:](self, "parseCharacteristicValue:", v11));
      if (v27)
        -[HAPMetadataCharacteristic setValueMetadata:](v24, "setValueMetadata:", v27);
      if (v24)
      {
        objc_msgSend(v46, "setObject:forKey:", v24, v23);
        objc_msgSend(v45, "setObject:forKey:", v23, v10);
      }
      else
      {
        v28 = sub_10007CCE4(0, v26);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = sub_10007CD2C(0);
          v44 = (void *)objc_claimAutoreleasedReturnValue(v30);
          *(_DWORD *)buf = v43;
          v57 = v44;
          v58 = 2112;
          v59 = v10;
          v60 = 2112;
          v61 = v12;
          v62 = 2112;
          v63 = (uint64_t)v19;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@characteristic %@: Failed to parse - UUID %@  description %@", buf, 0x2Au);

        }
      }

      v7 = v48;
      if (!v24)
        goto LABEL_25;
      v9 = (char *)v9 + 1;
      self = v47;
      if (v49 == v9)
      {
        v6 = v45;
        v5 = v46;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        if (v49)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    v33 = sub_10007CCE4(0, v14);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = sub_10007CD2C(0);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      *(_DWORD *)buf = v43;
      v57 = v36;
      v58 = 2112;
      v59 = v10;
      v60 = 2112;
      v61 = v12;
      v62 = 2048;
      v63 = kMetadataShortUUIDLength;
      v37 = "%{public}@characteristic %@: UUID '%@' length needs to be %lu";
      v38 = v34;
      v39 = 42;
      goto LABEL_23;
    }
LABEL_24:

LABEL_25:
    v32 = 0;
    v6 = v45;
    v5 = v46;
    goto LABEL_26;
  }
LABEL_18:

  v31 = objc_msgSend(v6, "copy");
  -[HAPMetadata setHapCharacteristicNameTypeMap:](self, "setHapCharacteristicNameTypeMap:", v31);

  v32 = objc_msgSend(v5, "copy");
LABEL_26:

  return v32;
}

- (id)parseServiceCharacteristics:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v4, "count")));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v12 = objc_claimAutoreleasedReturnValue(-[HAPMetadata characteristicTypeFromUTI:](self, "characteristicTypeFromUTI:", v11, (_QWORD)v21));
        if (!v12)
        {
          v16 = sub_10007CCE4(0, v13);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = sub_10007CD2C(0);
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            *(_DWORD *)buf = 138543618;
            v26 = v19;
            v27 = 2112;
            v28 = v11;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@Undefined characteristic %@ referenced", buf, 0x16u);

          }
          v15 = 0;
          goto LABEL_13;
        }
        v14 = (void *)v12;
        objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v8)
        continue;
      break;
    }
  }

  v15 = objc_msgSend(v5, "copy");
LABEL_13:

  return v15;
}

- (id)parseServices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  HAPMetadataService *v31;
  void *v32;
  void *v33;
  HAPMetadataService *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  __CFString *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  __CFString *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  id v64;
  NSObject *v65;
  __CFString *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  __CFString *v71;
  void *v72;
  id v73;
  NSObject *v74;
  __CFString *v75;
  void *v76;
  const char *v77;
  NSObject *v78;
  uint32_t v79;
  id v80;
  __CFString *v81;
  __int128 v83;
  id v84;
  NSObject *log;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  HAPMetadata *v90;
  id v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id obj;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  uint64_t v108;
  _BYTE v109[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicMap](self, "hapCharacteristicMap"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    obj = v4;
    v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
    if (v91)
    {
      v92 = *(_QWORD *)v98;
      *(_QWORD *)&v10 = 138543874;
      v83 = v10;
      v84 = v4;
      v86 = v9;
      v87 = v8;
      v90 = self;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v98 != v92)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "hmf_dictionaryForKey:", v12, v83));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hmf_stringForKey:", CFSTR("ShortUUID")));
        v15 = objc_msgSend(v14, "length");
        if (v15 != (id)kMetadataShortUUIDLength)
        {
          v73 = sub_10007CCE4(0, v16);
          v74 = objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v75 = sub_10007CD2C(0);
            v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
            *(_DWORD *)buf = 138544130;
            v102 = v76;
            v103 = 2112;
            v104 = v12;
            v105 = 2112;
            v106 = v14;
            v107 = 2048;
            v108 = kMetadataShortUUIDLength;
            v77 = "%{public}@service %@: UUID '%@' length needs to be %lu";
            v78 = v74;
            v79 = 42;
            goto LABEL_49;
          }
LABEL_50:

LABEL_51:
          v69 = 0;
          v4 = v84;
          v9 = v86;
          v8 = v87;
          goto LABEL_52;
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parsedUUIDs](self, "parsedUUIDs"));
        v18 = objc_msgSend(v17, "containsObject:", v14);

        if (v18)
        {
          v80 = sub_10007CCE4(0, v19);
          v74 = objc_claimAutoreleasedReturnValue(v80);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v81 = sub_10007CD2C(0);
            v76 = (void *)objc_claimAutoreleasedReturnValue(v81);
            *(_DWORD *)buf = v83;
            v102 = v76;
            v103 = 2112;
            v104 = v12;
            v105 = 2112;
            v106 = v14;
            v77 = "%{public}@service %@: UUID %@ is already defined in the metadata";
            v78 = v74;
            v79 = 32;
LABEL_49:
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, v77, buf, v79);

          }
          goto LABEL_50;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parsedUUIDs](self, "parsedUUIDs"));
        objc_msgSend(v20, "addObject:", v14);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hmf_stringForKey:", CFSTR("DefaultDescription")));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hmf_dictionaryForKey:", CFSTR("Characteristics")));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "hmf_arrayForKey:", CFSTR("Required")));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parseServiceCharacteristics:](self, "parseServiceCharacteristics:", v23));

        v25 = v24;
        v96 = v24;
        if (!objc_msgSend(v24, "count"))
        {
          v51 = sub_10007CCE4(0, v26);
          v27 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v52 = sub_10007CD2C(0);
            v53 = v27;
            v54 = v21;
            v55 = (void *)objc_claimAutoreleasedReturnValue(v52);
            *(_DWORD *)buf = 138543618;
            v102 = v55;
            v103 = 2112;
            v104 = v12;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%{public}@service %@: No mandatory characteristics", buf, 0x16u);

            v21 = v54;
            v27 = v53;
          }
          v48 = 1;
          v36 = v22;
          goto LABEL_38;
        }
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hmf_numberForKey:", CFSTR("ServiceProperties")));
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hmf_arrayForKey:", CFSTR("LinkedServices")));
        v94 = v21;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix"));
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", v29));

        v21 = v94;
        v31 = [HAPMetadataService alloc];
        v93 = (void *)v30;
        v32 = v25;
        v33 = (void *)v28;
        v34 = -[HAPMetadataService initWithName:uuid:description:mandatoryChrTypes:properties:linkedServices:](v31, "initWithName:uuid:description:mandatoryChrTypes:properties:linkedServices:", v12, v30, v94, v32, v27, v28);
        if (v34)
          break;
        v48 = 1;
        v36 = v22;
        v49 = v33;
        v50 = v93;
LABEL_37:

        self = v90;
LABEL_38:

        if (v48)
          goto LABEL_51;
        if (v91 == (id)++v11)
        {
          v4 = v84;
          v9 = v86;
          v8 = v87;
          v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
          if (v91)
            goto LABEL_4;
          goto LABEL_41;
        }
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hmf_stringForKey:", CFSTR("BTLE_ShortUUID")));
      v36 = v22;
      v89 = v35;
      if (v35)
      {
        v37 = v35;
        v38 = objc_msgSend(v35, "length");
        if (v38 != (id)kMetadataBTLEUUIDLength)
        {
          v56 = sub_10007CCE4(0, v39);
          v45 = objc_claimAutoreleasedReturnValue(v56);
          v49 = v33;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v57 = sub_10007CD2C(0);
            v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
            *(_DWORD *)buf = 138544130;
            v102 = v58;
            v103 = 2112;
            v104 = v12;
            v105 = 2112;
            v106 = v89;
            v107 = 2048;
            v108 = kMetadataBTLEUUIDLength;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}@service %@: BTLE UUID '%@' length needs to be %lu", buf, 0x2Au);

          }
          v48 = 1;
          v50 = v93;
          goto LABEL_36;
        }
        v40 = v37;
        v88 = v36;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parsedUUIDs](v90, "parsedUUIDs"));
        v42 = objc_msgSend(v41, "containsObject:", v40);

        if (v42)
        {
          v44 = sub_10007CCE4(0, v43);
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v46 = sub_10007CD2C(0);
            v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
            *(_DWORD *)buf = v83;
            v102 = v47;
            v103 = 2112;
            v104 = v12;
            v105 = 2112;
            v106 = v89;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}@service %@: BTLE UUID %@ is already defined in the metadata", buf, 0x20u);

          }
          v48 = 1;
          v49 = v33;
          v50 = v93;
LABEL_35:
          v36 = v88;
LABEL_36:

          v21 = v94;
          goto LABEL_37;
        }
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parsedUUIDs](v90, "parsedUUIDs"));
        objc_msgSend(v59, "addObject:", v40);

        -[HAPMetadataService setBtleuuidStr:](v34, "setBtleuuidStr:", v40);
        v36 = v88;
      }
      v88 = v36;
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "hmf_arrayForKey:", CFSTR("Optional")));
      v45 = objc_claimAutoreleasedReturnValue(-[HAPMetadata parseServiceCharacteristics:](v90, "parseServiceCharacteristics:", v60));

      v49 = v33;
      if (v45)
      {
        v50 = v93;
        if (-[NSObject count](v45, "count"))
          -[HAPMetadataService setOptionalCharacteristics:](v34, "setOptionalCharacteristics:", v45);
        buf[0] = 0;
        v62 = objc_msgSend(v13, "hmf_BOOLForKey:isPresent:", CFSTR("AllowAssociatedService"), buf);
        if (buf[0])
          v63 = v62;
        else
          v63 = 0;
        -[HAPMetadataService setAllowAssociatedService:](v34, "setAllowAssociatedService:", v63);
        -[NSObject setObject:forKey:](v87, "setObject:forKey:", v34, v93);
        objc_msgSend(v86, "setObject:forKey:", v93, v12);
        v48 = 0;
      }
      else
      {
        v64 = sub_10007CCE4(0, v61);
        v65 = objc_claimAutoreleasedReturnValue(v64);
        v50 = v93;
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          v66 = sub_10007CD2C(0);
          log = v65;
          v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
          *(_DWORD *)buf = 138543618;
          v102 = v67;
          v103 = 2112;
          v104 = v12;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@service %@: Error parsing optional characteristics", buf, 0x16u);

          v65 = log;
        }

        v48 = 1;
      }
      goto LABEL_35;
    }
LABEL_41:

    v68 = objc_msgSend(v9, "copy");
    -[HAPMetadata setHapServiceNameTypeMap:](self, "setHapServiceNameTypeMap:", v68);

    v69 = -[NSObject copy](v8, "copy");
LABEL_52:

  }
  else
  {
    v70 = sub_10007CCE4(0, v7);
    v8 = objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v71 = sub_10007CD2C(0);
      v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
      *(_DWORD *)buf = 138543362;
      v102 = v72;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@No HAP characteristics", buf, 0xCu);

    }
    v69 = 0;
  }

  return v69;
}

- (id)parseCharacteristicServiceTuples:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  HAPMetadataTuple *v25;
  uint64_t v26;
  HAPMetadataTuple *v27;
  id v28;
  id v29;
  __CFString *v30;
  NSObject *v31;
  id v32;
  __CFString *v33;
  NSObject *v34;
  id v36;
  __CFString *v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  NSObject *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];
  _BYTE v59[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v4, "count")));
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (!v7)
  {
LABEL_18:

    v28 = objc_msgSend(v5, "copy");
    goto LABEL_26;
  }
  v8 = v7;
  v9 = *(_QWORD *)v49;
LABEL_3:
  v10 = 0;
LABEL_4:
  if (*(_QWORD *)v49 != v9)
    objc_enumerationMutation(v6);
  v11 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v10);
  v12 = objc_claimAutoreleasedReturnValue(-[HAPMetadata characteristicTypeFromUTI:](self, "characteristicTypeFromUTI:", v11));
  if (v12)
  {
    v14 = v12;
    v42 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hmf_arrayForKey:", v11));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    if (!v17)
      goto LABEL_16;
    v18 = v17;
    v19 = *(_QWORD *)v45;
    v43 = v6;
    v40 = v8;
    v41 = v9;
    v39 = v10;
LABEL_9:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v19)
        objc_enumerationMutation(v16);
      v21 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v20);
      v22 = objc_claimAutoreleasedReturnValue(-[HAPMetadata serviceTypeFromUTI:](self, "serviceTypeFromUTI:", v21));
      if (!v22)
        break;
      v24 = v22;
      v25 = -[HAPMetadataTuple initWithCharacteristicType:serviceType:]([HAPMetadataTuple alloc], "initWithCharacteristicType:serviceType:", v14, v22);
      if (!v25)
      {
        v32 = sub_10007CCE4(0, v26);
        v31 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v33 = sub_10007CD2C(0);
          v34 = objc_claimAutoreleasedReturnValue(v33);
          *(_DWORD *)buf = 138543874;
          v53 = v34;
          v54 = 2112;
          v55 = v42;
          v56 = 2112;
          v57 = v21;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP metadata tuple %@,%@", buf, 0x20u);

        }
LABEL_23:

        goto LABEL_24;
      }
      v27 = v25;
      objc_msgSend(v5, "addObject:", v25);

      if (v18 == (id)++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
        v6 = v43;
        v8 = v40;
        v9 = v41;
        v10 = v39;
        if (v18)
          goto LABEL_9;
LABEL_16:

        if ((id)++v10 == v8)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
          if (!v8)
            goto LABEL_18;
          goto LABEL_3;
        }
        goto LABEL_4;
      }
    }
    v29 = sub_10007CCE4(0, v23);
    v24 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v30 = sub_10007CD2C(0);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      *(_DWORD *)buf = 138543618;
      v53 = v31;
      v54 = 2112;
      v55 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@Unknown service '%@' while parsing tuple", buf, 0x16u);
      goto LABEL_23;
    }
LABEL_24:
    v6 = v43;

    goto LABEL_25;
  }
  v36 = sub_10007CCE4(0, v13);
  v14 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v37 = sub_10007CD2C(0);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    *(_DWORD *)buf = 138543618;
    v53 = v38;
    v54 = 2112;
    v55 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@Unknown characteristic '%@' while parsing tuple", buf, 0x16u);

  }
LABEL_25:

  v28 = 0;
LABEL_26:

  return v28;
}

- (BOOL)parseMetadata:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  id v25;
  __CFString *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  id v31;
  __CFString *v32;
  id v33;
  __CFString *v34;
  void *v35;
  id v36;
  __CFString *v37;
  void *v38;
  id v39;
  NSObject *v40;
  __CFString *v41;
  void *v42;
  id v43;
  NSObject *v44;
  __CFString *v45;
  void *v46;
  id v47;
  NSObject *v48;
  __CFString *v49;
  void *v51;
  void *v52;
  os_log_t log;
  NSObject *loga;
  void *v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  uint64_t v62;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_stringForKey:", CFSTR("Base UUID")));
  v7 = v5;
  if (!v5)
  {
    v25 = sub_10007CCE4(0, v6);
    v10 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v26 = sub_10007CD2C(0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138543362;
      v58 = v27;
      v28 = "%{public}@Failed to parse HAP base UUID suffix";
      v29 = v10;
      v30 = 12;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);

    }
LABEL_14:
    v24 = 0;
    goto LABEL_35;
  }
  v8 = objc_msgSend(v5, "length");
  if (v8 != (id)kMetadataBaseUUIDSuffixLength)
  {
    v31 = sub_10007CCE4(0, v9);
    v10 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v32 = sub_10007CD2C(0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v32);
      *(_DWORD *)buf = 138543874;
      v58 = v27;
      v59 = 2048;
      v60 = objc_msgSend(v7, "length");
      v61 = 2048;
      v62 = kMetadataBaseUUIDSuffixLength;
      v28 = "%{public}@Base UUID suffix length is %lu, should be %lu";
      v29 = v10;
      v30 = 32;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  -[HAPMetadata setHapBaseUUIDSuffix:](self, "setHapBaseUUIDSuffix:", v7);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("Units")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parseUnits:](self, "parseUnits:", v10));
  if (v12)
  {
    -[HAPMetadata setHapUnitMap:](self, "setHapUnitMap:", v12);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("Properties")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parseProperties:](self, "parseProperties:", v13));
    if (v15)
    {
      -[HAPMetadata setHapPropertyMap:](self, "setHapPropertyMap:", v15);
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("Characteristics")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parseCharacteristics:](self, "parseCharacteristics:", v16));
      if (v18)
      {
        -[HAPMetadata setHapCharacteristicMap:](self, "setHapCharacteristicMap:", v18);
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("Services")));
        v20 = objc_claimAutoreleasedReturnValue(-[HAPMetadata parseServices:](self, "parseServices:", v19));
        v55 = (void *)v20;
        v56 = (void *)v19;
        if (v20)
        {
          v52 = v18;
          -[HAPMetadata setHapServiceMap:](self, "setHapServiceMap:", v20);
          log = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("SupportsAuthorizationData")));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata parseCharacteristicServiceTuples:](self, "parseCharacteristicServiceTuples:"));
          v24 = v23 != 0;
          if (v23)
          {
            -[HAPMetadata setHapSupportsAuthDataSet:](self, "setHapSupportsAuthDataSet:", v23);
          }
          else
          {
            v47 = sub_10007CCE4(0, v22);
            v48 = objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              v49 = sub_10007CD2C(0);
              v51 = (void *)objc_claimAutoreleasedReturnValue(v49);
              *(_DWORD *)buf = 138543618;
              v58 = v51;
              v59 = 2112;
              v60 = log;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP addAuthData tuples: %@", buf, 0x16u);

            }
          }

          v18 = v52;
          v44 = log;
        }
        else
        {
          v43 = sub_10007CCE4(0, v21);
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v45 = sub_10007CD2C(0);
            loga = v44;
            v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
            *(_DWORD *)buf = 138543618;
            v58 = v46;
            v59 = 2112;
            v60 = (id)v19;
            _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP services: %@", buf, 0x16u);

            v44 = loga;
          }
          v24 = 0;
        }

      }
      else
      {
        v39 = sub_10007CCE4(0, v17);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        v56 = v40;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = sub_10007CD2C(0);
          v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          *(_DWORD *)buf = 138543618;
          v58 = v42;
          v59 = 2112;
          v60 = v16;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP characteristics: %@", buf, 0x16u);

        }
        v24 = 0;
      }

    }
    else
    {
      v36 = sub_10007CCE4(0, v14);
      v16 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v37 = sub_10007CD2C(0);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        *(_DWORD *)buf = 138543618;
        v58 = v38;
        v59 = 2112;
        v60 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP properties: %@", buf, 0x16u);

      }
      v24 = 0;
    }

  }
  else
  {
    v33 = sub_10007CCE4(0, v11);
    v13 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v34 = sub_10007CD2C(0);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      *(_DWORD *)buf = 138543618;
      v58 = v35;
      v59 = 2112;
      v60 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP units: %@", buf, 0x16u);

    }
    v24 = 0;
  }

LABEL_35:
  return v24;
}

+ (id)shortenHAPType:(id)a3 baseUUIDSuffix:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasSuffix:", v6))
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringToIndex:", (_BYTE *)objc_msgSend(v5, "length") - (_BYTE *)objc_msgSend(v6, "length")));
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

- (id)serviceUTIFromType:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  return v4;
}

- (id)serviceTypeFromUTI:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceNameTypeMap](self, "hapServiceNameTypeMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)characteristicUTIFromType:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicFromType:](self, "hapCharacteristicFromType:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  return v4;
}

- (id)characteristicTypeFromUTI:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicNameTypeMap](self, "hapCharacteristicNameTypeMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (BOOL)isStandardHAPService:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a3));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isStandardHAPServiceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceNameTypeMap](self, "hapServiceNameTypeMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6 != 0;
}

- (BOOL)isStandardHAPCharacteristic:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicFromType:](self, "hapCharacteristicFromType:", a3));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isStandardHAPCharacteristicName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicNameTypeMap](self, "hapCharacteristicNameTypeMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6 != 0;
}

- (BOOL)isStandardHAPUnitName:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapUnitFromName:](self, "hapUnitFromName:", a3));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)allowAssociatedService:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a3));
  v4 = objc_msgSend(v3, "allowAssociatedService");

  return v4;
}

- (BOOL)validateMandatoryCharacteristics:(id)a3 forService:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mandatoryCharacteristics"));
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mandatoryCharacteristics"));
    v11 = objc_msgSend(v10, "isSubsetOfSet:", v8);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)descriptionFromServiceType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", v4));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "svcDescription"));
  if (!v6)
    v6 = v4;

  return v6;
}

- (id)descriptionFromCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicFromType:](self, "hapCharacteristicFromType:", v4));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chrDescription"));
  if (!v6)
    v6 = v4;

  return v6;
}

- (BOOL)isMandatoryCharacteristic:(id)a3 forService:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a4));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mandatoryCharacteristics"));
    v10 = objc_msgSend(v9, "containsObject:", v6);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)characteristicValueUnitOfType:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicFromType:](self, "hapCharacteristicFromType:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "units"));

  return v4;
}

- (id)btleToServiceType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("-0000-1000-8000-00805F9B34FB")))
  {
    v5 = objc_msgSend(v4, "length");
    if (v5 == objc_msgSend(CFSTR("00000000-0000-1000-8000-00805F9B34FB"), "length"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 4, 4));
      v7 = v6;
      if (v6)
      {
        v8 = v6;

        v4 = v8;
      }

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceMap](self, "hapServiceMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hmf_firstObjectWithValue:forKeyPath:", v4, CFSTR("btleuuidStr")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuidStr"));
  return v12;
}

- (id)serviceTypeToBTLE:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "btleuuidStr"));

  if (v6)
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "btleuuidStr"));
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

- (BOOL)supportsAdditionalAuthorizationData:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  HAPMetadataTuple *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[HAPMetadataTuple initWithCharacteristicType:serviceType:]([HAPMetadataTuple alloc], "initWithCharacteristicType:serviceType:", v7, v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapSupportsAuthDataSet](self, "hapSupportsAuthDataSet"));
  LOBYTE(self) = objc_msgSend(v9, "containsObject:", v8);

  return (char)self;
}

- (id)getDefaultCharacteristicMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HAPMetadataConstraints *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HAPCharacteristicMetadata *v16;
  void *v17;
  void *v18;
  void *v19;
  HAPCharacteristicMetadata *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicMap](self, "hapCharacteristicMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueMetadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minLength"));
  if (v8
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maxLength"))) != 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minValue"))) != 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maxValue"))) != 0)
  {

  }
  else
  {
    v9 = (HAPMetadataConstraints *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stepValue"));

    if (!v9)
      goto LABEL_7;
  }
  v9 = objc_alloc_init(HAPMetadataConstraints);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minValue"));
  -[HAPMetadataConstraints setMinimumValue:](v9, "setMinimumValue:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maxValue"));
  -[HAPMetadataConstraints setMaximumValue:](v9, "setMaximumValue:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stepValue"));
  -[HAPMetadataConstraints setStepValue:](v9, "setStepValue:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minLength"));
  -[HAPMetadataConstraints setMinLength:](v9, "setMinLength:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maxLength"));
  -[HAPMetadataConstraints setMaxLength:](v9, "setMaxLength:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "validValues"));
  -[HAPMetadataConstraints setValidValues:](v9, "setValidValues:", v15);

LABEL_7:
  v16 = [HAPCharacteristicMetadata alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chrDescription"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "format"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "units"));
  v20 = -[HAPCharacteristicMetadata initWithConstraints:description:format:units:](v16, "initWithConstraints:description:format:units:", v9, v17, v18, v19);

  return v20;
}

- (id)getDefaultCharacteristicProperties:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicFromType:](self, "hapCharacteristicFromType:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "properties"));

  return v4;
}

- (id)getDefaultServiceProperties:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceFromType:](self, "hapServiceFromType:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "properties"));

  return v4;
}

- (id)hapCharacteristicFromName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicMap](self, "hapCharacteristicMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicNameTypeMap](self, "hapCharacteristicNameTypeMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));
  return v8;
}

- (id)hapCharacteristicFromType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicMap](self, "hapCharacteristicMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)hapServiceFromName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceMap](self, "hapServiceMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceNameTypeMap](self, "hapServiceNameTypeMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));
  return v8;
}

- (id)hapServiceFromType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceMap](self, "hapServiceMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)hapUnitFromName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapUnitMap](self, "hapUnitMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (NSArray)hapValueUnits
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapUnitMap](self, "hapUnitMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return (NSArray *)v3;
}

- (NSArray)hapProperties
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapPropertyMap](self, "hapPropertyMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return (NSArray *)v3;
}

- (NSArray)hapCharacteristics
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristicMap](self, "hapCharacteristicMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return (NSArray *)v3;
}

- (NSArray)hapServices
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServiceMap](self, "hapServiceMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return (NSArray *)v3;
}

- (NSArray)hapSupportsAuthDataTuples
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapSupportsAuthDataSet](self, "hapSupportsAuthDataSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  return (NSArray *)v3;
}

- (HAPMetadata)initWithServices:(id)a3 characteristics:(id)a4 units:(id)a5 properties:(id)a6 addAuthDataTuples:(id)a7 hapBaseUUIDSuffix:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSDictionary *v28;
  NSDictionary *hapCharacteristicMap;
  NSDictionary *v30;
  NSDictionary *hapCharacteristicNameTypeMap;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSDictionary *v41;
  NSDictionary *hapServiceMap;
  NSDictionary *v43;
  NSDictionary *hapServiceNameTypeMap;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *k;
  void *v50;
  void *v51;
  NSDictionary *v52;
  NSDictionary *hapUnitMap;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *m;
  void *v59;
  HAPMetadataTuple *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  HAPMetadataTuple *v65;
  NSSet *v66;
  NSSet *hapSupportsAuthDataSet;
  void *v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  void *n;
  void *v74;
  void *v75;
  NSDictionary *v76;
  NSDictionary *hapPropertyMap;
  NSString *v78;
  NSString *hapBaseUUIDSuffix;
  void *v81;
  id v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  HAPMetadata *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  objc_super v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!objc_msgSend(v13, "count")
    || !objc_msgSend(v14, "count")
    || !objc_msgSend(v15, "count")
    || !objc_msgSend(v16, "count")
    || !objc_msgSend(v17, "count"))
  {
    goto LABEL_44;
  }
  v113.receiver = self;
  v113.super_class = (Class)HAPMetadata;
  v92 = -[HAPMetadata init](&v113, "init");
  if (!v92)
  {
    self = 0;
LABEL_44:
    v92 = 0;
    goto LABEL_45;
  }
  v81 = v18;
  self = (HAPMetadata *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v14, "count")));
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v14, "count")));
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v84 = v14;
  v19 = v14;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v110 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uuidStr"));
        -[HAPMetadata setObject:forKey:](self, "setObject:forKey:", v24, v25);

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uuidStr"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
        objc_msgSend(v90, "setObject:forKey:", v26, v27);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
    }
    while (v21);
  }

  v28 = (NSDictionary *)-[HAPMetadata copy](self, "copy");
  hapCharacteristicMap = v92->_hapCharacteristicMap;
  v92->_hapCharacteristicMap = v28;

  v30 = (NSDictionary *)objc_msgSend(v90, "copy");
  hapCharacteristicNameTypeMap = v92->_hapCharacteristicNameTypeMap;
  v92->_hapCharacteristicNameTypeMap = v30;

  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v13, "count")));
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v13, "count")));
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v32 = v13;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v106;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(_QWORD *)v106 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)j);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "uuidStr"));
        objc_msgSend(v89, "setObject:forKey:", v37, v38);

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "uuidStr"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
        objc_msgSend(v88, "setObject:forKey:", v39, v40);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
    }
    while (v34);
  }

  v41 = (NSDictionary *)objc_msgSend(v89, "copy");
  hapServiceMap = v92->_hapServiceMap;
  v92->_hapServiceMap = v41;

  v43 = (NSDictionary *)objc_msgSend(v88, "copy");
  hapServiceNameTypeMap = v92->_hapServiceNameTypeMap;
  v92->_hapServiceNameTypeMap = v43;

  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v15, "count")));
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v45 = v15;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v102;
    do
    {
      for (k = 0; k != v47; k = (char *)k + 1)
      {
        if (*(_QWORD *)v102 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)k);
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "name"));
        objc_msgSend(v87, "setObject:forKey:", v50, v51);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
    }
    while (v47);
  }
  v83 = v16;
  v85 = v13;

  v52 = (NSDictionary *)objc_msgSend(v87, "copy");
  hapUnitMap = v92->_hapUnitMap;
  v92->_hapUnitMap = v52;

  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v17, "count")));
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v82 = v17;
  v54 = v17;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v98;
    do
    {
      for (m = 0; m != v56; m = (char *)m + 1)
      {
        if (*(_QWORD *)v98 != v57)
          objc_enumerationMutation(v54);
        v59 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)m);
        v60 = [HAPMetadataTuple alloc];
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "characteristicType"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata characteristicTypeFromUTI:](v92, "characteristicTypeFromUTI:", v61));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "serviceType"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata serviceTypeFromUTI:](v92, "serviceTypeFromUTI:", v63));
        v65 = -[HAPMetadataTuple initWithCharacteristicType:serviceType:](v60, "initWithCharacteristicType:serviceType:", v62, v64);

        objc_msgSend(v86, "addObject:", v65);
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
    }
    while (v56);
  }

  v66 = (NSSet *)objc_msgSend(v86, "copy");
  hapSupportsAuthDataSet = v92->_hapSupportsAuthDataSet;
  v92->_hapSupportsAuthDataSet = v66;

  v16 = v83;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v83, "count")));
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v69 = v83;
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
  v17 = v82;
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v94;
    do
    {
      for (n = 0; n != v71; n = (char *)n + 1)
      {
        if (*(_QWORD *)v94 != v72)
          objc_enumerationMutation(v69);
        v74 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)n);
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "propertyType"));
        objc_msgSend(v68, "setObject:forKey:", v74, v75);

      }
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
    }
    while (v71);
  }

  v76 = (NSDictionary *)objc_msgSend(v68, "copy");
  hapPropertyMap = v92->_hapPropertyMap;
  v92->_hapPropertyMap = v76;

  v18 = v81;
  v78 = (NSString *)objc_msgSend(v81, "copy");
  hapBaseUUIDSuffix = v92->_hapBaseUUIDSuffix;
  v92->_hapBaseUUIDSuffix = v78;

  -[HAPMetadata updateRawPlist](v92, "updateRawPlist");
  v14 = v84;
  v13 = v85;
LABEL_45:

  return v92;
}

- (BOOL)updateRawPlist
{
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  int v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata generateDictionary](self, "generateDictionary"));
  if (v4)
  {
    objc_storeStrong((id *)&self->_rawPlist, v4);
  }
  else
  {
    v5 = sub_10007CCE4(0, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = sub_10007CD2C(0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v10 = 138543362;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate plist.", (uint8_t *)&v10, 0xCu);

    }
  }

  return v4 != 0;
}

- (id)generateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *k;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *m;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  id v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  _BYTE v89[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Base UUID"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapValueUnits](self, "hapValueUnits"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v79 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "generateDictionary"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Units"));
  v63 = v3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapProperties](self, "hapProperties"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
  v62 = v6;
  v64 = v15;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v75 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "generateDictionary"));
        if (v23)
        {
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "propertyType"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v24);
        }
        else
        {
          v25 = sub_10007CCE4(0, v22);
          v24 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v26 = sub_10007CD2C(0);
            v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "propertyType"));
            *(_DWORD *)buf = 138543618;
            v85 = v27;
            v86 = 2112;
            v87 = v28;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP property %@", buf, 0x16u);

            v15 = v64;
          }
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v15, "count"))
    objc_msgSend(v63, "setObject:forKeyedSubscript:", v15, CFSTR("Properties"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapSupportsAuthDataSet](self, "hapSupportsAuthDataSet"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata generateHAPMetadataTuplesDictionary:](self, "generateHAPMetadataTuplesDictionary:", v29));

  if (objc_msgSend(v30, "count"))
    objc_msgSend(v63, "setObject:forKeyedSubscript:", v30, CFSTR("SupportsAuthorizationData"));
  v61 = v30;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapCharacteristics](self, "hapCharacteristics"));
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v33; k = (char *)k + 1)
      {
        if (*(_QWORD *)v71 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)k);
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "generateDictionary:", v37));

        if (v38)
        {
          v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "name"));
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v38, v40);
        }
        else
        {
          v41 = sub_10007CCE4(0, v39);
          v40 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v42 = sub_10007CD2C(0);
            v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "name"));
            *(_DWORD *)buf = 138543618;
            v85 = v43;
            v86 = 2112;
            v87 = v44;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP characteristic %@", buf, 0x16u);

          }
        }

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    }
    while (v33);
  }

  if (objc_msgSend(v65, "count"))
    objc_msgSend(v63, "setObject:forKeyedSubscript:", v65, CFSTR("Characteristics"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapServices](self, "hapServices"));
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v67;
    do
    {
      for (m = 0; m != v48; m = (char *)m + 1)
      {
        if (*(_QWORD *)v67 != v49)
          objc_enumerationMutation(v46);
        v51 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)m);
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata hapBaseUUIDSuffix](self, "hapBaseUUIDSuffix"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "generateDictionary:metadata:", v52, self));

        if (v53)
        {
          v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "name"));
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v53, v55);
        }
        else
        {
          v56 = sub_10007CCE4(0, v54);
          v55 = objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v57 = sub_10007CD2C(0);
            v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "name"));
            *(_DWORD *)buf = 138543618;
            v85 = v58;
            v86 = 2112;
            v87 = v59;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP service %@", buf, 0x16u);

          }
        }

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    }
    while (v48);
  }

  if (objc_msgSend(v45, "count"))
    objc_msgSend(v63, "setObject:forKeyedSubscript:", v45, CFSTR("Services"));

  return v63;
}

- (id)generateHAPMetadataTuplesDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "characteristicType", (_QWORD)v18));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata characteristicUTIFromType:](self, "characteristicUTIFromType:", v12));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadata serviceUTIFromType:](self, "serviceUTIFromType:", v14));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v13));
        if (!v16)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v13);
        }
        objc_msgSend(v16, "addObject:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(id)a3
{
  objc_storeStrong((id *)&self->_schemaVersion, a3);
}

- (NSString)hapBaseUUIDSuffix
{
  return self->_hapBaseUUIDSuffix;
}

- (void)setHapBaseUUIDSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_hapBaseUUIDSuffix, a3);
}

- (NSDictionary)rawPlist
{
  return self->_rawPlist;
}

- (NSMutableArray)parsedUUIDs
{
  return self->_parsedUUIDs;
}

- (void)setParsedUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_parsedUUIDs, a3);
}

- (NSDictionary)hapUnitMap
{
  return self->_hapUnitMap;
}

- (void)setHapUnitMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapUnitMap, a3);
}

- (NSDictionary)hapPropertyMap
{
  return self->_hapPropertyMap;
}

- (void)setHapPropertyMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapPropertyMap, a3);
}

- (NSDictionary)hapCharacteristicMap
{
  return self->_hapCharacteristicMap;
}

- (void)setHapCharacteristicMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapCharacteristicMap, a3);
}

- (NSDictionary)hapServiceMap
{
  return self->_hapServiceMap;
}

- (void)setHapServiceMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapServiceMap, a3);
}

- (NSSet)hapSupportsAuthDataSet
{
  return self->_hapSupportsAuthDataSet;
}

- (void)setHapSupportsAuthDataSet:(id)a3
{
  objc_storeStrong((id *)&self->_hapSupportsAuthDataSet, a3);
}

- (NSDictionary)hapCharacteristicNameTypeMap
{
  return self->_hapCharacteristicNameTypeMap;
}

- (void)setHapCharacteristicNameTypeMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapCharacteristicNameTypeMap, a3);
}

- (NSDictionary)hapServiceNameTypeMap
{
  return self->_hapServiceNameTypeMap;
}

- (void)setHapServiceNameTypeMap:(id)a3
{
  objc_storeStrong((id *)&self->_hapServiceNameTypeMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapServiceNameTypeMap, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicNameTypeMap, 0);
  objc_storeStrong((id *)&self->_hapSupportsAuthDataSet, 0);
  objc_storeStrong((id *)&self->_hapServiceMap, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicMap, 0);
  objc_storeStrong((id *)&self->_hapPropertyMap, 0);
  objc_storeStrong((id *)&self->_hapUnitMap, 0);
  objc_storeStrong((id *)&self->_parsedUUIDs, 0);
  objc_storeStrong((id *)&self->_rawPlist, 0);
  objc_storeStrong((id *)&self->_hapBaseUUIDSuffix, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
