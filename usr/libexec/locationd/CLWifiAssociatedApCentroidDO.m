@implementation CLWifiAssociatedApCentroidDO

- (CLWifiAssociatedApCentroidDO)initWithMac:(id)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 horizontalAccuracy:(double)a7 verticalAccuracy:(double)a8 reach:(int)a9 stationaryTimeInSeconds:(double)a10 loiType:(id)a11 lastUpdated:(double)a12
{
  CLWifiAssociatedApCentroidDO *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CLWifiAssociatedApCentroidDO;
  v22 = -[CLWifiAssociatedApCentroidDO init](&v24, "init");
  if (v22)
  {
    v22->_mac = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", a3);
    v22->_horizontalAccuracy = a7;
    v22->_latitude = a4;
    v22->_longitude = a5;
    v22->_altitude = a6;
    v22->_reach = a9;
    v22->_stationaryTimeInSeconds = a10;
    v22->_verticalAccuracy = a8;
    v22->_loiType = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", a11);
    v22->_lastUpdated = a12;
  }
  return v22;
}

- (CLWifiAssociatedApCentroidDO)initWithNSDictionary:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  id v19;
  double v20;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("mac"));
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("latitude")), "doubleValue");
  v7 = v6;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("longitude")), "doubleValue");
  v9 = v8;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("altitude")), "doubleValue");
  v11 = v10;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("horizontalAccuracy")), "doubleValue");
  v13 = v12;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("verticalAccuracy")), "doubleValue");
  v15 = v14;
  v16 = objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("reach")), "intValue");
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("stationaryTimeInSeconds")), "doubleValue");
  v18 = v17;
  v19 = objc_msgSend(a3, "objectForKey:", CFSTR("loiType"));
  objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("lastUpdated")), "doubleValue");
  return -[CLWifiAssociatedApCentroidDO initWithMac:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:reach:stationaryTimeInSeconds:loiType:lastUpdated:](self, "initWithMac:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:reach:stationaryTimeInSeconds:loiType:lastUpdated:", v5, v16, v19, v7, v9, v11, v13, v15, v18, v20);
}

- (id)toNSDictionary
{
  id v3;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", self->_mac, CFSTR("mac"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude), CFSTR("latitude"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude), CFSTR("longitude"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_altitude), CFSTR("altitude"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_horizontalAccuracy), CFSTR("horizontalAccuracy"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_verticalAccuracy), CFSTR("verticalAccuracy"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_reach), CFSTR("reach"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_stationaryTimeInSeconds), CFSTR("stationaryTimeInSeconds"));
  objc_msgSend(v3, "setObject:forKey:", self->_loiType, CFSTR("loiType"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_lastUpdated), CFSTR("lastUpdated"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  double latitude;
  double v7;
  double longitude;
  double v9;
  double altitude;
  double v11;
  double horizontalAccuracy;
  double v13;
  double verticalAccuracy;
  double v15;
  int reach;
  double stationaryTimeInSeconds;
  double v18;
  double lastUpdated;
  double v20;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    v5 = -[NSString isEqualToString:](self->_mac, "isEqualToString:", objc_msgSend(a3, "mac"));
    if (v5)
    {
      latitude = self->_latitude;
      objc_msgSend(a3, "latitude");
      if (latitude != v7)
        goto LABEL_12;
      longitude = self->_longitude;
      objc_msgSend(a3, "longitude");
      if (longitude != v9)
        goto LABEL_12;
      altitude = self->_altitude;
      objc_msgSend(a3, "altitude");
      if (altitude != v11)
        goto LABEL_12;
      horizontalAccuracy = self->_horizontalAccuracy;
      objc_msgSend(a3, "horizontalAccuracy");
      if (horizontalAccuracy == v13
        && (verticalAccuracy = self->_verticalAccuracy, objc_msgSend(a3, "verticalAccuracy"), verticalAccuracy == v15)
        && (reach = self->_reach, reach == objc_msgSend(a3, "reach"))
        && (stationaryTimeInSeconds = self->_stationaryTimeInSeconds,
            objc_msgSend(a3, "stationaryTimeInSeconds"),
            stationaryTimeInSeconds == v18))
      {
        v5 = -[NSString isEqualToString:](self->_loiType, "isEqualToString:", objc_msgSend(a3, "loiType"));
        if (v5)
        {
          lastUpdated = self->_lastUpdated;
          objc_msgSend(a3, "lastUpdated");
          LOBYTE(v5) = lastUpdated == v20;
        }
      }
      else
      {
LABEL_12:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,<mac, %@, lat, %f, lng, %f, alt, %f, hacc, %f, vacc, %f, reach, %d, stationaryTimeInSeconds, %f, loiType, %@, lastUpdated, %f>"), NSStringFromClass(v3), self->_mac, *(_QWORD *)&self->_latitude, *(_QWORD *)&self->_longitude, *(_QWORD *)&self->_altitude, *(_QWORD *)&self->_horizontalAccuracy, *(_QWORD *)&self->_verticalAccuracy, self->_reach, *(_QWORD *)&self->_stationaryTimeInSeconds, self->_loiType, *(_QWORD *)&self->_lastUpdated);
}

- (void)dealloc
{
  objc_super v3;

  self->_mac = 0;
  self->_loiType = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWifiAssociatedApCentroidDO;
  -[CLWifiAssociatedApCentroidDO dealloc](&v3, "dealloc");
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (NSString)loiType
{
  return self->_loiType;
}

- (void)setLoiType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (NSString)mac
{
  return self->_mac;
}

- (void)setMac:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)reach
{
  return self->_reach;
}

- (void)setReach:(int)a3
{
  self->_reach = a3;
}

- (double)stationaryTimeInSeconds
{
  return self->_stationaryTimeInSeconds;
}

- (void)setStationaryTimeInSeconds:(double)a3
{
  self->_stationaryTimeInSeconds = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_verticalAccuracy = a3;
}

- (double)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(double)a3
{
  self->_lastUpdated = a3;
}

@end
