@implementation TIKeyboardInputManager(MockTestingParameters)

- (id)mockTestingParameters
{
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("trialExperimentId");
  v1[1] = CFSTR("trialTreatmentId");
  v2[0] = CFSTR("mockMockTrialExperimentIdValue");
  v2[1] = CFSTR("mockMockTrialTreatmentIdValue");
  v1[2] = CFSTR("trialSubjectId");
  v1[3] = CFSTR("trialTrackingId");
  v2[2] = CFSTR("mockTtrialSubjectIdValue");
  v2[3] = CFSTR("mockMockTrialTrackingIdValue");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)swizzleTestingParameters
{
  if (swizzleTestingParameters_onceToken != -1)
    dispatch_once(&swizzleTestingParameters_onceToken, &__block_literal_global_5857);
}

@end
