@implementation CMVehicleStateData

- (CMVehicleStateData)initWithTimeRange:(id)a3 vehicleName:(id)a4 vehicleModelName:(id)a5 vehicleBluetoothAddress:(id)a6
{
  char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMVehicleStateData;
  v10 = -[CMVehicleStateData init](&v12, "init");
  if (v10)
  {
    *((_QWORD *)v10 + 1) = a3;
    *((_QWORD *)v10 + 2) = a4;
    *((_QWORD *)v10 + 3) = a5;
    *((_QWORD *)v10 + 4) = a6;
    *(_OWORD *)(v10 + 40) = xmmword_101BC2400;
  }
  return (CMVehicleStateData *)v10;
}

- (CMVehicleStateData)initWithTimestamp:(id)a3 state:(unint64_t)a4 hints:(unint64_t)a5
{
  CMVehicleStateData *v8;
  CMMotionTimeRange *v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CMVehicleStateData;
  v8 = -[CMVehicleStateData init](&v14, "init");
  if (v8)
  {
    v9 = [CMMotionTimeRange alloc];
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v8->fTimeRange = -[CMMotionTimeRange initWithStartDate:endDate:](v9, "initWithStartDate:endDate:", v11, v12);
    v8->fVehicleName = 0;
    v8->fVehicleModelName = 0;
    v8->fVehicleBluetoothAddress = 0;
    v8->fVehicularState = a4;
    v8->fVehicularHints = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMVehicleStateData;
  -[CMVehicleStateData dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;

  v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if (v4)
  {
    *((_QWORD *)v4 + 1) = -[CMMotionTimeRange copy](self->fTimeRange, "copy");
    *((_QWORD *)v4 + 2) = -[NSString copy](self->fVehicleName, "copy");
    *((_QWORD *)v4 + 3) = -[NSString copy](self->fVehicleModelName, "copy");
    *((_QWORD *)v4 + 4) = -[NSString copy](self->fVehicleBluetoothAddress, "copy");
    *(_OWORD *)(v4 + 40) = *(_OWORD *)&self->fVehicularState;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMVehicleStateData)initWithCoder:(id)a3
{
  uint64_t v4;
  CMVehicleStateData *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMVehicleStateData;
  v5 = -[CMVehicleStateData init](&v10, "init");
  if (v5)
  {
    v5->fTimeRange = (CMMotionTimeRange *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(CMMotionTimeRange, v4), CFSTR("kCMVehicleStateDataCodingKeyTimeRange"));
    v5->fVehicleName = (NSString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v6), CFSTR("kCMVehicleStateDataCodingKeyVehicleName"));
    v5->fVehicleModelName = (NSString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v7), CFSTR("kCMVehicleStateDataCodingKeyVehicleModelName"));
    v5->fVehicleBluetoothAddress = (NSString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v8), CFSTR("kCMVehicleStateDataCodingKeyVehicleBluetoothAddress"));
    v5->fVehicularState = (unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("kCMVehicleStateDataCodingKeyState"));
    v5->fVehicularHints = (unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("kCMVehicleStateDataCodingKeyHints"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->fTimeRange, CFSTR("kCMVehicleStateDataCodingKeyTimeRange"));
  objc_msgSend(a3, "encodeObject:forKey:", self->fVehicleName, CFSTR("kCMVehicleStateDataCodingKeyVehicleName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->fVehicleModelName, CFSTR("kCMVehicleStateDataCodingKeyVehicleModelName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->fVehicleBluetoothAddress, CFSTR("kCMVehicleStateDataCodingKeyVehicleBluetoothAddress"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->fVehicularState, CFSTR("kCMVehicleStateDataCodingKeyState"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->fVehicularHints, CFSTR("kCMVehicleStateDataCodingKeyHints"));
}

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,<startDate %@, endDate %@, deviceId %@, vehicleName %@, vehicleModelName %@, vehicleBluetoothAddress %@, state %@, hints %@>"), NSStringFromClass(v3), -[CMMotionTimeRange startDate](-[CMVehicleStateData timeRange](self, "timeRange"), "startDate"), -[CMMotionTimeRange endDate](-[CMVehicleStateData timeRange](self, "timeRange"), "endDate"), -[CMVehicleStateData deviceId](self, "deviceId"), -[CMVehicleStateData vehicleName](self, "vehicleName"), -[CMVehicleStateData vehicleModelName](self, "vehicleModelName"), -[CMVehicleStateData vehicleBluetoothAddress](self, "vehicleBluetoothAddress"), +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CMVehicleStateData vehicularState](self, "vehicularState")), +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CMVehicleStateData vehicularHints](self, "vehicularHints")));
}

- (CMMotionTimeRange)timeRange
{
  return self->fTimeRange;
}

- (NSString)deviceId
{
  NSString *result;

  result = self->fVehicleName;
  if (!result)
    return self->fVehicleBluetoothAddress;
  return result;
}

- (NSString)vehicleName
{
  return self->fVehicleName;
}

- (NSString)vehicleModelName
{
  return self->fVehicleModelName;
}

- (NSString)vehicleBluetoothAddress
{
  return self->fVehicleBluetoothAddress;
}

- (unint64_t)vehicularState
{
  return self->fVehicularState;
}

- (unint64_t)vehicularHints
{
  return self->fVehicularHints;
}

@end
