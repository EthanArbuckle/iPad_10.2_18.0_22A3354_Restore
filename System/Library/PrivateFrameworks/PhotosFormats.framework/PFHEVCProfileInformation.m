@implementation PFHEVCProfileInformation

- (NSString)summaryDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PFHEVCProfileInformation profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFHEVCProfileInformation tier](self, "tier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFHEVCProfileInformation level](self, "level");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%1.1f"), v4, v5, v7 / 30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSNumber)profile
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProfile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)tier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)level
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLevel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_tier, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
