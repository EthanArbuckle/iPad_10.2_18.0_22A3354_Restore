@implementation VGVehicleState

- (NSNumber)currentBatteryCharge
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicleState currentBatteryCapacity](self, "currentBatteryCapacity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitEnergy kilowattHours](NSUnitEnergy, "kilowattHours"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "measurementByConvertingToUnit:", v3));
  objc_msgSend(v4, "doubleValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)(v5 * 1000.0)));

  return (NSNumber *)v6;
}

@end
