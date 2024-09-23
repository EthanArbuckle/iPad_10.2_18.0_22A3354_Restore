@implementation SPMacBeaconConfig

- (SPMacBeaconConfig)initWithInitialNoBeaconDuration:(double)a3 fastRollAdvertisementDuration:(double)a4 fastRollAdvertisementInterval:(double)a5 slowRollAdvertisementDuration:(double)a6 slowRollNoAdvertisementDuration:(double)a7 noAdvertisementDurationDecayFactor:(double)a8 postInitialDayAdvertisementTimes:(id)a9
{
  id v16;
  SPMacBeaconConfig *v17;
  SPMacBeaconConfig *v18;
  uint64_t v19;
  NSArray *postInitialDayAdvertisementTimes;
  objc_super v22;

  v16 = a9;
  v22.receiver = self;
  v22.super_class = (Class)SPMacBeaconConfig;
  v17 = -[SPMacBeaconConfig init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_initialNoBeaconDuration = a3;
    v17->_fastRollAdvertisementDuration = a4;
    v17->_fastRollAdvertisementInterval = a5;
    v17->_slowRollAdvertisementDuration = a6;
    v17->_slowRollNoAdvertisementDuration = a7;
    v17->_noAdvertisementDurationDecayFactor = a8;
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v16, 1);
    postInitialDayAdvertisementTimes = v18->_postInitialDayAdvertisementTimes;
    v18->_postInitialDayAdvertisementTimes = (NSArray *)v19;

  }
  return v18;
}

- (id)initFromPrefs
{
  SPMacBeaconConfig *v2;
  void *v3;
  double v4;
  uint64_t v5;
  NSArray *postInitialDayAdvertisementTimes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SPMacBeaconConfig;
  v2 = -[SPMacBeaconConfig init](&v8, sel_init);
  if (v2)
  {
    v2->_initialNoBeaconDuration = (double)objc_msgSend(MEMORY[0x1E0D20200], "integerForKey:inDomain:", CFSTR("initialNoBeaconDuration"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));
    v2->_fastRollAdvertisementDuration = (double)objc_msgSend(MEMORY[0x1E0D20200], "integerForKey:inDomain:", CFSTR("fastRollAdvertisementDuration"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));
    v2->_fastRollAdvertisementInterval = (double)objc_msgSend(MEMORY[0x1E0D20200], "integerForKey:inDomain:", CFSTR("fastRollAdvertisementInterval"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));
    v2->_slowRollAdvertisementDuration = (double)objc_msgSend(MEMORY[0x1E0D20200], "integerForKey:inDomain:", CFSTR("slowRollAdvertisementDuration"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));
    v2->_slowRollNoAdvertisementDuration = (double)objc_msgSend(MEMORY[0x1E0D20200], "integerForKey:inDomain:", CFSTR("slowRollNoAdvertisementDuration"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));
    objc_msgSend(MEMORY[0x1E0D20200], "stringForKey:inDomain:", CFSTR("noAdvertisementDurationDecayFactor"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v2->_noAdvertisementDurationDecayFactor = v4;

    objc_msgSend(MEMORY[0x1E0D20200], "arrayForKey:inDomain:", CFSTR("postInitialDayAdvertisementTimes"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));
    v5 = objc_claimAutoreleasedReturnValue();
    postInitialDayAdvertisementTimes = v2->_postInitialDayAdvertisementTimes;
    v2->_postInitialDayAdvertisementTimes = (NSArray *)v5;

  }
  return v2;
}

- (void)persistToPrefs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0D20200];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_initialNoBeaconDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInteger:forKey:inDomain:", objc_msgSend(v4, "integerValue"), CFSTR("initialNoBeaconDuration"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));

  v5 = (void *)MEMORY[0x1E0D20200];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fastRollAdvertisementDuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:inDomain:", objc_msgSend(v6, "integerValue"), CFSTR("fastRollAdvertisementDuration"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));

  v7 = (void *)MEMORY[0x1E0D20200];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fastRollAdvertisementInterval);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteger:forKey:inDomain:", objc_msgSend(v8, "integerValue"), CFSTR("fastRollAdvertisementInterval"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));

  v9 = (void *)MEMORY[0x1E0D20200];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_slowRollAdvertisementDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInteger:forKey:inDomain:", objc_msgSend(v10, "integerValue"), CFSTR("slowRollAdvertisementDuration"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));

  v11 = (void *)MEMORY[0x1E0D20200];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_slowRollNoAdvertisementDuration);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInteger:forKey:inDomain:", objc_msgSend(v12, "integerValue"), CFSTR("slowRollNoAdvertisementDuration"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));

  v13 = (void *)MEMORY[0x1E0D20200];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_noAdvertisementDurationDecayFactor);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setString:forKey:inDomain:", v15, CFSTR("noAdvertisementDurationDecayFactor"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));

  objc_msgSend(MEMORY[0x1E0D20200], "setArray:forKey:inDomain:", self->_postInitialDayAdvertisementTimes, CFSTR("postInitialDayAdvertisementTimes"), CFSTR("com.apple.icloud.searchpartyd.mac-beacon"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SPMacBeaconConfig initWithInitialNoBeaconDuration:fastRollAdvertisementDuration:fastRollAdvertisementInterval:slowRollAdvertisementDuration:slowRollNoAdvertisementDuration:noAdvertisementDurationDecayFactor:postInitialDayAdvertisementTimes:]([SPMacBeaconConfig alloc], "initWithInitialNoBeaconDuration:fastRollAdvertisementDuration:fastRollAdvertisementInterval:slowRollAdvertisementDuration:slowRollNoAdvertisementDuration:noAdvertisementDurationDecayFactor:postInitialDayAdvertisementTimes:", self->_postInitialDayAdvertisementTimes, self->_initialNoBeaconDuration, self->_fastRollAdvertisementDuration, self->_fastRollAdvertisementInterval, self->_slowRollAdvertisementDuration, self->_slowRollNoAdvertisementDuration, self->_noAdvertisementDurationDecayFactor);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPMacBeaconConfig)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  NSArray *postInitialDayAdvertisementTimes;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("initialNoBeaconDuration"));
  self->_initialNoBeaconDuration = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fastRollAdvertisementDuration"));
  self->_fastRollAdvertisementDuration = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fastRollAdvertisementInterval"));
  self->_fastRollAdvertisementInterval = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("slowRollAdvertisementDuration"));
  self->_slowRollAdvertisementDuration = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("slowRollNoAdvertisementDuration"));
  self->_slowRollNoAdvertisementDuration = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("noAdvertisementDurationDecayFactor"));
  self->_noAdvertisementDurationDecayFactor = v10;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("postInitialDayAdvertisementTimes"));
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();

  postInitialDayAdvertisementTimes = self->_postInitialDayAdvertisementTimes;
  self->_postInitialDayAdvertisementTimes = v14;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  double initialNoBeaconDuration;
  id v5;

  initialNoBeaconDuration = self->_initialNoBeaconDuration;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("initialNoBeaconDuration"), initialNoBeaconDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("fastRollAdvertisementDuration"), self->_fastRollAdvertisementDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("fastRollAdvertisementInterval"), self->_fastRollAdvertisementInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("slowRollAdvertisementDuration"), self->_slowRollAdvertisementDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("slowRollNoAdvertisementDuration"), self->_slowRollNoAdvertisementDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("noAdvertisementDurationDecayFactor"), self->_noAdvertisementDurationDecayFactor);
  objc_msgSend(v5, "encodeObject:forKey:", self->_postInitialDayAdvertisementTimes, CFSTR("postInitialDayAdvertisementTimes"));

}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPMacBeaconConfig fastRollAdvertisementDuration](self, "fastRollAdvertisementDuration");
  v6 = v5;
  -[SPMacBeaconConfig fastRollAdvertisementInterval](self, "fastRollAdvertisementInterval");
  v8 = v7;
  -[SPMacBeaconConfig slowRollAdvertisementDuration](self, "slowRollAdvertisementDuration");
  v10 = v9;
  -[SPMacBeaconConfig slowRollNoAdvertisementDuration](self, "slowRollNoAdvertisementDuration");
  v12 = v11;
  -[SPMacBeaconConfig noAdvertisementDurationDecayFactor](self, "noAdvertisementDurationDecayFactor");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> fast: [%f: %f], slow: [%f: %f], decay: %f"), v4, self, v6, v8, v10, v12, v13);
}

