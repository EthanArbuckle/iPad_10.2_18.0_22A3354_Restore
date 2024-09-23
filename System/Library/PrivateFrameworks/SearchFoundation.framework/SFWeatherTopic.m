@implementation SFWeatherTopic

- (SFWeatherTopic)initWithQuery:(id)a3 location:(id)a4 identifier:(id)a5
{
  id v8;
  SFWeatherTopic *v9;
  SFWeatherTopic *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFWeatherTopic;
  v9 = -[SFQueryTopic initWithType:query:identifier:](&v12, sel_initWithType_query_identifier_, 4, a3, a5);
  v10 = v9;
  if (v9)
    -[SFWeatherTopic setLocation:](v9, "setLocation:", v8);

  return v10;
}

- (SFWeatherTopic)initWithQuery:(id)a3 location:(id)a4
{
  return -[SFWeatherTopic initWithQuery:location:identifier:](self, "initWithQuery:location:identifier:", a3, a4, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFWeatherTopic;
  v4 = -[SFQueryTopic copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SFWeatherTopic location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocation:", v5);

  return v4;
}

- (SFWeatherTopic)initWithCoder:(id)a3
{
  id v4;
  SFWeatherTopic *v5;
  uint64_t v6;
  SFLatLng *location;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFWeatherTopic;
  v5 = -[SFQueryTopic initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_location"));
    v6 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (SFLatLng *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFWeatherTopic;
  v4 = a3;
  -[SFQueryTopic encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_location, CFSTR("_location"), v5.receiver, v5.super_class);

}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  double v5;
  long double v6;
  unint64_t v7;
  double v8;
  double v9;
  long double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFWeatherTopic;
  v3 = -[SFQueryTopic hash](&v12, sel_hash);
  -[SFLatLng lat](self->_location, "lat");
  v5 = -v4;
  if (v4 >= 0.0)
    v5 = v4;
  v6 = round(v5);
  v7 = ((unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL)) ^ v3;
  -[SFLatLng lng](self->_location, "lng");
  v9 = -v8;
  if (v8 >= 0.0)
    v9 = v8;
  v10 = round(v9);
  return v7 ^ ((unint64_t)(fmod(v10, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v9 - v10, 0x40uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  BOOL v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFWeatherTopic;
  if (-[SFQueryTopic isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = v4;
    -[SFWeatherTopic location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lat");
    v8 = v7;
    objc_msgSend(v5, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lat");
    if (v8 == v10)
    {
      -[SFWeatherTopic location](self, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lng");
      v13 = v12;
      objc_msgSend(v5, "location");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lng");
      v16 = v13 == v15;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFWeatherTopic;
  -[SFQueryTopic description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[SFWeatherTopic location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lat");
  v7 = v6;
  -[SFWeatherTopic location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lng");
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" lat: %f long: %f"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (SFLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
