@implementation SFStructuredLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setRadius:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_radius = a3;
}

- (BOOL)hasRadius
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFStructuredLocation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBStructuredLocation *v6;
  SFStructuredLocation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBStructuredLocation initWithData:]([_SFPBStructuredLocation alloc], "initWithData:", v5);
  v7 = -[SFStructuredLocation initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBStructuredLocation *v6;

  v4 = a3;
  v6 = -[_SFPBStructuredLocation initWithFacade:]([_SFPBStructuredLocation alloc], "initWithFacade:", self);
  -[_SFPBStructuredLocation data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBStructuredLocation *v2;
  void *v3;

  v2 = -[_SFPBStructuredLocation initWithFacade:]([_SFPBStructuredLocation alloc], "initWithFacade:", self);
  -[_SFPBStructuredLocation dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBStructuredLocation *v2;
  void *v3;

  v2 = -[_SFPBStructuredLocation initWithFacade:]([_SFPBStructuredLocation alloc], "initWithFacade:", self);
  -[_SFPBStructuredLocation jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFStructuredLocation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTitle:", v6);

  -[SFStructuredLocation geoLocation](self, "geoLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setGeoLocation:", v8);

  -[SFStructuredLocation radius](self, "radius");
  objc_msgSend(v4, "setRadius:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFStructuredLocation *v5;
  SFStructuredLocation *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = (SFStructuredLocation *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFStructuredLocation isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFStructuredLocation title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFStructuredLocation title](v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_24:

        goto LABEL_25;
      }
      -[SFStructuredLocation title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFStructuredLocation title](self, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFStructuredLocation title](v6, "title");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_22;
        }
        v24 = v10;
      }
      -[SFStructuredLocation geoLocation](self, "geoLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFStructuredLocation geoLocation](v6, "geoLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_21;
      }
      -[SFStructuredLocation geoLocation](self, "geoLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v21 = v3;
        -[SFStructuredLocation geoLocation](self, "geoLocation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFStructuredLocation geoLocation](v6, "geoLocation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          v11 = 0;
          v3 = v21;
LABEL_19:

LABEL_20:
LABEL_21:
          v10 = v24;
          if (!v9)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        v3 = v21;
      }
      -[SFStructuredLocation radius](self, "radius");
      v18 = v17;
      -[SFStructuredLocation radius](v6, "radius");
      v11 = vabdd_f64(v18, v19) < 2.22044605e-16;
      if (!v15)
        goto LABEL_20;
      goto LABEL_19;
    }
    v11 = 0;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  long double v9;
  unint64_t v10;

  -[SFStructuredLocation title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFStructuredLocation geoLocation](self, "geoLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFStructuredLocation radius](self, "radius");
  v8 = -v7;
  if (v7 >= 0.0)
    v8 = v7;
  v9 = round(v8);
  v10 = v6 ^ ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL));

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SFLatLng)geoLocation
{
  return self->_geoLocation;
}

- (void)setGeoLocation:(id)a3
{
  objc_storeStrong((id *)&self->_geoLocation, a3);
}

- (double)radius
{
  return self->_radius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoLocation, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (SFStructuredLocation)initWithProtobuf:(id)a3
{
  id v4;
  SFStructuredLocation *v5;
  void *v6;
  void *v7;
  void *v8;
  SFLatLng *v9;
  void *v10;
  SFLatLng *v11;
  double v12;
  SFStructuredLocation *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFStructuredLocation;
  v5 = -[SFStructuredLocation init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFStructuredLocation setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "geoLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [SFLatLng alloc];
      objc_msgSend(v4, "geoLocation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SFLatLng initWithProtobuf:](v9, "initWithProtobuf:", v10);
      -[SFStructuredLocation setGeoLocation:](v5, "setGeoLocation:", v11);

    }
    objc_msgSend(v4, "radius");
    if (v12 != 0.0)
    {
      objc_msgSend(v4, "radius");
      -[SFStructuredLocation setRadius:](v5, "setRadius:");
    }
    v13 = v5;
  }

  return v5;
}

@end
