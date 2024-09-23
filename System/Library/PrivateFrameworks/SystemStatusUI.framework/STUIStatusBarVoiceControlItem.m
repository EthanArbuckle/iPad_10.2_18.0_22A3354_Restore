@implementation STUIStatusBarVoiceControlItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0D80];
}

+ (id)pillCombinedDisplayIdentifier
{
  return (id)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("pillCombinedDisplayIdentifier"));
}

- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "voiceControlEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  return -[STUIStatusBarVoiceControlItem _overriddenStyleAttributesForVoiceControlType:](self, "_overriddenStyleAttributesForVoiceControlType:", v6);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarVoiceControlItem;
  -[STUIStatusBarIndicatorItem applyUpdate:toDisplayItem:](&v13, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "dataChanged"))
  {
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "voiceControlEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    -[STUIStatusBarVoiceControlItem imageOpacityForVoiceControlType:](self, "imageOpacityForVoiceControlType:", v11);
    objc_msgSend(v7, "setViewAlpha:");
  }

  return v8;
}

- (id)systemImageNameForUpdate:(id)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(a3, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voiceControlEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(objc_msgSend(v4, "type") - 1) >= 2)
    v5 = CFSTR("voice.control.slash");
  else
    v5 = CFSTR("voice.control");

  return (id)v5;
}

- (double)imageOpacityForVoiceControlType:(int64_t)a3
{
  double result;

  result = 0.65;
  if ((unint64_t)(a3 - 1) < 2)
    return 1.0;
  return result;
}

- (id)_overriddenStyleAttributesForVoiceControlType:(int64_t)a3
{
  void *v3;
  void *v4;

  if ((unint64_t)(a3 - 1) > 1)
  {
    v3 = 0;
  }
  else
  {
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImageTintColor:", v4);

  }
  return v3;
}

@end
