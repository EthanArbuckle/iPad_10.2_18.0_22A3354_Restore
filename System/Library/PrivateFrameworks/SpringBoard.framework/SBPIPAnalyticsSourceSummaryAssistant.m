@implementation SBPIPAnalyticsSourceSummaryAssistant

- (SBPIPAnalyticsSourceSummaryAssistant)initWithBundleIdentifier:(id)a3 contentType:(int64_t)a4 isAutoPIPEnabled:(BOOL)a5 invalidationBlock:(id)a6
{
  SBPIPAnalyticsSourceSummaryAssistant *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPIPAnalyticsSourceSummaryAssistant;
  result = -[SBPIPAnalyticsAssistant initWithBundleIdentifier:contentType:isAutoPIPEnabled:invalidationBlock:](&v7, sel_initWithBundleIdentifier_contentType_isAutoPIPEnabled_invalidationBlock_, a3, a4, a5, a6);
  if (result)
    result->_possibleTimestamp = NAN;
  return result;
}

- (id)analyticsIdentifier
{
  return CFSTR("com.apple.SpringBoard.PictureInPictureSourceLifecycleSummary");
}

- (void)notePIPBecamePossibleAtTime:(double)a3
{
  ;
}

- (void)notePIPBecameProhibitedAtTime:(double)a3
{
  self->_possibleDuration = a3 - self->_possibleTimestamp + self->_possibleDuration;
  self->_possibleTimestamp = NAN;
}

- (void)noteBecameActiveAtTime:(double)a3
{
  objc_super v3;

  self->_PIPBecameActive = 1;
  v3.receiver = self;
  v3.super_class = (Class)SBPIPAnalyticsSourceSummaryAssistant;
  -[SBPIPAnalyticsAssistant noteBecameActiveAtTime:](&v3, sel_noteBecameActiveAtTime_, a3);
}

- (id)_generateMutableAnalyticsPayload
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPIPAnalyticsSourceSummaryAssistant;
  -[SBPIPAnalyticsAssistant _generateMutableAnalyticsPayload](&v7, sel__generateMutableAnalyticsPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_PIPBecameActive);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PIPBecameActive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_possibleDuration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PossibleOrActiveDuration"));

  return v3;
}

- (void)invalidate
{
  objc_super v3;

  -[SBPIPAnalyticsSourceSummaryAssistant notePIPBecameProhibitedAtTime:](self, "notePIPBecameProhibitedAtTime:", CFAbsoluteTimeGetCurrent());
  v3.receiver = self;
  v3.super_class = (Class)SBPIPAnalyticsSourceSummaryAssistant;
  -[SBPIPAnalyticsAssistant invalidate](&v3, sel_invalidate);
}

@end
