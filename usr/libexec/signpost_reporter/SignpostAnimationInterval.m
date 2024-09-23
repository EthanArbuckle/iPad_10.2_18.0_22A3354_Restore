@implementation SignpostAnimationInterval

- (id)signpostType
{
  return CFSTR("AnimationInterval");
}

- (id)coreAnalyticsPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SignpostAnimationInterval;
  v3 = -[SignpostAnimationInterval coreAnalyticsPayload](&v9, "coreAnalyticsPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    -[SignpostAnimationInterval glitchTimeRatio](self, "glitchTimeRatio");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("FrameRate"));

    -[SignpostAnimationInterval glitchTimeRatioMsPerS](self, "glitchTimeRatioMsPerS");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HitchMsPerSec"));

    -[SignpostAnimationInterval nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS](self, "nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("NonFirstFrameHitchAdjustedMsPerSec"));

  }
  return v4;
}

@end
