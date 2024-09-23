@implementation RELocationRelevanceProvider

- (RELocationRelevanceProvider)initWithLocationType:(unint64_t)a3
{
  RELocationRelevanceProvider *v4;
  RELocationRelevanceProvider *v5;
  uint64_t v6;
  CLLocation *location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RELocationRelevanceProvider;
  v4 = -[RERelevanceProvider init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", 37.3353672, -122.011737);
    location = v5->_location;
    v5->_location = (CLLocation *)v6;

    v5->_radius = 1000.0;
    v5->_accuracy = *(double *)&kDefaultAccuracyScaleFactor * 1000.0;
  }
  return v5;
}

- (RELocationRelevanceProvider)initWithLocation:(id)a3 radius:(double)a4
{
  return -[RELocationRelevanceProvider initWithLocation:radius:accuracy:](self, "initWithLocation:radius:accuracy:", a3, a4, *(double *)&kDefaultAccuracyScaleFactor * a4);
}

- (RELocationRelevanceProvider)initWithLocation:(id)a3 radius:(double)a4 accuracy:(double)a5
{
  id v9;
  RELocationRelevanceProvider *v10;
  RELocationRelevanceProvider *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RELocationRelevanceProvider;
  v10 = -[RERelevanceProvider init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = 0;
    objc_storeStrong((id *)&v10->_location, a3);
    v11->_radius = a4;
    v11->_accuracy = a5;
  }

  return v11;
}

- (RELocationRelevanceProvider)providerWithBundleIdentifier:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[RELocationRelevanceProvider copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[8];
  v5[8] = v6;

  return (RELocationRelevanceProvider *)v5;
}

+ (id)relevanceSimulatorID
{
  return CFSTR("location");
}

- (RELocationRelevanceProvider)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RELocationRelevanceProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  RELocationRelevanceProvider *v22;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "integerValue"))
  {
    self = -[RELocationRelevanceProvider initWithLocationType:](self, "initWithLocationType:", objc_msgSend(v6, "integerValue"));
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("long"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("radius"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (v8 && v9)
    {
      v12 = objc_alloc(MEMORY[0x24BDBFA80]);
      objc_msgSend(v8, "doubleValue");
      v14 = v13;
      objc_msgSend(v9, "doubleValue");
      v16 = (void *)objc_msgSend(v12, "initWithLatitude:longitude:", v14, v15);
      if (v10)
      {
        objc_msgSend(v10, "doubleValue");
        v18 = v17;
      }
      else
      {
        v18 = 1000.0;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accuracy"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "doubleValue");
        v22 = -[RELocationRelevanceProvider initWithLocation:radius:accuracy:](self, "initWithLocation:radius:accuracy:", v16, v18, v21);
      }
      else
      {
        v22 = -[RELocationRelevanceProvider initWithLocation:radius:](self, "initWithLocation:radius:", v16, v18);
      }
      self = v22;
      objc_storeStrong((id *)&self->_bundleIdentifier, v11);

      v7 = self;
    }

  }
  return v7;
}

- (id)dictionaryEncoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  float accuracy;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CLLocation coordinate](self->_location, "coordinate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lat"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[CLLocation coordinate](self->_location, "coordinate");
  objc_msgSend(v6, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("long"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_radius);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("radius"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  v10 = self->_radius * *(double *)&kDefaultAccuracyScaleFactor;
  accuracy = self->_accuracy;
  if (vabds_f32(v10, accuracy) >= 0.00000011921)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("accuracy"));

  }
  if (self->_type)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("type"));

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RELocationRelevanceProvider;
  v4 = -[RERelevanceProvider copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 5, self->_location);
  v4[6] = *(id *)&self->_radius;
  v4[7] = *(id *)&self->_accuracy;
  v4[4] = (id)self->_type;
  objc_storeStrong(v4 + 8, self->_bundleIdentifier);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RELocationRelevanceProvider *v4;
  RELocationRelevanceProvider *v5;
  unint64_t type;
  char v7;
  CLLocation *location;
  CLLocation *v9;
  _BOOL4 v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSString *bundleIdentifier;
  _BOOL4 v19;
  objc_super v21;

  v4 = (RELocationRelevanceProvider *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)RELocationRelevanceProvider;
    if (-[RERelevanceProvider isEqual:](&v21, sel_isEqual_, v4))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        type = self->_type;
        if (type == v5->_type)
        {
          if (type)
          {
            v7 = 1;
LABEL_25:

            goto LABEL_26;
          }
          location = self->_location;
          v9 = v5->_location;
          v10 = ((unint64_t)location | (unint64_t)v9) == 0;
          if (location)
            v11 = v9 == 0;
          else
            v11 = 1;
          if (!v11)
          {
            -[CLLocation coordinate](location, "coordinate");
            v13 = v12;
            -[CLLocation coordinate](v5->_location, "coordinate");
            if (v13 == v14)
            {
              -[CLLocation coordinate](self->_location, "coordinate");
              v16 = v15;
              -[CLLocation coordinate](v5->_location, "coordinate");
              v10 = v16 == v17;
            }
            else
            {
              v10 = 0;
            }
          }
          bundleIdentifier = self->_bundleIdentifier;
          if (bundleIdentifier == v5->_bundleIdentifier)
            v7 = 1;
          else
            v7 = -[NSString isEqualToString:](bundleIdentifier, "isEqualToString:");
          v19 = self->_radius == v5->_radius && v10;
          if (v19 && self->_accuracy == v5->_accuracy)
            goto LABEL_25;
        }
        v7 = 0;
        goto LABEL_25;
      }
    }
    v7 = 0;
  }
LABEL_26:

  return v7;
}

- (unint64_t)_hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;

  v3 = -[CLLocation hash](self->_location, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_radius);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_accuracy);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[NSString hash](self->_bundleIdentifier, "hash");

  return v10;
}

- (id)description
{
  void *v3;
  unint64_t type;
  __CFString *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RELocationRelevanceProvider;
  -[RELocationRelevanceProvider description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type > 4)
    v5 = 0;
  else
    v5 = off_24CF91458[type];
  -[CLLocation description](self->_location, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" type=%@, location=%@, radius=%f, accuracy=%f, bundleIdentifier=%@"), v5, v6, *(_QWORD *)&self->_radius, *(_QWORD *)&self->_accuracy, self->_bundleIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (CLLocation)location
{
  return self->_location;
}

- (double)radius
{
  return self->_radius;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
