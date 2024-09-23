@implementation MSDNPIMaskValues

+ (id)sharedInstance
{
  if (qword_100175358 != -1)
    dispatch_once(&qword_100175358, &stru_10013EB90);
  return (id)qword_100175350;
}

- (MSDNPIMaskValues)initWithPreferencesFile:(id)a3
{
  id v4;
  MSDNPIMaskValues *v5;
  MSDNPIMaskValues *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDNPIMaskValues;
  v5 = -[MSDNPIMaskValues init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDNPIMaskValues setPreferencesFile:](v5, "setPreferencesFile:", v4);
    -[MSDNPIMaskValues setIsNPIDevice:](v6, "setIsNPIDevice:", 0);
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    -[MSDNPIMaskValues setMaskValuesLookUpTable:](v6, "setMaskValuesLookUpTable:", v7);

    -[MSDNPIMaskValues initMaskValuesLookUpTable](v6, "initMaskValuesLookUpTable");
  }

  return v6;
}

- (void)saveDeviceInfo:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[MSDNPIMaskValues saveDeviceInfo:]";
    v12 = 2114;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - deviceInfo:  %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues preferencesFile](self, "preferencesFile"));
    objc_msgSend(v7, "setObject:forKey:", v4, CFSTR("device_info"));

    -[MSDNPIMaskValues populateLookupTableUsingDeviceInfo:](self, "populateLookupTableUsingDeviceInfo:", v4);
  }
  else
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[MSDNPIMaskValues saveDeviceInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - Missing deviceInfo.", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (id)getMaskValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  const char *v11;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  }
  else
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[MSDNPIMaskValues getMaskValueForKey:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - key is nil.", (uint8_t *)&v10, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (void)populateLookupTableUsingDeviceInfo:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = a3;
  if (!objc_msgSend(v27, "count"))
  {
    -[MSDNPIMaskValues setIsNPIDevice:](self, "setIsNPIDevice:", 0);
    goto LABEL_29;
  }
  -[MSDNPIMaskValues setIsNPIDevice:](self, "setIsNPIDevice:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("product_type")));
  if (v5)
  {
    v6 = objc_opt_class(NSString, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      if (objc_msgSend(v5, "length"))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
        objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("ProductType"));

      }
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("part_description")));
  if (v9)
  {
    v10 = objc_opt_class(NSString, v8);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      if (objc_msgSend(v9, "length"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
        objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("MSDDemoPartDescription"));

      }
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("product_description")));
  if (v13
    && (v14 = objc_opt_class(NSString, v12), (objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    && objc_msgSend(v13, "length"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
    v16 = v15;
    v17 = v13;
  }
  else
  {
    if (!v9)
      goto LABEL_19;
    v18 = objc_opt_class(NSString, v12);
    if ((objc_opt_isKindOfClass(v9, v18) & 1) == 0 || !objc_msgSend(v9, "length"))
      goto LABEL_19;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
    v16 = v15;
    v17 = v9;
  }
  objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("MSDDemoProductDescription"));

LABEL_19:
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("device_family")));
  if (v20)
  {
    v21 = objc_opt_class(NSString, v19);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    {
      if (objc_msgSend(v20, "length"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
        objc_msgSend(v22, "setObject:forKey:", v20, CFSTR("MSDDemoDeviceFamily"));

      }
    }
  }
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("part_number")));
  if (!v24
    || (v25 = objc_opt_class(NSString, v23), (objc_opt_isKindOfClass(v24, v25) & 1) == 0)
    || !-[__CFString length](v24, "length"))
  {

    v24 = CFSTR("A-123/A");
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
  objc_msgSend(v26, "setObject:forKey:", v24, CFSTR("PartNumber"));

LABEL_29:
}

- (void)initMaskValuesLookUpTable
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[8];
  _QWORD v11[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues preferencesFile](self, "preferencesFile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("device_info")));

  if (v4)
  {
    v6 = objc_opt_class(NSDictionary, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
      -[MSDNPIMaskValues populateLookupTableUsingDeviceInfo:](self, "populateLookupTableUsingDeviceInfo:", v4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
  objc_msgSend(v7, "setObject:forKey:", &off_10014D958, CFSTR("MSDDemoNANDSize"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNPIMaskValues maskValuesLookUpTable](self, "maskValuesLookUpTable"));
  v10[0] = kMGQDiskUsageTotalSystemCapacity;
  v10[1] = kMGQDiskUsageTotalSystemAvailable;
  v11[0] = &off_10014D970;
  v11[1] = &off_10014D970;
  v10[2] = kMGQDiskUsageTotalDataCapacity;
  v10[3] = kMGQDiskUsageTotalDataAvailable;
  v11[2] = &off_10014D970;
  v11[3] = &off_10014D970;
  v10[4] = kMGQDiskUsageTotalDiskCapacity;
  v10[5] = kMGQDiskUsageAmountDataReserved;
  v11[4] = &off_10014D970;
  v11[5] = &off_10014D970;
  v10[6] = kMGQDiskUsageAmountDataAvailable;
  v10[7] = kMGQDiskUsageAmountRestoreAvailable;
  v11[6] = &off_10014D970;
  v11[7] = &off_10014D970;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 8));
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("DiskUsage"));

}

- (BOOL)isNPIDevice
{
  return self->_isNPIDevice;
}

- (void)setIsNPIDevice:(BOOL)a3
{
  self->_isNPIDevice = a3;
}

- (MSDPreferencesFile)preferencesFile
{
  return self->_preferencesFile;
}

- (void)setPreferencesFile:(id)a3
{
  objc_storeStrong((id *)&self->_preferencesFile, a3);
}

- (NSMutableDictionary)maskValuesLookUpTable
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMaskValuesLookUpTable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskValuesLookUpTable, 0);
  objc_storeStrong((id *)&self->_preferencesFile, 0);
}

@end
