@implementation PILevelsLuminanceAutoCalculator

- (id)calculateSettingsForImageHistogram:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "luminance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PILevelsAutoCalculator calculateSettingsForSingleChannelHistogram:suffix:](self, "calculateSettingsForSingleChannelHistogram:suffix:", v4, CFSTR("RGB"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
