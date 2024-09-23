@implementation RTDeviceMO

+ (id)managedObjectWithIdentifier:(id)a3 deviceName:(id)a4 deviceClass:(id)a5 deviceModel:(id)a6 creationDate:(id)a7 inManagedObjectContext:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  RTDeviceMO *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t v24[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v18)
  {
    v19 = -[RTDeviceMO initWithContext:]([RTDeviceMO alloc], "initWithContext:", v18);
    -[RTCloudManagedObject setIdentifier:](v19, "setIdentifier:", v13);
    -[RTDeviceMO setDeviceName:](v19, "setDeviceName:", v14);
    -[RTDeviceMO setDeviceClass:](v19, "setDeviceClass:", v15);
    -[RTDeviceMO setDeviceModel:](v19, "setDeviceModel:", v16);
    if (v17)
    {
      -[RTDeviceMO setCreationDate:](v19, "setCreationDate:", v17);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDeviceMO setCreationDate:](v19, "setCreationDate:", v21);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDeviceMO setExpirationDate:](v19, "setExpirationDate:", v22);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", v24, 2u);
    }

    v19 = 0;
  }

  return v19;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("RTDeviceMO"));
}

- (RTDeviceMO)device
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[RTDeviceMO(CoreDataProperties) device]";
    v6 = 1024;
    v7 = 26;
    _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "This method should never be called. (in %s:%d)", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (void)setDevice:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[RTDeviceMO(CoreDataProperties) setDevice:]";
    v6 = 1024;
    v7 = 32;
    _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "This method should never be called. (in %s:%d)", (uint8_t *)&v4, 0x12u);
  }

}

@end
