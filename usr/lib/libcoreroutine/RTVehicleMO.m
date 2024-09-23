@implementation RTVehicleMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTVehicleMO"));
}

+ (id)managedObjectWithVehicle:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  RTVehicleMO *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  __int16 v20;
  __int16 v21;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v8 = 0;
      goto LABEL_8;
    }
    v21 = 0;
    v17 = "Invalid parameter not satisfying: vehicle";
    v18 = (uint8_t *)&v21;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    goto LABEL_7;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v20 = 0;
    v17 = "Invalid parameter not satisfying: managedObjectContext";
    v18 = (uint8_t *)&v20;
    goto LABEL_10;
  }
  v8 = -[RTVehicleMO initWithContext:]([RTVehicleMO alloc], "initWithContext:", v6);
  objc_msgSend(v5, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleMO setStartDate:](v8, "setStartDate:", v10);

  objc_msgSend(v5, "dateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleMO setEndDate:](v8, "setEndDate:", v12);

  objc_msgSend(v5, "bluetoothAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleMO setBluetoothAddress:](v8, "setBluetoothAddress:", v13);

  objc_msgSend(v5, "vehicleName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleMO setVehicleName:](v8, "setVehicleName:", v14);

  objc_msgSend(v5, "vehicleModelName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleMO setVehicleModelName:](v8, "setVehicleModelName:", v15);

LABEL_8:
  return v8;
}

@end
