@implementation RFMapPoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setX:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_x = a3;
}

- (BOOL)hasX
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setY:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_y = a3;
}

- (BOOL)hasY
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (RFMapPoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMapPoint *v6;
  RFMapPoint *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFMapPoint initWithData:]([_SFPBRFMapPoint alloc], "initWithData:", v5);
  v7 = -[RFMapPoint initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFMapPoint *v6;

  v4 = a3;
  v6 = -[_SFPBRFMapPoint initWithFacade:]([_SFPBRFMapPoint alloc], "initWithFacade:", self);
  -[_SFPBRFMapPoint data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFMapPoint *v2;
  void *v3;

  v2 = -[_SFPBRFMapPoint initWithFacade:]([_SFPBRFMapPoint alloc], "initWithFacade:", self);
  -[_SFPBRFMapPoint dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFMapPoint *v2;
  void *v3;

  v2 = -[_SFPBRFMapPoint initWithFacade:]([_SFPBRFMapPoint alloc], "initWithFacade:", self);
  -[_SFPBRFMapPoint jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFMapPoint x](self, "x");
  objc_msgSend(v4, "setX:");
  -[RFMapPoint y](self, "y");
  objc_msgSend(v4, "setY:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFMapPoint *v4;
  RFMapPoint *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = (RFMapPoint *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (-[RFMapPoint isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[RFMapPoint x](self, "x");
    v7 = v6;
    -[RFMapPoint x](v5, "x");
    if (vabdd_f64(v7, v8) >= 2.22044605e-16)
    {
      v12 = 0;
    }
    else
    {
      -[RFMapPoint y](self, "y");
      v10 = v9;
      -[RFMapPoint y](v5, "y");
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

  -[RFMapPoint x](self, "x");
  v4 = -v3;
  if (v3 >= 0.0)
    v4 = v3;
  v5 = round(v4);
  v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  -[RFMapPoint y](self, "y");
  v8 = -v7;
  if (v7 >= 0.0)
    v8 = v7;
  v9 = round(v8);
  return ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
}

- (double)x
{
  return self->_x;
}

- (double)y
{
  return self->_y;
}

- (RFMapPoint)initWithProtobuf:(id)a3
{
  id v4;
  RFMapPoint *v5;
  double v6;
  double v7;
  RFMapPoint *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RFMapPoint;
  v5 = -[RFMapPoint init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "x");
    if (v6 != 0.0)
    {
      objc_msgSend(v4, "x");
      -[RFMapPoint setX:](v5, "setX:");
    }
    objc_msgSend(v4, "y");
    if (v7 != 0.0)
    {
      objc_msgSend(v4, "y");
      -[RFMapPoint setY:](v5, "setY:");
    }
    v8 = v5;
  }

  return v5;
}

@end
