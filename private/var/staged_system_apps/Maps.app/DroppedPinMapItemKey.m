@implementation DroppedPinMapItemKey

- (DroppedPinMapItemKey)initWithCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  DroppedPinMapItemKey *v5;
  DroppedPinMapItemKey *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  objc_super v11;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v11.receiver = self;
  v11.super_class = (Class)DroppedPinMapItemKey;
  v5 = -[DroppedPinMapItemKey init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    v5->_coordinate.latitude = latitude;
    v5->_coordinate.longitude = longitude;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)latitude));
    v8 = (unint64_t)objc_msgSend(v7, "hash");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)longitude));
    v6->_hash = (unint64_t)objc_msgSend(v9, "hash") ^ v8;

  }
  return v6;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  DroppedPinMapItemKey *v4;
  DroppedPinMapItemKey *v5;
  uint64_t v6;
  int32x2_t v7;
  char v8;

  v4 = (DroppedPinMapItemKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(DroppedPinMapItemKey), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3E45798EE0000000uLL), vabdq_f64((float64x2_t)self->_coordinate, (float64x2_t)v5->_coordinate)));
    v8 = v7.i8[0] & v7.i8[4];
  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

@end
