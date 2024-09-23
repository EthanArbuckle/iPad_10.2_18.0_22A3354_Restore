@implementation HAPMetadataService

- (HAPMetadataService)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 mandatoryChrTypes:(id)a6 properties:(id)a7 linkedServices:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = 0;
  if (v14 && v15 && v16)
  {
    v29.receiver = self;
    v29.super_class = (Class)HAPMetadataService;
    v20 = -[HAPMetadataService init](&v29, "init");
    if (v20)
    {
      v21 = objc_msgSend(v14, "copy");
      v22 = (void *)*((_QWORD *)v20 + 2);
      *((_QWORD *)v20 + 2) = v21;

      v23 = objc_msgSend(v15, "copy");
      v24 = (void *)*((_QWORD *)v20 + 4);
      *((_QWORD *)v20 + 4) = v23;

      v25 = objc_msgSend(v16, "copy");
      v26 = (void *)*((_QWORD *)v20 + 3);
      *((_QWORD *)v20 + 3) = v25;

      objc_storeStrong((id *)v20 + 8, a6);
      objc_storeStrong((id *)v20 + 6, a7);
      v27 = v19;
      self = (HAPMetadataService *)*((_QWORD *)v20 + 7);
      *((_QWORD *)v20 + 7) = v27;
    }
    else
    {
      self = 0;
    }
  }

  return (HAPMetadataService *)v20;
}

- (id)generateDictionary:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService uuidStr](self, "uuidStr"));
  v30 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HAPMetadata shortenHAPType:baseUUIDSuffix:](HAPMetadata, "shortenHAPType:baseUUIDSuffix:", v9, v6));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("ShortUUID"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService svcDescription](self, "svcDescription"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("DefaultDescription"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", &stru_10023F210, CFSTR("LocalizationKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService btleuuidStr](self, "btleuuidStr"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService btleuuidStr](self, "btleuuidStr"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("BTLE_ShortUUID"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService mandatoryCharacteristics](self, "mandatoryCharacteristics"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "characteristicUTIFromType:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v20)));
        if (v21)
          objc_msgSend(v15, "addObject:", v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v15, "count"))
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("Required"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService mandatoryCharacteristics](self, "mandatoryCharacteristics"));
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "characteristicUTIFromType:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v27)));
        if (v28)
          objc_msgSend(v22, "addObject:", v28);

        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v25);
  }

  if (objc_msgSend(v22, "count"))
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("Optional"));
  if (objc_msgSend(v14, "count"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("Characteristics"));
  if (-[HAPMetadataService allowAssociatedService](self, "allowAssociatedService"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("AllowAssociatedService"));

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService mandatoryCharacteristics](self, "mandatoryCharacteristics"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuidStr"));
        objc_msgSend(v3, "appendFormat:", CFSTR("%@(%@),"), v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService optionalCharacteristics](self, "optionalCharacteristics"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uuidStr"));
        objc_msgSend(v12, "appendFormat:", CFSTR("%@(%@),"), v19, v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v15);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService name](self, "name"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService uuidStr](self, "uuidStr"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService svcDescription](self, "svcDescription"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HAPMetadataService %@(%@) - %@ - mandatory %@, optional %@"), v21, v22, v23, v3, v12));

  return v24;
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
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  id v30;
  NSObject *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *j;
  void *v50;
  id v51;
  NSObject *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  HAPMetadataService *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  unint64_t v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;

  v3 = sub_10007CCE4(0, (uint64_t)a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = sub_10007CD2C(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService uuidStr](self, "uuidStr"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService svcDescription](self, "svcDescription"));
    *(_DWORD *)buf = 138544130;
    v70 = v6;
    v71 = 2112;
    v72 = (unint64_t)v7;
    v73 = 2112;
    v74 = v8;
    v75 = 2112;
    v76 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataCharaceristics %@(%@):  description: %@", buf, 0x2Au);

  }
  if (-[HAPMetadataService allowAssociatedService](self, "allowAssociatedService"))
  {
    v11 = sub_10007CCE4(0, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = sub_10007CD2C(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = -[HAPMetadataService allowAssociatedService](self, "allowAssociatedService");
      *(_DWORD *)buf = 138543618;
      v70 = v14;
      v71 = 2048;
      v72 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@AllowAssociatedService: %ld", buf, 0x16u);

    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService mandatoryCharacteristics](self, "mandatoryCharacteristics"));
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v19 = sub_10007CCE4(0, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = sub_10007CD2C(0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138543362;
      v70 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@Mandatory characteristics:", buf, 0xCu);

    }
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v58 = self;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService mandatoryCharacteristics](self, "mandatoryCharacteristics"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    if (v24)
    {
      v26 = v24;
      v27 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v64 != v27)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
          v30 = sub_10007CCE4(0, v25);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = sub_10007CD2C(0);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uuidStr"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "chrDescription"));
            *(_DWORD *)buf = 138544130;
            v70 = v33;
            v71 = 2112;
            v72 = (unint64_t)v34;
            v73 = 2112;
            v74 = v35;
            v75 = 2112;
            v76 = v36;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%{public}@%@(%@) - %@", buf, 0x2Au);

          }
        }
        v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      }
      while (v26);
    }

    self = v58;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService optionalCharacteristics](self, "optionalCharacteristics"));
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    v40 = sub_10007CCE4(0, v39);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = sub_10007CD2C(0);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      *(_DWORD *)buf = 138543362;
      v70 = v43;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%{public}@Optional characteristics:", buf, 0xCu);

    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataService optionalCharacteristics](self, "optionalCharacteristics"));
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    if (v45)
    {
      v47 = v45;
      v48 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v47; j = (char *)j + 1)
        {
          if (*(_QWORD *)v60 != v48)
            objc_enumerationMutation(v44);
          v50 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j);
          v51 = sub_10007CCE4(0, v46);
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = sub_10007CD2C(0);
            v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "name"));
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "uuidStr"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "chrDescription"));
            *(_DWORD *)buf = 138544130;
            v70 = v54;
            v71 = 2112;
            v72 = (unint64_t)v55;
            v73 = 2112;
            v74 = v56;
            v75 = 2112;
            v76 = v57;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%{public}@%@(%@) - %@", buf, 0x2Au);

          }
        }
        v47 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      }
      while (v47);
    }

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

- (NSString)svcDescription
{
  return self->_svcDescription;
}

- (void)setSvcDescription:(id)a3
{
  objc_storeStrong((id *)&self->_svcDescription, a3);
}

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (void)setUuidStr:(id)a3
{
  objc_storeStrong((id *)&self->_uuidStr, a3);
}

- (NSString)btleuuidStr
{
  return self->_btleuuidStr;
}

- (void)setBtleuuidStr:(id)a3
{
  objc_storeStrong((id *)&self->_btleuuidStr, a3);
}

- (NSNumber)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setLinkedServices:(id)a3
{
  objc_storeStrong((id *)&self->_linkedServices, a3);
}

- (NSSet)mandatoryCharacteristics
{
  return self->_mandatoryCharacteristics;
}

- (void)setMandatoryCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_mandatoryCharacteristics, a3);
}

- (NSSet)optionalCharacteristics
{
  return self->_optionalCharacteristics;
}

- (void)setOptionalCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_optionalCharacteristics, a3);
}

- (BOOL)allowAssociatedService
{
  return self->_allowAssociatedService;
}

- (void)setAllowAssociatedService:(BOOL)a3
{
  self->_allowAssociatedService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalCharacteristics, 0);
  objc_storeStrong((id *)&self->_mandatoryCharacteristics, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_btleuuidStr, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_svcDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
