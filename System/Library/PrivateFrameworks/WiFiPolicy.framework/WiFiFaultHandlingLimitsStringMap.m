@implementation WiFiFaultHandlingLimitsStringMap

void __WiFiFaultHandlingLimitsStringMap_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E8862328;
  v2[1] = &unk_1E8862340;
  v3[0] = CFSTR("WiFiFaultHandlingNotIgnored");
  v3[1] = CFSTR("WiFiFaultHandlingLimitedRateLastFaultIndication");
  v2[2] = &unk_1E8862358;
  v2[3] = &unk_1E8862370;
  v3[2] = CFSTR("WiFiFaultHandlingLimitedLinkOrPrimaryNotSet");
  v3[3] = CFSTR("WiFiFaultHandlingLimitedRateMinBrokenLinkDetectedInterval");
  v2[4] = &unk_1E8862388;
  v3[4] = CFSTR("WiFiFaultHandlingLimitedRecoveryDisabled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gWiFiFaultHandlingLimitsStringMap;
  gWiFiFaultHandlingLimitsStringMap = v0;

}

@end
