@implementation TPSAnalyticsCommonDefines

+ (id)displayTypeStringForDisplayType:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("unknown");
  else
    return off_1E395B300[a3];
}

+ (id)ineligibleReasonStringForReason:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;

  if (ineligibleReasonStringForReason__onceToken != -1)
    dispatch_once(&ineligibleReasonStringForReason__onceToken, &__block_literal_global_2);
  v4 = (void *)ineligibleReasonStringForReason__reasonsToStringMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[TPSLogger analytics](TPSLogger, "analytics");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[TPSAnalyticsCommonDefines ineligibleReasonStringForReason:].cold.1(a3, v7);

    v6 = CFSTR("unspecfied");
  }
  return v6;
}

void __61__TPSAnalyticsCommonDefines_ineligibleReasonStringForReason___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[23];
  _QWORD v3[24];

  v3[23] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E3978140;
  v2[1] = &unk_1E3978158;
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("unspecfied");
  v2[2] = &unk_1E3978170;
  v2[3] = &unk_1E3978188;
  v3[2] = CFSTR("tipsAppDeleted");
  v3[3] = CFSTR("notificationSettingDisabled");
  v2[4] = &unk_1E39781A0;
  v2[5] = &unk_1E39781B8;
  v3[4] = CFSTR("configurationChanged");
  v3[5] = CFSTR("displayedOnOtherDevices");
  v2[6] = &unk_1E39781D0;
  v2[7] = &unk_1E39781E8;
  v3[6] = CFSTR("performedOutcome");
  v3[7] = CFSTR("dismissalEventOccurred");
  v2[8] = &unk_1E3978200;
  v2[9] = &unk_1E3978218;
  v3[8] = CFSTR("restartTrackingDisplayEventOccurred");
  v3[9] = CFSTR("preconditionChanged");
  v2[10] = &unk_1E3978230;
  v2[11] = &unk_1E3978248;
  v3[10] = CFSTR("absentEventObserved");
  v3[11] = CFSTR("dismissedByUser");
  v2[12] = &unk_1E3978260;
  v2[13] = &unk_1E3978278;
  v3[12] = CFSTR("dismissedByClient");
  v3[13] = CFSTR("expired");
  v2[14] = &unk_1E3978290;
  v2[15] = &unk_1E39782A8;
  v3[14] = CFSTR("deliveryInfoLifetimeExpired");
  v3[15] = CFSTR("maxDurationExceeded");
  v2[16] = &unk_1E39782C0;
  v2[17] = &unk_1E39782D8;
  v3[16] = CFSTR("maxDisplayedCountExceeded");
  v3[17] = CFSTR("suppressedByHoldoutCamp");
  v2[18] = &unk_1E39782F0;
  v2[19] = &unk_1E3978308;
  v3[18] = CFSTR("userLanguageChanged");
  v3[19] = CFSTR("userKnew");
  v2[20] = &unk_1E3978320;
  v2[21] = &unk_1E3978338;
  v3[20] = CFSTR("personalizationFailed");
  v3[21] = CFSTR("languageCodeMismatched");
  v2[22] = &unk_1E3978350;
  v3[22] = CFSTR("invalidConfiguration");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 23);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ineligibleReasonStringForReason__reasonsToStringMapping;
  ineligibleReasonStringForReason__reasonsToStringMapping = v0;

}

+ (id)experimentCampIDStringForCamp:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unspecified");
  if (a3 == 1)
    v3 = CFSTR("allContent");
  if (a3 == 2)
    return CFSTR("holdout");
  else
    return (id)v3;
}

+ (void)ineligibleReasonStringForReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_19A906000, a2, OS_LOG_TYPE_DEBUG, "Unknown ineligible reason: %ld", (uint8_t *)&v2, 0xCu);
}

@end
