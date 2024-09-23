@implementation BYAnalyticsEventRecommendedLocale

- (BYAnalyticsEventRecommendedLocale)initWithAnalyticsManager:(id)a3
{
  id v4;
  BYAnalyticsEventRecommendedLocale *v5;
  BYAnalyticsEventRecommendedLocale *v6;
  _QWORD v8[4];
  BYAnalyticsEventRecommendedLocale *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BYAnalyticsEventRecommendedLocale;
  v5 = -[BYAnalyticsEventRecommendedLocale init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__BYAnalyticsEventRecommendedLocale_initWithAnalyticsManager___block_invoke;
    v8[3] = &unk_1E4E27B08;
    v9 = v5;
    objc_msgSend(v4, "addEvent:withPayloadBlock:persist:", CFSTR("com.apple.setupassistant.ios.guessedCountry"), v8, 1);

  }
  return v6;
}

id __62__BYAnalyticsEventRecommendedLocale_initWithAnalyticsManager___block_invoke(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "userVisitedLocalePane"))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventPayload");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)eventPayload
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = -[BYAnalyticsEventRecommendedLocale source](self, "source");
  if (v3 > 5)
    v4 = 0;
  else
    v4 = (uint64_t)*(&off_1E4E28190 + v3);
  v11[0] = v4;
  v10[0] = CFSTR("source");
  v10[1] = CFSTR("durationOfWiFiScan");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BYAnalyticsEventRecommendedLocale durationOfWiFiScan](self, "durationOfWiFiScan");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("userSawRecommendedLocale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BYAnalyticsEventRecommendedLocale userSawRecommendedLocale](self, "userSawRecommendedLocale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (double)durationOfWiFiScan
{
  return self->_durationOfWiFiScan;
}

- (void)setDurationOfWiFiScan:(double)a3
{
  self->_durationOfWiFiScan = a3;
}

- (BOOL)userVisitedLocalePane
{
  return self->_userVisitedLocalePane;
}

- (void)setUserVisitedLocalePane:(BOOL)a3
{
  self->_userVisitedLocalePane = a3;
}

- (BOOL)userSawRecommendedLocale
{
  return self->_userSawRecommendedLocale;
}

- (void)setUserSawRecommendedLocale:(BOOL)a3
{
  self->_userSawRecommendedLocale = a3;
}

@end
