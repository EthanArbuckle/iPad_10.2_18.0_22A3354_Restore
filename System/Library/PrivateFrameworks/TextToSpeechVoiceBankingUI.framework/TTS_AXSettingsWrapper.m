@implementation TTS_AXSettingsWrapper

+ (id)customSettingsForVoice:(id)a3 speechSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(getAXSettingsClass(), "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customSettingsForVoice:sourceKey:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)setCustomSettingsForVoice:(id)a3 speechSource:(id)a4 settings:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(getAXSettingsClass(), "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomSettingsForVoice:sourceKey:settings:", v9, v8, v7);

}

@end
