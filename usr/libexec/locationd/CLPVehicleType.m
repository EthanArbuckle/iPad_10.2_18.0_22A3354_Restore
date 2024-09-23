@implementation CLPVehicleType

- (id)initWithCLMotionActivity:(CLMotionActivity *)a3
{
  CLPVehicleType *v13;
  _BOOL8 v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLPVehicleType;
  v13 = -[CLPVehicleType init](&v16, "init", a3, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&a9, a4, a10);
  if (v13)
  {
    v14 = +[CLPMeta isInIndia](CLPMeta, "isInIndia")
       && CLMotionActivity::isInVehicle(a3)
       && a3->vehicleType == 3;
    -[CLPVehicleType setIsMotorcycle:](v13, "setIsMotorcycle:", v14);
  }
  return v13;
}

@end
