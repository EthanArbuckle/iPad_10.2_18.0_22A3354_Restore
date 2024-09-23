@implementation SBPIPAnalyticsSessionSummaryAssistant

- (SBPIPAnalyticsSessionSummaryAssistant)initWithBundleIdentifier:(id)a3 contentType:(int64_t)a4 isAutoPIPEnabled:(BOOL)a5 invalidationBlock:(id)a6
{
  SBPIPAnalyticsSessionSummaryAssistant *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPIPAnalyticsSessionSummaryAssistant;
  result = -[SBPIPAnalyticsAssistant initWithBundleIdentifier:contentType:isAutoPIPEnabled:invalidationBlock:](&v7, sel_initWithBundleIdentifier_contentType_isAutoPIPEnabled_invalidationBlock_, a3, a4, a5, a6);
  if (result)
    result->_stashedTimestamp = NAN;
  return result;
}

- (id)analyticsIdentifier
{
  return CFSTR("com.apple.SpringBoard.PictureInPictureSessionSummary");
}

- (void)noteStartedAutomatically:(BOOL)a3
{
  self->_startedAutomatically = a3;
}

- (void)noteRestoredFullScreen:(BOOL)a3
{
  self->_restoredFullScreen = a3;
}

- (void)noteAppStoppedSession:(BOOL)a3
{
  self->_appStoppedSession = a3;
}

- (void)noteBecameStashedAtTime:(double)a3
{
  ;
}

- (void)noteBecameUnstashedAtTime:(double)a3
{
  self->_stashedDuration = a3 - self->_stashedTimestamp + self->_stashedDuration;
  ++self->_numberOfStashEvents;
  self->_stashedTimestamp = NAN;
}

- (id)_generateMutableAnalyticsPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBPIPAnalyticsSessionSummaryAssistant;
  -[SBPIPAnalyticsAssistant _generateMutableAnalyticsPayload](&v14, sel__generateMutableAnalyticsPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_startedAutomatically);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("StartedAutomatically"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_restoredFullScreen);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("RestoredFullScreen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stashedDuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("StashedDuration"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ActiveDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Duration"));
  objc_msgSend(v7, "doubleValue");
  v9 = v8 < 8.0 && self->_startedAutomatically;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("CanceledQuicklyAfterAutoPIP"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfStashEvents);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("NumberOfStashEvents"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appStoppedSession);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("AppStoppedSession"));

  return v3;
}

- (void)invalidate
{
  objc_super v3;

  -[SBPIPAnalyticsSessionSummaryAssistant noteBecameUnstashedAtTime:](self, "noteBecameUnstashedAtTime:", CFAbsoluteTimeGetCurrent());
  v3.receiver = self;
  v3.super_class = (Class)SBPIPAnalyticsSessionSummaryAssistant;
  -[SBPIPAnalyticsAssistant invalidate](&v3, sel_invalidate);
}

@end
