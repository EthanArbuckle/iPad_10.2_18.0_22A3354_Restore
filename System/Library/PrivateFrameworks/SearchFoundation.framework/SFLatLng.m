@implementation SFLatLng

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setLat:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lat = a3;
}

- (BOOL)hasLat
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLng:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lng = a3;
}

- (BOOL)hasLng
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFLatLng)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBLatLng *v6;
  SFLatLng *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBLatLng initWithData:]([_SFPBLatLng alloc], "initWithData:", v5);
  v7 = -[SFLatLng initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBLatLng *v6;

  v4 = a3;
  v6 = -[_SFPBLatLng initWithFacade:]([_SFPBLatLng alloc], "initWithFacade:", self);
  -[_SFPBLatLng data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBLatLng *v2;
  void *v3;

  v2 = -[_SFPBLatLng initWithFacade:]([_SFPBLatLng alloc], "initWithFacade:", self);
  -[_SFPBLatLng dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBLatLng *v2;
  void *v3;

  v2 = -[_SFPBLatLng initWithFacade:]([_SFPBLatLng alloc], "initWithFacade:", self);
  -[_SFPBLatLng jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFLatLng lat](self, "lat");
  objc_msgSend(v4, "setLat:");
  -[SFLatLng lng](self, "lng");
  objc_msgSend(v4, "setLng:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFLatLng *v4;
  SFLatLng *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = (SFLatLng *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (-[SFLatLng isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[SFLatLng lat](self, "lat");
    v7 = v6;
    -[SFLatLng lat](v5, "lat");
    if (vabdd_f64(v7, v8) >= 2.22044605e-16)
    {
      v12 = 0;
    }
    else
    {
      -[SFLatLng lng](self, "lng");
      v10 = v9;
      -[SFLatLng lng](v5, "lng");
      v12 = vabdd_f64(v10, v11) < 2.22044605e-16;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  long double v5;
  unint64_t v6;
  double v7;
  double v8;
  long double v9;

  -[SFLatLng lat](self, "lat");
  v4 = -v3;
  if (v3 >= 0.0)
    v4 = v3;
  v5 = round(v4);
  v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  -[SFLatLng lng](self, "lng");
  v8 = -v7;
  if (v7 >= 0.0)
    v8 = v7;
  v9 = round(v8);
  return ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
}

- (double)lat
{
  return self->_lat;
}

- (double)lng
{
  return self->_lng;
}

- (SFLatLng)initWithProtobuf:(id)a3
{
  id v4;
  SFLatLng *v5;
  double v6;
  double v7;
  SFLatLng *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFLatLng;
  v5 = -[SFLatLng init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "lat");
    if (v6 != 0.0)
    {
      objc_msgSend(v4, "lat");
      -[SFLatLng setLat:](v5, "setLat:");
    }
    objc_msgSend(v4, "lng");
    if (v7 != 0.0)
    {
      objc_msgSend(v4, "lng");
      -[SFLatLng setLng:](v5, "setLng:");
    }
    v8 = v5;
  }

  return v5;
}

@end
