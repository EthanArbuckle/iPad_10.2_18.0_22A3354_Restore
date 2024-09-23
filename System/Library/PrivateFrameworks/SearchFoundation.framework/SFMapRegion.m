@implementation SFMapRegion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSouthLat:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_southLat = a3;
}

- (BOOL)hasSouthLat
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWestLng:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_westLng = a3;
}

- (BOOL)hasWestLng
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNorthLat:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_northLat = a3;
}

- (BOOL)hasNorthLat
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEastLng:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_eastLng = a3;
}

- (BOOL)hasEastLng
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAltitudeInMeters:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_altitudeInMeters = a3;
}

- (BOOL)hasAltitudeInMeters
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (SFMapRegion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMapRegion *v6;
  SFMapRegion *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBMapRegion initWithData:]([_SFPBMapRegion alloc], "initWithData:", v5);
  v7 = -[SFMapRegion initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMapRegion *v6;

  v4 = a3;
  v6 = -[_SFPBMapRegion initWithFacade:]([_SFPBMapRegion alloc], "initWithFacade:", self);
  -[_SFPBMapRegion data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMapRegion *v2;
  void *v3;

  v2 = -[_SFPBMapRegion initWithFacade:]([_SFPBMapRegion alloc], "initWithFacade:", self);
  -[_SFPBMapRegion dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMapRegion *v2;
  void *v3;

  v2 = -[_SFPBMapRegion initWithFacade:]([_SFPBMapRegion alloc], "initWithFacade:", self);
  -[_SFPBMapRegion jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFMapRegion southLat](self, "southLat");
  objc_msgSend(v4, "setSouthLat:");
  -[SFMapRegion westLng](self, "westLng");
  objc_msgSend(v4, "setWestLng:");
  -[SFMapRegion northLat](self, "northLat");
  objc_msgSend(v4, "setNorthLat:");
  -[SFMapRegion eastLng](self, "eastLng");
  objc_msgSend(v4, "setEastLng:");
  -[SFMapRegion altitudeInMeters](self, "altitudeInMeters");
  objc_msgSend(v4, "setAltitudeInMeters:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFMapRegion *v4;
  SFMapRegion *v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;

  v4 = (SFMapRegion *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else if (-[SFMapRegion isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[SFMapRegion southLat](self, "southLat");
    v7 = v6;
    -[SFMapRegion southLat](v5, "southLat");
    if (vabdd_f64(v7, v8) >= 2.22044605e-16)
      goto LABEL_10;
    -[SFMapRegion westLng](self, "westLng");
    v10 = v9;
    -[SFMapRegion westLng](v5, "westLng");
    if (vabdd_f64(v10, v11) >= 2.22044605e-16
      || (-[SFMapRegion northLat](self, "northLat"),
          v13 = v12,
          -[SFMapRegion northLat](v5, "northLat"),
          vabdd_f64(v13, v14) >= 2.22044605e-16)
      || (-[SFMapRegion eastLng](self, "eastLng"),
          v16 = v15,
          -[SFMapRegion eastLng](v5, "eastLng"),
          vabdd_f64(v16, v17) >= 2.22044605e-16))
    {
LABEL_10:
      v21 = 0;
    }
    else
    {
      -[SFMapRegion altitudeInMeters](self, "altitudeInMeters");
      v19 = v18;
      -[SFMapRegion altitudeInMeters](v5, "altitudeInMeters");
      v21 = vabdd_f64(v19, v20) < 2.22044605e-16;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;
  float64x2_t v6;
  float64x2_t v7;
  float64_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  double v14;
  double v15;
  long double v16;
  unint64_t v17;
  int8x16_t v18;
  long double v20;
  long double v21;
  float64x2_t __x;
  float64x2_t __xa;
  float64_t v24;
  float64x2_t v25;
  float64_t v26;
  float64x2_t v27;
  int8x16_t v28;
  float64_t v29;
  float64x2_t v30;
  int8x16_t v31;

  -[SFMapRegion southLat](self, "southLat");
  v29 = v3;
  -[SFMapRegion westLng](self, "westLng");
  v26 = v4;
  -[SFMapRegion northLat](self, "northLat");
  v24 = v5;
  -[SFMapRegion eastLng](self, "eastLng");
  v6.f64[0] = v29;
  v7.f64[0] = v24;
  v6.f64[1] = v26;
  v7.f64[1] = v8;
  v9 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v6), (int8x16_t)vnegq_f64(v6), (int8x16_t)v6);
  v10 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v7), (int8x16_t)vnegq_f64(v7), (int8x16_t)v7);
  v30 = vrndaq_f64(v9);
  __x = vrndaq_f64(v10);
  v25 = vsubq_f64(v10, __x);
  v27 = vsubq_f64(v9, v30);
  v20 = fmod(__x.f64[1], 1.84467441e19);
  v11.f64[0] = fmod(__x.f64[0], 1.84467441e19);
  v11.f64[1] = v20;
  __xa = v11;
  v21 = fmod(v30.f64[1], 1.84467441e19);
  v12.f64[0] = fmod(v30.f64[0], 1.84467441e19);
  v12.f64[1] = v21;
  v13 = (float64x2_t)vdupq_n_s64(0x41E3C6EF36200000uLL);
  v31 = (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(v12, v13)), (int64x2_t)vcvtq_n_u64_f64(v27, 0x40uLL));
  v28 = (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(__xa, v13)), (int64x2_t)vcvtq_n_u64_f64(v25, 0x40uLL));
  -[SFMapRegion altitudeInMeters](self, "altitudeInMeters");
  v15 = -v14;
  if (v14 >= 0.0)
    v15 = v14;
  v16 = round(v15);
  v17 = (unint64_t)(fmod(v16, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v15 - v16, 0x40uLL);
  v18 = veorq_s8(v31, v28);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)) ^ v17;
}

- (double)southLat
{
  return self->_southLat;
}

- (double)westLng
{
  return self->_westLng;
}

- (double)northLat
{
  return self->_northLat;
}

- (double)eastLng
{
  return self->_eastLng;
}

- (double)altitudeInMeters
{
  return self->_altitudeInMeters;
}

- (SFMapRegion)initWithProtobuf:(id)a3
{
  id v4;
  SFMapRegion *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SFMapRegion *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFMapRegion;
  v5 = -[SFMapRegion init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "southLat");
    if (v6 != 0.0)
    {
      objc_msgSend(v4, "southLat");
      -[SFMapRegion setSouthLat:](v5, "setSouthLat:");
    }
    objc_msgSend(v4, "westLng");
    if (v7 != 0.0)
    {
      objc_msgSend(v4, "westLng");
      -[SFMapRegion setWestLng:](v5, "setWestLng:");
    }
    objc_msgSend(v4, "northLat");
    if (v8 != 0.0)
    {
      objc_msgSend(v4, "northLat");
      -[SFMapRegion setNorthLat:](v5, "setNorthLat:");
    }
    objc_msgSend(v4, "eastLng");
    if (v9 != 0.0)
    {
      objc_msgSend(v4, "eastLng");
      -[SFMapRegion setEastLng:](v5, "setEastLng:");
    }
    objc_msgSend(v4, "altitudeInMeters");
    if (v10 != 0.0)
    {
      objc_msgSend(v4, "altitudeInMeters");
      -[SFMapRegion setAltitudeInMeters:](v5, "setAltitudeInMeters:");
    }
    v11 = v5;
  }

  return v5;
}

@end
