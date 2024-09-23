@implementation MIBUDeviceStatus

- (MIBUDeviceStatus)init
{
  MIBUDeviceStatus *v2;
  MIBUDeviceStatus *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUDeviceStatus;
  v2 = -[MIBUDeviceStatus init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MIBUDeviceStatus setState:](v2, "setState:", 0);
    -[MIBUDeviceStatus setOperation:](v3, "setOperation:", 0);
    -[MIBUDeviceStatus setOperationDetails:](v3, "setOperationDetails:", 0);
    -[MIBUDeviceStatus setOperationError:](v3, "setOperationError:", 0);
    -[MIBUDeviceStatus setBatteryLevel:](v3, "setBatteryLevel:", 0);
    -[MIBUDeviceStatus setThermalDetails:](v3, "setThermalDetails:", 0);
    -[MIBUDeviceStatus setBatteryDetails:](v3, "setBatteryDetails:", 0);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
    goto LABEL_10;
  v6 = objc_msgSend(v4, "state");
  if (v6 != (id)-[MIBUDeviceStatus state](self, "state"))
    goto LABEL_10;
  v7 = objc_msgSend(v4, "operation");
  if (v7 != (id)-[MIBUDeviceStatus operation](self, "operation"))
    goto LABEL_10;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "operationError"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceStatus operationError](self, "operationError"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (!v12)
    goto LABEL_10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "operationError"));
  v14 = objc_msgSend(v13, "code");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceStatus operationError](self, "operationError"));
  v16 = objc_msgSend(v15, "code");

  if (v14 != v16)
    goto LABEL_10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "batteryLevel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceStatus batteryLevel](self, "batteryLevel"));
  v19 = objc_msgSend(v17, "isEqualToNumber:", v18);

  if (!v19)
    goto LABEL_10;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "operationDetails"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceStatus operationDetails](self, "operationDetails"));
  v22 = objc_msgSend(v20, "isEqualToDictionary:", v21);

  if (!v22)
    goto LABEL_10;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "thermalDetails"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceStatus thermalDetails](self, "thermalDetails"));
  v25 = objc_msgSend(v23, "isEqualToDictionary:", v24);

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "batteryDetails"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceStatus batteryDetails](self, "batteryDetails"));
    v28 = objc_msgSend(v26, "isEqualToDictionary:", v27);

  }
  else
  {
LABEL_10:
    v28 = 0;
  }

  return v28;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
  objc_storeStrong((id *)&self->_operationError, a3);
}

- (NSNumber)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevel, a3);
}

- (NSDictionary)operationDetails
{
  return self->_operationDetails;
}

- (void)setOperationDetails:(id)a3
{
  objc_storeStrong((id *)&self->_operationDetails, a3);
}

- (NSDictionary)thermalDetails
{
  return self->_thermalDetails;
}

- (void)setThermalDetails:(id)a3
{
  objc_storeStrong((id *)&self->_thermalDetails, a3);
}

- (NSDictionary)batteryDetails
{
  return self->_batteryDetails;
}

- (void)setBatteryDetails:(id)a3
{
  objc_storeStrong((id *)&self->_batteryDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryDetails, 0);
  objc_storeStrong((id *)&self->_thermalDetails, 0);
  objc_storeStrong((id *)&self->_operationDetails, 0);
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
}

@end
