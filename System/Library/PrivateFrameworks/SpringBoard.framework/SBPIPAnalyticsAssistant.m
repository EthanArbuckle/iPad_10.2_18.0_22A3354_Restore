@implementation SBPIPAnalyticsAssistant

- (SBPIPAnalyticsAssistant)initWithBundleIdentifier:(id)a3 contentType:(int64_t)a4 isAutoPIPEnabled:(BOOL)a5 invalidationBlock:(id)a6
{
  __CFString *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  __CFString *v14;
  NSObject *v15;
  _BOOL4 v16;
  __CFString *v17;
  SBPIPAnalyticsAssistant *v18;
  SBPIPAnalyticsAssistant *v19;
  uint64_t v20;
  NSString *bundleIdentifier;
  uint64_t v22;
  id invalidationBlock;
  objc_super v25;

  v10 = (__CFString *)a3;
  v11 = a6;
  if (!v11)
  {
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

    if (v13)
      NSLog(CFSTR("Supply an invalidation block"));
  }
  v14 = v10;
  if (!v10)
  {
    SBLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v16)
      NSLog(CFSTR("you forgot a bundleid"));
    v14 = CFSTR("com.apple.UnknownPIPSource");
  }
  v17 = v14;

  v25.receiver = self;
  v25.super_class = (Class)SBPIPAnalyticsAssistant;
  v18 = -[SBPIPAnalyticsAssistant init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_isAutoPIPEnabled = a5;
    v18->_contentType = a4;
    v20 = -[__CFString copy](v17, "copy");
    bundleIdentifier = v19->_bundleIdentifier;
    v19->_bundleIdentifier = (NSString *)v20;

    v19->_activationTimestamp = NAN;
    v22 = MEMORY[0x1D17E5550](v11);
    invalidationBlock = v19->_invalidationBlock;
    v19->_invalidationBlock = (id)v22;

  }
  return v19;
}

- (void)noteBecameInactiveAtTime:(double)a3
{
  self->_activateDuration = a3 - self->_activationTimestamp + self->_activateDuration;
  self->_activationTimestamp = NAN;
}

- (void)invalidate
{
  void (**invalidationBlock)(id, SBPIPAnalyticsAssistant *, void *);
  void *v4;
  id v5;

  -[SBPIPAnalyticsAssistant noteBecameInactiveAtTime:](self, "noteBecameInactiveAtTime:", CFAbsoluteTimeGetCurrent());
  invalidationBlock = (void (**)(id, SBPIPAnalyticsAssistant *, void *))self->_invalidationBlock;
  if (invalidationBlock)
  {
    -[SBPIPAnalyticsAssistant analyticsIdentifier](self, "analyticsIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    invalidationBlock[2](invalidationBlock, self, v4);

    v5 = self->_invalidationBlock;
    self->_invalidationBlock = 0;

  }
}

- (id)generateAnalyticsPayload
{
  void *v2;
  void *v3;

  -[SBPIPAnalyticsAssistant _generateMutableAnalyticsPayload](self, "_generateMutableAnalyticsPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_generateMutableAnalyticsPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v10[0] = self->_bundleIdentifier;
  v9[0] = CFSTR("AppBundleIdentifier");
  v9[1] = CFSTR("IsAutoPIPEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAutoPIPEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("ActiveDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_activateDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("ContentType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_contentType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  return v7;
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
