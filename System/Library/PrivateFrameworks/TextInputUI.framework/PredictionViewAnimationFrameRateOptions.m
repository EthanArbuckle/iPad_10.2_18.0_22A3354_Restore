@implementation PredictionViewAnimationFrameRateOptions

void __PredictionViewAnimationFrameRateOptions_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "maximumFramesPerSecond");

  v2 = 117440512;
  if (v1 > 60)
    v2 = 150994944;
  PredictionViewAnimationFrameRateOptions_frameRateOptions = v2;
}

@end
