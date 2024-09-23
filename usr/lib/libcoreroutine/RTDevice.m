@implementation RTDevice

- (RTDevice)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_deviceName_deviceClass_deviceModel_creationDate_);
}

- (RTDevice)initWithIdentifier:(id)a3 deviceName:(id)a4 deviceClass:(id)a5 deviceModel:(id)a6 creationDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  RTDevice *v17;
  uint64_t v18;
  NSUUID *identifier;
  uint64_t v20;
  NSString *deviceName;
  uint64_t v22;
  NSString *deviceClass;
  uint64_t v24;
  NSString *deviceModel;
  uint64_t v26;
  NSDate *creationDate;
  RTDevice *v28;
  NSObject *v29;
  objc_super v31;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    v31.receiver = self;
    v31.super_class = (Class)RTDevice;
    v17 = -[RTDevice init](&v31, sel_init);
    if (v17)
    {
      v18 = objc_msgSend(v12, "copy");
      identifier = v17->_identifier;
      v17->_identifier = (NSUUID *)v18;

      v20 = objc_msgSend(v13, "copy");
      deviceName = v17->_deviceName;
      v17->_deviceName = (NSString *)v20;

      v22 = objc_msgSend(v14, "copy");
      deviceClass = v17->_deviceClass;
      v17->_deviceClass = (NSString *)v22;

      v24 = objc_msgSend(v15, "copy");
      deviceModel = v17->_deviceModel;
      v17->_deviceModel = (NSString *)v24;

      v26 = objc_msgSend(v16, "copy");
      creationDate = v17->_creationDate;
      v17->_creationDate = (NSDate *)v26;

    }
    self = v17;
    v28 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v28 = 0;
  }

  return v28;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, deviceName, %@, deviceClass, %@, deviceModel, %@"), v4, self->_deviceName, self->_deviceClass, self->_deviceModel);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)createWithManagedObject:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412802;
      v8 = v3;
      v9 = 2080;
      v10 = "+[RTDevice(RTCoreDataTransformable) createWithManagedObject:]";
      v11 = 1024;
      v12 = 32;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTDevice+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_7;
  }
  objc_msgSend((id)objc_opt_class(), "createWithDeviceMO:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

+ (id)createWithDeviceMO:(id)a3
{
  id v3;
  RTDevice *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RTDevice *v10;

  v3 = a3;
  v4 = [RTDevice alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[RTDevice initWithIdentifier:deviceName:deviceClass:deviceModel:creationDate:](v4, "initWithIdentifier:deviceName:deviceClass:deviceModel:creationDate:", v5, v6, v7, v8, v9);
  return v10;
}

@end
