@implementation CIImage(PrivateSmartBlackAndWhite)

- (uint64_t)smartBlackAndWhiteStatistics
{
  if (smartBlackAndWhiteStatistics_onceToken != -1)
    dispatch_once(&smartBlackAndWhiteStatistics_onceToken, &__block_literal_global_77_14680);
  return MEMORY[0x1E0C9AA70];
}

- (id)smartBlackAndWhiteAdjustmentsForValue:()PrivateSmartBlackAndWhite andStatistics:
{
  void *v2;
  void *v3;
  _QWORD v5[7];
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  if (smartBlackAndWhiteAdjustmentsForValue_andStatistics__onceToken != -1)
    dispatch_once(&smartBlackAndWhiteAdjustmentsForValue_andStatistics__onceToken, &__block_literal_global_82_14675);
  v5[0] = CFSTR("inputStrength");
  v5[1] = CFSTR("inputNeutralGamma");
  v6[0] = &unk_1E5051EF8;
  v6[1] = &unk_1E5051ED8;
  v6[2] = &unk_1E5051ED8;
  v5[2] = CFSTR("inputTone");
  v5[3] = CFSTR("inputHue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v2;
  v6[4] = &unk_1E5051ED8;
  v5[4] = CFSTR("inputGrain");
  v5[5] = CFSTR("inputSeed");
  v5[6] = CFSTR("inputScaleFactor");
  v6[5] = &unk_1E5051ED8;
  v6[6] = &unk_1E5051ED8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
