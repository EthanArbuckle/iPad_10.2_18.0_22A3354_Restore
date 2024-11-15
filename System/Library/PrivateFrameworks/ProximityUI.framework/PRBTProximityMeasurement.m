@implementation PRBTProximityMeasurement

+ (id)btProximityWithTime:(double)a3 proximityLevel:(unint64_t)a4 rssi:(double)a5 continuousProximityLevel:(id)a6 uuid:(id)a7 proximityTrend:(unint64_t)a8
{
  id v13;
  id v14;
  PRBTProximityMeasurement *v15;

  v13 = a7;
  v14 = a6;
  v15 = -[PRBTProximityMeasurement initWithTime:proximityLevel:rssi:continuousProximityLevel:uuid:proximityTrend:]([PRBTProximityMeasurement alloc], "initWithTime:proximityLevel:rssi:continuousProximityLevel:uuid:proximityTrend:", a4, v14, v13, a8, a3, a5);

  return v15;
}

- (PRBTProximityMeasurement)initWithTime:(double)a3 proximityLevel:(unint64_t)a4 rssi:(double)a5 continuousProximityLevel:(id)a6 uuid:(id)a7 proximityTrend:(unint64_t)a8
{
  id v15;
  id v16;
  PRBTProximityMeasurement *v17;
  PRBTProximityMeasurement *v18;
  objc_super v20;

  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PRBTProximityMeasurement;
  v17 = -[PRBTProximityMeasurement init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_timestamp = a3;
    v17->_proximityLevel = a4;
    v17->_rssi = a5;
    objc_storeStrong((id *)&v17->_continuousProximityLevel, a6);
    objc_storeStrong((id *)&v18->_uuid, a7);
    v18->_proximityTrend = a8;
  }

  return v18;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unint64_t)proximityLevel
{
  return self->_proximityLevel;
}

- (double)rssi
{
  return self->_rssi;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSNumber)continuousProximityLevel
{
  return self->_continuousProximityLevel;
}

- (unint64_t)proximityTrend
{
  return self->_proximityTrend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuousProximityLevel, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