- (double)initialNoBeaconDuration
{
  return self->_initialNoBeaconDuration;
}

- (void)setInitialNoBeaconDuration:(double)a3
{
  self->_initialNoBeaconDuration = a3;
}

- (double)fastRollAdvertisementDuration
{
  return self->_fastRollAdvertisementDuration;
}

- (void)setFastRollAdvertisementDuration:(double)a3
{
  self->_fastRollAdvertisementDuration = a3;
}

- (double)fastRollAdvertisementInterval
{
  return self->_fastRollAdvertisementInterval;
}

- (void)setFastRollAdvertisementInterval:(double)a3
{
  self->_fastRollAdvertisementInterval = a3;
}

- (double)slowRollAdvertisementDuration
{
  return self->_slowRollAdvertisementDuration;
}

- (void)setSlowRollAdvertisementDuration:(double)a3
{
  self->_slowRollAdvertisementDuration = a3;
}

- (double)slowRollNoAdvertisementDuration
{
  return self->_slowRollNoAdvertisementDuration;
}

- (void)setSlowRollNoAdvertisementDuration:(double)a3
{
  self->_slowRollNoAdvertisementDuration = a3;
}

- (double)noAdvertisementDurationDecayFactor
{
  return self->_noAdvertisementDurationDecayFactor;
}

- (void)setNoAdvertisementDurationDecayFactor:(double)a3
{
  self->_noAdvertisementDurationDecayFactor = a3;
}

- (NSArray)postInitialDayAdvertisementTimes
{
  return self->_postInitialDayAdvertisementTimes;
}

- (void)setPostInitialDayAdvertisementTimes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postInitialDayAdvertisementTimes, 0);
}

@end
