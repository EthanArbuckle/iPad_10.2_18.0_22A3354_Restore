@implementation NWNetworkPredictions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWNetworkPredictions)initWithCoder:(id)a3
{
  id v4;
  NWNetworkPredictions *v5;
  void *v6;
  uint64_t v7;
  NSDate *changePointAt;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NWNetworkPredictions;
  v5 = -[NWNetworkPredictions init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24958F0D4]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changePointAt"));
    v7 = objc_claimAutoreleasedReturnValue();
    changePointAt = v5->_changePointAt;
    v5->_changePointAt = (NSDate *)v7;

    v5->_toQuality = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("toQuality"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v9;
    v5->_resolutionSeconds = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("resolutionSeconds"));
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x24958F0D4]();
  -[NWNetworkPredictions changePointAt](self, "changePointAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("changePointAt"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[NWNetworkPredictions toQuality](self, "toQuality"), CFSTR("toQuality"));
  -[NWNetworkPredictions confidence](self, "confidence");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("confidence"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[NWNetworkPredictions resolutionSeconds](self, "resolutionSeconds"), CFSTR("resolutionSeconds"));
  objc_autoreleasePoolPop(v4);

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[NWNetworkPredictions changePointAt](self, "changePointAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionWithLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NWNetworkPredictions toQuality](self, "toQuality");
  -[NWNetworkPredictions confidence](self, "confidence");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("pred %p, nextAt:%@, quality:%ld, confidence:%f, resolution:%ld"), self, v6, v7, v8, -[NWNetworkPredictions resolutionSeconds](self, "resolutionSeconds"));

  return v9;
}

- (NWNetworkPredictions)initWithSpec:(id)a3 toQuality:(int64_t)a4 withConfidence:(double)a5 resolutionSeconds:(unsigned int)a6
{
  id v11;
  NWNetworkPredictions *v12;
  NWNetworkPredictions *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NWNetworkPredictions;
  v12 = -[NWNetworkPredictions init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_changePointAt, a3);
    v13->_toQuality = a4;
    v13->_confidence = a5;
    v13->_resolutionSeconds = a6;
  }

  return v13;
}

- (NSDate)changePointAt
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)toQuality
{
  return self->_toQuality;
}

- (double)confidence
{
  return self->_confidence;
}

- (int64_t)resolutionSeconds
{
  return self->_resolutionSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changePointAt, 0);
}

@end
