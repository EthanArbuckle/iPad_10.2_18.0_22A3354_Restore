@implementation PICinematicAudioAdjustmentController

- (double)dialogMixBias
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICinematicAudioAdjustmentController dialogMixBiasKey](PICinematicAudioAdjustmentController, "dialogMixBiasKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 0.5;
  }

  return v6;
}

- (void)setDialogMixBias:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICinematicAudioAdjustmentController dialogMixBiasKey](PICinematicAudioAdjustmentController, "dialogMixBiasKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (NSString)renderingStyle
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("renderingStyle"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("original");
  v5 = v4;

  return v5;
}

- (void)setRenderingStyle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("renderingStyle"));

}

- (void)setRenderingStyleToDefaultForPortraitVideo
{
  -[PICinematicAudioAdjustmentController setRenderingStyle:](self, "setRenderingStyle:", CFSTR("voice"));
}

+ (NSString)dialogMixBiasKey
{
  return (NSString *)CFSTR("dialogMixBias");
}

@end
