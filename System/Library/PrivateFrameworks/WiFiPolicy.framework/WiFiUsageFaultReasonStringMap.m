@implementation WiFiUsageFaultReasonStringMap

void __WiFiUsageFaultReasonStringMap_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[34];
  _QWORD v3[35];

  v3[34] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E8861FF8;
  v2[1] = &unk_1E8862010;
  v3[0] = CFSTR("kWiFiUsageFaultReasonUnknown");
  v3[1] = CFSTR("kWiFiUsageFaultReasonSymptomLowRssiDnsFailure");
  v2[2] = &unk_1E8862028;
  v2[3] = &unk_1E8862040;
  v3[2] = CFSTR("kWiFiUsageFaultReasonSymptomLowRssiArpFailure");
  v3[3] = CFSTR("kWiFiUsageFaultReasonSymptomLowRssiDataStall");
  v2[4] = &unk_1E8862058;
  v2[5] = &unk_1E8862070;
  v3[4] = CFSTR("kWiFiUsageFaultReasonSymptomLowRssiShortFlow");
  v3[5] = CFSTR("kWiFiUsageFaultReasonSymptomLowRssiRTTFailure");
  v2[6] = &unk_1E8862088;
  v2[7] = &unk_1E88620A0;
  v3[6] = CFSTR("kWiFiUsageFaultReasonDatapathStall");
  v3[7] = CFSTR("kWiFiUsageFaultReasonWatchdogReset");
  v2[8] = &unk_1E88620B8;
  v2[9] = &unk_1E88620D0;
  v3[8] = CFSTR("kWiFiUsageFaultReasonSsidBlocklisted");
  v3[9] = CFSTR("kWiFiUsageFaultReasonBssidBlocklisted");
  v2[10] = &unk_1E88620E8;
  v2[11] = &unk_1E8862100;
  v3[10] = CFSTR("kWiFiUsageFaultReasonSlowWiFiAP");
  v3[11] = CFSTR("kWiFiUsageFaultReasonPrivateMACFallback");
  v2[12] = &unk_1E8862118;
  v2[13] = &unk_1E8862130;
  v3[12] = CFSTR("kWiFiUsageFaultReasonDelayedAutoJoin");
  v3[13] = CFSTR("kWiFiUsageFaultReasonDhcpFailure");
  v2[14] = &unk_1E8862148;
  v2[15] = &unk_1E8862160;
  v3[14] = CFSTR("kWiFiUsageFaultReasonLinkTestLocalCheckFailed");
  v3[15] = CFSTR("kWiFiUsageFaultReasonLinkTestInternetCheckFailed");
  v2[16] = &unk_1E8862178;
  v2[17] = &unk_1E8862190;
  v3[16] = CFSTR("kWiFiUsageFaultReasonLinkTestDNSCheckFailed");
  v3[17] = CFSTR("kWiFiUsageFaultReasonArpFailure");
  v2[18] = &unk_1E88621A8;
  v2[19] = &unk_1E88621C0;
  v3[18] = CFSTR("kWiFiUsageFaultReasonSlowWiFiDnsFailure");
  v3[19] = CFSTR("kWiFiUsageFaultReasonSlowWiFiDUT");
  v2[20] = &unk_1E88621D8;
  v2[21] = &unk_1E88621F0;
  v3[20] = CFSTR("kWiFiUsageFaultReasonUserOverridesCellularOutranking");
  v3[21] = CFSTR("kWiFiUsageFaultReasonFirmwareTrap");
  v2[22] = &unk_1E8862208;
  v2[23] = &unk_1E8862220;
  v3[22] = CFSTR("kWiFiUsageFaultReasonSleepPowerBudgetExceeded");
  v3[23] = CFSTR("kWiFiUsageFaultReasonLowPowerBudgetExceeded");
  v2[24] = &unk_1E8862238;
  v2[25] = &unk_1E8862250;
  v3[24] = CFSTR("kWiFiUsageFaultReasonDextCrashed");
  v3[25] = CFSTR("kWiFiUsageFaultReasonSiriTimedOut");
  v2[26] = &unk_1E8862268;
  v2[27] = &unk_1E8862280;
  v3[26] = CFSTR("kWiFiUsageFaultReasonApsdTimedOut");
  v3[27] = CFSTR("kWiFiUsageFaultReasonBrokenBackhaulLinkFailed");
  v2[28] = &unk_1E8862298;
  v2[29] = &unk_1E88622B0;
  v3[28] = CFSTR("kWiFiUsageFaultReasonLinkTestSiriTCPCheckFailed");
  v3[29] = CFSTR("kWiFiUsageFaultReasonLinkTestSiriTLSCheckFailed");
  v2[30] = &unk_1E88622C8;
  v2[31] = &unk_1E88622E0;
  v3[30] = CFSTR("kWiFiUsageFaultReasonAirplayConnectionStall");
  v3[31] = CFSTR("kWiFiUsageFaultReasonAirplayBufferedAudioUnderrun");
  v2[32] = &unk_1E88622F8;
  v2[33] = &unk_1E8862310;
  v3[32] = CFSTR("kWiFiUsageFaultReasonAirplayRealtimeAudioUnderrun");
  v3[33] = CFSTR("kWiFiUsageFaultReasonHomeKitFault");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 34);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gWiFiUsageFaultReasonStringMap;
  gWiFiUsageFaultReasonStringMap = v0;

}

@end
