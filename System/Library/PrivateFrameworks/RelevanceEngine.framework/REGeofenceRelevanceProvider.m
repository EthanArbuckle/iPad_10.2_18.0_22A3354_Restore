@implementation REGeofenceRelevanceProvider

- (REGeofenceRelevanceProvider)init
{
  void *v3;
  REGeofenceRelevanceProvider *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[REGeofenceRelevanceProvider initWithRegion:](self, "initWithRegion:", v3);

  return v4;
}

- (REGeofenceRelevanceProvider)initWithRegion:(id)a3
{
  return -[REGeofenceRelevanceProvider initWithRegion:bundleIdentifier:](self, "initWithRegion:bundleIdentifier:", a3, 0);
}

- (REGeofenceRelevanceProvider)initWithRegion:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  REGeofenceRelevanceProvider *v9;
  REGeofenceRelevanceProvider *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REGeofenceRelevanceProvider;
  v9 = -[RERelevanceProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_region, a3);
    v11 = objc_msgSend(v8, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

  }
  return v10;
}

+ (id)relevanceSimulatorID
{
  return CFSTR("geofence");
}

- (REGeofenceRelevanceProvider)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  REGeofenceRelevanceProvider *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latitude"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longitude"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("radius"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("region_name"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v10 = &stru_24CF92178;
  if (v9)
    v10 = v9;
  v11 = v10;

  v12 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "doubleValue");
    v14 = v13;
    objc_msgSend(v6, "doubleValue");
    v16 = v15;
    if (v7)
    {
      objc_msgSend(v7, "doubleValue");
      v18 = v17;
    }
    else
    {
      v18 = 1000.0;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA50]), "initWithCenter:radius:identifier:", v11, v14, v16, v18);
    self = -[REGeofenceRelevanceProvider initWithRegion:bundleIdentifier:](self, "initWithRegion:bundleIdentifier:", v19, v8);

    v12 = self;
  }

  return v12;
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
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CLCircularRegion center](self->_region, "center");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("latitude"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[CLCircularRegion center](self->_region, "center");
  objc_msgSend(v6, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("longitude"));

  v9 = (void *)MEMORY[0x24BDD16E0];
  -[CLCircularRegion radius](self->_region, "radius");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("radius"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  -[CLCircularRegion identifier](self->_region, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("region_name"));

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REGeofenceRelevanceProvider;
  v4 = -[RERelevanceProvider copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 4, self->_region);
  objc_storeStrong(v4 + 5, self->_bundleIdentifier);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  REGeofenceRelevanceProvider *v4;
  REGeofenceRelevanceProvider *v5;
  char v6;
  NSString *bundleIdentifier;
  char v8;
  char v9;
  objc_super v11;

  v4 = (REGeofenceRelevanceProvider *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)REGeofenceRelevanceProvider;
    if (-[RERelevanceProvider isEqual:](&v11, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = -[CLCircularRegion isEqual:](self->_region, "isEqual:", v5->_region);
      bundleIdentifier = self->_bundleIdentifier;
      if (bundleIdentifier == v5->_bundleIdentifier)
        v8 = 1;
      else
        v8 = -[NSString isEqualToString:](bundleIdentifier, "isEqualToString:");
      v9 = v6 & v8;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)_hash
{
  uint64_t v3;

  v3 = -[CLCircularRegion hash](self->_region, "hash");
  return -[NSString hash](self->_bundleIdentifier, "hash") ^ v3;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REGeofenceRelevanceProvider;
  -[REGeofenceRelevanceProvider description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" region=%@ bundleIdentifier=%@"), self->_region, self->_bundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
