@implementation RAPAuxiliaryControlWatch

- (RAPAuxiliaryControlWatch)initWithPropertiesOfDevice:(id)a3
{
  id v4;
  RAPAuxiliaryControlWatch *v5;
  uint64_t v6;
  NSString *serialNumber;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  RAPAuxiliaryControlWatch *v15;
  GEORPWatchAuxiliaryControl *v16;
  GEORPWatchAuxiliaryControl *reportAProblemControlMessage;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RAPAuxiliaryControlWatch;
  v5 = -[RAPAuxiliaryControlWatch init](&v19, "init");
  if (!v5)
    goto LABEL_11;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", NRDevicePropertySerialNumber));
  serialNumber = v5->_serialNumber;
  v5->_serialNumber = (NSString *)v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", NRDevicePropertyIsActive));
  v5->_active = objc_msgSend(v8, "BOOLValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", NRDevicePropertyProductType));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", NRDevicePropertySystemVersion));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", NRDevicePropertySystemBuildVersion));
  v12 = v11;
  if (v9)
    v13 = v10 == 0;
  else
    v13 = 1;
  if (!v13 && v11 != 0)
  {
    v16 = (GEORPWatchAuxiliaryControl *)objc_alloc_init((Class)GEORPWatchAuxiliaryControl);
    reportAProblemControlMessage = v5->_reportAProblemControlMessage;
    v5->_reportAProblemControlMessage = v16;

    -[GEORPWatchAuxiliaryControl setHardwareIdentifier:](v5->_reportAProblemControlMessage, "setHardwareIdentifier:", v9);
    -[GEORPWatchAuxiliaryControl setOsVersion:](v5->_reportAProblemControlMessage, "setOsVersion:", v10);
    -[GEORPWatchAuxiliaryControl setOsBuild:](v5->_reportAProblemControlMessage, "setOsBuild:", v12);

LABEL_11:
    v15 = v5;
    goto LABEL_12;
  }

  v15 = 0;
LABEL_12:

  return v15;
}

- (BOOL)isSameControlAsControl:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id *v7;
  id *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = objc_opt_class(RAPAuxiliaryControlWatch);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7[1], "isEqual:", self->_serialNumber);
  else
    v9 = 0;

  return v9;
}

- (BOOL)isActive
{
  return self->_active;
}

- (GEORPWatchAuxiliaryControl)reportAProblemControlMessage
{
  return self->_reportAProblemControlMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportAProblemControlMessage, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
