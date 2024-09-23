@implementation RTWiFiAccessPointMO

+ (id)managedObjectWithAccessPoint:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  RTWiFiAccessPointMO *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = -[RTWiFiAccessPointMO initWithContext:]([RTWiFiAccessPointMO alloc], "initWithContext:", v6);
    objc_msgSend(v5, "mac");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWiFiAccessPointMO setMac:](v7, "setMac:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "rssi"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWiFiAccessPointMO setRssi:](v7, "setRssi:", v9);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "channel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWiFiAccessPointMO setChannel:](v7, "setChannel:", v10);

    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "age");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWiFiAccessPointMO setAge:](v7, "setAge:", v12);

    objc_msgSend(v5, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWiFiAccessPointMO setDate:](v7, "setDate:", v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "+[RTWiFiAccessPointMO managedObjectWithAccessPoint:inManagedObjectContext:]";
      v18 = 1024;
      v19 = 21;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext (in %s:%d)", (uint8_t *)&v16, 0x12u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("RTWiFiAccessPointMO"));
}

@end
