@implementation TUDiscoverabilitySignal

id __50__TUDiscoverabilitySignal_logAnalyticsEventNamed___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __39__TUDiscoverabilitySignal_isSeniorUser__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "primaryAuthKitAccount");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isSeniorUser_kIsSeniorUser = objc_msgSend(v1, "userIsSeniorForAccount:", v0);

}

+ (void)logAnalyticsEventPhoneAddFavorites
{
  objc_msgSend(a1, "logAnalyticsEventNamed:", CFSTR("com.apple.tips.phone_favorites"));
}

+ (void)logAnalyticsEventNamed:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "isSeniorUser");
  v9 = CFSTR("u65_flag");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  AnalyticsSendEventLazy();

}

+ (BOOL)isSeniorUser
{
  if (isSeniorUser_predicate != -1)
    dispatch_once(&isSeniorUser_predicate, &__block_literal_global_8);
  return isSeniorUser_kIsSeniorUser;
}

+ (void)logAnalyticsEventFaceTimeLink
{
  objc_msgSend(a1, "logAnalyticsEventNamed:", CFSTR("com.apple.tips.facetime_link"));
}

+ (void)logAnalyticsEventPhoneRecentlyDialed
{
  objc_msgSend(a1, "logAnalyticsEventNamed:", CFSTR("com.apple.tips.phone_recently_dialed"));
}

+ (void)logAnalyticsEventSpeakerphone
{
  objc_msgSend(a1, "logAnalyticsEventNamed:", CFSTR("com.apple.tips.phone_speakerphone"));
}

@end
