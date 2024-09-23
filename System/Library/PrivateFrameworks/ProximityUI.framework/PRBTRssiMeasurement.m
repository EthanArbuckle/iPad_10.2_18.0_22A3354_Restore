@implementation PRBTRssiMeasurement

- (PRBTRssiMeasurement)initWithTime:(double)a3 rssi:(int)a4 channel:(unint64_t)a5 uuid:(id)a6
{
  id v11;
  PRBTRssiMeasurement *v12;
  PRBTRssiMeasurement *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PRBTRssiMeasurement;
  v12 = -[PRBTRssiMeasurement init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_timestamp = a3;
    v12->_rssi = a4;
    v12->_channel = a5;
    objc_storeStrong((id *)&v12->_uuid, a6);
  }

  return v13;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)rssi
{
  return self->_rssi;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
