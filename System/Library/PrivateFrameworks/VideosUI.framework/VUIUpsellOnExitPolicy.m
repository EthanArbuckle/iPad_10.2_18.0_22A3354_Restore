@implementation VUIUpsellOnExitPolicy

- (VUIUpsellOnExitPolicy)initWithDictionary:(id)a3
{
  id v4;
  VUIUpsellOnExitPolicy *v5;
  void *v6;
  uint64_t v7;
  NSArray *rateLimitPolicies;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIUpsellOnExitPolicy;
  v5 = -[VUIUpsellOnExitPolicy init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("displayPolicy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("rateLimitPolicies"));
    v7 = objc_claimAutoreleasedReturnValue();
    rateLimitPolicies = v5->_rateLimitPolicies;
    v5->_rateLimitPolicies = (NSArray *)v7;

    objc_msgSend(v4, "objectForKey:", CFSTR("showExitUpsell"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_showUpsell = objc_msgSend(v9, "BOOLValue");

    if (v6 && v5->_rateLimitPolicies)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("playbackInSeconds"));
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("playbackPercentage"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11 | v10)
      {
        if (v11)
        {
          v5->_thresholdValueType = 0;
          v12 = (void *)v11;
        }
        else
        {
          v5->_thresholdValueType = 1;
          v12 = (void *)v10;
        }
        objc_storeStrong((id *)&v5->_playbackThreshold, v12);
      }
      else
      {
        v5->_showUpsell = 0;
      }

    }
    else
    {
      v5->_showUpsell = 0;
    }

  }
  return v5;
}

- (int64_t)thresholdValueType
{
  return self->_thresholdValueType;
}

- (void)setThresholdValueType:(int64_t)a3
{
  self->_thresholdValueType = a3;
}

- (NSNumber)playbackThreshold
{
  return self->_playbackThreshold;
}

- (void)setPlaybackThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_playbackThreshold, a3);
}

- (NSArray)rateLimitPolicies
{
  return self->_rateLimitPolicies;
}

- (void)setRateLimitPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimitPolicies, a3);
}

- (BOOL)showUpsell
{
  return self->_showUpsell;
}

- (void)setShowUpsell:(BOOL)a3
{
  self->_showUpsell = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimitPolicies, 0);
  objc_storeStrong((id *)&self->_playbackThreshold, 0);
}

@end
