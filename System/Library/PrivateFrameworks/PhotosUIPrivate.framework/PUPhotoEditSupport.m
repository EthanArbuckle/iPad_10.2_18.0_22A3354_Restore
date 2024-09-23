@implementation PUPhotoEditSupport

+ (BOOL)currentDeviceShouldAllowRawDecode
{
  if (currentDeviceShouldAllowRawDecode_onceToken != -1)
    dispatch_once(&currentDeviceShouldAllowRawDecode_onceToken, &__block_literal_global_61730);
  return currentDeviceShouldAllowRawDecode_supportsRawDecode;
}

+ (double)changeValueOfSlider:(id)a3 reverse:(BOOL)a4 coarse:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "maximumValue");
  v9 = v8;
  objc_msgSend(v7, "minimumValue");
  v11 = (v9 - v10) / fmax((double)(objc_msgSend(v7, "tickMarkCount") - 1), 1.0);
  if (v6)
    v11 = -v11;
  if (v5)
    v12 = v11 * 5.0;
  else
    v12 = v11;
  objc_msgSend(v7, "value");
  objc_msgSend(v7, "setValue:", v13 + v12);

  return v12;
}

+ (id)createEditSlider
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0D0D090]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setUseTickMarkLegibilityShadows:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tickMarksConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMainTickMarkColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tickMarksConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSecondaryTickMarkColor:", v8);

  return v3;
}

+ (id)createPlayPauseButton
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);
  objc_msgSend(v2, "_setTouchInsets:", -15.0, -15.0, -15.0, -15.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  objc_msgSend(v2, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowColor:", v4);

  objc_msgSend(v2, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1050253722;
  objc_msgSend(v6, "setShadowOpacity:", v7);

  objc_msgSend(v2, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowRadius:", 5.0);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("play.fill"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:forState:", v9, 0);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pause.fill"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:forState:", v10, 4);

  return v2;
}

void __55__PUPhotoEditSupport_currentDeviceShouldAllowRawDecode__block_invoke()
{
  id v0;
  char v1;
  size_t v2;
  unint64_t v3;

  v0 = MTLCreateSystemDefaultDevice();
  v2 = 8;
  v3 = 0;
  if (sysctlbyname("hw.memsize", &v3, &v2, 0, 0) || v3 >= 0x60000001)
    v1 = objc_msgSend(v0, "supportsFeatureSet:", 1);
  else
    v1 = 0;
  currentDeviceShouldAllowRawDecode_supportsRawDecode = v1;

}

@end
