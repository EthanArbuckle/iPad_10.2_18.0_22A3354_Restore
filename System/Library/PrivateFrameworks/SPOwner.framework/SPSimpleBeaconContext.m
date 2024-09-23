@implementation SPSimpleBeaconContext

- (unint64_t)fetchProperties
{
  return self->_fetchProperties;
}

- (BOOL)sendInitialBeacons
{
  return self->_sendInitialBeacons;
}

- (NSArray)filterBeaconUUIDs
{
  return self->_filterBeaconUUIDs;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fmipItemContextForBeaconUUIDs:(id)a3
{
  id v3;
  SPSimpleBeaconContext *v4;

  v3 = a3;
  v4 = -[SPSimpleBeaconContext initWithFetchProperties:filterBeaconUUIDs:]([SPSimpleBeaconContext alloc], "initWithFetchProperties:filterBeaconUUIDs:", 512, v3);

  return v4;
}

- (SPSimpleBeaconContext)initWithFetchProperties:(unint64_t)a3 filterBeaconUUIDs:(id)a4
{
  id v7;
  SPSimpleBeaconContext *v8;
  SPSimpleBeaconContext *v9;
  void *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPSimpleBeaconContext;
  v8 = -[SPSimpleBeaconContext init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_fetchProperties = a3;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v11;

    v9->_sendInitialBeacons = 1;
    objc_storeStrong((id *)&v9->_filterBeaconUUIDs, a4);
  }

  return v9;
}

- (SPSimpleBeaconContext)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *bundleIdentifier;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *filterBeaconUUIDs;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v5;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fetchProperties"));
  self->_fetchProperties = (unint64_t)v7;
  self->_sendInitialBeacons = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sendInitialBeacons"));
  v8 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("filterBeaconUUIDs"));
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();

  filterBeaconUUIDs = self->_filterBeaconUUIDs;
  self->_filterBeaconUUIDs = v11;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("fetchProperties"), (double)self->_fetchProperties);
  objc_msgSend(v5, "encodeBool:forKey:", self->_sendInitialBeacons, CFSTR("sendInitialBeacons"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filterBeaconUUIDs, CFSTR("filterBeaconUUIDs"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_filterBeaconUUIDs, 0);
}

+ (id)defaultContext
{
  SPSimpleBeaconContext *v2;

  v2 = [SPSimpleBeaconContext alloc];
  return -[SPSimpleBeaconContext initWithFetchProperties:filterBeaconUUIDs:](v2, "initWithFetchProperties:filterBeaconUUIDs:", 0, MEMORY[0x1E0C9AA60]);
}

+ (id)deviceManagerContext
{
  SPSimpleBeaconContext *v2;

  v2 = [SPSimpleBeaconContext alloc];
  return -[SPSimpleBeaconContext initWithFetchProperties:filterBeaconUUIDs:](v2, "initWithFetchProperties:filterBeaconUUIDs:", 511, MEMORY[0x1E0C9AA60]);
}

+ (id)fmipItemContext
{
  SPSimpleBeaconContext *v2;

  v2 = [SPSimpleBeaconContext alloc];
  return -[SPSimpleBeaconContext initWithFetchProperties:filterBeaconUUIDs:](v2, "initWithFetchProperties:filterBeaconUUIDs:", 512, MEMORY[0x1E0C9AA60]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  -[SPSimpleBeaconContext bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIdentifier:", v5);

  objc_msgSend(v4, "setFetchProperties:", -[SPSimpleBeaconContext fetchProperties](self, "fetchProperties"));
  objc_msgSend(v4, "setSendInitialBeacons:", -[SPSimpleBeaconContext sendInitialBeacons](self, "sendInitialBeacons"));
  -[SPSimpleBeaconContext filterBeaconUUIDs](self, "filterBeaconUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilterBeaconUUIDs:", v6);

  return v4;
}

- (void)setSendInitialBeacons:(BOOL)a3
{
  self->_sendInitialBeacons = a3;
}

- (void)setFilterBeaconUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFetchProperties:(unint64_t)a3
{
  self->_fetchProperties = a3;
}

@end
